# -----------------
# NVM
# -----------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
nvm use stable


# -----------------
# PATH - Any scripts in ~/scripts can be run globally.
# -----------------
export PATH="$PATH:$HOME/scripts"

# -----------------
# mkcd Function - Creates and enters a directory
# -----------------
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# -----------------
# General Aliases
# -----------------
alias c='code .'
alias nr='npm run'
alias nrd='npm run dev'
alias nrb='npm run build'
alias ll="ls -la"
alias o="open ."

# -----------------
# Git Aliases
# -----------------

alias gc='git checkout'
alias gp='git pull'
alias gs='git add . && git stash'
alias gsp='git stash pop'
alias gri='git rebase -i'
alias gpf='git push --force-with-lease'
alias gpdev='git pull origin development --rebase'