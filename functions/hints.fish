function hints --description "Show shortcuts, functions, and keybindings"
    # ── Usage ───────────────────────────────────────────────────
    # hints              → all hints (pager, scrollable)
    # hints <section>    → specific section only
    # hints search       → interactive fzf search
    # hints list         → show available sections
    #
    # Sections: git, system, files, pkg, docker, compose, npm,
    #           cargo, systemctl, ide, functions, dev, keys


    set -g _hints_col 0

    function _hr
        # Get terminal width, default to 80 if not set
        set -l cols $COLUMNS
        if test -z "$cols"
            set cols 80
        end

        # Fallback to single column if terminal is too narrow
        if test $cols -lt 100
            printf "  \e[1;32m%-10s\e[0m\e[90m→ \e[0m\e[36m%s\e[0m\n" "$argv[1]" "$argv[2..]"
            set _hints_col 0
            return
        end

        set -l half_width (math -s0 "$cols / 2")

        set -l val_len (string length "$argv[2..]")
        set -l pad_len (math "$half_width - 14 - $val_len")
        if test $pad_len -lt 1
            set pad_len 1
        end
        set -l padding (string repeat -n $pad_len " ")

        if test $_hints_col -eq 0
            printf "  \e[1;32m%-10s\e[0m\e[90m→ \e[0m\e[36m%s\e[0m%s" "$argv[1]" "$argv[2..]" "$padding"
            set _hints_col 1
        else
            printf "  \e[1;32m%-10s\e[0m\e[90m→ \e[0m\e[36m%s\e[0m\n" "$argv[1]" "$argv[2..]"
            set _hints_col 0
        end
    end

    function _hh
        if test $_hints_col -eq 1
            echo ""
            set _hints_col 0
        end
        echo ""
        printf "  \e[1;%sm%s\e[0m\n" "$argv[1]" "$argv[2..]"
        
        # Draw line spanning the terminal width
        set -l cols $COLUMNS
        if test -z "$cols"
            set cols 80
        end
        set -l line_width (math "$cols - 4")
        if test $line_width -lt 10
            set line_width 76
        end
        set -l line (string repeat -n $line_width "─")
        printf "  \e[90m%s\e[0m\n" "$line"
    end

    # ── Section Renderers ───────────────────────────────────────
    function _hints_git
        _hh 35 "🐙 Git"
        _hr lg  lazygit;   _hr ga  "git add .";  _hr gc  "git commit -am"
        _hr gp  "git push"; _hr gpl "git pull";   _hr gs  "git status"
        _hr gd  "git diff"; _hr gl  "git log --oneline --graph"
        _hr gst "git stash";     _hr gsp "git stash pop"
        _hr gsw "git switch";    _hr gsm "git switch main"
        _hr gb  "git branch";    _hr gbd "git branch -d"
        _hr gco "git checkout";  _hr gsh "git show"
        _hr gcl "git clone";     _hr grs "git reset";  _hr grb "git rebase -i"
    end

    function _hints_system
        _hh 34 "💻 System"
        _hr l   ls;     _hr ll  "ls -l";  _hr la  "ls -a";  _hr lla "ls -la"
        _hr lt  "eza tree (2 levels)";    _hr lta "eza tree + hidden"
        _hr ..  "cd ../";  _hr ... "cd ../../";  _hr .... "cd ../../../"
        _hr c   clear;  _hr py  python;   _hr fetch fastfetch
        _hr myip "curl ifconfig.me"
    end

    function _hints_files
        _hh 32 "📁 Files"
        _hr rm  "rm -i (safe)";  _hr cp  "cp -i (safe)";  _hr mv "mv -i (safe)"
        _hr del "trash-put";     _hr undel "trash-restore"; _hr copy "wl-copy"
    end

    function _hints_pkg
        _hh 37 "📦 Pacman / Yay"
        _hr install "pacman -S";   _hr remove "pacman -Rns"
        _hr search  "pacman -Ss";  _hr update "pacman -Syu"
        _hr sync    "pacman -Syy"; _hr clean  "pacman -Scc"
        _hr yi "yay -S";  _hr yu "yay -Syu";  _hr ys "yay -Ss"
    end

    function _hints_docker
        _hh 36 "🐳 Docker"
        _hr dk   docker;       _hr dkps "docker ps"
        _hr dkex "docker exec -it";  _hr dkl  "docker logs -f"
        _hr dkr  "docker run --rm -it";  _hr dkb "docker build -t"
    end

    function _hints_compose
        _hh 36 "🐳 Docker Compose"
        _hr dc  "docker compose";     _hr dcu "docker compose up -d"
        _hr dcd "docker compose down"; _hr dcl "docker compose logs -f"
        _hr dcr "docker compose restart"; _hr dcb "docker compose build"
    end

    function _hints_npm
        _hh 33 "📦 npm / pnpm"
        _hr ni npm install;  _hr nd  "npm run dev"
        _hr nb "npm run build";  _hr nr "npm run"
        _hr nt "npm test";  _hr nid "npm install -D"
        _hr pi "pnpm install"; _hr pd "pnpm dev"
        _hr pa "pnpm add";    _hr px "pnpm dlx"
    end

    function _hints_cargo
        _hh 33 "🦀 Cargo / Go"
        _hr cr  "cargo run";    _hr cb  "cargo build"
        _hr cbr "cargo build --release"
        _hr ct  "cargo test";   _hr cf  "cargo fmt"; _hr ccl "cargo clippy"
        _hr gor "go run .";     _hr gob "go build"
        _hr got "go test ./..."; _hr gom "go mod tidy"
    end

    function _hints_systemctl
        _hh 37 "⚙️  Systemctl"
        _hr sc   "sudo systemctl";  _hr scs  "systemctl status"
        _hr scr  "systemctl restart"; _hr scst "systemctl start"
        _hr scsp "systemctl stop"
    end

    function _hints_ide
        _hh 35 "📝 IDEs & Text Editors"
        _hr vc   "code (VS Code)"; _hr cs   cursor
        _hr zd   zed;              _hr sb   "subl (Sublime)"
        _hr n    nano;             _hr v    vim
        _hr nv   nvim;             _hr id   "idea (IntelliJ)"
        _hr ag   "antigravity-ide"; _hr lg   lazygit
    end





    function _hints_functions
        _hh 33 "🔧 Functions — General"
        _hr mkcd    "Create dir and cd into it"
        _hr venv    "Create/activate Python venv"
        _hr extract "Extract any archive format"
        _hr conf    "Edit config files (\$EDITOR)"
        _hr fe      "Fuzzy find and edit file"
        _hr fcd     "Fuzzy find and cd into dir"
        _hr backup  "Timestamped file backup"
        _hr reload  "Reload fish configuration"
        _hr port    "Find process using a port"
        _hr hints   "Show this help"
    end

    function _hints_dev
        _hh 33 "🚀 Functions — Developer"
        _hr serve    "Quick HTTP server (python)"
        _hr killport "Kill process on a port"
        _hr envload  "Load .env into shell"
        _hr gig      "Generate .gitignore"
        _hr rgf      "Ripgrep + fzf → editor"
        _hr dclean   "Docker cleanup"
        _hr proj     "Jump to project dir (fzf)"
        _hr bench    "Benchmark a command"
        _hr json     "Pretty-print JSON"
    end

    function _hints_keys
        _hh 31 "⌨️  Keybindings"
        _hr "Ctrl+T" "Fuzzy find file (fzf)"
        _hr "Alt+C"  "Fuzzy find directory (fzf)"
        _hr "Ctrl+R" "Search history (atuin/fzf)"
        _hr "Ctrl+/" "Toggle fzf preview"
    end

    # ── All sections in order ───────────────────────────────────
    function _hints_all
        _hints_git
        _hints_system
        _hints_files
        _hints_pkg
        _hints_docker
        _hints_compose
        _hints_npm
        _hints_cargo
        _hints_systemctl
        _hints_ide
        _hints_functions
        _hints_dev
        _hints_keys
        echo ""
    end

    # ── Section map ─────────────────────────────────────────────
    set -l sections git system files pkg docker compose npm cargo systemctl ide functions dev keys

    # ── Handle arguments ────────────────────────────────────────
    if not set -q argv[1]
        # Default: pager mode (bat if available, otherwise less)
        if type -q bat
            _hints_all | bat --paging=always --style=plain
        else
            _hints_all | less -R
        end
    else
        switch $argv[1]
            case search s
                # Interactive fzf search
                _hints_all | fzf --ansi \
                    --header="Type to search shortcuts..." \
                    --no-sort \
                    --multi \
                    --border=rounded \
                    --prompt="🔍 " \
                    --height=80%
            case list ls
                echo ""
                printf "  \e[1;37mAvailable sections:\e[0m\n"
                printf "  \e[90m─────────────────────────────────────────────────────\e[0m\n"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" git "Git shortcuts"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" system "System & navigation"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" files "File operations"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" pkg "Pacman / Yay"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" docker "Docker"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" compose "Docker Compose"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" npm "npm / pnpm"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" cargo "Cargo / Go"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" systemctl "Systemctl"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" ide "IDEs & Editors"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" functions "General functions"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" dev "Developer functions"
                printf "  \e[1;32m%-12s\e[0m\e[36m%s\e[0m\n" keys "Keybindings"
                echo ""
                printf "  \e[90mUsage: hints <section> | hints search | hints\e[0m\n"
                echo ""
            case git
                _hints_git; echo ""
            case system sys
                _hints_system; echo ""
            case files file
                _hints_files; echo ""
            case pkg pacman yay
                _hints_pkg; echo ""
            case docker dk
                _hints_docker; echo ""
            case compose dc
                _hints_compose; echo ""
            case npm pnpm node
                _hints_npm; echo ""
            case cargo go rust
                _hints_cargo; echo ""
            case systemctl sc service
                _hints_systemctl; echo ""
            case ide editor
                _hints_ide; echo ""
            case functions fn func
                _hints_functions; echo ""
            case dev developer
                _hints_dev; echo ""
            case keys keybinds kb
                _hints_keys; echo ""
            case all
                _hints_all
            case '*'
                printf "  \e[31mUnknown section: %s\e[0m\n" $argv[1]
                echo "  Run 'hints list' to see available sections"
        end
    end

    # Cleanup
    set -e _hints_col
    functions -e _hr _hh
    functions -e _hints_git _hints_system _hints_files _hints_pkg
    functions -e _hints_docker _hints_compose _hints_npm _hints_cargo
    functions -e _hints_systemctl _hints_ide _hints_functions _hints_dev _hints_keys
    functions -e _hints_all
end
