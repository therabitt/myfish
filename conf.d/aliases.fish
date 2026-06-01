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
