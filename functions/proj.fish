function proj --description "Jump to a project directory with fuzzy search"
    set -l search_dirs

    # Use configurable PROJECTS_DIR first
    if set -q PROJECTS_DIR
        for dir in $PROJECTS_DIR
            test -d $dir && set -a search_dirs $dir
        end
    end

    # Auto-detect common project directories
    for dir in ~/Dev ~/Projects ~/projects ~/Code ~/code ~/src ~/repos
        if test -d $dir
            # Avoid duplicates
            if not contains $dir $search_dirs
                set -a search_dirs $dir
            end
        end
    end

    if test (count $search_dirs) -eq 0
        echo "  No project directories found."
        echo "  Set PROJECTS_DIR or create ~/Dev or ~/Projects"
        return 1
    end

    set -l dir (fd --type d --max-depth 1 --min-depth 1 . $search_dirs 2>/dev/null | \
        sort -u | \
        fzf --preview 'eza --tree --level=1 --icons --color=always {} 2>/dev/null || ls -la {}' \
            --header="Projects: $search_dirs" \
            --query="$argv")

    if test -n "$dir"
        cd $dir
        echo "  ✓ $(basename $dir)"
    end
end
