library(dendextend)
library(stars)

matrizDistancia <- function(dataFrame) {
  matrizDist <- dist(dataFrame
    , method = "euclidean")
  return(matrizDist)
}

hclustSingle <- function(matrizDist) {
  hc <- hclust(matrizDist, method = "single")
  return(hc)
}

hclustComplete <- function(matrizDist) {
  hc <- hclust(matrizDist, method = "complete")
  return(hc)
}

hclustAverage <- function(matrizDist) {
  hc <- hclust(matrizDist, method = "average")
  return(hc)
}

hclustWardD <- function(matrizDist) {
  hc <- hclust(matrizDist, method = "ward.D")
  return(hc)
}

plotDendograma <- function(hc, k = 0) {
  plot(hc, cex = 0.6, hang = -1)
  if (k > 0)
    rect.hclust(hc, k)
}

comparaDendograma <- function(matrizDist) {
  dend1 <- hclustSingle(matrizDist) %>% as.dendrogram()
  dend2 <- hclustComplete(matrizDist) %>% as.dendrogram()
  dend3 <- hclustAverage(matrizDist) %>% as.dendrogram()
  dend4 <- hclustWardD(matrizDist) %>% as.dendrogram()

  dend_list1 <- dendlist(dend3, dend4)
  dend_list2 <- dendlist(dend1, dend2)
  tanglegram(dend3, dend4, main = paste("Emaranhado =", round(entanglement(dend_list1), 2)))
  tanglegram(dend1, dend2, main = paste("Emaranhado =", round(entanglement(dend_list2), 2)))
}

clusterHierarquico <- function(dataFrame, hc, k) {
  grupo <- cutree(hc, k)
  grupo <- data.frame(grupo)
  bind <- cbind(dataFrame, grupo)
  return(bind)
}

plotSilhouette <- function(dataFrame, k.max = 10) {
  g <- fviz_nbclust(dataFrame, FUN = hcut, method = "silhouette", k.max = k.max)
  return(g)
}

plotWss <- function(dataFrame, k.max = 10) {
  g <- fviz_nbclust(dataFrame, FUN = hcut, method = "wss", k.max = k.max)
  return(g)
}