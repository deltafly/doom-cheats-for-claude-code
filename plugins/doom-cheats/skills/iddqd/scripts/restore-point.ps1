# restore-point.ps1 -- IDDQD god mode: a real, non-destructive restore point.
# ASCII-only on purpose (PS 5.1 reads BOM-less UTF-8 as ANSI -> non-ASCII breaks parsing).
#
# Usage:
#   powershell -File restore-point.ps1                 # in a git repo: working-tree snapshot
#   powershell -File restore-point.ps1 file1 file2 ... # outside git: timestamped .bak of each file
#
# In a git repo: `git stash create` snapshots the working tree WITHOUT touching anything,
# and records HEAD, with an exact rollback command.
# Outside git: copies each given file to a timestamped .bak.

$stamp = (Get-Date).ToString('yyyyMMdd-HHmmss')

function Test-GitRepo {
    try {
        $r = git rev-parse --is-inside-work-tree 2>$null
        return ($LASTEXITCODE -eq 0 -and $r -eq 'true')
    } catch { return $false }
}

Write-Output "=== IDDQD RESTORE POINT ==="

if (Test-GitRepo) {
    $head   = (git rev-parse HEAD).Trim()
    $branch = (git branch --show-current).Trim()
    $dirty  = git status --porcelain
    Write-Output "[git] branch: $branch"
    Write-Output "[git] HEAD:   $head"
    if ([string]::IsNullOrWhiteSpace($dirty)) {
        Write-Output "[git] working tree CLEAN -- HEAD is your restore point."
        Write-Output ""
        Write-Output "Rollback (discard later changes):"
        Write-Output "  git reset --hard $head"
    } else {
        $snap = (git stash create "iddqd-$stamp")
        if ($snap) { $snap = $snap.Trim() } else { $snap = '(empty)' }
        Write-Output "[git] working tree DIRTY -- snapshot taken (working tree untouched)."
        Write-Output "[git] snapshot commit: $snap"
        Write-Output ""
        Write-Output "Rollback options:"
        Write-Output "  # discard ALL changes back to HEAD:"
        Write-Output "  git reset --hard $head"
        Write-Output "  # ...then recover the snapshot if needed:"
        Write-Output "  git stash apply $snap"
    }
} else {
    Write-Output "[fs] not a git repo -- file backup mode."
    if ($args.Count -eq 0) {
        Write-Output "[fs] WARNING: no files given and no git repo -- cannot snapshot."
        Write-Output "[fs] Re-run with the files you are about to change:"
        Write-Output "     powershell -File restore-point.ps1 path\file1 path\file2"
    } else {
        foreach ($f in $args) {
            if (Test-Path -LiteralPath $f -PathType Leaf) {
                $bak = "$f.$stamp.bak"
                Copy-Item -LiteralPath $f -Destination $bak -Force
                Write-Output "[fs] backed up: $f  ->  $bak"
            } else {
                Write-Output "[fs] skip (not a file): $f"
            }
        }
        Write-Output ""
        Write-Output "Rollback: copy each .$stamp.bak back over the original."
    }
}
Write-Output "==========================="
