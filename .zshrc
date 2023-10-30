# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# added for nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# enabling some built-in features
zstyle ':completion:*' menu select
autoload -U compinit && compinit
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# personal aliases
alias cls="clear"
alias zshconfig="nano ~/.zshrc"
alias aws-profiles="cat ~/.aws/credentials | grep -o '\[[^]]*\]'"
alias pn='pnpm'
alias glfh="git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10"
alias git-count-lines="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"

#myzsh plugins
plugins=(
 kubectl
 bun
 ssh-agent
 git
 git-flow
 npm
 nvm
 docker
 docker-compose
 zsh-autosuggestions
)
zstyle :omz:plugins:ssh-agent identities github projectx companyy

source $ZSH/oh-my-zsh.sh

autoload -U promptinit
autoload -U add-zsh-hook

for script in $ZSH_CUSTOM/*.zsh; do source $script; done

add-zsh-hook chpwd load-nvmrc
load-nvmrc
add-zsh-hook chpwd set_aws_profile_based_on_dir
set_aws_profile_based_on_dir

eval "$(starship init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
export PATH=$PATH:$HOME/.bun/bin
export PATH=$PATH:~/.local/bin

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
