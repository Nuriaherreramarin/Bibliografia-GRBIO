library(RefManageR)
library(dplyr)
#install.packages("bib2df")
library(bib2df)
library(bibtex)

art <- bib2df("C:/Users/nuria.herrera/Desktop/Biblio articles/ARTICLES_DEF.bib")
df <- as.data.frame(art)
df$AUTHOR <- sapply(df$AUTHOR, function(x) paste(x, collapse = ", "))
df$EDITOR <- sapply(df$EDITOR, function(x) paste(x, collapse = ", "))
df$NOTE <- gsub(";", ",", df$NOTE)
write.csv(df, file="C:/Users/nuria.herrera/Desktop/Biblio articles/Articles_PIDSGR.csv",
          row.names = TRUE)
