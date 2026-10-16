# Exportiert jede Folie (<section class="slide" id="folie-N">) eines Karussell-HTML als PNG (1080x1350).
# Aufruf: powershell -ExecutionPolicy Bypass -File export_karussell.ps1 -Html <pfad\karussell.html>
# Ausgabe: folie-1.png ... folie-N.png im selben Ordner wie das HTML.
param(
  [Parameter(Mandatory = $true)][string]$Html,
  [int]$Width = 1080,
  [int]$Height = 1350
)
$ErrorActionPreference = 'Stop'

$browser = @(
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $browser) { throw "Kein Chrome/Edge gefunden." }

$htmlPath = (Resolve-Path $Html).Path
$outDir = Split-Path $htmlPath -Parent
$src = [IO.File]::ReadAllText($htmlPath, [Text.Encoding]::UTF8)
$ids = [regex]::Matches($src, 'id="(folie-\d+)"') | ForEach-Object { $_.Groups[1].Value }
if (-not $ids) { throw "Keine Folien (id=""folie-N"") gefunden." }

$tmp = Join-Path $env:TEMP ("karussell_" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tmp | Out-Null
$profileDir = Join-Path $tmp 'profile'

try {
  foreach ($id in $ids) {
    $css = "<style>.draft-note{display:none!important}html,body{margin:0;background:#0E3B43;overflow:hidden}" +
           ".slide{margin:0!important}.slide:not(#$id){display:none!important}</style></head>"
    $page = Join-Path $tmp "$id.html"
    [IO.File]::WriteAllText($page, ($src -replace '</head>', $css), (New-Object Text.UTF8Encoding $false))
    $png = Join-Path $outDir "$id.png"
    $url = 'file:///' + ($page -replace '\\', '/')
    $browserArgs = @('--headless=new', '--disable-gpu', '--hide-scrollbars', '--no-first-run',
              "--user-data-dir=`"$profileDir`"", "--window-size=$Width,$Height",
              '--virtual-time-budget=8000', "--screenshot=`"$png`"", $url)
    Start-Process -FilePath $browser -ArgumentList $browserArgs -Wait -NoNewWindow `
      -RedirectStandardError (Join-Path $tmp 'stderr.log') -RedirectStandardOutput (Join-Path $tmp 'stdout.log')
    if (-not (Test-Path $png)) { throw "Export fehlgeschlagen: $id" }
    Write-Output "OK $png"
  }
}
finally {
  Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
}
