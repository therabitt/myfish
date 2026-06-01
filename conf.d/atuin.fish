status is-interactive; or return
command -v atuin &>/dev/null; or return

# ── Atuin — Magical Shell History ────────────────────────────────
# Ctrl+R is handled by Atuin (overrides fzf's Ctrl+R)
# Up arrow also triggers Atuin search
atuin init fish | source
