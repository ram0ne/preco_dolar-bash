#!/usr/bin/env bash

#CORES
red="\033[31;1m"
cor="\033[m"

echo -e "\033[32;1mEXIBINDO VALOR DO DOLAR HOJE EM FORMATO DA MOEDA REAL R$: \033[m \n"
valor=$(curl -s https://economia.awesomeapi.com.br/json/last/USD-BRL | grep -oP '"bid":\s*"\K[0-9]+\.[0-9]+')
valor=$(echo "$valor" | sed 's/..$//' | tr '.' ',')
echo -e "💵 Dólar em `date +%d/%m/%y--%H:%M`: ${red}R\$${valor} ${cor}" | tee -a historico.txt

#FORMATANDO TEXTO NO ARQUIVO DO HISTORICO
uniq historico.txt > final.txt && mv final.txt historico.txt
