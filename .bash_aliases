shopt -s expand_aliases
# Common Aliases

alias tmp='cd /home/greg/code/tmp_scripts'

item_hash() {
	php /home/greg/code/testreq/testrequest.php item_hash $1
}

alias tmux='tmux -2'
alias git=hub
alias pl="git status --short | cut -c 4- | xargs -n1 php -l"
alias gls="git status"
alias gc="git checkout"
alias gl="git log --all --graph --decorate --oneline --simplify-by-decoration"
source /usr/share/bash-completion/completions/git
__git_complete gc _git_checkout


# HS Aliases

alias hs='cd /home/greg/code/headshot_server/'
alias hss="rsync -zrlpPt --delete --force --progress --exclude '.git' --exclude '*php.sw*' --exclude 'tags' /home/greg/code/headshot_server/ hs_dev2:/var/www/gregmatthews/"
alias hs_dev='ssh hs_dev'
alias hs_dev2='ssh hs_dev2'
alias hs_dev3='ssh hs_dev3'
alias hs_qa='ssh hs_qa'
alias hs_qa2='ssh hs_qa2'
alias hs_qa3='ssh hs_qa3'
alias hs_stg='ssh hs_stg'
alias hs_admin='ssh hs_admin_prod'
alias hs_tags='/home/greg/.vim/mytags/create_hs.sh'
alias hgp='grep -rniI --exclude=tags --exclude=*.min.js --exclude=*.min.css --exclude=*.phar --exclude=*.json --exclude-dir=.git --exclude-dir=ext --exclude-dir=vendor'
alias hs_build='~/code/headshot_client/build/scripts/build_apk.sh rebuild Headshot Debug x86 10 notc `svn info ~/code/headshot_client | grep "Last Changed Rev" | cut -f 4 -d " "` no'
alias apk='for DEVID in `adb devices | grep -o "emulator-[0-9]*"`; do echo $DEVID; adb -s $DEVID install -r ~/code/headshot_client/build/proj.android/bin/HeadShot-debug.apk ; done'
alias sims='for EMULATOR in "HS_1" "HS_1a"; do emulator -avd $EMULATOR  -netspeed full -netdelay none -qemu -m 2047 -enable-kvm > /dev/null 2>&1 & done'
alias hs_rev='echo "`git symbolic-ref --short -q HEAD`_`git describe --match v1`"'
alias hs_test='. ~/code/headshot_server/classes/Headshot/Test/test_gm.sh --verbose --testsuite Local-Tests'
alias hs_test_cover='hs_test --coverate-html /tmp'
alias sim_log='adb -d logcat -v time | grep `adb shell ps | grep com.scopely.headshot | cut -c10-15`'
