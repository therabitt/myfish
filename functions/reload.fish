function reload --description "Reload fish configuration"
    source ~/.config/fish/config.fish

    for f in ~/.config/fish/conf.d/*.fish
        source $f
    end

    echo "✓ Fish config reloaded"
end
