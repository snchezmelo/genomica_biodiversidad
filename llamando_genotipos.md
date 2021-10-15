
# Table of Contents

1.  [Motivación](#orga05cae8)
2.  [Sub-muestreando los alineamientos](#org65830ac)
    1.  [Extrayendo una región específica de los alineamientos](#org11c07ee)
3.  [Llamando genotipos](#org352deab)
    1.  [Verosimilitudes de genotipos](#orgedafec6)
    2.  [Llamada de genotipos](#org85c6cc0)
4.  [Operaciones con archivos VCF/BCF](#orgecc355c)
    1.  [El formato VCF](#org2b0db65)
    2.  [Qué veo en mi archivo de resultados?](#org069406f)
    3.  [Extrayendo información](#orgc21e30c)
    4.  [Tipos de variantes](#org0e875e8)
    5.  [Filtrando sitios](#org48fea13)



<a id="orga05cae8"></a>

# TODO Motivación


<a id="org65830ac"></a>

# TODO Sub-muestreando los alineamientos


<a id="org11c07ee"></a>

## TODO Extrayendo una región específica de los alineamientos

-   [ ] En algunos casos estaremos interesados en extraer regiones específicas
    del genoma en lugar de analizarlo completamente. En particular, en nuestro
    curso queremos trabajar con algunos segmentos del genoma de *Heliconius*
    por motivos prácticos; analizarlo todo nos tomaría mucho tiempo, aún con
    pocas muestras. Para trabajar con una región específica del genoma
    aprenderemos a extraer regiones de nuestro alineamiento. Esto debemos
    hacerlo muestra por muestra. Usaremos `samtools` para esta tarea.
-   [ ] Recursos computacionales: 2 procesadores, 2 GB de memoria, ~5 min de
    tiempo de ejecución
-   [ ] Crea un script de `bash` usando `nano` y solicita los recursos
    necesarios. No olvides cargar el módulo de `samtools`.


<a id="org352deab"></a>

# TODO Llamando genotipos


<a id="orgedafec6"></a>

## TODO Verosimilitudes de genotipos


<a id="org85c6cc0"></a>

## TODO Llamada de genotipos

-   [ ] Inferencia de alelos:
-   [ ] Recursos computacionales: 2 procesadores, 8 GB de memoria, 20-25 min de
    tiempo total de ejecución
-   [ ] 


<a id="orgecc355c"></a>

# TODO Operaciones con archivos VCF/BCF


<a id="org2b0db65"></a>

## TODO El formato VCF


<a id="org069406f"></a>

## TODO Qué veo en mi archivo de resultados?


<a id="orgc21e30c"></a>

## TODO Extrayendo información


<a id="org0e875e8"></a>

## TODO Tipos de variantes


<a id="org48fea13"></a>

## TODO Filtrando sitios

Usaremos [`vcftools`](https://vcftools.github.io/man_latest.html) para filtrar. Existen otras herramientas disponibles para
hacer esto, como `bcftools` o `GATK`. `vcftools` es razonablemente simple y
nos permite calcular algunas estadísticas sobre nuestras muestras para
decidir qué filtros aplicar. Podemos visualizar estas estadísticas en `R`
para facilitar el análisis. Recursos computacionales: 2 procesadores, 2 GB de
memoria, 30 min de tiempo total de ejecución (aprox.).

-   [ ] Preparando el análisis por sitios
-   [ ] Calculando frecuencias alélicas
-   [ ] Calculando profundidad promedio de secuenciación por individuo
-   [ ] Calculando profundidad promedio de secuenciación por sitio
-   [ ] Calculando calidad de inferencia de alelos (`QUAL`)
-   [ ] 

-   [ ] Visualizando la distribución de estadísticas en `R`
    
        # cargamos el paquete ggplot2
        library(ggplot2)

