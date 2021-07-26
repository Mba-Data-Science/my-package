library(dplyr)
library(tidyverse)
library(knitr)
library(kableExtra)
library(factoextra)
library(gridExtra)
library(myPackage)

alunos_pap <- read.table("dados/alunos_pap.csv", sep = ";", header = T, dec = ",")
alunos_pap
rownames(alunos_pap) <- alunos_pap[["Aluno"]]

dataFrame <- alunos_pap %>% select_if(is.numeric)

dataFrame

distMatrix <- dataFrame %>% matrizDistancia()

distMatrix

##distMatrix %>%
##  viewTable()


comparaDendograma(distMatrix)

hc4 <- hclustWardD(distMatrix)
plotDendograma(hc4)

grupo_alunos2 <- cutree(hc4, k = 2)
table(grupo_alunos2)
grupo_alunos2 %>% data.frame

class(hc4)

clusterHierarquico(dataFrame, hc4, 2)

dataFrame.padrao <- dataFrame %>% scale()

fviz_nbclust(dataFrame, FUN = hcut, method = "silhouette", k.max = 5)

g1 <- plotSilhouette(dataFrame.padrao, 5)
g2 <- plotWss(dataFrame.padrao, 5)

grid.arrange(g1, g2, nrow = 2)
