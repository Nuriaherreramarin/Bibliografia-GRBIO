library(RefManageR)
library(dplyr)
install.packages("bib2df")
library(bib2df)
library(bibtex)

df<- bib2df("C:/Users/nuria.herrera/Desktop/Biblio articles/Articlesact_2507.bib")

for (i in 1:nrow(df)) {
  # Obtener el título y el año de cada entrada
  title <- df$TITLE[i]
  # Quitar los espacios del titulo para cogerlo bien
  title <- gsub(" ", "", title)
  year <- df$YEAR[i]
  
  # Generar el identificador único basado en el título, año e índice
  identifier <- paste0(substr(title, 1, 4), year, i)
  
  # Asignar el identificador a la entrada actual
  df$BIBTEXKEY[i] <- identifier
}

newFile <- tempfile()
df2bib(df, file = newFile)


