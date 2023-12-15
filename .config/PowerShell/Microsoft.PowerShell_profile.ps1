### IMPORTS ###
Import-Module -Name PSFzf
Import-Module -Name ZLocation
# Import-Module -Name Terminal-Icons

### ALIAS ###
Set-Alias c  openCode
Set-Alias ll llEza
Set-Alias la laEza
Set-Alias lt ltEza
Set-Alias grep findstr

# Git Alias
Set-Alias g git
Set-Alias gg lazygit
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'


### FUNCTIONS ###
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function openCode {
  code . # Open VSCode in currect dir
}

function llEza {
  eza --color=always --group-directories-first --icons --git -l # my preferred listing
}

function laEza {
  eza --color=always --group-directories-first --icons --git -al # all files and dirs
}

function ltEza {
  eza -lT --color=always --group-directories-first --icons --git # tree listing
}

function config {

} 

# Git Alias Functions
function gs { git status }
function ga { git add $args }
function gcom { git commit $args }
function gco { git checkout $args }
function gb { git branch $args }
function gpull { git pull $args }
function gpush { git push $args }
function glog { git log $args }
function gd {
    git diff --ignore-all-space --ignore-space-at-eol --ignore-space-change --ignore-blank-lines . ':(exclude)*package-lock.json' $args
}

### PSReadline ###
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates 
Set-PSReadLineOption -BellStyle None

# PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

### Starship Initialization ###
Invoke-Expression (&starship init powershell)