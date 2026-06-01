function fcd --description "Fuzzy find and cd into directory"
    command -v fzf &>/dev/null; or begin
        echo "Error: fzf is required"
        return 1
    end

    set -l dir (fd --type d --hidden --follow --exclude .git 2>/dev/null | fzf --preview 'eza --tree --level=1 --icons --color=always {} 2>/dev/null || ls {}' --query="$argv")
    if test -n "$dir"
        cd $dir
    end
end
