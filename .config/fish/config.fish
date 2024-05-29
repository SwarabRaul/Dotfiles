### Fish Greeting Message ###
set fish_greeting ""

# ### ALIAS ###
alias ll "eza --color=always --group-directories-first --icons --git -l --hyperlink" # my preferred listing
alias la "eza --color=always --group-directories-first --icons --git -al --hyperlink" # all files and dirs
alias lt "eza --color=always --group-directories-first --icons --git -lT --hyperlink" # tree listing
alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME" # Bare Dotfile Manager
alias cl "clear"
alias bat "batcat"
alias gg "lazygit"
alias g "git"
alias gs "git status"
alias ga "git add"
alias gcom "git commit"
alias gco "git checkout"
alias gb "git branch"
alias gpull "git pull"
alias gpush "git push"
alias glog "git log"
alias gd "git diff --ignore-all-space --ignore-space-at-eol --ignore-space-change --ignore-blank-lines . ':(exclude)*package-lock.json' $args | xargs batcat --diff"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Starship Initialization ###
starship init fish | source

function starship_transient_prompt_func
  starship module status
end
enable_transience # Enable terminal transiences

###  Conda Initialization ###
if test -e /home/raul/miniconda3/etc/fish/conf.d/conda.fish
    . /home/raul/miniconda3/etc/fish/conf.d/conda.fish
else
    set -x PATH /home/raul/miniconda3/bin $PATH
end

# conda activate base

### asdf Initialization ###
source ~/.asdf/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish # Setting Java Home

### Zoxide Initialization ###
# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
zoxide init fish | source

### fzf Initialization ###
# Set up fzf key bindings
fzf --fish | source