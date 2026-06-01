function envload --description "Load .env file variables into current shell"
    set -l envfile ".env"
    if set -q argv[1]
        set envfile $argv[1]
    end

    if not test -f $envfile
        echo "  Error: $envfile not found"
        return 1
    end

    set -l count 0
    while read -l line
        # Skip comments and empty lines
        string match -qr '^\s*#' -- $line; and continue
        string match -qr '^\s*$' -- $line; and continue

        set -l key (string split -m1 '=' -- $line)[1]
        set -l val (string split -m1 '=' -- $line)[2]

        # Strip surrounding quotes from value
        set val (string trim --chars='"' -- $val)
        set val (string trim --chars="'" -- $val)
        set val (string trim -- $val)

        if test -n "$key"
            set -gx (string trim -- $key) $val
            set count (math $count + 1)
        end
    end <$envfile

    echo "  ✓ Loaded $count variables from $envfile"
end
