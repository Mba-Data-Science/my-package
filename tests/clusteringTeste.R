library(tidyverse)
library(myPackage)
library(knitr)
library(kableExtra)

alunos_pap <- read.table("tests/dados/alunos_pap.csv", sep = ";", header = T, dec = ",")
alunos_pap
rownames(alunos_pap) <- alunos_pap[["Aluno"]]

data.frame <- alunos_pap %>% select_if(is.numeric)

data.frame

dist <- data.frame %>% matrizDistancia()

viewTable(dist)
