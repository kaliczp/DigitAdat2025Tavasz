## install.packages("readxl")
library(readxl)
## Beolvasás adattáblába (data.frame)
Osszesito <- as.data.frame(read_excel("KosztaM_osszesito_tablat_20221102_javitott (1).xlsx"),
                           n_max = 25)
## Javított beolvasás
Osszesito <- as.data.frame(read_excel("KosztaM_osszesito_tablat_20221102_javitott (1).xlsx",
                                      range = "A1:IX25"))
## A teljes vizsgált terület
sum(Osszesito$"Poligon területe (m2)")
