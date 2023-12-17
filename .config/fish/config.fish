### Fish Greeting Message ###
set fish_greeting ""

# Theme
# fish_config theme save "Catppuccin Mocha"

### ALIAS ###
alias c "code ."
alias ll "eza --color=always --group-directories-first --icons --git -l" # my preferred listing
alias la "eza --color=always --group-directories-first --icons --git -al" # all files and dirs
alias lt "eza -lT --color=always --group-directories-first --icons --git" # tree listing
alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME" # Bare Dotfile Manager
alias addgitignore "npx add-gitignore" # Added 'npx add-gitignore'

# Git Alias 
alias g "git"
alias gg "lazygit"
alias gs "git status"
alias ga "git add"
alias gcom "git commit"
alias gco "git checkout"
alias gb "git branch"
alias gpull "git pull"
alias gpush "git push"
alias glog "git log"
alias gd "git diff --ignore-all-space --ignore-space-at-eol --ignore-space-change --ignore-blank-lines . ':(exclude)*package-lock.json'"

### PLUGINS ###
# ProjectDo
abbr -a b --function projectdo_build
abbr -a r --function projectdo_run
abbr -a t --function projectdo_test
abbr -a p --function projectdo_tool

if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Starship Initialization ###
starship init fish | source

### Homebrew Initialization ###
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

###  Conda Initialization ###
if test -e /home/raul/miniconda3/etc/fish/conf.d/conda.fish
    . /home/raul/miniconda3/etc/fish/conf.d/conda.fish
else
    set -x PATH /home/raul/miniconda3/bin $PATH
end

# conda activate base

### asdf Initialization ###
source ~/.asdf/asdf.fish

# Enabling Transience Prompt - Left & Right
enable_transience
