# C Project Build Script
param(
    [ValidateSet("build", "run", "clean", "all")]
    [string]$action = "all"
)

$srcDir = "src"
$objDir = "build"
$binDir = "build"
$binName = "program.exe"
$target = "$binDir\$binName"

function Invoke-Build {
    Write-Host "🔨 Building..." -ForegroundColor Cyan
    if (-not (Test-Path $objDir)) {
        New-Item -ItemType Directory -Path $objDir | Out-Null
    }
    
    $files = Get-ChildItem "$srcDir\*.c" -ErrorAction SilentlyContinue
    if ($files.Count -eq 0) {
        Write-Host "❌ No C files found in $srcDir" -ForegroundColor Red
        return $false
    }
    
    $sourceList = ($files | ForEach-Object { $_.FullName }) -join " "
    $cmd = "gcc -Wall -Wextra -x c -std=gnu89 -I include $sourceList -o $target"
    
    Write-Host $cmd
    Invoke-Expression $cmd
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Build successful" -ForegroundColor Green
        return $true
    } else {
        Write-Host "❌ Build failed" -ForegroundColor Red
        return $false
    }
}

function Invoke-Run {
    if (Test-Path $target) {
        Write-Host "▶️  Running..." -ForegroundColor Cyan
        & $target
    } else {
        Write-Host "❌ Binary not found. Run build first." -ForegroundColor Red
    }
}

function Invoke-Clean {
    Write-Host "🧹 Cleaning..." -ForegroundColor Cyan
    if (Test-Path $objDir) {
        Remove-Item -Path "$objDir\*" -Force -Recurse
        Write-Host "✅ Clean complete" -ForegroundColor Green
    }
}

# Execute action
switch ($action) {
    "build" { Invoke-Build }
    "run" { if (Invoke-Build) { Invoke-Run } }
    "clean" { Invoke-Clean }
    "all" { if (Invoke-Build) { Invoke-Run } }
}
