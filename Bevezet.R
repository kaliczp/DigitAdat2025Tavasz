### Ismétlés
a <- 1:50
str(a)
b <- "Kalicz"
str(b) # Objektum struktúrája
length(a)
c <- diag(10)
c[2,2] # Indexelés
?matrix # Kézikönyv!
d <- matrix(data = 1:4, nrow = 2)
d # Fent létrehozott mátrix kiíratása
d <- matrix(data = 1:4, nrow = 2, byrow = TRUE) # Soronként feltöltés
d <- matrix(1:4, 2, byrow = TRUE) # Mint az előző, de argumentum név nélkül
d <- matrix(1:4, 2, 2, TRUE) # ha sorba megadok mindent nem kell arg név
e <- as.data.frame(d) # Konvertálás adattáblába (data.frame)
as.matrix(e) # adattábla mátrixszá konvertálása
c("A","G") # Karakter vektor létrehozása
e <- data.frame(V1 = c(1,3), V2 = c(2,4)) # data.frame létrehozása
data.frame(V1 = c(1,3), V2 = c(2,4), Bet = c("A","G")) # újabb oszlop
cbind(e, Bet = c("A","G")) # Ugyan az, mint az előző más függvénnyel
rbind(e, Bet = c("A","G")) # Sor hozzáfűzése. Figyelem, így minden karakter lesz! Az oszlopok, azonos típusúak legyenek!

cbind(e, "A") # Automatikus kiegészítés, az egész oszlop A betű
cbind(e, TRUE) # Automatikus kiegészítés, az egész oszlop TRUE

## Vektorizált műveletek
e + 2 # Mátrix összes eleméhez hozzáad kettőt
a + 2 # Vektorokra is megy

## Logikai kifejezések ez is vektorizált
a > 10 # Objektumra is működnek
e$V2 > 2 # Második változóm kiértékelése

## Indexelés minden a második oszlopot adja vissza
e[1:2,2]
e$V2
e[,2]
e[, "V2"]

## Beolvasás
getwd() # Munka mappa kiíratása, ha nem ezt szeretném, Fájl menü -> Munkakönyvtár beállítás
dir() # Aktuális munka mappa tartalmának ellenőrzése
read.table("ESM_Gánt-Aggtelek_GenAlEx.csv") # Hiba
read.table("ESM_Gánt-Aggtelek_GenAlEx.csv", sep = ";") # mező elválasztó ;, ha tabulátor, akkor "\t"
read.table("ESM_Gánt-Aggtelek_GenAlEx.csv", sep = ";", skip = 2) # Első két sor nélkül
ESM <- read.table("ESM_Gánt-Aggtelek_GenAlEx.csv", sep = ";", skip = 2, head = TRUE) # Fejléccel kódolás?
str(ESM)

## Objektum függő összefoglalás
summary(ESM) # adattáblára
summary(a) # vektorra
## minimum, maximum, medián, átlag
## 1st Qu. alsó kvartilis, aminél a 25%-a kisebb az adatoknak
## medián 50%-a kisebb az adatoknak
## 3st Qu. felső kvartilis 75%-a kisebb az adatoknál

ESM[,3] # Harmadik oszlop
summary(ESM[,3])
quantile(ESM[,3]) # Tukey five numbers

### Grafikus megjelenítés
boxplot(ESM[,3]) # Tukey 5 szám grafikusan Kiugró ponttal.
boxplot(ESM[,3], col = "blue") # Más szín
boxplot(ESM[,3:42]) # Az összes numerikus változó
boxplot(ESM[,3:42], col = c("orange", "yellow")) # Párok színezve
boxplot(ESM[,3:42], col = c("orange", "yellow"), ylab = "Hossz") # y cimke
names(ESM)
boxplot(ESM[,17]) # A boxplot kiírása
locator(1) # Leolvasás a grafikonról, csak 1 érték
summary(ESM[,17]) # Összefoglaló a 17. oszlopról
ESM[,17] # Csak a 17. oszlop
sort(ESM[,17]) # Növekvő sorba rendezés
NA # not available nem áll rendelkezésre
ESM.mat <- ESM[,3:42] # csak a numerikus
ESM.mat[ESM.mat == 0] <- NA # NA-val felülírva
boxplot(ESM.mat) # Boxplot

## Export
write.table(ESM.mat, "ESM.csv", row.names = FALSE) # Szóköz elválasztóval, sorok neve nélkül
write.csv2(ESM.mat, "ESM.csv")

## Kicsit bővebb adatbázis a Grafika.R-ből
library(ggplot2)
mpg.df <- as.data.frame(mpg)
str(mpg.df)
## Indexelés
mpg.df$manufacturer
## ha sok, ismétlődő elemmel, akkor az egyedieket kereshetem
summary(mpg.df$manufacturer) # Ez karakter változóval nem megy.
unique(mpg.df$manufacturer)
## summary numerikus adatokkal
summary(mpg.df$displ)
## ha minőségi adataim vannak -> factor
as.factor(mpg.df$manufacturer)
## summary factorral
summary(as.factor(mpg.df$manufacturer))
## Indexelés számmal
mpg.df[,1]
mpg.df[,"manufacturer"]
## Logikai kifejezéssel is megy
mpg.df[mpg.df$manufacturer == "jeep",]
## Számmal
mpg.df[123:130,]
mpg.df[c(123, 124, 125, 126, 127, 128, 129, 130),]


