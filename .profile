# ========================================
#              General Aliases
# ========================================
alias groovy='/d/groovy-2.5.3/bin/groovy'
alias cdg='cd /d/git-clones'


# ========================================
#              Git Clone Aliases
# ========================================
# clone repository and directly cd into it
gclone() {
  git clone "$1" && cd "$(basename $1 .git)"
}
alias gcd=gclone

alias go='git clone'

# ========================================
#              Main Git Aliases
# ========================================
alias gs='git status'
alias gss='git status -sb'
alias gl='git pull'
alias gp='git push'
alias gf='git fetch'
alias ga='git add '
alias gaa='git add .'
alias gcmsg='git commit -m '

alias gco='git checkout '
alias gcb='git checkout -b'
alias gclear='git checkout -- '
alias gh='git checkout -'
alias gr='git reset HEAD '

alias gb='git branch'
alias gblist='git branch -a'
alias gbshow='git branch -vv'

alias gm='git merge'

alias gd='git diff'
alias gda='git diff HEAD'
alias gdc='git diff --cached'

alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

alias gconfig='git config --global'

alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# ========================================
#              Other Aliases
# ========================================
alias gwhat='git whatchanged'
alias g1="git whatchanged --since='1 day ago'"
alias g7="git whatchanged --since='7 days ago'"

alias glg='git log'
alias glo='git log --oneline --decorate --color'
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

alias gr='git grep -l '
alias gra="git rev-list --all | xargs git grep "
alias ggrep="git log -p | grep "

alias gk='gitk --all --branches'

# To find which commits and which files a string was added or removed in:

# git log -S'search string' --oneline --name-status

# To see the diff of that

# git log -S'search string' -p | grep 'search string' -C5
