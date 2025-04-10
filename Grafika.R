## Az alap R grafikához szükséges csomagok mindig betöltve a ggplot-hoz be kell tölteni a csomagot
library(ggplot2)
## A csomag felkerül a keresési útra
search()
## Vignette alapján dolgozunk
vignette("ggplot2")
## mpg minta adatbázis elmentése data.frame-ként
mpg.df <- as.data.frame(mpg)
## Adatbázist használata
ggplot(data = mpg)
## Alap R grafika scatterplot-matrix
plot(mpg.df)
## ggplot két változó
ggplot(mpg, mapping = aes(x = cty, y = hwy))
## Ha az adatokat is látni akarom, meg kell adni a formáját
ggplot(mpg, aes(cty, hwy)) +
    geom_point()
## Adjunk még hozzá egy regressziós egyenest
ggplot(mpg, aes(cty, hwy)) +
    geom_point() +
    geom_smooth(formula = y ~ x, method = "lm")
