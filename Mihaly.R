## install.packages("readxl")
library(readxl)
## Beolvasás adattáblába (data.frame)
Osszesito <- as.data.frame(read_excel("KosztaM_osszesito_tablat_20221102_javitott.xlsx"),
                           n_max = 25)
## Javított beolvasás
Osszesito <- as.data.frame(read_excel("KosztaM_osszesito_tablat_20221102_javitott.xlsx",
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

## install.packages("vegan")
library(vegan)

## Work with sums
Tax <- Osszesito[,grep("ossz",names(Osszesito))] # Csak összes adatok
colnames(Tax) <- gsub(" ossz", "", names(Tax)) # Nevek csak fajkódok
row.names(Tax) <- paste(Osszesito[,2], Osszesito[,5], sep = "_")
Tax[is.na(Tax)] <- 0 # Replace NA-s with 0

## Indexek
shannon <- diversity(Tax) # Shannon (default)
simpson <- diversity(Tax, index = "simpson") # Simpson index

## Histograms
par(mfrow = c(1, 2))  # 2 panels
hist(simpson)
hist(shannon)

## rarecurve
row.names(Tax) <- paste(Osszesito[,2])
rarecurve(Tax)

## Ajánlott csomagok
library(MASS)
## install.packages("casualreg")
library(casualreg)

## Faktor készítés
TypSh <- data.frame(Type = factor(Osszesito[,4]), Shannon = shannon) # adattábla az indexszel
summary(TypSh) # Összegzés
boxplot(Shannon ~ Type, data = TypSh, xlab = "") # Vizuális elemzés a kategóriákra

summary(TypSh[TypSh$Type == "Cserjés",]) # Csak a Cserjés leíró statisztikája
TypSh[TypSh$Type == "Tisztás-erdő szegély",] # Adatokat megnézzük

## Dendrogram
Taxdist <- dist(Tax) # Eucledian dist

Taxhc <- hclust(Taxdist) # Clustering
Taxcdhc <- as.dendrogram(Taxhc) # Produce dendrogram
plot(Taxcdhc)

## Skip some row
Taxdist1 <- dist(Tax[-c(11,13,17,20),])
Taxhc1 <- hclust(Taxdist1)
Taxcdhc1 <- as.dendrogram(Taxhc1)
plot(Taxcdhc1)
