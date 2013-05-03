export EDITOR=/usr/bin/vim
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export JAVA_HOME=$(/usr/libexec/java_home)

source ~/.bash_sensitive

alias gits='git status;'
alias chef-roles='find roles -name "*.json" -or -name "*.rb" | xargs knife role from file'
alias chef-environments='find environments -name "*.json" -or -name "*.rb" | xargs knife environment from file'
alias chef-sync='knife cookbook upload -a; chef-roles; chef-environments;'

RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\e[0;37m\]"

function cdc() {
    cd ~/code/$1
}

function ref(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\[\1\]/' || return
}

function sha(){
    git rev-parse --short HEAD 2> /dev/null | sed -e 's/\(.*\)/\[\1\]/' || return
}

function dateOut() {
    date +%H:%M || return
}

PS1="$GREEN[\$(dateOut)]$YELLOW\$(ref)\$(sha)\[\e[0m\][\w]\$ "

kssh() {
    IP=`knife node show 1.api.testing.updater.com | grep "IP" | sed 's/IP:          //g'`
    ssh ubuntu@$IP
}

_kssh() {
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(knife node list | tr '\n' ' ')
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}

complete -F _kssh kssh
