#!/bin/bash

groupadd DAI2_A 2> /dev/null
groupadd DAI2_B 2> /dev/null


for X in 0 1 2 3 4
do
	useradd -b /home -g DAI2_A alumno$X
done

for X in 5 6 7 8 9
do
	useradd -b /home -g DAI2_B alumno$X
done

for X in 0 1 2 3 4 5 6 7 8 9
do
	mkdir /home/alumno$X
	chown alumno$X /home/alumno$X
done

for X in 0 1 2 3 4
do
	chgrp DAI2_A /home/alumno$X
done

for X in 5 6 7 8 9
do
	chgrp DAI2_B /home/alumno$X
done
