function prompt_curator_daemon -d "Start the prompt curator daemon"
    source ~/.config/fish/functions/backend_router.fish

    set -g HISTORY ~/.local/share/fish/fish_history
    set -g HASHES /data/data/com.termux/files/home/shadow_workspace/.prompt_hashes
    set -g OUT /data/data/com.termux/files/home/shadow_workspace/source/prompts
    set -g LOG /data/data/com.termux/files/home/shadow_workspace/archives/agent_logs/agent3.log

    mkdir -p $OUT (dirname $LOG)
    touch $HASHES

    echo "["(date)"] Agent 3 started" >> $LOG
    tail -100 $HISTORY | while read line
        echo $line | grep -q "^- cmd:"; and process_cmd (echo $line | sed 's/^- cmd: //')
    end

    inotifywait -m -e modify $HISTORY | while read path action file
        tail -100 $HISTORY | while read line
            echo $line | grep -q "^- cmd:"; and process_cmd (echo $line | sed 's/^- cmd: //')
        end
    end
end

function process_cmd -a cmd
    echo $cmd | grep -qE "(gemini|claude|aichat|ollama)"; or return
    
    set is_complex 0
    echo $cmd | grep -q "|"; and set is_complex 1
    echo $cmd | grep -q ">"; and set is_complex 1
    echo $cmd | grep -qE "\n"; and set is_complex 1
    test $is_complex -eq 0; and return
    
    set hash (echo -n $cmd | tr -s ' ' | string trim | sha256sum | cut -d' ' -f1)
    grep -qF $hash $HASHES; and return
    
    set prompt "Categorize AI prompt:
Command: $cmd
JSON only: {\"tool\": \"<tool>\", \"topic\": \"<topic>\", \"description\": \"<desc>\"}"
    
    set result (route_task "simple_format" $prompt 500)
    set tool (echo $result | jq -r '.tool' 2>/dev/null)
    set topic (echo $result | jq -r '.topic' 2>/dev/null)
    
    test -z "$tool"; and set tool "unknown"
    test -z "$topic"; and set topic "general"
    
    set outfile "$OUT/$tool/$topic.md"
    mkdir -p (dirname $outfile)
    
    if not test -f $outfile
        echo "---" > $outfile
        echo "title: $tool - $topic" >> $outfile
        echo "agent: prompt_curator" >> $outfile
        echo "---" >> $outfile
        echo "" >> $outfile
    end
    
    echo "## "(date +"%Y-%m-%d %H:%M") >> $outfile
    echo '```fish' >> $outfile
    echo $cmd >> $outfile
    echo '```' >> $outfile
    echo "" >> $outfile
    
    echo $hash >> $HASHES
    cd /data/data/com.termux/files/home/shadow_workspace
    git add source/prompts/$tool/$topic.md .prompt_hashes
    git commit -m "Agent 3: $tool/$topic" >/dev/null 2>&1
end
