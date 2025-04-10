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
## Ugyan ez a hagyományos R-es grafikával
plot(hwy ~ cty, data = mpg.df)
mpg.lm <- lm(hwy ~ cty, data = mpg.df)
abline(mpg.lm)
## Nézzük meg a regresszió ereményét
summary(mpg.lm)

### Ggplot tovább
## Alapértelmezett simítás vizuális
ggplot(mpg, aes(cty, hwy)) +
    geom_point() +
    geom_smooth()
## Scales
ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_point() +
    scale_colour_viridis_d()

## Facets
ggplot(mpg, aes(cty, hwy)) +
    geom_point() +
    facet_grid(year ~ drv)

## Coordinates
ggplot(mpg, aes(cty, hwy)) +
    geom_point() +
    coord_fixed()

## Theme
ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_point() +
    theme_minimal() +
    coord_fixed()

ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_point() +
    theme_minimal() +
    theme(
        legend.position = "top",
        axis.line = element_line(linewidth = 0.75),
        axis.line.x.bottom = element_line(colour = "blue")
    )

## Mindent bele
ggplot(mpg, aes(cty, hwy)) +
    geom_point(mapping = aes(colour = displ)) +
    geom_smooth(formula = y ~ x, method = "lm") +
    scale_colour_viridis_c() +
    facet_grid(year ~ drv) +
    coord_fixed() +
    theme_minimal() +
    theme(panel.grid.minor = element_blank())


### És hogyan mentem el?
help.start() # és a grDevices csomag.
