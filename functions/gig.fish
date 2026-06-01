function gig --description "Generate .gitignore from gitignore.io templates"
    if not set -q argv[1]
        echo "Usage: gig <template...>"
        echo ""
        echo "Examples:"
        echo "  gig python node"
        echo "  gig rust"
        echo "  gig go"
        echo "  gig list          → show all available templates"
        echo "  gig list | rg go  → search templates"
        return 0
    end

    set -l base_url "https://www.toptal.com/developers/gitignore/api"

    if test "$argv[1]" = "list"
        curl -sL "$base_url/list" | string split ","
        return
    end

    set -l templates (string join "," $argv)
    set -l content (curl -sL "$base_url/$templates")

    if string match -q "*ERROR*" -- "$content"
        echo "  Error: Invalid template(s): $argv"
        echo "  Run 'gig list' to see available templates"
        return 1
    end

    echo $content >.gitignore
    echo "  ✓ Generated .gitignore for: $argv"
end
