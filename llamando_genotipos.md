# <span class="todo TODO">TODO</span> Motivación

# Sub-muestreando los alineamientos

## Extrayendo una región específica de los alineamientos

Recursos computacionales: 2 procesadores, 2 GB de memoria, \~10 min de
tiempo de ejecución.

En algunos casos estaremos interesados en extraer regiones específicas
del genoma en lugar de analizarlo completamente. En nuestro curso
particularmente queremos trabajar con algunos segmentos del genoma de
*Heliconius* por motivos prácticos; analizarlo todo nos tomaría mucho
tiempo aún con pocas muestras. Además, conocemos regiones en donde hay
genes interesantes. Para trabajar con una región específica del genoma
aprenderemos a extraer regiones de nuestro alineamiento. Esto debemos
hacerlo <u>muestra por muestra</u>. Usaremos `samtools` para esta tarea.
Trabajaremos con el scaffold `Hmel218003o` de *Heliconius melpomene*
cual contiene al gen *optix*.

![](./Imagenes/optix_scaf.png)

Este gen tiene un rol clave en la adaptación de *Heliconius* y otras
mariposas; puedes leer más sobre él en este [paper publicado en
*Science*
(2011)](https://www.science.org/doi/pdf/10.1126/science.1208227), en
esta [perspectiva
(2011)](https://www.science.org/doi/full/10.1126/science.1211025) o en
este [paper publicado en PNAS
(2017).](https://www.pnas.org/content/114/40/10707)

**Sigue los pasos:**

1.  Crea un script de `bash` usando `nano` y solicita los recursos
    necesarios. No olvides cargar el módulo de `samtools`.

2.  Dentro del script crea un ciclo `for` que itere sobre los
    alineamientos `.bam` que ya están ordenados y sin duplicados. Si no
    recuerdas cómo escribir un ciclo `for` en `bash` puedes consultarlo
    aquí &lt;INSERTAR LINK&gt;.

3.  En cada iteración del ciclo debes llamar a `samtools view` con dos
    procesadores usando la opción `-@`. Debes usar la opción `-b` para
    que el archivo de salida tenga formato `bam` y debes especificar el
    nombre del archivo de salida usando la opción `-o`. Como argumentos
    para `samtools
      view` debes incluir primero el nombre del archivo `bam` original
    del que quieres extraer la región y luego debes especificar el
    nombre de la región que quieres extraer: La región que extraeremos
    corresponde al primer millón y medio de bases del scaffold
    `Hmel218003o` y la especificamos así: `Hmel218003o:1-1500000`. Dale
    una extensión informativa a cada archivo de salida: Estamos
    extrayendo parte del scaffold `Hmel218003o`; te sugerimos usar
    `C18S3` como parte del nombre de los archivos resultantes.

    Recuerda que la forma general de usar `samtools view` es:

    ``` shell
    # Los argumentos dentro de los parentesis cuadrados [] son opcionales
    # Los argumentos dentro de los angulos <> son obligatorios
    samtools view [options] <in.bam>|<in.sam>|<in.cram> [region ...]
    ```

4.  Dentro del ciclo `for`, después de extraer la región de interés es
    necesario crear un índice para cada archivo de salida. Esto lo
    podemos hacer usando `samtools index`.

    La forma general de usar `samtools index es`:

    ``` shell
    # Los argumentos dentro de los parentesis cuadrados [] son opcionales
    # los argumentos dentro de los angulos <> son obligatorios
    samtools index [-@ threads] <in.bam>
    ```

5.  **Atención!** Antes de enviar el trabajo a la cola muéstrale tu
    script a un monitor/instructor para verificar que no haya errores de
    sintáxis.

6.  Envía el trabajo a la cola.

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

| CROMOSOMA   | POSICIÓN | REF. | ALT. | Muestra1 | Muestra2 | Muestra3 | Muestra4 | …   |
|-------------|----------|------|------|----------|----------|----------|----------|-----|
| Hmel218003o | 1        | A    | G    | 0/0      | 0/1      | 0/0      | 1/1      | …   |
| Hmel218003o | 2        | T    | G    | 0/0      | 0/0      | 0/0      | 0/1      | …   |
| Hmel218003o | 3        | G    | A    | 0/1      | 0/1      | 0/1      | 0/1      | …   |
| Hmel218003o | 4        | C    | A    | 0/0      | 0/1      | 0/1      | 1/1      | …   |
| Hmel218003o | 5        | C    | T    | 0/1      | 0/1      | 0/1      | 1/1      | …   |
| Hmel218003o | 6        | T    | C    | 0/0      | 0/0      | 0/1      | 0/1      | …   |
| …           | …        |      |      | …        | …        | …        | …        | …   |

Existen varias herramientas que pueden llamar genotipos, cada una tiene
ciertos estándares y modelos probabilísticos que usa para decidir si se
llama o no a un genotipo determinado.

Usaremos
[`bcftools`](https://samtools.github.io/bcftools/bcftools.html), que es
parte de `samtools`, por su simplicidad de uso y velocidad de ejecución.
En general, independientemente de la herramienta utilizada este es el
paso más largo de todo el proceso, por eso utilizamos una región
pequeña.

1.  
2.  

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

1.  **Preparando el análisis por sitios:** Es necesario modificar
    nuestro archivo de genotipos para poder aplicar filtros
    correctamente y hacer análisis posteriores de forma correcta; la
    mayoría de análisis y modelos en genética de poblaciones están
    diseñados considerando individualmente sitios con dos alelos.

    ``` shell
    ```

2.  **Calculando frecuencias alélicas:**

    ``` shell
    vcftools --gzvcf heliconius.optixscaf.GT.vcf.gz --freq2 \
             --out heliconius.optixscaf.2 --max-alleles 2
    ```

3.  **Calculando profundidad promedio de secuenciación por individuo:**

4.  **Calculando profundidad promedio de secuenciación por sitio:**

5.  **Calculando calidad de inferencia de alelos (`QUAL`):**

6.  **Calculando la proporción de datos perdidos por individuo:**

7.  **Calculando la proporción de datos perdidos por sitio:**

### <span class="todo TODO">TODO</span> Analizando las estadísticas

1.  Visualizando la distribución de estadísticas en `R`

    ``` r
    ### cargamos el paquete ggplot2
    library(ggplot2)

    ### opcionalmente si tienes instalado tidyverse
    library(tidyverse)
    ```

2.  **Estadísticas por sitio: Calidad de inferencia de alelos**

    ``` r
    ```

3.  **Estadísticas por sitio: Profundidad promedio**

    ``` r
    ```

4.  **Estadísticas por sitio: Datos perdidos**

    ``` r
    ```

5.  **Estadísticas por sitio: Límite inferior para frecuencias
    alélicas**

    ``` r
    ```

6.  **Estadísticas por individuo: Profundidad promedio**

    ``` r
    ```

7.  **Estadísticas por individuo: Datos perdidos**

    ``` r
    ```

### <span class="todo TODO">TODO</span> Aplicando los filtros al VCF

1.  
2.  
3.  
