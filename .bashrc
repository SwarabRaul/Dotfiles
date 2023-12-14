# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History Control
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

### ALIAS ###
alias c='code'
alias ll='eza --icons --group-directories-first --git -l' # my preferred listing
alias la='eza --icons --group-directories-first --git -l -a' # all files and dirs
alias tree='eza -T --icons --group-directories-first --git -l' # tree listing
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # Bare Dotfile Manager

# Git Alias
alias g='git'
alias gg='lazygit'
alias gs='git status'
alias ga='git add'
alias gcom='git commit'
alias gco='git checkout'
alias gb='git branch'
alias gpull='git pull'
alias gpush='git push'
alias glog='git log'
alias gd="git diff --ignore-all-space --ignore-space-at-eol --ignore-space-change --ignore-blank-lines . ':(exclude)*package-lock.json'"

### Starship Initialization ###
eval "$(starship init bash)"

### Homebrew Initialization ###
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

### Conda Initialization ###
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/raul/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/raul/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/raul/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/raul/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### asdf Initialization ###
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"