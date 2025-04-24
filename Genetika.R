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
