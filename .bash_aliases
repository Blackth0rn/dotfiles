shopt -s expand_aliases
# Common Aliases

alias tmp='cd /home/greg/code/tmp_scripts'

item_hash() {
	php /home/greg/code/testreq/testrequest.php item_hash $1
}

alias tmux='tmux -2'
alias pl="git status --short | cut -c 4- | xargs -n1 php -l"
alias gls="git status"
alias gc="git checkout"
alias gl="git log --all --graph --decorate --oneline --simplify-by-decoration"
source /usr/share/bash-completion/completions/git
__git_complete gc _git_checkout


alias gp='grep -rniI --exclude=tags --exclude=*.min.js --exclude=*.min.css --exclude=*.phar --exclude=*.json --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=.svn'
