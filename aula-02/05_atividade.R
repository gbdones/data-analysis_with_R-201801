### Atividade prática

## Vamos começar carregando um ambiente previamente criado para esta aula. 
## Nas aulas seguintes trabalharemos com fontes de dados em arquivos de formatos diversos.
load("aula-02/data/dados_exercicio.RData")

### 1 ####
## Inicie mostrando uma prévia do conteúdo da variável acessos_alunos
## 
## Dica 1: No material sobre estruturas de dados vimos como exibir uma prévia do conteúdo de uma variável com 2 funções diferentes
## Dica 2: Na primeira aula vimos uma função do RStudio que permite visualizar o conteúdo de uma variável, mas neste caso 
##         quero ver uma saída na Console.
### # ####
str(acessos_alunos)


### 2 ###
## Quantos elementos a variável acessos_alunos possui? Utilize uma função do R que retorna o tamanho da variável.
length(acessos_alunos)


## Dica: Vimos um exemplo no mesmo material sobre estruturas de dados
### # ###


### 3 ###
## Utilizando o seu código de aluno da Uniritter como nome de um valor da lista, imprima uma linha informando quantos acessos
## você fez. A linha deve ser impressa na Console, com um texto que diga o seu código de aluno e o valor conforme o seguinte exemplo:
## "O aluno <alu...> realizou N acessos."

## Dica 1: Utilize a função paste() para composição do texto que será impresso. 
## Dica 2: Vimos exemplos disto nos materiais dos tipos numéricos e das estruturas de dados.
### # ###

#### Define a matricula 
matricula <- "alu0811237"

#### Busca acessos do aluno
acessosAluno <- acessos_alunos[which(names(acessos_alunos) == matricula)]

#### Concatena informação de aluno e acessos
paste("O aluno",matricula,"realizou",acessosAluno, "acessos")


### 4 ###
## A operação abaixo cria um vetor com todas as quantidades de acessos por aluno.
acessos <- unlist(acessos_alunos)

## Após a criação deste vetor, determine quantos colegas fizeram mais acessos que você.
## Faça isso em 3 etapas: 
## 1. Crie uma variável com o resultado de um teste de comparação (relacional) entre o seu número de acessos e os demais.
## 2. Com uma operação de indexação, crie um outro vetor contendo somente os valores maiores
## 3. Determine o tamanho do vetor da operação 2, imprimindo o resultado na Console
### # ###


##### Variavel que contém somente o valor de acessos do usuário 
acessoAluno <- acessos[[matricula]]

##### Variavel de comparacao entre o usuário e os demais. Resulta  ao vetor somente os alunos com mais acessos
somenteMaiores <- acessos[acessos>acessoAluno]

##### Imprime valores maiores
length(somenteMaiores)


### 5 ###
## Combine todas as etapas acima em uma única chamada, sem a criação dos vetores auxiliares
### # ###

##### Busca somente registros maiores que o usuario de forma unica
maisAcessosUnico <- acessos[acessos>acessos[matricula]]

##### Imprime valores maiores
length(maisAcessosUnico)

### 6 ###
## Agora determine quantos colegas fizeram menos acessos que você. 
## Faça isso utilizando a função sum!

## Dica: Lembre que falamos sobre como o R faz conversões implícitas entre o tipo lógico e tipos numéricos
### # ###

#### Imprime quantidade de acessos menores que o do usuario
sum(acessos[acessos<acessos[matricula]] < acessos[matricula])



### 7 ###
## Supondo que eu quero atribuir uma nota de participação baseada na quantidade de acessos, com a seguinte definição:
##   - Alunos que não acessaram não recebem nota de participação
##   - Alunos que acessaram, mas menos que 10 vezes, recebem 1 ponto
##   - Alunos que acessaram 10 vezes ou mais recebem 2 pontos
## Crie um vetor chamado notas com a nota de cada aluno, na mesma ordem do vetor de acessos criado para o exercício 4.

## Dica: Pode ser mais fácil se iniciar o vetor notas como uma cópia do vetor acessos, modificando os valores conforme as regras
## OBSERVAÇÃO :: Não avaliarei participação na forma do enunciado deste exercício. 
### # ###

#### Cria cópia do vetor de acessos
notas <- acessos

#### Associa as notas com relação aos acessos
notas[notas == 0] <- NA
notas[notas > 0 & notas < 10 ] <- 1
notas[notas >= 10] <- 2

#### IMPRIME NOTAS
notas 


### 8 ###
## Visualização da quantidade de alunos com cada nota de participação. Esta não é uma atividade, apenas uma ilustração de como
## criar uma tabela com esta contagem
table(notas)


### 9 ###
## Abaixo, criei uma versão modificada da lista acessos_alunos, com a inclusão de um acesso convidado.
## Não foi possível determinar o número de acessos por não existir um login para este tipo de acesso.
acessos_alunos_e_guest <- acessos_alunos
acessos_alunos_e_guest$guest <- NA

## Repita as atividades 4, 5, 6, e 7 utilizando o acessos_com_guest no lugar da lista acessos_alunos.
## Tome o devido cuidado de sempre criar variáveis com nomes diferentes das já utilizadas! 

acessosGuest <- unlist(acessos_alunos_e_guest)

##### Variavel que contém somente o valor de acessos do usuário 
qtdAcessos <- acessosGuest[[matricula]]

##### Variavel de comparacao entre o usuário e os demais. Resulta  ao vetor somente os alunos com mais acessos
somenteMaioresConvidado <- acessosGuest[acessosGuest>qtdAcessos]

##### Imprime valores maiores
length(somenteMaioresConvidado)

##### Retorna somente os alunos com mais acessos que o usuario
maisAcessosUnicoConvidado <- acessosGuest[acessosGuest>acessosGuest[matricula]]

##### Imprime valores maiores Unico
length(maisAcessosUnicoConvidado)

#### Imprime quantidade de acessos menores que o do usuario
sum(acessosGuest[acessosGuest<acessosGuest[matricula]] < acessosGuest[matricula])

#### Cria cópia do vetor de acessos
notasGuest <- acessosGuest

#### Associa as notas com relação aos acessos
notasGuest[notasGuest == 0] <- NA
notasGuest[notasGuest > 0 & notasGuest < 10 ] <- 1
notasGuest[notasGuest >= 10] <- 2

#### Imprime Notas com Convidado
notasGuest 


### 10 ###
## Responda as seguintes perguntas:

# 1. Houve modificação no número de alunos com mais e com menos acessos que você?
#Sim. No caso de alunos com mais acessos, identifiquei que o NA foi considerado. 
#Porém, quando apliquei o sum para calcular a quantidade que teve menos acessos a execução retornou NA. 

# 2. Como você conclui que o R trata comparações (operações relacionais) entre valores numéricos e NA?
#Parece que o R não consegue identificar em operações relacionais se os valores são maiores ou menores. 

# 3. Qual o resultado do uso da função sum na presença de NA? O que você conclui sobre a operação de soma de todos os valores de
#    um vetor na presença de NA?
# O resultado foi NA, aparentemente o R não consegue lidar com a soma de valores NA em vetores.
# 4. Execute o comando abaixo para ler a documentação da função sum e veja se há como modificar a chamada da função sum na presença
#    de NAs. Teste os exemplos da página de help da função sum.
help(sum)

## RETORNO DO SUM APÓS O TRATAMENTO DE RETORNO UTILIZANDO O NA.RM
sum(acessosGuest[acessosGuest<acessosGuest[matricula]] < acessosGuest[matricula],na.rm=TRUE)
