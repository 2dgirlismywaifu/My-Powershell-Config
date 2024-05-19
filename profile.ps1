
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "D:\builder_cache\anaconda\Scripts\conda.exe") {
    (& "D:\builder_cache\anaconda\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion

