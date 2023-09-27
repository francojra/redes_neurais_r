
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

head(iris)

dataset_iris = iris

### Agora o processo de criação de 3 (três) colunas e setar as mesmas como os valores 
### [TRUE] ou [FALSE] conforme a espécie da cada flor e colocar um nome para cada 
### coluna. Essa coluna será utilizada na saída da rede neural posterior nos testes
### com a mesma.

dataset_iris = cbind(dataset_iris,dataset_iris$Species == 'setosa')
dataset_iris = cbind(dataset_iris,dataset_iris$Species == 'versicolor')
dataset_iris = cbind(dataset_iris,dataset_iris$Species == 'virginica')

names(dataset_iris)[6] <- 'setosa'
names(dataset_iris)[7] <- 'versicolor'
names(dataset_iris)[8] <- 'virginica'

head(dataset_iris)

### O processo de treinamento consiste em dividir nosso dataset em duas partes, 
### sendo a parte de treino ficando com 70% dos dados [dataset_treino] e o restante 
### 30% para os testes [dataset_teste].

install.packages("caret", dependencies = T)
library(caret)

particao = createDataPartition(1:dim(dataset_iris)[1],p = .7)
dataset_treino = dataset_iris[particao$Resample1,]
dataset_teste = dataset_iris[-particao$Resample1,]

### Criação da rede neural

install.packages("neuralnet")
library(neuralnet)

modelo = neuralnet( setosa  + versicolor  +  virginica  
                    ~ Sepal.Length + Sepal.Width +  
                      Petal.Length + Petal.Width , 
                    dataset_treino, hidden = c(5,4), 
                    act.fct = "logistic")

### Função de Ativação - Função logística:
### Possui a função de trasnformar a saída de um neurônio antes que o sinal seja 
### passado para a próxima camada.

### Função logística

logistica <- function(z) {
    
    1 / (1 + exp(-z))
}

### Gráfico da Função logística

x <- c(-10:10)
plot(x, logistica(x), type = "l", col = "red")

### Plotagem da rede neural criada

plot(modelo, rep = "best")

### Realização dos testes da rede neural com apenas o registro [28] da base de teste 
### [dataset_teste]. 

dataset_teste[28,1:5]

### Tratando o resultado do teste para exibir no nome da flor

### dataset_teste

teste = compute(modelo, dataset_teste[25,1:4])

resultado = as.data.frame(teste$net.result)

names(resultado)[1] <- 'setosa'
names(resultado)[2] <- 'versicolor'
names(resultado)[3] <- 'virginica'

resultado$class = colnames(resultado[,1:3])[max.col(resultado[,1:3], 
                           ties.method = 'first')]

resultado$class

resultado$class = colnames(resultado[,1:3])[max.col(resultado[,1:3], 
                           ties.method = 'first')]

resultado$class

### Realizando teste com toda a base de teste [dataset_teste]

teste = compute(modelo,dataset_teste[,1:4])

resultado = as.data.frame(teste$net.result)

names(resultado)[1] <- 'setosa'
names(resultado)[2] <- 'versicolor'
names(resultado)[3] <- 'virginica'

resultado$class = colnames(resultado[,1:3])[max.col(resultado[,1:3], 
                           ties.method = 'first')]
