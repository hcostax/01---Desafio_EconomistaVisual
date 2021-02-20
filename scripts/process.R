
# |||||||||||||||||||||||||||||||||||||||
# 
#   DESAFIO: Reprodução de visualização
#            EconomistaVisual
#
#   Autor:        Henrique C. Costa
#   Blog:         https://hcostax.com/
#
#----------------------------------------

# para retirar notacoes cientifica
options(scipen = 999)


# Pacotes necessarios para o projeto

library(tidyverse)     # conjunto de pacotes essenciais
library(readxl)        # pacote para "ler" arquivos excel
library(lubridate)     # pacote para trabalhar com datas
library(here)          # fluxos de trabalho orientados a projetos


# -------------------------------------------------------------


# Obter os dados baixados, que estao na pasta ´dados´


# Fonte dos dados: https://www.dieese.org.br/cesta/

# Para carregar os dados usaremos o codigo a seguir:

cesta_basica <- read_excel(     # funcao que ler arquivos .xls
  here::here(                   # funcao que informa o local
    "dados","exporta.xls"       # "local", "arquivo"
    )
)


# -------------------------------------------------------------


# visualizar a situacao dos dados
head(cesta_basica)              # funcao imprime no console 
                                # as 10 primeiras observacoes

tail(cesta_basica)              # funcao imprime no console 
                                # as 10 ultimas observacoes


# Visualizando, percebe-se que necessita retirar do dataframe
# a primeira linha, e as 3 ultimas linhas, renomear as colunas

# faremos isso a seguir:


CB <- cesta_basica %>%          # criando um objeto reduzindo
                                # o nome do dataframe para CB
                                # ao inves de cesta_basica
                                # e usando o operador " %>% "
  
  rename(                       # funcao para renomear colunas
    
    Data = `Gasto Mensal - Total da Cesta`,
    Valor = ...2
    
  ) %>%                       
  
  slice(2:255)                  # funcao que corta os dados
                                # retirando apenas o desejado


# -------------------------------------------------------------

# precisamos ver a estrutura dos dados
# utilizaremos a funcao str()

str(CB)

# tibble [254 x 2] (S3: tbl_df/tbl/data.frame)
# $ Data : chr [1:254] "01-2000" "02-2000" "03-2000" "04-2000" ...
# $ Valor: chr [1:254] "112.22" "110.8" "115.13" "115.92" ...


# temos 254 observacoes e 2 colunas (variaveis)
# as 2 variaveis estao em formato ´chr´ - caracteres

# precisamos modificar esses formatos, passar a variavel
# ´Valor´ para o formato numerico, e Data como datas 
# utilizaremos os passos a seguir:


# CB <- CB %>%                   # substituindo o dataframe
#   
#   mutate(                      # funcao p/ modificar variaveis
#     
#     Data = rep(seq(            # Substituindo a variavel Data
#                                # por uma variavel no formato de dadtas
#                                # criando uma sequencia de datas
#                                 
#       from = as.Date("2000-01-01"), 
#       to = as.Date("2021-01-01"), 
#       by ="1 month"
#     )),
#     
#     Valor = as.numeric(Valor) # modificando a variavel ´Valor´
#                               # para o formato numerico
#   )

# Erro: Problem with `mutate()` input `Data`.
# x Input `Data` can't be recycled to size 254.
# i Input `Data` is `rep(...)`.
# i Input `Data` must be size 254 or 1, not 253.


# percebemos esse erro
# significa que o vetor de datas que tentamos criar
# nao eh do mesmo "tamanho" que a variavel Data anterior
# a variavel Data tem 254 observacoes e nosso vetor de 
# datas tem apenas 253. Totalmente sem sentido, pois
# criamos um vetor de datas que segue uma sequencia 
# mes a mes de 01/01/2000 ate 01/01/202

# a priori, temos a hipotese de que ha valores e data repetidas

# como a base de dados eh pequena (254 obs) usaremos
# a funcao View() para ver a base completa e entende-la
# para encontrar a observacao repetida

# View(CB)

# encontramos a observacao 193, com a data 12-2015 (1)
# e valor de 418.13.

# como nao pesquisei a fundo o motivo, vou considerar
# como um reajuste no valor, entao irei retirar a 
# observacao anterior (192). 

# vou utilizar novamente a o codigo acima
# adicionarei a funcao slice() 
# para recortar a observacao



CB <- CB %>%                   # substituindo o dataframe
  
  slice(-192) %>%              # funcao p/ recortar 
  
  mutate(                      # funcao p/ modificar variaveis
    
    Data = rep(seq(            # Substituindo a variavel Data
      # por uma variavel no formato de dadtas
      # criando uma sequencia de datas
      
      from = as.Date("2000-01-01"), 
      to = as.Date("2021-01-01"), 
      by ="1 month"
    )),
    
    Valor = as.numeric(Valor) # modificando a variavel ´Valor´
    # para o formato numerico
  )




# -------------------------------------------------------------

# carregar o grafico
source(here::here("scripts", "plot.R"))




## remove (almost) everything in the working environment.
## You will get no warning, so don't do this unless you are really sure.
rm(list = ls())






