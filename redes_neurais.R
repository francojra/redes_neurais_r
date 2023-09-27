
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



