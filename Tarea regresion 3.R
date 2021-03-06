---
# Preámbulo con paquetes y definiciones básicas
# Se incluyen los comandos mínimos de LaTeX
title: Tarea Examen Jesús Urrutia
  - Jesus Alberto Urrutia Camacho (urcajeal@gmail.com)
header-includes:
  - \usepackage{array}
  - \usepackage{booktabs}
  - \usepackage{amsmath}
  - \allowdisplaybreaks #% para permitir rompimiento de ecuaciones en p\'aginas distintas
    #% ver http://tex.stackexchange.com/questions/51682/is-it-possible-to-pagebreak-aligned-equations
    #% para m\'as detalles
  #- \numberwithin{equation}{section} # Para numerar ecuaciones por secciones cuando están numeradas
  - \usepackage{amssymb}
  - \usepackage{mathtools}
  - \usepackage{braket}
  - \usepackage[shortlabels]{enumitem}
  - \usepackage[spanish]{babel}
  - \decimalpoint
  - \usepackage{graphicx}
  - \usepackage{caption}
  - \renewcommand{\and}{\\}
  - \renewcommand{\arraystretch}{1.2}
  - \usepackage{booktabs}
  - \usepackage{float}
  - \usepackage[font=small,labelfont=bf]{caption}
  - \usepackage{fancyhdr}
  - \usepackage{dsfont}
  # Usa el comando \mathds{1}
  # Ver
  # https://tex.stackexchange.com/questions/26637/how-do-you-get-mathbb1-to-work-characteristic-function-of-a-set
  # para más información acerca de números con estilo mathbb
  - \newcommand{\mb}[1]{\mathbb{#1}}
  # para usar kableExtra se requieren los siguientes paquetes
  # ver
  # https://haozhu233.github.io/kableExtra/awesome_table_in_pdf.pdf
  # para más detalles
  - \usepackage{booktabs}
  - \usepackage{longtable}
  - \usepackage{array}
  - \usepackage{multirow}
  - \usepackage{wrapfig}
  - \usepackage{float}
  - \floatplacement{figure}{H}
  - \usepackage{colortbl}
  - \usepackage{pdflscape}
  - \usepackage{tabu}
  - \usepackage{threeparttable}
  - \usepackage{threeparttablex}
  - \usepackage[normalem]{ulem}
  - \usepackage{makecell}
  - \usepackage{xcolor}
output: 
  pdf_document:
    #toc: true
    toc_depth: 2
    number_sections: true
    df_print: kable
    highlight: tango
---
                
<!--           <!-- El siguiente código sirve para poner el logo del encabezado. --> -->
<!-- \pagestyle{fancy} -->
<!-- \fancyhf{} -->

<!-- \rhead{\begin{picture}(0,0)  -->
<!-- \put(-40,-20) -->
<!-- {\includegraphics[width=30mm] -->
<!-- {images/iimas}}  -->
<!-- \end{picture}} -->

<!-- \renewcommand{\headrulewidth}{0pt} -->
<!-- \rfoot[\thepage]{\vspace{-0.5cm} \thepage} -->

        
```{r setup, include = FALSE}
        knitr::opts_chunk$set(echo = TRUE, warning = FALSE)
```
        
```{r include = FALSE, echo = FALSE}
        ##  LIBRERÍAS
        # Aquí vamos a incluir las librerías que necesitemos
        # En donde se pongan pedazos de código, únicamente se comentará
        # Es BUENA PRÁCTICA poner las librerías al principio, por ello las ponemos aquí
        # library(library_name)
        library(knitr)
        #install.packages("kableExtra")
        library(kableExtra)
        library(cluster)
        library(mclust)
        library(factoextra)
        library(dendextend)
        library(purrr)
        library(ggplot2)
        library(lmtest)
        library(readr)
        library(texreg)
        library(emmeans)
        library(expsmooth)
        library(MASS)
        library(fma)
        library(faraway)
        library(corrplot)
        library(olsrr)
        library(leaps)
        library(GGally)

```
        
        
        
        
        <!-- AQUÍ INICIA LA PÁGINA DE TÍTULO
        Indicaciones:
                El nombre de los autores aparece al principio, allí puede cambiar su correo
        SIEMPRE PONER LA FECHA CORRECTA (la de entrega)
        ESCRIBIR CADA VEZ EL NOMBRE DE LA MATERIA CORRESPONDIENTE
        -->

<!-- \title{ {\sc Universidad Nacional Autónoma de México}\\ -->
<!-- \vspace{1cm}{\sc Instituto de Investigaciones en Matemáticas Aplicadas y en Sistemas}\\  -->
<!--                         \vspace{1cm}{\sc Especialización en Estadística Aplicada} \\ -->
<!--                         \vspace{1.5cm} {Diseño de Experimentos} \\ -->
<!--                         \vspace{1.5cm} {Tarea 4} -->
<!--                 } -->

<!-- \date{\vspace{1.5cm}Ciudad de México\\ -->
<!--         \vspace{1cm} \today } -->

<!-- \maketitle -->


<!-- \thispagestyle{fancy} -->
<!-- \newpage -->
        
       
# Se realiza un estudio del el efecto que tiene la renta per capita (R), la zona costera (ZC) o archipiélago (ZA) sobre las estadías hoteleras por habitante en diferentes provincias (P). Y se obtienen los siguientes resultados

A. Indique qué variables son estadísticamente significativas a nivel individual, usando como nivel de significancia el 5%. ¿Y si usamos el nivel de significancia del 10%?

B. Construya un intervalo del 95% de confianza para $\beta_{2}$ (ZC) y otro para $\beta_{3}$(ZA).


# Para un conjunto de empresas pertenecientes a cierto sector económico se ha ajustado la siguiente función de producción:

Para que el modelo sea lineal, se toma el logaritmo obteniendo el siguiente modelo transformado

A. Realice las pruebas de hipótesis individuales para determinar la significancia de $\beta_{1}$ y $\beta_{2}$  la prueba de significancia conjunta.

B. La estimación de los modelos de regresión lineal simple de  ln(Q) en función de ln(L) y de ln(Q) en función de ln(K) produjo los siguientes resultados.

Realice las pruebas de hipótesis para evaluar la significancia de en cada uno de los modelos. Explique la aparente contradicción entre los resultados obtenidos del inciso A) y con los obtenidos en este inciso.

# Utilizando el estadístico de Mallows como referencia, seleccione que modelo(s) es (son) el (los) mejor para predecir el puntaje de un estudiante en un examen. Suponga que un profesor quisiera utilizar las horas de estudio, exámenes de prueba tomados y el actual promedio como variables para predecir el puntaje que obtendrá un estudiante en un examen. El profesor realiza el ajuste con siete distintos modelos y obtiene el coeficiente de Mallows para cada uno.
```{r}
data3 <- data.frame(Variables = c("Horas", "Exámenes de prueba", "PRomedio", "Horas y examanes de prueba", "Horas y promedio", "Exámenes de prueba y promedio", "Las tres juntas"),
                 p_1 = c(2,2,2,
                         3,3,3,4),
                 Cp_Mallows = c(45.5,31.4,29.3,3.4,2.9,2.7,4)
                    )

```

# Considere el siguinete modelo:

A. ¿Qué hipótesis del modelo de regresión lineal múltiple viola este modelo?

B. ¿Qué expresión tendría el modelo ponderado que corrige este modelo?

C. Compruebe que el modelo ponderado del inciso anterior es
heterocedástico

# Utilizando el conjunto de datos cangas del paquete expsmooth responda: ¿por qué la transformación de Box-Cox no es de verdadera ayuda?

```{r, include=FALSE}
base5 <- cangas
#subset(base5, base5==length(base5))
anios <- rep(1:45, each=12)

length(base5) #542
length(anios)
46*11 #552
#hay46 años
542/45

#cbind(anios, base5) #revisar que la ongitud de anios == a base5
str(base5)
summary(base5)

```
La base de datos describe una serie de tiempo desde  1960 hasta el año 2005. Se puede percibir que conforme pasan los años, el valor de la variable también aumenta, lo cuál se visualiza en la siguiente gráfica.  

```{r, echo=FALSE}
plot(base5)
```
Respecto a la transformación BoxCox, ésta es de gran utilidad cuando se busca transformar los datos hacia una distribución normal y generar una varianza constante. 
Además, esta transformación busca "encontrar una relación lineal cuando esta es una curva". Desafortunadamente, la gráfica permite visualizar que la hay ciclos en la tendencia, y no solo una curva (Juarez, 2021). 

```{r}


```

REVISAR CÓMO SE VEN LOS DATOS CON HETEROSCEDASTICIDAD Y SUPONER METER LA BOXCOX

# Para el conjuntos de datos usdeaths del paquete fma

A. GRafique los datos
```{r, echo=FALSE}
bd6 <- usdeaths
length(bd6) #12
72/12
anio6 <- rep(1:12, 6)

bd6df <- as.data.frame(cbind(anio6, bd6))


par(mfrow=c(1,2))
plot(bd6) 
ggplot(bd6df, aes(x=anio6, y=(bd6))) +
        geom_point() +
        geom_abline(slope= 109.95, intercept = 8188.57, show.legend = "real", color="pink")  
    
```
Es evidente que se trata de una base de datos de información temporal. Si se traza una recta de regresión, es evidente que hay gran distancia entre las observaciones y la recta, lo cuál podría llevar a pensar que el modelo no ajusta bien. 

```{r}
summary(bd6)
str(bd6)
```
Lo anterior se confirmar con la función _str_ , la cual describe que los datos son recogidos entre 1973 a 1979. Y el tamaño es de $72$ unidades, donde cada año observado es integrado por 12 meses, por lo que hay 6 años enla base. 

B. Si cree que es apropiado realizar una transformación para ajustar un modelo lineal, aplíquela y describa los efectos de su aplicación.

```{r, include=FALSE}

mod6 <- lm(bd6 ~ anio6)
summary(mod6)

par(mfrow=c(2,2))
plot(mod6)


```
Se aplica un modelo de regresión lineal simple. A pesar de que los estimadores son estadísticamente significativos, el coeficiente de determinación es _muy mal_, pues es de 0.13. Respecto a los supuestos básciso, es posible identificar que los datos son normales, pero los extremos se alejan; parece que no hay datos _outliers_ influyentes; parece que no hay heteroscedasticidad, pero que los datos con identificación 7, 6, y 8 podrían  incidir en la curva central roja; finalmente, parece haber tendencia entre los residuales y los datos ajustados, lo que se muestra como una _colina_, y los mismos datos (6,7,8) ,son los más incluyentes. Entonces, se procede a realizar una transformación para mejorar el ajuste del modelo, y comprobar la relación entre residuales y datos. 

```{r}

bc6 <- boxcox(mod6)
bc6$x[ which(bc6$y==max(bc6$y)) ] # -0.989899
mod6new <- lm(((bd6^-0.989899)-1)/-0.989899 ~ anio6)

summary(mod6new)
ggplot(bd6df, aes(x=anio6, y=((bd6^-0.989899)-1)/-0.989899)) +
        geom_point() +
        geom_smooth(method = "lm", se=T, col="orange")

```
Primero se realiza una transformación box-cox, con $y_{i}^\lambda = y_{i}^{-0.989899}$. Aunque los estimadores continúan siendo significativos al 95% de confianza, con P valores de $0.0000$ y $0.0002$, es evidente que el modelo de mejora su ajuste, pues la $R^2 = 0.17$. Además, se grafica la recta de regresión y es visible la gran distancia entre los datos y la recta. 

```{r}

par(mfrow=c(2,2))
plot(mod6new)

bptest(mod6new)
dwtest(mod6new)

```

Respecto a los supuestos, parece que los supuestos de normalidad, outliers influyentes y homocedasticidad permanecen constantes, pero la correlación de residuales continúa siendo violada. Por lo que se procede a realizar pruebas de hipótesis. Se realiza la prueba Breush Pagan y no se rechaza la hipótesis nula de homocedasticidad con un P valor de 0.6433. Pero sí se rechaza la hipótesis nula de no correlación de errores con la prueba Durbin-Watson al 95% de confianza, y un P valor de 0.0000. 

```{r, echo=FALSE}

mod6log <- lm(log(bd6) ~ anio6)
summary(mod6log)

ggplot(bd6df, aes(x=anio6, y=log(bd6))) +
        geom_point() +
        geom_smooth(method = "lm", se=T, col="pink") +
        geom_abline(slope = 0.01240, intercept = 8.99471, color="red")


```
Segundo, se realiza la transformación del logaritmo a la variable respuesta, y el escenario es similar a los anteriores: el $R^2 = 0.15$, pero los estadísticos siguen siendo significativos. También, la gráfica con la recta de regresión parece haber gran distancia entre los datos y la recta. 

```{r}
par(mfrow=c(2,2))
plot(mod6log)

bptest(mod6log)
dwtest(mod6log)
```

Respecto a los supuestos, parece que los supuestos de normalidad, outliers influyentes y homocedasticidad siguen constantes, empero la correlación de residuales es incumplida todavía. Por lo que se procede a hacer pruebas de hipótesis. Se realiza la prueba Breusch Pagan y no se rechaza la hipótesis nula de homocedasticidad con un P valor de 0.9695. Pero sí se rechaza la hipótesis nula de no correlación de errores con la prueba Durbin-Watson al 95% de confianza, y un P valor de 0.0000.

Finalmente, a pesar  de que el modelo de regresión con los datos originales y en las dos transformaciones muestran que los estimadores son estadísticamente significativos, hay coeficientes de determinación muy bajos, entre el 0.1 al 0.2. Esto se debe a que los errores están correlados, pues los datos son temporales, y esto se compueba con las pruebas de Durbin-Watson. El efecto que tiene esto en el modelo es que sí es posible estimar los parametros, pero sus varianzas no son las mínimas, ya que éstas dependen de $Cov(e_{i}, e_{j}) \neq 0$, y  por lo tanto no son los mejores estimadores por Gauss-Markov. Esto también se debe a que los datos al ser temporales tienen varianzas que dependen del tiempo. Además, esto repercute en que los Intervalo de confianza serán amplios y las pruebas no serán _confiables_. Para arreglar esto, sugiere aplicar mínimos cuadrados generalizados, aumentar el tamaño de la muestra y utilizar técnicas propias para datos temporales. 


# Utilice el conjunto de datos seatpos del paquete faraway para encontrar el mejor modelo lineal que describa a la variable hipcenter. Compare este modelo con el modelo que incluye a todas las variables independientes del conjunto.

```{r, echo=FALSE}
#?seatpos #Car drivers like to adjust the seat position for their own comfort. Car designers would find it helpful to know where different drivers will position the seat depending on their size and age
bd7 <- seatpos
str(bd7)
summary(bd7)
```
La base de datos está compuesta por 9 variables, donde la variables **hipcenter** es la endógena y describe la "distancia horizontal del punto medio de la cadera desde una ubicación fija en el carro medida en milímetros" (Faraway, 2004). Todas son núméricas o de valores enteros. 

<!-- Las variables son ... y describen ... se muestra que tienen valores entre este y aquel... -->

A continuación se muestra un correlograma, donde se tacha a las correlaciones que no son significativas al 95% de confianza. Cabe destacar, a excepción de *age*, todas las variables están fuertemente correlacionadas con **hipcenter**, y también entre sí. Esto podría ser un indicio para excluir a la variable *age* del modelo de regresión, para que ajuste bien. 
```{r, include = TRUE, echo = FALSE, fig.pos = 'H', fig.dim = c(8,5), fig.align = "center", message=FALSE, fig.cap = 'Correlograma con significancia'}
#scale(frameBase$dp, center = T, scale = T) #si quisieramos agregar variable bd
par(mfrow=c(1,2))
cor_base <- cor(bd7, use="complete.obs")
cor.mtest <- function(mat, ...) {
    mat <- as.matrix(mat)
    n <- ncol(mat)
    p.mat<- matrix(NA, n, n)
    diag(p.mat) <- 0
    for (i in 1:(n - 1)) {
        for (j in (i + 1):n) {
            tmp <- cor.test(mat[, i], mat[, j], ...)
            p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
        }
    }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}
# matrix of the p-value of the correlation
p.mat <- cor.mtest(cor_base)
corrplot(cor_base, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45, p.mat = p.mat, sig.level = 0.05)
ggpairs(bd7)


```

```{r, echo=FALSE}

complet7 <- lm(hipcenter ~ . , data = bd7, x = T, y = T)

summary(complet7)

par(mfrow=c(2,2))
plot(complet7) #homoscedasticidad pedo

```
Luego de aplicar una regresión múltiple con todas las variables independientes, el modelo tiene un coeficiente de regresión bajo, y a excepción del intercepto, ningun coeficiente de regresión parcial es significativo. También, el rango de los resoduales recorre desde -73 hasta 62, lo que se puede considerar un amplio margen. Esto se podría deber a errores de especificación de las variables que describen el modelo.
Respecto a los supuestos, gráficamente parece haber independencia de residuales, y también cumplir laxamente la normalidad y homoscedasticidad. Sin embargo, sí hay outliers influyentes, el cuál es el punto 31, 35 y 23. Se procede a realizar pruebas para los anteriores supuestos.

```{r, echo=FALSE}

bptest(complet7)
dwtest(complet7)
```
El test con hipótesis nula No correlación no se rechaza, con un P valor de 0.244. La prueba de hipótesis nula de homscedasticidad no se rechaza, pero está en la frontera con un P valor de 0.08. Cabe recordar que este último problema se puede deber a outliers influyentes, errores de especificación, entre otros. 

Entonces, a continuación se procede a encontrar el mejor modelo. Cabe señalar que se debería de modela con respaldo de un experto de área, y este debería ser el principal criterio para crear modelos. Sin embargo, se procede a seleccionar el modelo a través de . . . 

```{r}

outs<-leaps(complet7$x, bd7$hipcenter, int=FALSE) #output: que V.A. incluye modelo, $labels son los variables, $size tamaño de modelos, $Cp
plot(outs$size,outs$Cp, log="y",cex=0.9)
lines(outs$size,outs$size)
text(outs$size, outs$Cp, labels=row(outs$which), cex=0.9, pos=2)
```   
El análisis con la Cp de Mallows impica que se seleccionará aquel número cuyo valor sea similar a la cantidad de parámetros del modelos, ya que $E(C_{p}) \approx  p$ . En este sentido, y según la gráfica, los modelos 12, 75,79,72,78 son los mejores para este criterio. 
# ```{r}
# #DATAFRAMe de Cp vs tamaño modelos, y comporarlos en una dataFrame
# outs$Cp[79]
# 
# outs$size[79]
# ``` 


```{r, echo=FALSE}
indicadores7<-ols_step_all_possible(complet7)
par(mfrow=c(2,3))
plot(indicadores7)
```

Por otra parte, es necesario comparar más que sólamente un indicador como la Cp de Mallow. Afortunadamente la anterior gráfica muestra comparaciones para diferentes índicadores (como la $R^2_{ajust}$, la Cp, o el criterio AIC). Es posible visualizar lo siguiente:

1. Cuando se tienen todos los parámetros (sin incluir $\beta_{0}$), el modelo "25" es el mejor. Ya que es el único. 

2. Cuando se tienen 7 párametros (sin incluir $\beta_{0}$), el mejor modelo es el "247". Esto lo afirman los criterios de Cp, R cuadrada ajustada y el criterio AIC. Este modelo está integrado por las variables: Age, Weight, HtShoes, Arm, Thigh, Leg.

3. Al poseer 6 párametro  (sin incluir $\beta_{0}$), el modelo "219", el mejor según los criterios R cuadrada ajustada y el criterio AIC. Este modelo está integrado por las variables: Age, HtShoes, Seated, Arm, Thigh, Leg.

4. Al poseer 5 párametro  (sin incluir $\beta_{0}$), el modelo "163", el mejor según los criterios R cuadrada ajustada y el criterio AIC. Este modelo está integrado por las variables: Age, HtShoes, Arm, Thigh, Leg.

Curiosamente, las variables Age, HtShoes, Arm, Thigh, Leg se mantienen en los 4 modelos anteriores.


```{r}
best7 <- regsubsets(hipcenter ~ . , data = bd7)
summary(best7)
plot(best7, scale = "r")
```
Tal como se indicó con el análisis de los indicadores, las variables: Age, HtShoes, Arm, Thigh, Leg también aparecen en el modelo de 5 coeficientes de regresión parcial   (sin incluir $\beta_{0}$). Sin embargo, si se buscara solamente 4 coeficientes, se podría excluir el $\beta_{arm}$, esto en función de los resultados brindados por el análisis con la función _regsubsets_.

```{r, echo=FALSE}
names(bd7)
mod74 <- lm(hipcenter ~ Age + HtShoes + Thigh + Leg, data = bd7)
summary(mod74)
# 
# mod75 <- lm(hipcenter ~ Age + HtShoes + Thigh + Leg + Arm, data = bd7)
# summary(mod75)
```
Al compara los modelos de cuatro y cincos variables sin "Arm", es evidente que el modelo de 4 variables, tiene un coeficiente de determinación ligeramente mayor, y en ambos casos sólamente $\beta_{0}$ es estadísticamente significativo. 
```{r}
par(mfrow=c(2,2))
plot(mod74)
names(bd7)
```

Esto aún puede deberse a que había outliers influyentes y a que el supuesto de homoscedasticidad esté en la _frontera_. Pero al graficar los supuestos, ya nose observan outliers. Y al realizar la prueba, ya el supuesto de homoscedasticidad ha mejorado con un P valor de 0.1265. 

```{r, echo=FALSE}
bptest(mod74)
dwtest(mod74)
```



```{r, echo=FALSE}
complet7
ols_step_forward_p(complet7) # , details = T

mod72 <- lm(hipcenter ~ Ht + Leg, data = bd7)

mod71 <- lm(hipcenter ~ Ht, data = bd7)

```
Se parte del modelo con una sóla variable explicativa: "Ht", con un$R^2 = 0.799$, y con un P valor de 0.051. Lo cuál es coherete con los modelos anteriores, donde Ht era seleccionado para modelos con menos de 3 variables independientes. 
Posteriomente, se incorpora la variables _Leg_, cabe destacar que el coeficiente de determinación ya converge al que se ha presentado previamente, pues $R^2_{adj} = 0.659$, desafortunadamente el significancia se va hasta 0.15. 
Luego, se agrega la variable Age. Pero en este punto las variablese ya no son significativas, y  el $R^2$ no supera el 0.68. Y así termina la modelación _fordward_.


```{r, echo=FALSE}
ols_step_backward_p(complet7) #details = T


```
Respecto al método "hacia atrás", la primer variable en ser eliminada es _Ht_. Cabe señalar, que ninguna de las variables independientes son estadísticamente significativas. 
Posteriormente se quitan las variables _Weight_ , _Seated_ , _Arm_, y _Thingh_ en ese órden. El valor de $R^2$ varía entre 0.61 a 0.65. Finalmente, el modelo seleccionado está integrado por Age, HtShoes, y Leg. Con un $R^2_{adj} = 0.65$

```{r}
mod73 <- lm(hipcenter ~ Age + HtShoes + Leg, data = bd7)
summary(mod73)

```
Se muestra que el modelo de tres variables: Age, HtShies y Leg, tiene un coeficiente de determinación de 0.6531. Y que sólamente la variables HtShoes es significativamente al 90%. Además, si se verifican los residuales, se puede evidenciar que el rango recorre desde -79 hasta 60, lo cuál se puede considerar un rango amplio. 

```{r}
par(mfrow=c(2,2))
plot(mod73)
```
Al comprobar gráficamente los supuestos, no aparecen outliers que sean influyentes, y parece que los tres supuestos restantes se cumplen someramente bien. 

```{r, echo=FALSE}
Rajustada7 <- c(0.6001, 0.6467, 0.6531, 0.6399)
Aic7compl <-AIC(complet7, mod73, mod74, mod72)

resumen7 <- data.frame(Indicador = c("R Ajustada", "AIC"),
            ModeloCompleto = c(Rajustada7[1] , Aic7compl$AIC[1]), 
           Modelo4variables = c(Rajustada7[2], Aic7compl$AIC[2]),
           Modelo3variables = c(Rajustada7[3], Aic7compl$AIC[3]),
           Modelo2varialbes = c(Rajustada7[4], Aic7compl$AIC[4])
)

kbl(resumen7, booktabs = T, align = "c", caption = "Comparación modelos con R ajustada y AIC")  %>%
  collapse_rows(columns = 1:3, latex_hline = "major", valign = "middle") %>%
  kable_styling(position = "center", latex_options = c("repeat_header", "hold_position"),
                font_size = 17) %>% landscape()



```

Finalmente, es posible arguir que el modelo de tres variables es el que presenta mejores indicadores. Ya tiene el coeficiente de determinación más alto, y el un punto más alto que los modelos con 2 y 4 variables. Asimismo, los modelos reducidos no cuentan con los problema de outliers influyentes ni de homoscedasticidad en la frontera del P value. Sin embargo,  se evidenció que en ningún modelo, las variables son estadísticamente significativas al 95%. Esto se puede deber a falta de especificación, es decir que ninguna variables describe de forma correcta a  _hipcenter_. Además, se mostró que los residuales tienen un amplio rango. Entonces, se sugiere que haya un especialista de área que oriente la formulación del modelo. 


