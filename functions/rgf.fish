function rgf --description "Ripgrep + fzf: search code and open result in editor"
    if not set -q argv[1]
        echo "Usage: rgf <search_term>"
        return 1
    end

    set -l result (rg --color=always --line-number --no-heading "$argv" 2>/dev/null | \
        fzf --ansi \
            --delimiter=: \
            --preview 'bat --color=always --highlight-line {2} --line-range (math max 1, {2}-10):(math {2}+10) {1} 2>/dev/null' \
            --preview-window='up,60%,border-bottom')

    if test -n "$result"
        set -l file (echo $result | string split -m2 ':')[1]
        set -l line (echo $result | string split -m2 ':')[2]
        set -l editor $EDITOR
        test -z "$editor" && set editor nano
        $editor +$line $file
    end
end
