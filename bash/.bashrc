### Standard stuff ###
if [[ $- != *i* ]] ; then
      # Shell is non-interactive, return now.
      return
fi

export HISTFILESIZE=20000

export TERM=xterm-256color

source ~/dotfiles/git/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH=$PATH:~/Scripts

### Aliases and function helpers ###

# BASH Helpers
alias ls='ls -G'
alias ll='ls -A -l'
alias la='ls -A'
alias l='ls -CF'
alias countfiles='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'
hash_folder() { find $1 -type f -exec md5sum {} \; | cut -d " " -f 1 | sort| md5sum; }

# Pretty print code
alias enscript_c='enscript -q -B -C -Ec -G --color --word-wrap -f Courier9 -MLetter -p - $@'
alias enscript_python='enscript -q -B -C -Epython -G --color --word-wrap -f Courier9 -MLetter -p - $@'

# useful tools
alias servedir='python -m SimpleHTTPServer'

# tmux aliases
alias tma='tmux attach -d -t'
alias git-tmux='tmux new -s $(basename $(pwd))'

# git -> g
alias g='git'

# pretty view of git branches, ordered by edit date
alias gb='git for-each-ref --sort=committerdate refs/heads/ --format="%(HEAD)%(color:blue)%(refname:short)%(color:reset) -%(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname)(%(color:green)%(committerdate:relative)%(color:reset))"'

# clear all vim swap files
alias clearswap='find . -type f -name "*.sw[klmnop]" -delete'

if [ -x ~/.bashrc_local ]; then
    . ~/.bashrc_local
else
  echo "No local file loaded"
fi

# Convenient shortcut to start livedown monitoring
# https://www.npmjs.com/package/livedown
alias livedown='livedown start README.md  --port 1337'
alias docker-compose-prod='docker-compose -f docker-compose.base.yml -f docker-compose.prod.yml'
alias docker-compose-dev='docker-compose -f docker-compose.base.yml -f docker-compose.dev.yml'
alias docker-prune-f='docker container prune -f & docker volume prune -f'
alias docker-discprov-rm-f='docker-compose-dev rm -f & docker volume prune -f'

# Usage
# `grep -HRn "search term" [directory]`
alias grepss='grep -Hrn'

alias ktiller='export TILLER_NAMESPACE=tiller
tiller -listen=localhost:44134 -storage=secret -logtostderr'

# aliases for quick navigate to folders
alias ap='cd ~/Development/audius-protocol'
alias cn='cd ~/Development/audius-protocol/creator-node'
alias cs='cd ~/Development/audius-protocol/content-service'
alias dp='cd ~/Development/audius-protocol/discovery-provider'
alias libs='cd ~/Development/audius-protocol/libs'
alias is='cd ~/Development/audius-protocol/identity-service'
alias tool='cd ~/Development/audius-tooling'
alias dapp='cd ~/Development/audius-dapp'
alias kube='cd ~/Development/audius-k8s'
alias spdash='cd ~/Development/sp-dashboard'

alias k='kubectl'
alias ks='kubectl -n stage'
alias kp='kubectl -n production'
alias kc='kubectl -n content'
alias ksw='watch kubectl -n stage get pods,svc,pvc'
alias kpw='watch kubectl -n production get pods,svc,pvc'
alias kuseprod='k config use-context arn:aws:eks:us-west-2:526177477460:cluster/audius-production'
alias kusestage='k config use-context arn:aws:eks:us-west-2:526177477460:cluster/audius-stage-xl'
alias kusecontent='k config use-context arn:aws:eks:eu-west-1:526177477460:cluster/audius-content-services'

export TILLER_NAMESPACE=tiller
export HELM_HOST=:44134

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=

AWS_DEFAULT_REGION=us-west-1

alias k=kubectl

# Cached version of PS1 including user/etc
# export PS1="\[[33m\]\A \[[32m\]\u@\h \[[34m\]\w\$(__git_ps1) \n\$ \[[0m\]"

# Simpler version of PS1 - eliminate user prefix
export PS1="\[[33m\]\A \[[32m\]\[[34m\]\w\$(__git_ps1) \n\$ \[[0m\]"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
