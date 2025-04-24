## install.packages("readxl")
library(readxl)
## Beolvasás adattáblába (data.frame)
Osszesito <- as.data.frame(read_excel("KosztaM_osszesito_tablat_20221102_javitott (1).xlsx"),
                           n_max = 25)
## Javított beolvasás
Osszesito <- as.data.frame(read_excel("KosztaM_osszesito_tablat_20221102_javitott (1).xlsx",
                                      range = "A1:IX25"))
## Megvan az objektum?
ls()
## A teljes vizsgált terület kétféle indexszeléssel
sum(Osszesito$"Poligon területe (m2)") # Dollár után oszlopnév
sum(Osszesito[,"Poligon területe (m2)"]) # Indexként használt oszlopnév
sum(Osszesito[,3]) # A harmadik oszlop
## A területek öszegzése
quantile(Osszesito[,"Poligon területe (m2)"])
summary(Osszesito[,"Poligon területe (m2)"])
