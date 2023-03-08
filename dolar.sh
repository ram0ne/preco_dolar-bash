#!/usr/bin/env bash


#DATA FORMATADA PARA DIA/MES/ANO E HORA:MINUTO
#COMANDO CURL BAIXANDO CONTEUDO HTML DA PAGINA 'INVESTING'
#GREP FILTRANDO APENAS O VALOR DO DOLAR HOJE EM REAL R$
#SED LIMPANDO VALORES E DEIXANDO APENAS 3 DIGITOS
#TEE REDIRECIONANDO SAIDA FINAL PARA TELA E PARA ARQUIVO 'historico.txt' SEM DELETAR O CONTEUDO EXISTENTE NO ARQUIVO.  
echo -e "\033[32;1mEXIBINDO VALOR DO DOLAR HOJE EM FORMATO DA MOEDA REAL R$: \033[m \n"

{ echo -n "`date +%d/%m/%y-----%H:%M` , Valor: " ; curl -s https://br.investing.com/currencies/usd-brl | grep -oP '(?<=data-test="instrument-price-last">)[^<]+' ;} | sed 's/..$/ BRL/' | tee -a historico.txt

#TRATAMENTO DO ARQUIVO HISTORICO DE COTAÇÕES
#UNIQ REMOÇÃO DE VALORES REPETIDOS CRIANDO ARQUIVO 'final.txt' TEMPORARIO
#MV MOVENDO TUDO PARA O ARQUIVO 'historico.txt' DEFINITIVO.
uniq historico.txt > final.txt && mv final.txt historico.txt
