
matrizDistancia <- function(dataFrame){
  matrizDist <- dist(dataFrame
                     , method = "euclidean")
  return(matrizDist)
}
