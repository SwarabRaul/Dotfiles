### IMPORTS ###
Import-Module -Name PSFzf
Import-Module -Name ZLocation
Import-Module Catppuccin
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

### Catppuccin Theme ###
# Set a flavor for easy access
$Flavor = $Catppuccin['Mocha']

### PSReadline ###
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates 
Set-PSReadLineOption -BellStyle None

$Colors = @{
	# Largely based on the Code Editor style guide
	# Emphasis, ListPrediction and ListPredictionSelected are inspired by the Catppuccin fzf theme
	
	# Powershell colours
	ContinuationPrompt     = $Flavor.Teal.Foreground()
	Emphasis               = $Flavor.Red.Foreground()
	Selection              = $Flavor.Surface0.Background()
	
	# PSReadLine prediction colours
	InlinePrediction       = $Flavor.Overlay0.Foreground()
	ListPrediction         = $Flavor.Mauve.Foreground()
	ListPredictionSelected = $Flavor.Surface0.Background()

	# Syntax highlighting
	Command                = $Flavor.Blue.Foreground()
	Comment                = $Flavor.Overlay0.Foreground()
	Default                = $Flavor.Text.Foreground()
	Error                  = $Flavor.Red.Foreground()
	Keyword                = $Flavor.Mauve.Foreground()
	Member                 = $Flavor.Rosewater.Foreground()
	Number                 = $Flavor.Peach.Foreground()
	Operator               = $Flavor.Sky.Foreground()
	Parameter              = $Flavor.Pink.Foreground()
	String                 = $Flavor.Green.Foreground()
	Type                   = $Flavor.Yellow.Foreground()
	Variable               = $Flavor.Lavender.Foreground()
}
# Set the colours
Set-PSReadLineOption -Colors $Colors

#### PSFzf ###
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Fzf - Catppuccin Theme
$ENV:FZF_DEFAULT_OPTS = @"
--color=bg+:$($Flavor.Surface0),bg:$($Flavor.Base),spinner:$($Flavor.Rosewater)
--color=hl:$($Flavor.Red),fg:$($Flavor.Text),header:$($Flavor.Red)
--color=info:$($Flavor.Mauve),pointer:$($Flavor.Rosewater),marker:$($Flavor.Rosewater)
--color=fg+:$($Flavor.Text),prompt:$($Flavor.Mauve),hl+:$($Flavor.Red)
--color=border:$($Flavor.Surface2)
"@

### Starship Initialization ###
Invoke-Expression (&starship init powershell)

# Transient Prompt Function
function Invoke-Starship-TransientFunction {
  &starship module character
}
Enable-TransientPrompt
