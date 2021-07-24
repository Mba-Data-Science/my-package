carregaPacotes <- function(pacotes){
  if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
    instalador <- pacotes[!pacotes %in% installed.packages()]
    for(i in 1:length(instalador)) {
      install.packages(instalador, dependencies = T)
      break()}
    sapply(pacotes, require, character = T)
  } else {
    sapply(pacotes, require, character = T)
  }
}


viewTable <- function(dataFrame) {
  table <- dataFrame %>%
    kable() %>%
    kable_styling(bootstrap_options = "striped",
                  full_width = T,
                  font_size = 12)
  return(table)
}
