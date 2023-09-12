library(readr)
articles<-read.csv("C:/Users/nuria.herrera/Desktop/Biblio articles/Articles_PIDGRBIO.csv",
                   fileEncoding = "UTF-8")
df2<-csv_to_bibtex(articles)
class(df2)
tmp <- tempfile()
write_lines(df2, tmp)
