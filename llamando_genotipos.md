# <span class="todo TODO">TODO</span> Motivación

# <span class="todo TODO">TODO</span> Sub-muestreando los alineamientos

## <span class="todo TODO">TODO</span> Extrayendo una región específica de los alineamientos

Recursos computacionales: 2 procesadores, 2 GB de memoria, \~5 min de
tiempo de ejecución.

En algunos casos estaremos interesados en extraer regiones específicas
del genoma en lugar de analizarlo completamente. En particular, en
nuestro curso queremos trabajar con algunos segmentos del genoma de
*Heliconius* por motivos prácticos; analizarlo todo nos tomaría mucho
tiempo, aún con pocas muestras y además conocemos regiones en donde hay
genes interesantes. Para trabajar con una región específica del genoma
aprenderemos a extraer regiones de nuestro alineamiento. Esto debemos
hacerlo <u>muestra por muestra</u>. Usaremos `samtools` para esta tarea.

-   [ ] Crea un script de `bash` usando `nano` y solicita los recursos
    necesarios. No olvides cargar el módulo de `samtools`.

-   [ ] Dentro del script crea un ciclo `for` que itere sobre los
    alineamientos `.bam` que ya están ordenados y sin duplicados. Si no
    recuerdas cómo escribir un ciclo `for` en `bash` puedes consultarlo
    aquí &lt;INSERTAR LINK&gt;.

-   [ ] En cada iteración del ciclo debes llamar a `samtools view` con
    dos procesadores usando la opción `-@`. Debes usar la opción `-b`
    para que el archivo de salida tenga formato `bam` y debes
    especificar el nombre del archivo de salida usando la opción `-o`.
    Como argumentos para `samtools
          view` debes incluir primero el nombre del archivo `bam`
    original del que quieres extraer la región y luego debes especificar
    el nombre de la región que quieres extraer: La región que
    extraeremos corresponde al primer millón y medio de bases del
    scaffold `Hmel218003o` y la especificamos así:
    `Hmel218003o:1-1500000`. Dale una extensión informativa a cada
    archivo de salida: Estamos extrayendo parte del scaffold
    `Hmel218003o`; te sugerimos usar `C18S3` como parte del nombre de
    los archivos resultantes.

    Recuerda que la forma general de usar `samtools view` es:

    ``` shell
    # Los argumentos dentro de los parentesis cuadrados [] son opcionales
    # Los argumentos dentro de los angulos <> son obligatorios
    samtools view [options] <in.bam>|<in.sam>|<in.cram> [region ...]
    ```

-   [ ] Dentro del ciclo `for`, después de extraer la región de interés
    es necesario crear un índice para cada archivo de salida. Recuerda
    que esto puedes hacerlo usando `samtools index`.

    La forma general de usar `samtools index es`:

    ``` shell
    # Los argumentos dentro de los parentesis cuadrados [] son opcionales
    # los argumentos dentro de los angulos <> son obligatorios
    samtools index [-@ threads] <in.bam>
    ```

# <span class="todo TODO">TODO</span> Llamando genotipos

## <span class="todo TODO">TODO</span> Verosimilitudes de genotipos

## <span class="todo TODO">TODO</span> Llamada de genotipos

-   [ ] Inferencia de alelos:
-   [ ] Recursos computacionales: 2 procesadores, 8 GB de memoria, 20-25
    min de tiempo total de ejecución
-   [ ]

# <span class="todo TODO">TODO</span> Operaciones con archivos VCF/BCF

## <span class="todo TODO">TODO</span> El formato VCF

## <span class="todo TODO">TODO</span> Qué veo en mi archivo de resultados?

## <span class="todo TODO">TODO</span> Extrayendo información

## <span class="todo TODO">TODO</span> Tipos de variantes

## <span class="todo TODO">TODO</span> Filtrando sitios

Usaremos [`vcftools`](https://vcftools.github.io/man_latest.html) para
filtrar. Existen otras herramientas disponibles para hacer esto, como
`bcftools` o `GATK`. `vcftools` es razonablemente simple y nos permite
calcular algunas estadísticas sobre nuestras muestras para decidir qué
filtros aplicar. Podemos visualizar estas estadísticas en `R` para
facilitar el análisis. Recursos computacionales: 2 procesadores, 2 GB de
memoria, 30 min de tiempo total de ejecución (aprox.).

### <span class="todo TODO">TODO</span> Calculando estadísticas en el set de datos

-   [ ] **Preparando el análisis por sitios:** Es necesario modificar
    nuestro archivo de genotipos para poder aplicar filtros
    correctamente y hacer análisis posteriores de forma correcta; la
    mayoría de análisis y modelos en genética de poblaciones están
    diseñados considerando individualmente sitios con dos alelos.

    ``` shell
    ```

-   [ ] **Calculando frecuencias alélicas:**

    ``` shell
    vcftools --gzvcf heliconius.optixscaf.GT.vcf.gz --freq2 \
             --out heliconius.optixscaf.2 --max-alleles 2
    ```

-   [ ] **Calculando profundidad promedio de secuenciación por
    individuo:**

-   [ ] **Calculando profundidad promedio de secuenciación por sitio:**

-   [ ] **Calculando calidad de inferencia de alelos (`QUAL`):**

-   [ ] **Calculando la proporción de datos perdidos por individuo:**

-   [ ] **Calculando la proporción de datos perdidos por sitio:**

### <span class="todo TODO">TODO</span> Analizando las estadísticas

-   [ ] Visualizando la distribución de estadísticas en `R`

    ``` r
    ### cargamos el paquete ggplot2
    library(ggplot2)

    ### opcionalmente si tienes instalado tidyverse
    library(tidyverse)
    ```

-   [ ] **Estadísticas por sitio: Calidad de inferencia de alelos**

    ``` r
    ```

-   [ ] **Estadísticas por sitio: Profundidad promedio**

    ``` r
    ```

-   [ ] **Estadísticas por sitio: Datos perdidos**

    ``` r
    ```

-   [ ] **Estadísticas por sitio: Límite inferior para frecuencias
    alélicas**

    ``` r
    ```

-   [ ] **Estadísticas por individuo: Profundidad promedio**

    ``` r
    ```

-   [ ] **Estadísticas por individuo: Datos perdidos**

    ``` r
    ```

### <span class="todo TODO">TODO</span> Aplicando los filtros al VCF

-   [ ]
-   [ ]
-   [ ]
