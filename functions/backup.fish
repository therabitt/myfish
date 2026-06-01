function backup --description "Create timestamped backup of a file"
    if not set -q argv[1]
        echo "Usage: backup <file>"
        return 1
    end

    if not test -f $argv[1]
        echo "Error: '$argv[1]' is not a file"
        return 1
    end

    set -l backup_name "$argv[1].bak."(date +%Y%m%d_%H%M%S)
    cp $argv[1] $backup_name
    echo "✓ Backed up: $argv[1] → $backup_name"
end
