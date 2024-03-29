#!/bin/bash
#Скрипт выводит информацию о времени  в трех часовых поясах.
#Может быть полезен, если пользователь живет в одном часовом поясе,
#его мама в другом, а девушка в третьем. )
#Работа скрипта останавливается вводом символа "q"


#Считываем исходные размеры окна
read -r Def_rows Def_cols < <(stty size)

#Задаем нужные нам размеры, ихменяем геометрию окна
set -u
cols=30
rows=9
printf '\033[8;%d;%dt' $rows $cols

#В течение 1 секунды ждем ввод  символа "q" для остановки часов
while :
do
read -t 1 line

if [ $line == "q" ]; then
  break
fi
#Чистим экран, затем выводим информацию о времени в трех часовых поясах (+-3 часа от Москвы)
clear
curtime=$(date -d "-3 hours")
echo "TimeZone: America/Montevideo:"
echo $curtime
echo "      * * *        "
curtime=$(date -d "+0 hours")
echo "TimeZone: Europe/Moscow:"
echo $curtime
echo "      * * *        "
curtime=$(date -d "+3 hours")
echo "TimeZone: Asia/Omsk:"
echo $curtime
#Задержка выполнения скрипта на 1 секунду
sleep 1s
done

#Возвращаем окну исходный размер
printf '\033[8;%d;%dt' $Def_rows $Def_cols
