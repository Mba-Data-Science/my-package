library(tidyverse)

alunos_pap <- read.table("tests/dados/alunos_pap.csv", sep = ";", header = T, dec = ",")
alunos_pap
rownames(alunos_pap) <- alunos_pap[["Aluno"]]

alunos_pap %>% select_if(is.numeric)


sa <- sapply(alunos_pap, class)
sa

al
