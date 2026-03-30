#!/usr/bin/env fish
function agent_orchestrator -d "AI Agent Orchestrator"
    # agent_orchestrator.fish - Cross-agent concurrency controller
    set -g MAX_CONCURRENT 2
    set -g PRIORITY_ORDER intelligence_processor system_architect environment_researcher prompt_curator
    
    function count_active
        ps aux | grep -E "intelligence_processor|system_architect|environment_research|prompt_curator" | grep -v grep | wc -l
    end
    
    function start_agent -a agent_name
        set active (count_active)
        if test $active -ge $MAX_CONCURRENT
            echo "Max concurrency ($MAX_CONCURRENT) reached, queueing $agent_name"
            return 1
        end
        
        ~/shadow_workspace/agents/$agent_name.fish &
        echo "Started: $agent_name"
    end
    
    # Priority queue execution
    for agent in $PRIORITY_ORDER
        while test (count_active) -ge $MAX_CONCURRENT
            sleep 5
        end
        start_agent $agent
    end
    
end