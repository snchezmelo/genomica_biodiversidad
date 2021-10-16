<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
# Índice

- [<span class="todo TODO">TODO</span> Motivación](#span-classtodo-todotodospan-motivación)
- [Sub-muestreando los alineamientos](#sub-muestreando-los-alineamientos)
    - [Extrayendo una región específica de los alineamientos](#extrayendo-una-región-específica-de-los-alineamientos)
- [<span class="todo TODO">TODO</span> Llamando genotipos](#span-classtodo-todotodospan-llamando-genotipos)
    - [<span class="todo TODO">TODO</span> Verosimilitudes de genotipos](#span-classtodo-todotodospan-verosimilitudes-de-genotipos)
    - [<span class="todo TODO">TODO</span> Llamada de genotipos](#span-classtodo-todotodospan-llamada-de-genotipos)
- [<span class="todo TODO">TODO</span> Operaciones con archivos VCF/BCF](#span-classtodo-todotodospan-operaciones-con-archivos-vcfbcf)
    - [<span class="todo TODO">TODO</span> El formato VCF](#span-classtodo-todotodospan-el-formato-vcf)
    - [<span class="todo TODO">TODO</span> Qué veo en mi archivo de resultados?](#span-classtodo-todotodospan-qué-veo-en-mi-archivo-de-resultados)
    - [<span class="todo TODO">TODO</span> Extrayendo información](#span-classtodo-todotodospan-extrayendo-información)
    - [<span class="todo TODO">TODO</span> Tipos de variantes](#span-classtodo-todotodospan-tipos-de-variantes)
    - [<span class="todo TODO">TODO</span> Filtrando sitios](#span-classtodo-todotodospan-filtrando-sitios)
        - [<span class="todo TODO">TODO</span> Calculando estadísticas en el set de datos](#span-classtodo-todotodospan-calculando-estadísticas-en-el-set-de-datos)
        - [<span class="todo TODO">TODO</span> Analizando las estadísticas](#span-classtodo-todotodospan-analizando-las-estadísticas)
        - [<span class="todo TODO">TODO</span> Aplicando los filtros al VCF](#span-classtodo-todotodospan-aplicando-los-filtros-al-vcf)

<!-- markdown-toc end -->

# <span class="todo TODO">TODO</span> Motivación

# Sub-muestreando los alineamientos

## Extrayendo una región específica de los alineamientos

Recursos computacionales: 2 procesadores, 2 GB de memoria, \~10 min de
tiempo de ejecución.

En algunos casos estaremos interesados en extraer regiones específicas
del genoma en lugar de analizarlo completamente. En nuestro curso
particularmente queremos trabajar con algunos segmentos del genoma de
*Heliconius* por motivos prácticos; analizarlo todo nos tomaría mucho
tiempo aún con pocas muestras y además conocemos regiones en donde hay
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
    es necesario crear un índice para cada archivo de salida. Esto lo
    podemos hacer usando `samtools index`.

    La forma general de usar `samtools index es`:

    ``` shell
    # Los argumentos dentro de los parentesis cuadrados [] son opcionales
    # los argumentos dentro de los angulos <> son obligatorios
    samtools index [-@ threads] <in.bam>
    ```

-   [ ] **Atención!** Antes de enviar el trabajo a la cola muéstrale tu
    script a un monitor/instructor para verificar que no haya errores de
    sintáxis.

-   [ ] Envía el trabajo a la cola.

# <span class="todo TODO">TODO</span> Llamando genotipos

## <span class="todo TODO">TODO</span> Verosimilitudes de genotipos

## <span class="todo TODO">TODO</span> Llamada de genotipos

Recursos computacionales: 2 procesadores, 8 GB de memoria, \~20-25 min
de tiempo total de ejecución.

Vamos a hacer un paso conocido como "llamada de genotipos" usando los
alineamientos del scaffold `Hmel218003o` que extrajimos en la tarea
anterior. El resultado final será un archivo en el que cada base o
posición en el genoma aparece en una fila y cada una de nuestras
muestras aparece en una columna.

La estructura es similar a esta tabla, pero es un poco más compleja.
Luego veremos en detalle la estructura de este archivo.

| CHROM       | POS | Muestra1 | Muestra2 | Muestra3 | Muestra4 | …   |
|-------------|-----|----------|----------|----------|----------|-----|
| Hmel218003o | 1   | 0/0      | 0/1      | 0/0      | 1/1      | …   |
| Hmel218003o | 2   | 0/0      | 0/0      | 0/0      | 0/1      | …   |
| Hmel218003o | 3   | 0/1      | 0/1      | 0/1      | 0/1      | …   |
| Hmel218003o | 4   | 0/0      | 0/1      | 0/1      | 1/1      | …   |
| Hmel218003o | 5   | 0/1      | 0/1      | 0/1      | 1/1      | …   |
| Hmel218003o | 6   | 0/0      | 0/0      | 0/1      | 0/1      | …   |
| …           | …   | …        | …        | …        | …        | …   |

-   [ ]
-   [ ]
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
