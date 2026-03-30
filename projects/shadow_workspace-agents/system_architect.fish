#!/usr/bin/env fish
# system_architect.fish - Agent 4
source ~/shadow_workspace/lib/backend_router.fish

set OUT ~/shadow_workspace/source/architecture
set LOG ~/shadow_workspace/archives/agent_logs/agent4.log

mkdir -p $OUT (dirname $LOG)

function redact_secrets -a text
    echo $text | sed -E 's/(api[_-]?key|token|password|secret)["\'\s:=]+[^"\s]+/\1=[REDACTED]/gi'
end

echo "["(date)"] System scan" >> $LOG

set scan_output (echo "=== SYSTEM SCAN ===" > $TMPDIR/scan.txt
    echo "Date: "(date) >> $TMPDIR/scan.txt
    pkg list-installed | awk '{print $1}' | sort >> $TMPDIR/scan.txt
    echo "" >> $TMPDIR/scan.txt
    if test -d ~/.local/var/service/; sv status ~/.local/var/service/* 2>/dev/null >> $TMPDIR/scan.txt; end
    echo "PATH: $PATH" >> $TMPDIR/scan.txt
    ls -la ~/.config/ >> $TMPDIR/scan.txt
    cat $TMPDIR/scan.txt)

set redacted (redact_secrets $scan_output)

set prompt "Analyze Termux environment:
$redacted

Generate Markdown with:
- Dependency graph (Mermaid)
- Service architecture (Mermaid)
- Config summary"

set result (route_task "architecture" $prompt (echo $redacted | wc -w))
test -z "$result"; and exit 1

set outfile "$OUT/system_state_"(date +%Y%m%d_%H%M%S)".md"
echo $result > $outfile

cd ~/shadow_workspace
git add source/architecture/(basename $outfile)
git commit -m "Agent 4: "(date +%Y-%m-%d) >/dev/null 2>&1

echo "Scan complete: $outfile"
