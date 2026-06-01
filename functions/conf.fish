function conf --description "Edit config files with \$EDITOR"
    set -l editor $EDITOR
    test -z "$editor" && set editor nano

    if not set -q argv[1]
        echo "Usage: conf <target>"
        echo ""
        set_color --bold cyan
        echo "  Available targets:"
        set_color normal
        echo "  fish   → ~/.config/fish/config.fish"
        echo "  hypr   → ~/.config/hypr/hyprland"
        echo "  var    → ~/.config/hypr/variables.conf"
        echo "  key    → ~/.config/hypr/hyprland/keybinds.conf"
        echo "  rul    → ~/.config/hypr/hyprland/rules.conf"
        echo "  cael   → ~/.config/caelestia/shell.json"
        echo "  star   → ~/.config/starship.toml"
        echo ""
        echo "  Editor: $editor"
        return 0
    end

    switch $argv[1]
        case fish
            $editor ~/.config/fish/config.fish
        case hypr
            $editor ~/.config/hypr/hyprland
        case var
            $editor ~/.config/hypr/variables.conf
        case key
            $editor ~/.config/hypr/hyprland/keybinds.conf
        case rul
            $editor ~/.config/hypr/hyprland/rules.conf
        case cael
            $editor ~/.config/caelestia/shell.json
        case star
            $editor ~/.config/starship.toml
        case '*'
            echo "Unknown target: $argv[1]"
            echo "Run 'conf' without arguments to see available targets."
            return 1
    end
end
