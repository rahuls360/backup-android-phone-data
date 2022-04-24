@REM Removes the C:// prompt in the start of each command
@echo off

title Backup android files excluding a /Android folder (due to permissions issues)

echo Starting script...

@REM Ensure your device is connected properly (USB debugging must be on)
adb devices

@REM Create a backup folder
mkdir "Backup"

@REM adb shell

@REM cd sdcard

@REM ls

@REM Loop through each file/folder of mobile device and copy files
for /F "tokens=*" %%a in (mobilecontentlist.txt) do (
  if "%%a" NEQ "Android" (
    echo "Copying: " . %%a
    adb pull sdcard/%%a "./Backup/%%a"
  ) else (
    echo "Ignoring the problem: " . %%a
  )
)





@REM for /F "tokens=*" %%A in (testlog.txt) do echo %%A


@REM Prevents closing of terminal on conclusion of a script
pause