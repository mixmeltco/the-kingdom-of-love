$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Test-Path (Join-Path $PSScriptRoot "index.html"))) {
    throw "No encuentro index.html. Ejecuta este script desde la carpeta raíz del proyecto."
}
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Falta Git for Windows. Instálalo desde https://git-scm.com/download/win y vuelve a ejecutar este script." -ForegroundColor Red
    exit 1
}

$defaultRemote = "https://github.com/mixmeltco/the-kingdom-of-love.git"
$entered = Read-Host "URL HTTPS del repositorio [$defaultRemote]"
$remote = if ([string]::IsNullOrWhiteSpace($entered)) { $defaultRemote } else { $entered.Trim() }
if ($remote -notmatch '^https://github\.com/[^/]+/[^/]+(?:\.git)?$') {
    throw "La URL no parece una dirección HTTPS válida de GitHub."
}

$workDir = Join-Path $env:TEMP ("kingdom-of-love-publish-" + [Guid]::NewGuid().ToString("N"))
Write-Host "Clonando el repositorio..." -ForegroundColor Cyan
git clone --branch main $remote $workDir
if ($LASTEXITCODE -ne 0) { throw "No se pudo clonar el repositorio. Comprueba tu acceso a GitHub." }

try {
    Write-Host "Copiando el proyecto completo..." -ForegroundColor Cyan
    robocopy $PSScriptRoot $workDir /E /R:2 /W:1 /XD ".git" "node_modules" ".cache" /XF "*.log"
    if ($LASTEXITCODE -ge 8) { throw "Robocopy encontró un error al copiar archivos (código $LASTEXITCODE)." }

    Set-Location $workDir
    if (-not (git config user.name)) {
        $n = Read-Host "Nombre para identificar tus commits"
        if ($n) { git config user.name $n }
    }
    if (-not (git config user.email)) {
        $e = Read-Host "Correo asociado a tu GitHub"
        if ($e) { git config user.email $e }
    }

    git add -A
    git diff --cached --quiet
    if ($LASTEXITCODE -eq 1) {
        git commit -m "Publish Auralia V5 game project"
        if ($LASTEXITCODE -ne 0) { throw "No se pudo crear el commit." }
    } else {
        Write-Host "El repositorio ya tiene exactamente estos archivos." -ForegroundColor Yellow
    }

    git push origin main
    if ($LASTEXITCODE -ne 0) { throw "El push falló. Comprueba la autenticación y los permisos de escritura." }
    Write-Host "Proyecto completo enviado a GitHub correctamente." -ForegroundColor Green
    Write-Host "Ahora activa Settings > Pages > Source: GitHub Actions." -ForegroundColor Cyan
    Set-Location $PSScriptRoot
    Remove-Item $workDir -Recurse -Force
} catch {
    Set-Location $PSScriptRoot
    Write-Host "No se borró la carpeta temporal para facilitar el diagnóstico: $workDir" -ForegroundColor Yellow
    throw
}
