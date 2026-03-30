#!/usr/bin/env fish
# intelligence_processor.fish - Agent 1: Process technical documents
# Location: ~/shadow_workspace/agents/intelligence_processor.fish
# Usage: ./intelligence_processor.fish /path/to/document.pdf
# Daemon: Triggered by inotifywait on /sdcard/Download/Intelligence/

source ~/shadow_workspace/lib/backend_router.fish

if test (count ) -eq 0
    echo "Usage: intelligence_processor <file>"
    return 1
end

set INPUT_FILE $argv[1]
set OUTPUT_DIR ~/shadow_workspace/source/intelligence
set ARCHIVE_DIR ~/shadow_workspace/archives/intelligence_intake
set FAILED_DIR ~/shadow_workspace/archives/failed_intake
set LOG_FILE ~/shadow_workspace/archives/agent_logs/agent1_intelligence.log

# Ensure directories exist
mkdir -p $OUTPUT_DIR $ARCHIVE_DIR $FAILED_DIR (dirname $LOG_FILE)

# Log processing start
echo "["(date +"%Y-%m-%d %H:%M:%S")"] Processing: $INPUT_FILE" >> $LOG_FILE

function extract_text -a input_file
    set file_ext (echo $input_file | sed 's/.*\.//')
    
    switch $file_ext
        case pdf
            # Primary: pdftotext
            set extracted (pdftotext "$input_file" - 2>/dev/null)
            
            if test -n "$extracted"
                echo $extracted
                return 0
            else
                # Fallback: Tesseract OCR
                echo "[WARN] pdftotext failed, attempting OCR fallback" >&2
                set temp_png (mktemp -u).png
                pdftoppm -png -f 1 -l 5 "$input_file" > $temp_png 2>/dev/null
                
                if test -f $temp_png
                    set ocr_result (tesseract $temp_png - 2>/dev/null)
                    rm $temp_png
                    
                    if test -n "$ocr_result"
                        echo $ocr_result
                        return 0
                    end
                end
            end
        case txt md
            cat "$input_file"
            return 0
        case json
            jq -r 'to_entries | .[] | "\(.key): \(.value)"' "$input_file"
            return 0
        case csv
            awk -F',' '{for(i=1;i<=NF;i++) print "Column "$i": "$i}' "$input_file"
            return 0
    end
    
    return 1
end

function synthesize_intelligence -a extracted_text filename
    set prompt "You are a technical intelligence analyst. Analyze the following document and extract:
1. Document title (infer from content if not explicit)
2. Primary subject matter (1-2 word category: vehicle, firmware, network, etc.)
3. Key technical specifications or findings
4. Actionable insights or recommendations

Document filename: $filename
Content:
$extracted_text

Output format: Markdown with YAML frontmatter
---
title: <inferred title>
category: <subject>
source_file: $filename
processed_date: "(date +%Y-%m-%d)"
agent: intelligence_processor
backend: <backend_used>
partial: <true if incomplete extraction, false otherwise>
---

# <Title>

## Summary
<2-3 sentence summary>

## Key Findings
<bullet points of critical information>

## Technical Specifications
<structured data extraction>

## Recommendations
<actionable next steps if applicable>"

    set token_count (echo $extracted_text | wc -w)
    set result (route_task "research" $prompt $token_count)
    echo $result
end

# Main processing workflow
set extracted_text (extract_text $INPUT_FILE)

if test -z "$extracted_text"
    # Complete extraction failure
    echo "["(date)"] FAILED: Unable to extract text from $INPUT_FILE" >> $LOG_FILE
    mv "$INPUT_FILE" "$FAILED_DIR/"
    
    termux-notification --title "Shadow-Agent 1" \
        --content "Failed to process: "(basename $INPUT_FILE)
    
    exit 1
end

# Successful extraction
set basename (basename $INPUT_FILE)
set synthesized (synthesize_intelligence $extracted_text $basename)

if test -z "$synthesized"
    echo "["(date)"] ERROR: AI synthesis failed for $INPUT_FILE" >> $LOG_FILE
    mv "$INPUT_FILE" "$FAILED_DIR/"
    exit 1
end

# Generate output filename from title
set title_slug (echo $synthesized | grep "^title:" | sed 's/title: //' | \
    tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd '[:alnum:]_')

if test -z "$title_slug"
    set title_slug (date +%Y%m%d_%H%M%S)"_"(basename $INPUT_FILE .pdf)
end

set output_file "$OUTPUT_DIR/$title_slug.md"

# Write output
echo $synthesized > $output_file

# Archive original
mv "$INPUT_FILE" "$ARCHIVE_DIR/"

# Log success
echo "["(date)"] SUCCESS: $INPUT_FILE -> $output_file" >> $LOG_FILE

# Git commit
cd ~/shadow_workspace
git add source/intelligence/$title_slug.md
git commit -m "Agent 1: Processed $basename -> $title_slug.md" >/dev/null 2>&1

echo "Processed: $basename -> $title_slug.md"
