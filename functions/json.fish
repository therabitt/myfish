function json --description "Pretty-print JSON from file or stdin"
    if isatty stdin
        if not set -q argv[1]
            echo "Usage: json <file> or echo '{...}' | json"
            return 1
        end

        if command -v jq &>/dev/null
            jq '.' $argv[1]
        else
            python3 -m json.tool $argv[1]
        end
    else
        if command -v jq &>/dev/null
            jq '.'
        else
            python3 -m json.tool
        end
    end
end
