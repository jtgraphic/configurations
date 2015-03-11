export EDITOR=/usr/bin/vim
JAVA_HOME=$(/usr/libexec/java_home)

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && rvm use 1.9

source ~/.bash_sensitive

alias l='ls -lhaG'
alias ll='ls -lhaG'

alias gits='git status;'

alias chef-roles='find roles -name "*.json" -or -name "*.rb" | xargs knife role from file'
alias chef-environments='find environments -name "*.json" -or -name "*.rb" | xargs knife environment from file'
alias chef-sync='knife cookbook upload -a; chef-roles; chef-environments;'

function gitp() {
  git push -u origin $(ref)
  hub pull-request "[#$(ref)] $(last_commit)" -b daftlabs:master -h daftlabs:$(ref)
}

function project() {
  git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//'
}

function last_commit() {
  git log --format=%B -1
}

function ref(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' || return
}

function sha(){
    git rev-parse --short HEAD 2> /dev/null | sed -e 's/\(.*\)/\[\1\]/' || return
}

function dateOut() {
    date +%H:%M || return
}

kpurge() {
    knife client delete $1
    knife node delete $1
}

kssh() {
    IP=`knife node show $1 | grep "IP" | sed 's/IP:          //g'`
    ssh ubuntu@$IP
}

_kssh() {
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(knife node list | tr '\n' ' ')
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}

deploy() {
  knife ssh "name:*.$2" "sudo chef-client" -x ubuntu -a ec2.public_hostname -i ~/.ssh/$1-validator.pem
}

complete -F _kssh kssh
complete -F _kssh kpurge

function cdc() {
    cd ~/code/$1
}

cdc() {
    cd ~/code/$1
}

_cdc() {
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(cd ~/code ; ls -d *)
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}

complete -F _cdc cdc

RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\e[0;37m\]"

PS1="$GREEN[\$(dateOut)]$YELLOW[\$(ref)]\$(sha)\[\e[0m\][\w]\$ "

eval "$(hub alias -s)"
