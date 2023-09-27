
# Introdução a Redes Neurais utilizando R --------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 26/09/23 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://rpubs.com/mbatista/545937 --------------------------------------------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### Segundo a concepção de Steven Pinker, no livro “Como a mente funciona”, “Pensar é 
### computação”. Essa tentativa de criarmos redes neurais que imitam o funcionamento do 
### cérebro humano sempre me fascinou. Acredito que fascina qualquer pessoa quando 
### escuta falar sobre inteligência artificial.

### Será utilizado dois pacotes do CRAN para desenvolver essa introdução a redes neurais.
### O primeiro pacote que utilizaremos será o 'caret' que possui funções diversas para 
### treinamento e plotagem de modelos de classificação e regressão. O segundo pacote 
### a utilizarmos é o 'neuralnet', onde utilizaremos para treinamento da nossa rede neural.

### Abaixo segue um passo a passo que realizaremos para criar a rede neural.
### O primeiro passo é criar a base de teste e treino.
### Consequentemente precisamos de uma base completa com as entradas para o 
### nosso neurônio e a respectiva saída nesses dados. 
### A rede neural que criaremos será utilizada para classificar três espécies plantas 
### conhecida como “íris”.

### Passo 1: criar base de treino e teste
### Passo 2: divisão em 70% para treino e 30% para teste
### Passo 3: criar modelo/rede neural
### Passo 4: teste do modelo
### Passo 5: rede neural ok

# DataSet Iris -----------------------------------------------------------------------------------------------------------------------------

### O dataset de Iris é muito utilizado para testar o funcionamento de modelos 
### clássicos de classificação. 

### Ele foi criado a partir das características da flor Iris e o objetivo é classificar
### (definir a classe / rótulo) de qual é o tipo dessa flor, entre três tipos possíveis 
### estão: Versicolor, Setosa e Virginica.

### O conjunto de dados “Iris” consiste em 50 unidades amostrais de três espécies 
### (setosa, virginica, versicolor) desta (espécie de planta) chamada íris, ou seja, 
### temos um total de 150 unidades amostrais.
### De cada uma delas mediu-se quatro variáveis morfológicas: comprimento (Length) e 
### largura (Width) da sépala e comprimento e largura da pétala.

### O objetivo original é quantificar a variação morfológica em relação a essas 
### espécies com bases nas quatro variáveis de interesse.

# Análises ---------------------------------------------------------------------------------------------------------------------------------


