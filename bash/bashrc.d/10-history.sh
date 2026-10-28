# Fedora's /etc/bashrc keeps bash defaults (HISTSIZE=1000) — raise for real usage.
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth:erasedups   # skip space-prefixed + repeats; a new dup removes the older one
HISTTIMEFORMAT='%F %T '            # store timestamps (shown by `history`)
shopt -s histappend                # append to ~/.bash_history instead of overwriting on exit
shopt -s histverify                # expand !-history before running, don't run blind
# Share history across concurrently open shells: write each command now, read others' new ones.
PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
