PS1="\[\033[38;5;12m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ "
source ~/.alias
source ~/.ls_colors

source ~/.env_vars

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/quantexa/google-cloud-sdk/path.bash.inc' ]; then . '/home/quantexa/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/quantexa/google-cloud-sdk/completion.bash.inc' ]; then . '/home/quantexa/google-cloud-sdk/completion.bash.inc'; fi
