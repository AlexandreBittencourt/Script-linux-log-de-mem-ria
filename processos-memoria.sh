#!/bin/bash
# Author: Alexandre Bittencourt
echo [Inicio] $(date)

processo=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

if [ -d log ] 
then
	mkdir log
fi

processos_memoria(){
for pid in $processo
do
	nome_processo=$(ps -p $pid -o comm=)
	echo -n $(date +%F,%H:%M:%S,) >> /home/user/$nome_processo.log
	tamanho_processo=$( ps -p $pid -o size | grep [0-9])
	echo "$(bc <<< "scale=2;$pid/1024")MB" >> /home/user/$nome_processo.log
done
}

processos_memoria

if [ $? -eq 0 ] then
        echo "Logs salvos com sucesso"
else
        echo "Houve uma falha no processo de sakvar os logs"
fi

echo [Fim] $(date)