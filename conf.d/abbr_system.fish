status is-interactive; or return

# ── Better ls (eza) ─────────────────────────────────────────────
alias ls='eza --icons --group-directories-first -1'

# ── File Listing ────────────────────────────────────────────────
abbr l    'ls'
abbr ll   'ls -l'
abbr la   'ls -a'
abbr lla  'ls -la'
abbr lt   'eza --tree --level=2 --icons'
abbr lta  'eza --tree --level=2 --icons -a'

# ── Navigation ──────────────────────────────────────────────────
abbr ..   'cd ../'
abbr ...  'cd ../../'
abbr .... 'cd ../../../'

# ── Common ──────────────────────────────────────────────────────
abbr c      'clear'
abbr py     'python'
abbr fetch  'fastfetch'
abbr myip   'curl -s ifconfig.me'

# ── Safe File Operations ────────────────────────────────────────
abbr rm    'rm -i'
abbr cp    'cp -i'
abbr mv    'mv -i'
abbr copy  'wl-copy'
abbr del   'trash-put'
abbr undel 'trash-restore'

# ── Pacman / Yay ────────────────────────────────────────────────
abbr install 'sudo pacman -S'
abbr remove  'sudo pacman -Rns'
abbr search  'sudo pacman -Ss'
abbr sync    'sudo pacman -Syy'
abbr clean   'sudo pacman -Scc'
abbr update  'sudo pacman -Syu'
abbr yi      'yay -S'
abbr yu      'yay -Syu'
abbr ys      'yay -Ss'
