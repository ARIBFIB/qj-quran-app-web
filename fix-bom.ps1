# fix-bom.ps1
# Scans the whole project (excluding node_modules, .next, .git) and removes
# UTF-8 BOM from every text/code file it finds, so Vercel/Node.js/CSS parsers
# don't choke on it.
#
# Usage:
#   1. Save this file inside your project root, e.g.:
#      D:\Rozmarrah-CUST\Najeeb Islamic Quran App\Quran App\Code\Website\qj_web
#   2. Open PowerShell in that folder
#   3. If needed, allow script execution for this session:
#        Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#   4. Run:
#        .\fix-bom.ps1

$root = $PSScriptRoot
if ([string]::IsNullOrEmpty($root)) { $root = Get-Location }

$extensions = @("*.json","*.ts","*.tsx","*.js","*.jsx","*.mjs","*.css","*.md")
$excludeDirs = @("node_modules", ".next", ".git", "out", "build")

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$fixedCount = 0
$checkedCount = 0

$allFiles = Get-ChildItem -Path $root -Recurse -File -Include $extensions |
    Where-Object {
        $path = $_.FullName
        $excluded = $false
        foreach ($dir in $excludeDirs) {
            if ($path -like "*\$dir\*") { $excluded = $true; break }
        }
        -not $excluded
    }

foreach ($f in $allFiles) {
    $checkedCount++
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)

    $hasBom = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF

    if ($hasBom) {
        $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
        [System.IO.File]::WriteAllText($f.FullName, $content, $utf8NoBom)
        $relPath = $f.FullName.Substring($root.Path.Length).TrimStart('\')
        Write-Host "Fixed BOM: $relPath" -ForegroundColor Green
        $fixedCount++
    }
}

Write-Host ""
Write-Host "Checked $checkedCount files. Fixed $fixedCount file(s) with BOM." -ForegroundColor Cyan

if ($fixedCount -gt 0) {
    Write-Host ""
    Write-Host "Now run:" -ForegroundColor Cyan
    Write-Host "  git add ." -ForegroundColor White
    Write-Host "  git commit -m `"fix: remove BOM from all project files`"" -ForegroundColor White
    Write-Host "  git push" -ForegroundColor White
} else {
    Write-Host "No BOM issues found anywhere. If the build still fails, the error is something else." -ForegroundColor Yellow
}