#!/bin/bash
echo "Start backup process of ICLOUD DRIVE..."
# путь к папке откуда копируем
sourceDirectory='/Users/kea/Library/Mobile\ Documents/com~apple~CloudDocs'
# путь на nas к папке где будут создаваться папки-бэкапы
destinationDirectory="/Volumes/Backup/IcloudDriveBackup"

# получаем текущие дату-время
currdate=$(date +"%Y-%m-%d_%H-%M-%S")
echo "current date: ${currdate}"
echo "source dir: ${sourceDirectory}"
# формируем имя папки-бэкапа
backup_dir="${destinationDirectory}/${currdate}"
# формируем путь к файлу лога (чтобы понять, что случилось, если что-то пошло не так)
# по-умолчанию в папке-источнике
logfile="${sourceDirectory}/${currdate}.txt"
echo "make target dir: ${backup_dir}"
# заходим в папку на nas
cd ${destinationDirectory}
# и создаём там папку (у учетки от имени которой запускается скрипт должны быть права на создание/запись)
mkdir -p ${currdate}
# заходим в новосозданную папку-бэкап
cd ${currdate}
echo "Start copy..."
# и копируем в неё файлы из папки-источника
# rsync -avh --progress $/Users/kea/Library/Mobile\ Documents/com~apple~CloudDocs/* ./
cp -rf /Users/kea/Library/Mobile\ Documents/com~apple~CloudDocs/* ./
echo "End copy!"
echo "DONE!"

# если вдруг на MAC нет rsync (в чём очень сомневаюсь), то cp есть; можно заменить 25 строку на:
# cp -rf $sourceDirectory ./
# всё тоже самое, но без индикации прогресса
