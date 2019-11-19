#!/bin/bash
# файл с параметрами что куда копировать и кому отправлять

# задания на копирование
declare -a jobs
# "откуда" ; "куда" ; "1" - если нужно только содержимое папки
jobs[0]="$build/Users/kea/Library/Mobile Documents/com~apple~CloudDocs/;$build/Volumes/Backup/IcloudDriveBackup;1"
jobs[1]="$build/Volumes/Work/Фото Танюши;$build/Volumes/Backup_KTS;0"
jobs[2]="$build/Volumes/Work/Документы Танюши;$build/Volumes/Backup_KTS;0"
