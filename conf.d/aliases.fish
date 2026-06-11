status is-interactive; or return

# ── Modern CLI Tool Aliases ─────────────────────────────────────
alias cat='bat --paging=never --style=plain'
alias grep='rg'
alias find='fd'

# ── Colorized Man Pages (bat) ───────────────────────────────────
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT "-c"

# ── Default Editor ──────────────────────────────────────────────
if not set -q EDITOR
    set -gx EDITOR nano
end

# ── IDEs & Text Editors ─────────────────────────────────────────
alias vc='code'
alias cs='cursor'
alias zd='zed'
alias sb='subl'
alias n='nano'
alias v='vim'
alias nv='nvim'
alias id='idea'
alias ag='antigravity-ide'
alias lg='lazygit'




