## adegenet csomag
## install.packages("adegenet")
## install.packages("adegenet", dep=TRUE) # a függőségekkel is.
library(adegenet)
adegenetWeb() # web page opening
?adegenet

### A tutorial alapján haladunk
data(nancycats) # Minta adatbázis betöltése
?nancycats
nancycats # Összefoglaló az objektumról
nancycats@tab # 
nancycats@tab

## Import próba
PET <- read.csv2("INPUT20250310taxgeo.csv", skip = 2)
## Két oszlop összeforrasztása lókuszonként
loci <- data.frame(apply(PET[,3:4], 1, paste, collapse = "/"))
for(lokusz in 3:22){
    lok.akt <- 2*lokusz
    akt <- data.frame(apply(PET[,(lok.akt-1):lok.akt], 1, paste, collapse = "/"))
    loci <- cbind(loci,akt)
}

## Lokusz nevek
PET.names <- as.character(read.csv2("INPUT20250310taxgeo.csv", skip = 2, head = FALSE, nrows = 1))
colnames(loci) <- c(PET.names[!PET.names == "NA"])
## Egyedek elnevezése
row.names(loci) <- PET[,ncol(PET)]

## Átalakítás genind objektummá
PET.g <- df2genind(loci, sep = "/")

## visszaalakítás
genind2df(nancycats)
genind2df(PET.g) # Valami nem jó

## A sikertelen mérések azonosítása
loci[loci == "0/0"] <- NA
PET.g <- df2genind(loci, sep = "/")

## Főkomponens analízis
PETrepl <- tab(PET.g, NA.method="mean")

pca1 <- dudi.pca(PETrepl) # interaktív axes selection

pca2 <- dudi.pca(PETrepl, scannf = FALSE, nf = 2) # nem interaktív
pop(PET.g) <- PET[,2] # populáció jelölés
print(summary(PET.g))

PETpop <- genind2genpop(PET.g)

temp <- as.integer(pop(PET.g))
