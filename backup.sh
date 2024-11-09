#!/bin/bash

date_time=$(date +%d-%m-%y)


make_backup () {

	7z a /home/common/VulcorBackups/Vulcor_SMP_$date_time.zip /home/common/Vulcor
	if [ $? == 0 ]; then
		printf "\n Backup Ready with name Vulcor_SMP_$date_time.zip\n\n"
	else
		printf "\nBackup Failed, Error: $?\n\n"
}


if [ -f /home/common/VulcorBackups/Vulcor_SMP_$date_time.zip ]; then

	printf "Backup already exists. Continue ? (y/n): "
	read input

	if [ $input == "y" ]; then
		make_backup

	elif [ $input == "n" ]; then
		exit 1;

	fi

else

	make_backup

fi
