## poppr csomag
## install.packages("poppr")
library(poppr) # load package
Pet <- read.genalex("Javitott.csv", sep = ";") # import
str(Pet) # Structure of the object
class(Pet) # Information from object

package?poppr # Read The Fine Manual

gac <- genotype_curve(Pet) # Genotype curve
gac <- genotype_curve(Pet, sample = 1000) # Sample number increased
Petlt <- locus_table(Pet) # Locus table
Petlt # Check it!
info_table(Pet, type = "missing", plot = TRUE) # Missing
tail(genind2df(Pet, sep = "/")) # look at data as data.frame

Pet.ploidy <- info_table(Pet, type = "ploidy", plot = TRUE, low = "black", high = "orange")
write.table(Pet.ploidy, "Ploidy.csv", sep = ";") # Export

poppr(Pet) # Diversity table

## Remove all missing
library("magrittr")
miss <- Pet %>% missingno("loci", cutoff = 0) %>% info_table(plot = TRUE)
## A tradícionális R-ben
miss005 <- missingno(Pet, "loci") # 5%
info_table(miss005, plot = TRUE)
miss <- missingno(Pet, "loci", cutoff = 0) # 0%
info_table(miss, plot = TRUE)

library("pegas")
(Pet.hwe.full <- hw.test(Pet, B = 1000))

## DAPC
dapc.Pet <- dapc(Pet, var.contrib = TRUE, scale = FALSE, n.pca = 30, n.da = nPop(Pet) - 1)
scatter(dapc.Pet, cell = 0, pch = 18:23, cstar = 0, mstree = TRUE, lwd = 2, lty = 2)

## AMOVA
table(strata(Pet, ~Pop))  # Populations

## Re-generate with strata based on Part II/Data preparation
Petsp <- read.genalex("SubPop.csv", sep = ";") # import
splitStrata(Petsp) <- ~Pop/Subpop

table(strata(Petsp, ~Pop/Subpop, combine = FALSE))  # Subpopulations
Petamova <- poppr.amova(Petsp, ~Pop/Subpop)
Petamovacc <- poppr.amova(Petsp, ~Pop/Subpop, clonecorrect = TRUE)

Petamova
Petamovacc

Petamova$componentsofcovariance

Petsignif   <- randtest(Petamova, nrepet = 999)
Petccsignif <- randtest(Petamovacc, nrepet = 999)

plot(Petsignif)
