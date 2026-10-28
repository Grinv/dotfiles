# Homebrew. Deliberately here and not in .zshenv: /etc/zprofile runs
# `path_helper`, which rebuilds PATH from /etc/paths and /etc/paths.d/* and then
# appends whatever was already set. Anything prepended in .zshenv therefore ends
# up behind /usr/local/bin and /usr/bin. .zprofile is sourced after that, so the
# prepend sticks.
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/konstantin/.docker/bin"
# End of Docker Desktop section.
