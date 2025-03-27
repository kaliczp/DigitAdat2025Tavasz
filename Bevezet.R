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
