# Initialize Starship
try { $null = starship init powershell | Invoke-Expression } catch { }

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Set history search cursor position
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Enable Predictive IntelliSense with list view
try { $null = Set-PSReadLineOption -PredictionSource History } catch { }
try { $null = Set-PSReadLineOption -PredictionSource HistoryAndPlugin } catch { }
try { $null = Set-PSReadLineOption -PredictionViewStyle ListView } catch { }
