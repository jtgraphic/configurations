alias gits='git status;'
alias cdc='cd ~/code/';
alias chef-roles='for file in `find roles/ -path "*\.json"`; do knife role from file $file; done'
alias chef-environments='for file in `find environments/ -path "*\.json"`; do knife environment from file $file; done'
alias chef-sync='knife cookbook upload -a; chef-roles; chef-environments;'

RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\e[0;37m\]"

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
