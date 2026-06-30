@echo off
echo ==================================================
echo   Auto Renaming... Please wait.
echo ==================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "$t=((Get-Item .).Name -replace '(\u7b2c|Season).*$','').Trim(); if([string]::IsNullOrEmpty($t)){$t='TVShow'}; Get-ChildItem -File | Where-Object { $_.Extension -match 'mp4|mkv|avi|rmvb|mov' } | ForEach-Object { $n=$_.BaseName; if ($n -match 'S(\d+)E(\d+)') { $s=$Matches[1]; $e=$Matches[2] } elseif ($n -match '[Ex](\d+)') { $s='01'; $e=$Matches[1] } else { return }; $s=$s.PadLeft(2,'0'); $e=$e.PadLeft(2,'0'); $r=''; if ($n -match '2160|4[Kk]') { $r='2160p' } elseif ($n -match '1080') { $r='1080p' } elseif ($n -match '720') { $r='720p' }; $newName=$t+' S'+$s+'E'+$e; if ($r) { $newName+=' '+$r }; $newName+=$_.Extension; if ($_.Name -ne $newName) { try { Rename-Item -LiteralPath $_.FullName -NewName $newName -ErrorAction Stop; Write-Host '[OK]' $newName } catch { Write-Host '[FAIL]' $_.Name } } }"
echo ==================================================
echo   Task Finished.