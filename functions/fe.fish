function fe --description "Fuzzy find and edit file"
    command -v fzf &>/dev/null; or begin
        echo "Error: fzf is required"
        return 1
    end

    set -l file (fzf --preview 'bat --color=always --style=numbers --line-range=:300 {} 2>/dev/null || cat {}' --query="$argv")
    if test -n "$file"
        set -l editor $EDITOR
        test -z "$editor" && set editor nano
        $editor $file
    end
end
