#################################################
# Constru��o de Tabelas
# Vari�veis Qualitativas e qualitativas
# Baseado na aula do Prof. Silvano Cesar da Costa
#################################################


# Primeiros passos -----------------------------

#� interessante definir um diret�rio de trabalho,
# local "default" para procurar os arquivos de dados.
# Op��es:
#  1. Defina um projeto pelo R Studio.
#  2. Use a op��o do menu Session/Set working directory
#  3. Use o comando setwd("<new path>")
#     Exemplo: setwd("C:/MyDoc")

#Obs: Use getwd() para mostrar o diret�rio de trabalho.

# Ao final do trabalho todos os dados da sua sess�o
# ser�o salvos neste diret�rio.

#

# Leitura dos Dados ---------------------
#
## Op��es:
##
##   1. Usar a op��o do menu  "Import Dataset"
#        na �rea "Environment"
# 
##   2. Usar Comando "read.table()
# 
##   Dados separados por espa�os (Ex: "mydata.txt")
# 
#     100   a1   b1
#     200   a2   b2
#     300   a3   b3
#     400   a4   b4
# 
# Exemplo:
#   mydata=read.table("mydata.txt") #read text file
#   mydata
#
---
  
  
# Lendo Arquivos de outros formatos ----------------------------

# Melhor op��o:
#   Salvar dados como texto e ler com o comando read.table()
# 
# # Lembre-se: No R h� sempre um pacote que facilita alguma opera��o.
# 
#   Alternativa: Usar um dos pacotes dispon�veis para o tipo
#                de arquivo desejado
# 
#   Use o comando para instalar no R :
#   >install.packages("nome_do_pacote")
# 
#   E para carregar o pacote na sua sess�o:
#   Comandos:
#   >library(nome_do_pacote)           #load package
#   >mydata=read.XXX("mydata.xxx")     #read file
---

#Lendo os dados do arquivo do moodle ------------------------ 


tab3 =read.table("dados1.txt")

# Explorando os dados ----

View(tab3) # Procure por NA�s

# Visualilzando o cabe�alho de dados e a sua estrutura ---- 
names(tab3)
str(tab3)

# Explorando os dados ----
tab3[1:10,]
tab3[1:10,4]
tab3[1, 1:4]
tab3[1:5, 1:5]

# Especificando colunas pelo nome ----  

tab<-tab3[1:3,c('IDADE','SALMIN')]
tab
tab<-tab3[,c('IDADE','SALMIN')]
tab

tab<-tab3[tab3$SALMIN>15,]
tab

# Visualizando o in�cio e fim dos dados ----  

head(tab3)
tail(tab3)

# Sum�rio dos 5 n�meros ---- 
summary(tab3)

###############################
# Tabela vari�veis Qualitativas ---- 
###############################

# Tabela para ESTADO CIVIL ----

table(tab3$ESTCIV)
estado.civil = table(tab3$ESTCIV)
rownames(estado.civil) = c('Casado', 'Solteiro')
estado.civil
addmargins(estado.civil)
addmargins(estado.civil, FUN=list(Total=sum))

# Tabela das Propor��es ----
prop.table(estado.civil)
(prop.estciv = round(100*prop.table(estado.civil), 1))
addmargins(prop.estciv, FUN=list(Total=sum))

#------------------------------------------

# Tabela para Grau de Instru��o ---

table(tab3$GRAUINSTR)
grau.inst = table(tab3$GRAUINSTR)
rownames(grau.inst) = c('Fundamental', 'M�dio','Superior')

grau.inst
addmargins(grau.inst)
addmargins(grau.inst, FUN=list(Total=sum))

#pedindo ajuda no comando 
?addmargins

# Tabela das Proporcoes ----
prop.table(grau.inst)
grau.inst

(prop.grauinstr= round(100*prop.table(grau.inst), 1))
addmargins(prop.grauinstr, FUN=list(Total=sum))

# Outra op��o para arrendondar output ----

#grava a configura��o anterior e altera a atual
old=options(digits = 2)
prop.table(grau.inst)
# Restaura as op��es anteriores
options(old)


# Tabela de Conting�ncia ----

tab = table(tab3$ESTCIV, tab3$GRAUINSTR)
tab

?table



# Gr�fico com 2 vari�veis ---- 
plot(tab, col="LightYellow")
plot(tab, col="LightYellow", xlab="Estado Civil", ylab='Grau de Instru��o',
     main='Tabela de Conting�ncia', las=1, cex.axis=1.1)

mosaicplot(tab)
mosaicplot(tab, las=1, xlab='Estado Civil',
       color=c('lightgreen','lightyellow','red'), ylab='Grau de Instru��o',
       main="")

# Gr�fico com 3 vari�veis ----

tab = table(tab3$ESTCIV, tab3$GRAUINSTR, tab3$PROCED)
tab
mosaicplot(tab, color=1:3, main="Estado Civil x Grau Instru��o x Proced�ncia", xlab='Estado Civil', ylab='Grau
             de Instru��o', off=5)


#--------------------

# Gr�ficos de pizza
pie(estado.civil)
pie(estado.civil, labels=c('Casado', 'Solteiro'), radius=1)

pie(estado.civil, labels = paste(c('Casado ', 'Solteiro '), prop.estciv,'%'))
pie(estado.civil, labels = paste(c('Casado ', 'Solteiro '), prop.estciv,'%'), col=c('lightyellow', 'lightgreen'))


pie(estado.civil, labels = paste(c('Casado ', 'Solteiro '), prop.estciv,'%'),
    col=c('lightyellow', 'lightblue'), radius=1, cex=1.5)

pie(estado.civil, labels = paste(c('Casado ', 'Solteiro '), prop.estciv,
     '%'), col=c('lightyellow', 'lightblue'), radius=1, cex=1.5, border='red')

# Forma Direta gr�ficos de pizza
anim = c(650, 230, 70)
pie(anim)
pie(anim, labels = c('Pequeno Porte','M�dio Porte','Grande Porte'))

