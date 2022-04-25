#!/bin/bash
# Author: Alexandre Bittencourt
echo [Inicio] $(date)

converte_imagem(){
	local caminho_imagem=$1
    local IMAGEM_SEM_EXTENSAO=$(ls $IMAGEM | awk -F. '{ print $1}')
    convert $IMAGEM_SEM_EXTENSAO.jpg $IMAGEM_SEM_EXTENSAO.png
	

}

varrer_diretorio(){
	$1
	cd $1
	for arquivo in *
	do 
		local caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo)
		if [ ! -d $caminho_arquivo ] 
		then
			varrer_diretorio $caminho_arquivo
		else
			converte_imagem $caminho_arquivo
		fi
	done
}

varrer_diretorio ~/Downloads/imagens-novos-livros

if [ $? -eq 0 ] 
then
        echo "Conevrsão realizada com sucesso"
else
        echo "Houve uma falha no processo"
fi

echo [Fim] $(date)