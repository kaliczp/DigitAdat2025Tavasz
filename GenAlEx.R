## poppr csomag
## install.packages("poppr")
library(poppr) # load package
Pet <- read.genalex("Javitott.csv", sep = ";") # import


package?poppr # Read The Fine Manual

gac <- genotype_curve(Pet) # Genotype curve
Petlt <- locus_table(Pet) # Locus table
Petlt # Check it!
info_table(Pet, type = "missing", plot = TRUE) # Missing
tail(genind2df(Pet, sep = "/")) # look at data as data.frame

poppr(Pet) # Diversity table

## DAPC
dapc.Pet <- dapc(Pet, var.contrib = TRUE, scale = FALSE, n.pca = 30, n.da = nPop(Pet) - 1)
scatter(dapc.Pet, cell = 0, pch = 18:23, cstar = 0, mstree = TRUE, lwd = 2, lty = 2)
