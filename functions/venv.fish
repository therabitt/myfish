function venv --description "Create or activate Python virtual environment"
    set -l venv_dir "venv"
    if set -q argv[1]
        set venv_dir $argv[1]
    end

    if test -d $venv_dir
        source $venv_dir/bin/activate.fish
        echo "✓ Activated: $venv_dir"
    else
        python -m venv $venv_dir
        source $venv_dir/bin/activate.fish
        echo "✓ Created and activated: $venv_dir"
    end
end
