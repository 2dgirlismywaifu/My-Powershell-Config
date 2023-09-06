# Startship terminal prompt
#Invoke-Expression (&starship init powershell)

# ls icon list using Terminal-Icons
Import-Module -Name Terminal-Icons

# Oh My Posh Theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
#Imports PSReadLine
Import-Module PSReadLine
#Tab - Gives a menu of suggestions
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
#UpArrow will show the most recent command
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
#DownArrow will show the least recent command
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#During auto completion, pressing arrow key up or down will move the cursor to the end of the completion
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
#Shows tooltip during completion
Set-PSReadLineOption -ShowToolTips
#Gives completions/suggestions from historical commands
Set-PSReadLineOption -PredictionSource History
#Change the color of the suggestion menu
Set-PSReadLineOption -Colors @{
  InlinePrediction = '#a6e3a1'
  Command            = '#89b4fa'
  Number             = '#eba0ac'
  Member             = '#f38ba8'
  Operator           = '#cba6f7'
  Type               = '#f2cdcd'
  Variable           = '#f38ba8'
  Parameter          = '#f38ba8'
  ContinuationPrompt = '#f38ba8'
  Default            = '#b4befe'
  }
#Change location of history file
Set-PSReadLineOption -HistorySavePath "$env:USERPROFILE\OneDrive\Documents\PowerShell\history.txt"