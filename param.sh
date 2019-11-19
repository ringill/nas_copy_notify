#!/bin/bash
# файл с параметрами что куда копировать и кому отправлять

# задания на копирование
declare -a jobs
# "откуда" ; "куда" ; "1" - если нужно только содержимое папки
jobs[0]="/Users/kea/Library/Mobile Documents/com~apple~CloudDocs/;/Volumes/Backup/IcloudDriveBackup;1"
jobs[1]="/Volumes/Work/Фото Танюши;/Volumes/Backup_KTS;0"
jobs[2]="/Volumes/Work/Документы Танюши;/Volumes/Backup_KTS;0"
