# vi keybindings at the prompt (readline built-in; zsh used the zsh-vi-mode plugin).
set -o vi

command -v fzf    >/dev/null && eval "$(fzf --bash)"
command -v zoxide >/dev/null && eval "$(zoxide init bash)"

if command -v eza >/dev/null; then
  alias l='eza --icons'
  alias la='eza -a --icons'
  alias ll='eza -lah --icons'
  alias ls='eza --color=auto --icons'
fi

# Lazy-load nvm: sourcing nvm.sh eagerly costs ~380ms on every shell start.
# Inlined stubs (no shared helper): tools that snapshot shell functions (e.g. Claude Code's
# Bash tool) must not capture a stub that calls a helper they didn't capture.
export NVM_DIR="$HOME/.nvm"
for _nvm_cmd in nvm node npm npx; do
  eval "${_nvm_cmd}() {
    unset -f nvm node npm npx
    [ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"
    [ -s \"\$NVM_DIR/bash_completion\" ] && . \"\$NVM_DIR/bash_completion\"
    ${_nvm_cmd} \"\$@\"
  }"
done
unset _nvm_cmd
