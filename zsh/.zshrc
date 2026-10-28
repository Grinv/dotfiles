# /etc/zshrc sets stingy defaults (HISTSIZE=2000 SAVEHIST=1000) — override for real usage.
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY       # save timestamp + duration per command
setopt HIST_IGNORE_DUPS       # skip immediate repeats
setopt HIST_IGNORE_ALL_DUPS   # a new dup removes the older one from history
setopt HIST_IGNORE_SPACE      # commands starting with a space aren't recorded
setopt HIST_VERIFY            # expand !-history before running, don't run blind
setopt SHARE_HISTORY          # sync across concurrently open sessions

BREW_PREFIX="$(brew --prefix)"
source "$BREW_PREFIX/opt/spaceship/spaceship.zsh"

export NVM_DIR="$HOME/.nvm"
# Lazy-load nvm: sourcing nvm.sh eagerly costs ~380ms on every shell start (profiled).
# Instead, define stubs that load the real thing only on first use of node/npm/npx/nvm.
# Inlined (not split into a shared helper): tools that snapshot shell function state
# (e.g. Claude Code's Bash tool) can capture these wrapper functions without capturing
# a separate helper function, which previously left a dangling call to an undefined
# function and caused infinite self-recursion until FUNCNEST was exhausted.
for _nvm_cmd in nvm node npm npx; do
  eval "${_nvm_cmd}() {
    unset -f nvm node npm npx
    [ -s \"/opt/homebrew/opt/nvm/nvm.sh\" ] && \\. \"/opt/homebrew/opt/nvm/nvm.sh\"
    [ -s \"/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm\" ] && \\. \"/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm\"
    ${_nvm_cmd} \"\$@\"
  }"
done
unset _nvm_cmd

source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$BREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias l='eza --icons'
alias la='eza -a --icons'
alias ll='eza -lah --icons'
alias ls='eza --color=auto --icons'
