csv_to_bibtex <- function(df) {

   # Inicialitzar cadena de text en format BibTeX
  bibtex <- ""
  
  # Iterar sobre les files del dataframe i generar la entrada BibTeX para cada fila
  for (i in 1:nrow(df)) {
    # Extraer los valores de los campos necesarios para la entrada BibTeX
    title <- df[i, "TITLE"]
    # author <- df[i, "AUTHORS"]
    journal <- df[i, "JOURNAL"]
    year <- df[i, "YEAR"]
    volume <- df[i, "VOLUME_PAGES"]
    doi <- df[i, "DOI"]
    nota1 <- df[i, "SGR.2022"]
    nota2 <- df[i, "PID"]
    HQ <- df[i, "HIGHEST_QUARTIL"]
    HQ[HQ == "-"] <- NA
    IF <- df[i, "IMPACT_FACTOR"]
    IF[IF == "-"] <- NA
    nota3 <- df[i, "FIRST_AUTHOR"]
    nota4 <- df[i, "LAST_AUTHOR"]
    bioinf<-df[i, "Bioinformatics"]
    ifelse(bioinf== 1, "YES", ifelse(bioinf == 0, "NO", ""))
    stat_prob <- df[i, "Statistics_Probability"]
    ifelse(stat_prob== 1, "YES", ifelse(stat_prob == 0, "NO", ""))
    open_acces<- df[i, "OPEN_ACCES"]
    # Generar la entrada BibTeX para la fila actual
    entry <- paste(
      "@article{",
      make.names(paste0(substr(title, 1, 4), year, i)),  # Generar una clave unica para la entrada
      ",\n",
      "title={", title, "},\n",
      "journal={", journal, "},\n",
      "year={", year, "},\n",
      "note={", paste("SGR2022:",ifelse(nota1 == "YES", "YES", "NO"), ";", "PID:",
                      ifelse(nota2=="YES", "YES", "NO"), ";", 
                      ifelse(HQ != " ", paste("HQ:", HQ), ""),";",
                      ifelse(IF != " ", paste("IF:", IF), ""),";",
                       "Firstauthor:", ifelse(nota3=="1", "YES", "NO"), 
                      ";", "Lastauthor:", ifelse(nota4==1, "YES", "NO"), ";", 
                       ifelse(bioinf != " ", paste("Bioinf:", bioinf), ""), ";",
                      ifelse(stat_prob != " ", paste("Stat_Prob:", stat_prob), ""), ";",
                      ifelse(open_acces != " ", paste("Open_Acces:", open_acces), ""),
                      ";", sep=" "), "},\n",
      "doi={", doi, "},\n",
      "}\n",
      sep = ""
    )
  
    # Agregar la entrada BibTeX a la cadena de texto
    bibtex <- paste(bibtex, entry, sep = "\n")
  }
  # Devolver la cadena de texto completa
  return(bibtex)
  
}



