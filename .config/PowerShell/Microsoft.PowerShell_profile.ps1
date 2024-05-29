# Import necessary modules
Import-Module -Name PSFzf
Import-Module -Name PSReadLine
Import-Module -Name Terminal-Icons

# Function Definitions

function llEza {
    eza --color=always --group-directories-first --icons --git -l --hyperlink
}

function laEza {
    eza --color=always --group-directories-first --icons --git -al --hyperlink
}

function ltEza {
    eza --color=always --group-directories-first --icons --git -lT --hyperlink
}

function Test-CommandExists {
    param($command)
    $null -ne (Get-Command $command -ErrorAction SilentlyContinue)
}

function whereis {
    param($command)
    Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path
}

function Edit-Profile {
    code $PROFILE.CurrentUserAllHosts
}

function touch {
    param($file)
    "" | Out-File $file -Encoding ASCII
}

function ReloadProfile {
    & $PROFILE
}

function docs {
    Set-Location -Path $HOME\Documents
}

function dtop {
    Set-Location -Path $HOME\Desktop
}

function down {
    Set-Location -Path $HOME\Downloads
}

function Get-PubIP {
    (Invoke-WebRequest http://ifconfig.me/ip).Content
}

function gs { git status }
function ga { git add $args }
function gcom { git commit $args }
function gco { git checkout $args }
function gb { git branch $args }
function gpull { git pull $args }
function gpush { git push $args }
function glog { git log $args }
function gd {
    git diff --ignore-all-space --ignore-space-at-eol --ignore-space-change --ignore-blank-lines . ':(exclude)*package-lock.json' $args | xargs bat --diff
}

# Alias Definitions

Set-Alias ll llEza
Set-Alias la laEza
Set-Alias lt ltEza
Set-Alias cl clear
Set-Alias gg lazygit
Set-Alias g git
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# PSFzf Configuration
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# FZF Environment Variable
$env:FZF_DEFAULT_OPTS = '--preview "bat --color=always --style=numbers {}"'

# Initialize Starship Prompt
Invoke-Expression (&starship init powershell)

# Transient Prompt Function
function Invoke-Starship-TransientFunction {
    &starship module status
}
Enable-TransientPrompt

# Initialize Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# PSReadLine Configuration
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -MaximumHistoryCount 4096
Set-PSReadLineOption -WordDelimiters ' ,.;:()[]{}'
Set-PSReadLineOption -BellStyle None

# Apply Nord Color Scheme to PSReadLine
Set-PSReadLineOption -Colors @{
    Command         = '#81A1C1'  # Frost Blue
    Parameter       = '#88C0D0'  # Frost Light Blue
    String          = '#A3BE8C'  # Aurora Green
    Operator        = '#EBCB8B'  # Aurora Yellow
    Variable        = '#D08770'  # Aurora Orange
    Number          = '#B48EAD'  # Aurora Purple
    Member          = '#5E81AC'  # Frost Dark Blue
    Type            = '#8FBCBB'  # Frost Blue Green
    Comment         = '#4C566A'  # Polar Night Dark Grey
    Keyword         = '#81A1C1'  # Frost Blue
    Selection       = '#434C5E'  # Polar Night Grey
    Default         = '#D8DEE9'  # Snow Storm Light Grey
    InlinePrediction = '#4C566A' # Polar Night Dark Grey
}
