$paths = @(
    "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe",
    "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe",
    "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\Application\brave.exe"
)

$BravePath = $paths | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $BravePath) {
    throw "Brave not found"
}

$appUrl = "https://huggingface.co/learn/agents-course/unit3/agentic-rag/agent"
$shortcutPath = Join-Path ([Environment]::GetFolderPath("Desktop")) "Agent.lnk"

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $BravePath
$shortcut.Arguments = "--app=$appUrl"
$shortcut.IconLocation = "$BravePath,0"
$shortcut.Save()