<#
.SYNOPSIS
    Puri project (AIChatbot-fe-Next ya kisi bhi Next.js/React project) ki saari
    relevant code files ko ek single .txt file mein export karta hai.

.USAGE
    1. Is script ko apne project ke root folder mein rakhein (jahan package.json hai)
       - ya phir neeche $ProjectRoot variable mein apna path daal dein.
    2. PowerShell terminal mein run karein:
         .\Export-ProjectCode.ps1
    3. Output file "ProjectCode_Export.txt" usi folder mein ban jayegi.
#>

# ============ CONFIG ============
# Agar script project ke andar nahi hai to yahan apna project ka full path daal dein.
$ProjectRoot = "."

# Output file ka naam
$OutputFile = "ProjectCode_Export.txt"

# Kin extensions ki files include karni hain
$IncludeExtensions = @(
    "*.ts", "*.tsx", "*.js", "*.jsx",
    "*.css", "*.scss",
    "*.json",
    "*.md",
    "*.mjs", "*.cjs"
)

# Kin folders ko skip karna hai (bade/irrelevant folders)
$ExcludeDirs = @(
    "node_modules",
    ".next",
    ".git",
    "dist",
    "build",
    "out",
    "coverage",
    ".vercel",
    "public\fonts"
)

# Kin specific files ko skip karna hai (bade lock files waghera)
$ExcludeFiles = @(
    "package-lock.json",
    "yarn.lock",
    "pnpm-lock.yaml"
)

# ============ SCRIPT ============

$FullProjectPath = Resolve-Path $ProjectRoot
$OutputPath = Join-Path $FullProjectPath $OutputFile

Write-Host "Project scan ho raha hai: $FullProjectPath" -ForegroundColor Cyan

# Pehle purani output file agar hai to hata dein
if (Test-Path $OutputPath) {
    Remove-Item $OutputPath -Force
}

# Saari files dhoondain jo include extensions match karti hain
$AllFiles = Get-ChildItem -Path $FullProjectPath -Recurse -File -Include $IncludeExtensions |
    Where-Object {
        $filePath = $_.FullName
        $relativePath = $filePath.Substring($FullProjectPath.Path.Length + 1)

        $isExcludedDir = $false
        foreach ($dir in $ExcludeDirs) {
            if ($relativePath -like "*$dir*") {
                $isExcludedDir = $true
                break
            }
        }

        $isExcludedFile = $ExcludeFiles -contains $_.Name

        -not $isExcludedDir -and -not $isExcludedFile
    }

$TotalFiles = $AllFiles.Count
Write-Host "Total files mili: $TotalFiles" -ForegroundColor Yellow

$Counter = 0
$StringBuilder = New-Object System.Text.StringBuilder

# Header
[void]$StringBuilder.AppendLine("=" * 80)
[void]$StringBuilder.AppendLine("PROJECT CODE EXPORT")
[void]$StringBuilder.AppendLine("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
[void]$StringBuilder.AppendLine("Total Files: $TotalFiles")
[void]$StringBuilder.AppendLine("=" * 80)
[void]$StringBuilder.AppendLine("")

foreach ($file in $AllFiles) {
    $Counter++
    $relativePath = $file.FullName.Substring($FullProjectPath.Path.Length + 1)

    Write-Host "[$Counter/$TotalFiles] Processing: $relativePath" -ForegroundColor Green

    [void]$StringBuilder.AppendLine("")
    [void]$StringBuilder.AppendLine("=" * 80)
    [void]$StringBuilder.AppendLine("FILE: $relativePath")
    [void]$StringBuilder.AppendLine("=" * 80)

    try {
        $content = Get-Content -Path $file.FullName -Raw -ErrorAction Stop
        if ([string]::IsNullOrEmpty($content)) {
            [void]$StringBuilder.AppendLine("(empty file)")
        } else {
            [void]$StringBuilder.AppendLine($content)
        }
    } catch {
        [void]$StringBuilder.AppendLine("!! ERROR reading file: $($_.Exception.Message)")
    }

    [void]$StringBuilder.AppendLine("")
}

# File likh dein
[System.IO.File]::WriteAllText($OutputPath, $StringBuilder.ToString(), [System.Text.Encoding]::UTF8)

Write-Host ""
Write-Host "Done! Export mukammal ho gaya." -ForegroundColor Cyan
Write-Host "Output file: $OutputPath" -ForegroundColor Cyan
Write-Host "Total files exported: $Counter" -ForegroundColor Cyan