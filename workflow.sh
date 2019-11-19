#!/bin/bash

## функция создаёт в папке-назначения папку с датой и возвращает полный путь
# функция принимает 2 параметра: текущую дату-время, путь к целевой папке
function init_destination() {
    local currdate="$1"
    local target="$2"
    cd $target
    # и создаём там папку (у учетки от имени которой запускается скрипт должны быть права на создание/запись)
    mkdir -p $currdate
    # заходим в новосозданную папку-бэкап
    cd $currdate
    # возвращаем текущий путь этой папки
    echo $PWD
}

## функция копирует файлы/папки в папку назначения
# функция принимает 3 параметра: 
#   - путь откуда копировать
#   - путь куда копировать
#   - копировать только содержимое
function copy_folder() {
    local source="$1"
    local target="$2"
    local contentOnly="$3"
    # заходим в папку назначения
    cd $target
    # и копируем в неё
    if [ $contentOnly -eq "1" ]; then
        cp -rf "$source"* ./
    else
        cp -rf "$source" ./
    fi
    # проверяем код ошибки
    local errcode=$?
    if [ $? -ne 0 ]; then
        # нам нужен код ошибки, чтобы понимать что писать в письме:
        # всё хорошо или всё плохо
        echo "copy fail"
    fi
    return $errcode
}

## основная логика здесь
# получаем текущие дату-время
currdate=$(date +"%Y-%m-%d_%H-%M-%S")
# индикатор ошибки
errcode=0
# проходим по каждому набору "источник;назначение"
for job in "${jobs[@]}"; do
    # Преобразуем запись вида 'source;target' в массив ['source', 'target']
    IFS=";" read -r -a arr <<<"${job}"
    # вычитанная из параметров папка: откуда копируем
    source="${arr[0]}"
    # вычитанная из параметров папка: куда копируем
    target="${arr[1]}"
    # копировать только содержимое
    contentOnly="${arr[2]}"
    # созданная папка: куда копируем + папка-дата
    destination=$(init_destination $currdate $target)
    # копируем файлы
    copy_folder "$source" "$destination" "$contentOnly"
    code=$?
    # проблема есть, если errcode окажется больше нуля
    errcode=$((errcode + code))
done
# проверяем индикатор ошибки и отправляем письмо
# TODO: осталось реализовать функцию отправки email
if [ $errcode -ne 0 ]; then
    # грустное
    echo "sad emal"
else
    # радостное
    echo "happy emal"
fi
