library(stats)

carregaPacotes <- function(pacotes) {
  if (sum(as.numeric(!pacotes %in% installed.packages())) != 0) {
    instalador <- pacotes[!pacotes %in% installed.packages()]
    for (i in 1:length(instalador)) {
      install.packages(instalador, dependencies = T)
      break() }
    sapply(pacotes, require, character = T)
  } else {
    sapply(pacotes, require, character = T)
  }
}

toDataFrame <- function(object) {
  if (class(object) == "dist") {
    dataMatrix <- object %>%
      as.matrix() %>%
      data.frame()
    return(dataMatrix)
  } else {
    return(object)
  }
}

viewTable <- function(dataFrame) {
  table <- dataFrame %>%
    toDataFrame() %>%
    kable() %>%
    kable_styling(bootstrap_options = "striped",
                  full_width = T,
                  font_size = 12)
  return(table)
}
