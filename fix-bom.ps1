# fix-bom.ps1
# Removes UTF-8 BOM from package.json and other critical project files
# so Vercel/Node.js can parse them correctly as JSON/config files.
#
# Usage:
#   1. Save this file inside your project root: D:\Rozmarrah-CUST\Najeeb Islamic Quran App\Quran App\Code\Website\qj_web
#   2. Open PowerShell in that folder
#   3. If needed, allow script execution for this session:
#        Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#   4. Run:
#        .\fix-bom.ps1

$files = @(
    "package.json",
    "package-lock.json",
    "tsconfig.json",
    "next.config.ts",
    "postcss.config.mjs",
    "eslint.config.mjs"
)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Use the folder where this script lives, not PowerShell's tracked $PWD,
# since .NET File APIs sometimes resolve relative paths differently.
$root = $PSScriptRoot
if ([string]::IsNullOrEmpty($root)) { $root = Get-Location }

foreach ($file in $files) {
    $fullPath = Join-Path $root $file

    if (Test-Path -LiteralPath $fullPath) {
        $bytes = [System.IO.File]::ReadAllBytes($fullPath)

        # Check for UTF-8 BOM (EF BB BF)
        $hasBom = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF

        if ($hasBom) {
            $content = [System.IO.File]::ReadAllText($fullPath, [System.Text.Encoding]::UTF8)
            [System.IO.File]::WriteAllText($fullPath, $content, $utf8NoBom)
            Write-Host "Fixed BOM: $file" -ForegroundColor Green
        } else {
            Write-Host "No BOM found (already clean): $file" -ForegroundColor Yellow
        }
    } else {
        Write-Host "File not found, skipped: $file" -ForegroundColor DarkGray
    }
}

Write-Host ""
Write-Host "Done. Now run:" -ForegroundColor Cyan
Write-Host "  git add ." -ForegroundColor White
Write-Host "  git commit -m `"fix: remove BOM from json/config files`"" -ForegroundColor White
Write-Host "  git push" -ForegroundColor White