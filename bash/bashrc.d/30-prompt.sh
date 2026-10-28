# Prompt: starship (bash port of the zsh spaceship look; config in ~/.config/starship.toml).
# Fallback: git's own git-prompt.sh (ships with git-core) if starship isn't installed.
if command -v starship >/dev/null; then
  eval "$(starship init bash)"
elif [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
  . /usr/share/git-core/contrib/completion/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUPSTREAM=auto
  PS1='\[\e[1;34m\]\w\[\e[0m\]$(__git_ps1 " \[\e[35m\](%s)\[\e[0m\]")\n\$ '
fi
