#!/bin/bash
echo "Start backup process of Photo & docs KTS..."
# путь к папке откуда копируем
# sourceDirectory='/Users/kea/Library/Mobile\ Documents/com~apple~CloudDocs'
# путь на nas к папке где будут создаваться папки-бэкапы
destinationDirectory="/Volumes/Backup_KTS"

# получаем текущие дату-время
currdate=$(date +"%Y-%m-%d_%H-%M-%S")
echo "current date: ${currdate}"
#echo "source dir: ${sourceDirectory}"
# формируем имя папки-бэкапа
backup_dir="${destinationDirectory}/${currdate}"
# формируем путь к файлу лога (чтобы понять, что случилось, если что-то пошло не так)
# по-умолчанию в папке-источнике
#logfile="${sourceDirectory}/${currdate}.txt"
echo "make target dir: ${backup_dir}"
# заходим в папку на nas
cd ${destinationDirectory}
# и создаём там папку (у учетки от имени которой запускается скрипт должны быть права на создание/запись)
mkdir -p ${currdate}
# заходим в новосозданную папку-бэкап
cd ${currdate}
echo "Start copy of photo arhive..."
# и копируем в неё файлы из папки-источника
# rsync -avh --progress $/Users/kea/Library/Mobile\ Documents/com~apple~CloudDocs/* ./
cp -rf /Volumes/Work/Фото\ Танюши ./
echo "End copy!"
echo "Start copy of documents arhive..."
cp -rf /Volumes/Work/Документы\ Танюши ./
echo "End copy!"
echo "ALL DONE!"

# если вдруг на MAC нет rsync (в чём очень сомневаюсь), то cp есть; можно заменить 25 строку на:
# cp -rf $sourceDirectory ./
# всё тоже самое, но без индикации прогресса
