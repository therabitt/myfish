function killport --description "Kill process running on a specific port"
    if not set -q argv[1]
        echo "Usage: killport <port>"
        return 1
    end

    set -l pid (lsof -ti :$argv[1] 2>/dev/null)
    if test -z "$pid"
        echo "  No process found on port $argv[1]"
        return 1
    end

    echo "  Killing PID $pid on port $argv[1]..."
    kill -9 $pid
    echo "  ✓ Process killed"
end
