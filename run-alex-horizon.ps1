$ErrorActionPreference = "Stop"

$uv = Join-Path $env:USERPROFILE "AppData\Roaming\Python\Python312\Scripts\uv.exe"
if (-not (Test-Path $uv)) {
    Write-Error "uv.exe not found. Install it with: python -m pip install --user uv"
}

Set-Location $PSScriptRoot

if (-not $env:ANTHROPIC_AUTH_TOKEN -and -not $env:ANTHROPIC_API_KEY -and -not $env:OPENAI_API_KEY) {
    Write-Warning "No AI API credential found in the current environment. Update .env or your system environment variables first."
}

& $uv run horizon --hours 24
