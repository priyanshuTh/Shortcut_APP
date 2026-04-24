
$BravePath = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\Application\brave.exe"

if (-not $BravePath) {
    throw "Brave not found"
}

$appUrl = "https://huggingface.co/learn/agents-course/unit3/agentic-rag/agent"
$shortcutPath = Join-Path ([Environment]::GetFolderPath("Desktop")) "Agent.lnk"

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $BravePath
$shortcut.Arguments = "--app=$appUrl"
$shortcut.IconLocation = "$env:USERPROFILE\huggingface.ico"
$shortcut.Save()
