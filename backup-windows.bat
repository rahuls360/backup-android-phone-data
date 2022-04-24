@REM Removes the C:// prompt in the start of each command
@REM @echo off

title Backup Windows files and folders (ignoring some files)

echo Starting script...

@REM Process files
for %%a in (".\*") do (
adb pull sdcard\
if "%%a" NEQ ".\file.png" (
  echo "good: " . %%a
)
)

@REM Process folders
for /d %%a in (".\*") do (
if "%%a" NEQ ".\Bad folder" (
  echo "good: " . %%a
) else (
  echo "found the problem: " . %%a
)
)

@REM Prevents closing of terminal on conclusion of a script
pause