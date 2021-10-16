
# Table of Contents

1.  [Motivación](#org29cdcdd)
2.  [Sub-muestreando los alineamientos](#org7440e35)
    1.  [Extrayendo una región específica de los alineamientos](#org8bb922e)
3.  [Llamando genotipos](#org4f3e09e)
    1.  [Verosimilitudes de genotipos](#orgbd5e473)
    2.  [Llamada de genotipos](#org979a028)
4.  [Operaciones con archivos VCF/BCF](#org86a714c)
    1.  [El formato VCF](#org9b5824f)
    2.  [Qué veo en mi archivo de resultados?](#org5372f4a)
    3.  [Extrayendo información](#org65a10c0)
    4.  [Tipos de variantes](#orga8ba934)
    5.  [Filtrando sitios](#org99c68e6)
        1.  [Calculando estadísticas en el set de datos](#org0e41642)
        2.  [Analizando las estadísticas](#org49a8987)
        3.  [Aplicando los filtros al VCF](#org80e6dd5)



<a id="org29cdcdd"></a>

# TODO Motivación


<a id="org7440e35"></a>

# TODO Sub-muestreando los alineamientos


<a id="org8bb922e"></a>

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


<a id="org4f3e09e"></a>

# TODO Llamando genotipos


<a id="orgbd5e473"></a>

## TODO Verosimilitudes de genotipos


<a id="org979a028"></a>

## TODO Llamada de genotipos

-   [ ] Inferencia de alelos:
-   [ ] Recursos computacionales: 2 procesadores, 8 GB de memoria, 20-25 min de
    tiempo total de ejecución
-   [ ] 


<a id="org86a714c"></a>

# TODO Operaciones con archivos VCF/BCF


<a id="org9b5824f"></a>

## TODO El formato VCF


<a id="org5372f4a"></a>

## TODO Qué veo en mi archivo de resultados?


<a id="org65a10c0"></a>

## TODO Extrayendo información


<a id="orga8ba934"></a>

## TODO Tipos de variantes


<a id="org99c68e6"></a>

## TODO Filtrando sitios

Usaremos [`vcftools`](https://vcftools.github.io/man_latest.html) para filtrar. Existen otras herramientas disponibles para
hacer esto, como `bcftools` o `GATK`. `vcftools` es razonablemente simple y
nos permite calcular algunas estadísticas sobre nuestras muestras para
decidir qué filtros aplicar. Podemos visualizar estas estadísticas en `R`
para facilitar el análisis. Recursos computacionales: 2 procesadores, 2 GB de
memoria, 30 min de tiempo total de ejecución (aprox.).


<a id="org0e41642"></a>

### TODO Calculando estadísticas en el set de datos

-   [ ] **Preparando el análisis por sitios:** Es necesario modificar nuestro
    archivo de genotipos para poder aplicar filtros correctamente y hacer
    análisis posteriores de forma correcta; la mayoría de análisis y modelos
    en genética de poblaciones están diseñados considerando individualmente
    sitios con dos alelos.

-   [ ] **Calculando frecuencias alélicas:**
    
        vcftools --gzvcf heliconius.optixscaf.GT.vcf.gz --freq2 \
                 --out heliconius.optixscaf.2 --max-alleles 2
-   [ ] **Calculando profundidad promedio de secuenciación por individuo:**
-   [ ] **Calculando profundidad promedio de secuenciación por sitio:**
-   [ ] **Calculando calidad de inferencia de alelos (`QUAL`):**
-   [ ] **Calculando la proporción de datos perdidos por individuo:**
-   [ ] **Calculando la proporción de datos perdidos por sitio:**


<a id="org49a8987"></a>

### TODO Analizando las estadísticas

-   [ ] Visualizando la distribución de estadísticas en `R`
    
        ### cargamos el paquete ggplot2
        library(ggplot2)
        
        ### opcionalmente si tienes instalado tidyverse
        library(tidyverse)

-   [ ] **Estadísticas por sitio: Calidad de inferencia de alelos**

-   [ ] **Estadísticas por sitio: Profundidad promedio**

-   [ ] **Estadísticas por sitio: Datos perdidos**

-   [ ] **Estadísticas por sitio: Límite inferior para frecuencias alélicas**

-   [ ] **Estadísticas por individuo: Profundidad promedio**

-   [ ] **Estadísticas por individuo: Datos perdidos**


<a id="org80e6dd5"></a>

### TODO Aplicando los filtros al VCF

-   [ ] 

-   [ ] 

-   [ ] 

