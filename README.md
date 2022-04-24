# Backup android phone data

Backing up is an boring yet important thing to be done periodically. There are multiple ways to backup phone data:-

- Manual copy paste of folders
- Using 1 click software
- Using terminal

## Pros and cons

- Manual copy paste is slow and needs lot of attention to detail (to ensure things are done correctly)
- Using software usually gives you the backup in a special format, which cannot be opened, unless restored to a mobile device. These softwares can be pricy
- Using terminal is an automated way of doing things. I am elaborating on this approach

## Simplest solution

```
adb devices
adb pull sdcard c://mybackupfolder
```

## Caveats

Sometimes this would fail, as some applications have restricted access to their folder. From my experience, this is likely to happen only in the `Android` folder. Therefore I have a written this script

### What it does

My script logs the files and folders to the android device. Move this file to your PC. Then run the batch script. The batch script loops through each file and does a `adb pull sdcard/folder1 c://backupfolder/folder1` to all the folders except Android folder. We can manually copy our data from Android folder later.

## Steps

1. `adb devices`
2. `adb shell`
3. `cd sdcard`. This is the internal sdcard folder
4. `ls`. Lists the contents of your device. If it looks correct, then write the next command.
5. `ls > mobilecontentlist.txt 2> testerrors.txt`. This logs runs the command that outputs the list of contents of the mobile device. If run successfully, the logs are stored in `mobilecontentlist.txt`. If it fails, then error logs are stored in `testerrors.txt`
6. Transfer `mobilecontentlist.txt` to your PC. Put it in the same folder as the place you want your backup folder. Ensure `backup-android.bat` also is in the same folder.
7. Run `backup-android.bat`
8. Your backup will run
9. Copy data you want to save from Android folder manually

#### Resources

- https://www.tutorialspoint.com/batch_script/batch_script_if_else_statement.htm
- https://www.youtube.com/watch?v=fu2S4MjA6A8
- https://www.makeuseof.com/tag/write-simple-batch-bat-file/
- https://www.tutorialspoint.com/batch_script/batch_script_logging.htm
- https://ss64.com/nt/for.html
