#!/bin/bash
# основной файл, который следует запускать для целей тестирования
set -x

## Готовим окружение для теста
# получаем путь к папке, откуда запущен скрипт теста
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# заходим в неё
cd $dir
# и на уровень выше
cd ..
# убиваем там папку build, если таковая уже имеется
rm -rf build
# создаём там папку build
mkdir -p build
# заходим в неё
cd build
# это будет наша рабочая папка для тестов
buildFolder=$PWD
# в ней создаём папку-источник
mkdir -p Volumes
cd Volumes
mkdir -p Work
cd Work
mkdir -p Фото\ Танюши
cd Фото\ Танюши
# и там создаём пустой файл
touch photo.txt
# создаём ещё одну папку с файлом
cd ..
mkdir -p Документы\ Танюши
cd Документы\ Танюши
touch doc.txt
# и ещё одну (контрольный в голову)
cd $buildFolder
mkdir -p Users
cd Users
mkdir -p kea
cd kea
mkdir -p Library
cd Library
mkdir -p Mobile\ Documents
cd Mobile\ Documents
mkdir -p com~apple~CloudDocs
cd com~apple~CloudDocs
# а в ней набор папок с файлами
limit=4
for i in $(seq 1 $limit); do
    mkdir -p $i
    touch "$i/$i.txt"
done
# возвращаемся в исходную папку
cd $dir
# создадим кучку целевых папок
cd $buildFolder
cd Volumes
mkdir -p Backup_KTS
mkdir -p Backup
cd Backup
mkdir -p IcloudDriveBackup
cd $dir
set +x
##

## Запускаем основной скрипт, но с тестовыми параметрами
# импортируем файл параметров
source param.sh
# запускаем процесс копирования и уведомления
source ../workflow.sh

