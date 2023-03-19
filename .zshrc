export ZSH="/home/zero/.oh-my-zsh"
export PATH="~/.local/bin":$PATH
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


alias cls="clear"
alias zshconfig="nano ~/.zshrc"
alias aws-profiles="cat ~/.aws/credentials | grep -o '\[[^]]*\]'"
alias pn='pnpm'

plugins=(
 kubectl
 ssh-agent
 git
 git-flow
 npm
 docker
 docker-compose
 zsh-autosuggestions
)

zstyle :omz:plugins:ssh-agent identities id1 id2

source $ZSH/oh-my-zsh.sh

autoload -U promptinit
autoload -U add-zsh-hook


for script in $ZSH_CUSTOM/*.zsh; do source $script; done

add-zsh-hook chpwd auto-switch-node-version
auto-switch-node-version

eval "$(starship init zsh)"
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# pnpm
#export PNPM_HOME="/home/zero/.local/share/pnpm"
#export PATH="$PNPM_HOME:$PATH"
# pnpm end

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
