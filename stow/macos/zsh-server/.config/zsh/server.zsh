VIM="nvim"

# Let's set colored prompt
PS1='%F{blue}%n@%m%f %F{cyan}%1~%f %# '

export EDITOR=$VIM
export GIT_EDITOR=$VIM

PATH="/usr/local/bin:$PATH"
PATH="$HOME/.bin:$PATH"

export PATH
