[ -r /etc/bashrc ] && source /etc/bashrc
[ -r /etc/bash_completion ] && source /etc/bash_completion
[ -r /usr/local/rvm/scripts/rvm ] && source /usr/local/rvm/scripts/rvm

export TERM=xterm-256color

black=$(tput setaf 0)
red=$(tput setaf 9)
green=$(tput setaf 83)
yellow=$(tput setaf 11)
cyan=$(tput setaf 51)
pink=$(tput setaf 201)
blue=$(tput setaf 39)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# Nicely formatted terminal prompt
export PS1='\n\[$bold\][\[$green\]\u\[$cyan\]@\[$green\]\h \[$cyan\]\@\[$reset\]\[$reset\]\[$bold\]] [\[$pink\]\w\[$reset\]\[$bold\]]\[$yellow\]$(parse_git_branch)\[$reset\]\[$bold\]\[$red\] \$ \[$reset\]'
alias grep='grep --color=auto -in'
