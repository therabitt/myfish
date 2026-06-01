function serve --description "Start a quick HTTP server in current directory"
    set -l port 8000
    if set -q argv[1]
        set port $argv[1]
    end

    echo "  Serving on http://localhost:$port"
    echo "  Press Ctrl+C to stop"
    echo ""
    python -m http.server $port
end
