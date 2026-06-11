if status is-interactive
    # ── Prompt ──────────────────────────────────────────────────
    starship init fish | source

    # ── Shell Integrations ──────────────────────────────────────
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source

    # ── Custom Colours (Caelestia) ──────────────────────────────
    cat ~/.local/state/caelestia/sequences.txt 2>/dev/null

    # ── Foot Terminal — prompt marking for jump-between-prompts ─
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
end

set -gx GTK_IM_MODULE fcitx5
set -gx QT_IM_MODULE fcitx5
set -gx XMODIFIERS @im=fcitx5

pyenv init - | source
