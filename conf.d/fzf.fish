status is-interactive; or return
command -v fzf &>/dev/null; or return

# ── fzf Configuration — powered by fd + bat ─────────────────────
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

set -gx FZF_DEFAULT_OPTS "\
    --height=60% \
    --layout=reverse \
    --border=rounded \
    --prompt='  ' \
    --pointer='▸' \
    --marker='✓' \
    --info=inline \
    --preview-window='right:50%:wrap' \
    --bind='ctrl-/:toggle-preview'"

# Ctrl+T — fuzzy find file (with bat preview)
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers --line-range=:300 {} 2>/dev/null || cat {}'"

# Alt+C — fuzzy find directory (with tree preview)
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --level=1 --icons --color=always {} 2>/dev/null || ls {}'"

# Load fzf shell integration (Ctrl+T, Ctrl+R, Alt+C)
fzf --fish | source
