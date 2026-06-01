function port --description "Find process using a specific port"
    if not set -q argv[1]
        echo "Usage: port <port_number>"
        return 1
    end

    set -l result (ss -tlnp 2>/dev/null | grep ":$argv[1] ")
    if test -z "$result"
        echo "No process found on port $argv[1]"
    else
        echo $result
    end
end
