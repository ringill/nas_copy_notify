#!/bin/bash
## файл с параметрами что куда копировать и кому отправлять для целей тестирования

# получаем путь к папке, откуда запущен скрипт теста
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# заходим в неё
cd $dir
# и на уровень выше
cd ..
# заходим в папку build
cd build
build=$PWD

# задания на копирование
declare -a jobs
# "откуда" ; "куда" ; "1" - если нужно только содержимое папки
jobs[0]="$build/Users/kea/Library/Mobile Documents/com~apple~CloudDocs/;$build/Volumes/Backup/IcloudDriveBackup;1"
jobs[1]="$build/Volumes/Work/Фото Танюши;$build/Volumes/Backup_KTS;0"
jobs[2]="$build/Volumes/Work/Документы Танюши;$build/Volumes/Backup_KTS;0"
