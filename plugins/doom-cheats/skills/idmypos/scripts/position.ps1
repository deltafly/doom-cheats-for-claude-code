# position.ps1 -- IDMYPOS: gather real position data (read-only).
# ASCII-only on purpose (PS 5.1 reads BOM-less UTF-8 as ANSI -> non-ASCII breaks parsing).
# Usage: powershell -File position.ps1

function Test-GitRepo {
    try {
        $r = git rev-parse --is-inside-work-tree 2>$null
        return ($LASTEXITCODE -eq 0 -and $r -eq 'true')
    } catch { return $false }
}

Write-Output "=== IDMYPOS POSITION ==="
Write-Output ("[dir] " + (Get-Location).Path)

if (Test-GitRepo) {
    $branch = (git branch --show-current).Trim()
    $last   = git log -1 --oneline 2>$null
    $porc   = git status --porcelain
    $count  = if ($porc) { ($porc | Measure-Object -Line).Lines } else { 0 }
    Write-Output "[git] branch: $branch  (uncommitted: $count file[s])"
    Write-Output "[git] last:   $last"
    $ab = git rev-list --left-right --count "@{u}...HEAD" 2>$null
    if ($LASTEXITCODE -eq 0 -and $ab) {
        $p = $ab -split "\s+"
        Write-Output ("[git] vs upstream: behind " + $p[0] + ", ahead " + $p[1])
    }
    if ($count -gt 0) {
        Write-Output "[git] changed (max 8):"
        ($porc | Select-Object -First 8) | ForEach-Object { Write-Output ("       " + $_) }
    }
} else {
    Write-Output "[git] not a git repo here."
    Write-Output "[dir] most recently modified (top 5, this folder only):"
    Get-ChildItem -File -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 5 |
        ForEach-Object { Write-Output ("       " + $_.LastWriteTime.ToString('MM-dd HH:mm') + "  " + $_.Name) }
}
Write-Output "======================="
