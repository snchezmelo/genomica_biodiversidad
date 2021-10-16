author: Juan Enciso
title: LLamando genotipos

# <span class="todo TODO">TODO</span> Motivación [motivación]

# <span class="todo TODO">TODO</span> Sub-muestreando los alineamientos [sub-muestreando-los-alineamientos]

## <span class="todo TODO">TODO</span> Extrayendo una región específica de los alineamientos [extrayendo-una-región-específica-de-los-alineamientos]

-   ☐ En algunos casos estaremos interesados en extraer regiones
    específicas del genoma en lugar de analizarlo completamente. En
    particular, en nuestro curso queremos trabajar con algunos segmentos
    del genoma de *Heliconius* por motivos prácticos; analizarlo todo
    nos tomaría mucho tiempo, aún con pocas muestras. Para trabajar con
    una región específica del genoma aprenderemos a extraer regiones de
    nuestro alineamiento. Esto debemos hacerlo muestra por muestra.
    Usaremos `samtools` para esta tarea.
-   ☐ Recursos computacionales: 2 procesadores, 2 GB de memoria, \~5 min
    de tiempo de ejecución
-   ☐ Crea un script de `bash` usando `nano` y solicita los recursos
    necesarios. No olvides cargar el módulo de `samtools`.

# <span class="todo TODO">TODO</span> Llamando genotipos [llamando-genotipos-1]

## <span class="todo TODO">TODO</span> Verosimilitudes de genotipos [verosimilitudes-de-genotipos]

## <span class="todo TODO">TODO</span> Llamada de genotipos [llamada-de-genotipos]

-   ☐ Inferencia de alelos:
-   ☐ Recursos computacionales: 2 procesadores, 8 GB de memoria, 20-25
    min de tiempo total de ejecución
-   ☐

# <span class="todo TODO">TODO</span> Operaciones con archivos VCF/BCF [operaciones-con-archivos-vcfbcf]

## <span class="todo TODO">TODO</span> El formato VCF [el-formato-vcf]

## <span class="todo TODO">TODO</span> Qué veo en mi archivo de resultados? [qué-veo-en-mi-archivo-de-resultados]

## <span class="todo TODO">TODO</span> Extrayendo información [extrayendo-información]

## <span class="todo TODO">TODO</span> Tipos de variantes [tipos-de-variantes]

## <span class="todo TODO">TODO</span> Filtrando sitios [filtrando-sitios]

Usaremos [`vcftools`](https://vcftools.github.io/man_latest.html) para
filtrar. Existen otras herramientas disponibles para hacer esto, como
`bcftools` o `GATK`. `vcftools` es razonablemente simple y nos permite
calcular algunas estadísticas sobre nuestras muestras para decidir qué
filtros aplicar. Podemos visualizar estas estadísticas en `R` para
facilitar el análisis. Recursos computacionales: 2 procesadores, 2 GB de
memoria, 30 min de tiempo total de ejecución (aprox.).

### <span class="todo TODO">TODO</span> Calculando estadísticas en el set de datos [calculando-estadísticas-en-el-set-de-datos]

-   ☐ **Preparando el análisis por sitios:** Es necesario modificar
    nuestro archivo de genotipos para poder aplicar filtros
    correctamente y hacer análisis posteriores de forma correcta; la
    mayoría de análisis y modelos en genética de poblaciones están
    diseñados considerando individualmente sitios con dos alelos.

    ``` shell
    ```

-   ☐ **Calculando frecuencias alélicas:**

    ``` shell
    vcftools --gzvcf heliconius.optixscaf.GT.vcf.gz --freq2 \
             --out heliconius.optixscaf.2 --max-alleles 2
    ```

-   ☐ **Calculando profundidad promedio de secuenciación por
    individuo:**

-   ☐ **Calculando profundidad promedio de secuenciación por sitio:**

-   ☐ **Calculando calidad de inferencia de alelos (`QUAL`):**

-   ☐ **Calculando la proporción de datos perdidos por individuo:**

-   ☐ **Calculando la proporción de datos perdidos por sitio:**

### <span class="todo TODO">TODO</span> Analizando las estadísticas [analizando-las-estadísticas]

-   ☐ Visualizando la distribución de estadísticas en `R`

    ``` r
    ### cargamos el paquete ggplot2
    library(ggplot2)

    ### opcionalmente si tienes instalado tidyverse
    library(tidyverse)
    ```

-   ☐ **Estadísticas por sitio: Calidad de inferencia de alelos**

    ``` r
    ```

-   ☐ **Estadísticas por sitio: Profundidad promedio**

    ``` r
    ```

-   ☐ **Estadísticas por sitio: Datos perdidos**

    ``` r
    ```

-   ☐ **Estadísticas por sitio: Límite inferior para frecuencias
    alélicas**

    ``` r
    ```

-   ☐ **Estadísticas por individuo: Profundidad promedio**

    ``` r
    ```

-   ☐ **Estadísticas por individuo: Datos perdidos**

    ``` r
    ```

### <span class="todo TODO">TODO</span> Aplicando los filtros al VCF [aplicando-los-filtros-al-vcf]

-   ☐
-   ☐
-   ☐
