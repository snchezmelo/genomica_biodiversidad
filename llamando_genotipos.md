---
bibliography: /home/juanenciso/MEGA/phd_thesis_juan/thesis_bibliography.bib
description: "Genómica de la biodiversidad: Llamando genotipos"
lang: es
title: Llamando y filtrando genotipos
---

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
Trabajaremos con el scaffold `Hmel218003o` de *Heliconius melpomene* que
contiene al gen *optix*.

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
    aquí \<INSERTAR LINK>.

3.  En cada iteración del ciclo debes llamar a `samtools view` con dos
    procesadores usando la opción `-@`. Debes usar la opción `-b` para
    que el archivo de salida tenga formato `bam` y debes especificar el
    nombre del archivo de salida usando la opción `-o`. Como argumentos
    para `samtools
            view` debes incluir primero el nombre del archivo `bam`
    original del que quieres extraer la región y luego debes especificar
    el nombre de la región que quieres extraer: La región que
    extraeremos corresponde al primer millón y medio de bases del
    scaffold `Hmel218003o` y la especificamos así:
    `Hmel218003o:1-1500000`. Dale una extensión informativa a cada
    archivo de salida: Estamos extrayendo parte del scaffold
    `Hmel218003o`; te sugerimos usar `C18S3` como parte del nombre de
    los archivos resultantes.

    La forma general de usar `samtools view` es:

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
    sintáxis. Muéstrale también la línea que usarás para enviar el
    trabajo a la cola.

6.  Envía el trabajo a la cola. Asegúrate de enviar el trabajo desde el
    directorio donde están tus archivos de entrada.

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
llama o no a un genotipo determinado. Las diferentes herramientas y
modelos tienen efectos fuertes sobre los datos que se producirán, por lo
que es importante considerar las diferentes opciones de antemano. [Este
review en Nature Genetics
(2011)](https://www.nature.com/articles/nrg2986) es un buen punto de
partida para conocer las distintas perspectivas y recomendaciones al
hacer este paso.

En este caso usaremos
[`bcftools`](https://samtools.github.io/bcftools/bcftools.html), que es
parte de `samtools`, por su simplicidad de uso y velocidad de ejecución.
En general, independientemente de la herramienta utilizada este es el
paso más largo de todo el proceso, por eso trabajaremos con una región
pequeña.

**Sigue los pasos:**

1.  Llamar genotipos con `bcftools` y otras herramientas es un proceso
    que da mejores resultados cuando se consideran los individuos <u>en
    conjunto</u>. Lo primero que debemos hacer es poner en un archivo de
    texto plano la lista de alineamientos de la región `Hmel218003o`.
    Recuerda que cada alineamiento corresponde a un individuo; tu lista
    debe tener los nombres de los alineamientos de las 18 muestras.
    ¿Cómo creas este archivo con la lista de muestras?

2.  Crea un script de `bash` usando `nano` y solicita los recursos
    necesarios. No olvides cargar el módulo de `samtools`.

3.  Tu script debe recibir y procesar la siguiente información (3
    argumentos como mínimo):

    -   El archivo con la lista de alineamientos que creaste en el paso
        1

    -   La ubicación del archivo `fasta` de referencia (ruta absoluta)

    -   El nombre del archivo de salida que quieres darle a tu `vcf` con
        los genotipos. No olvides que vamos a escribir un `vcf`
        comprimido (`.vcf.gz`).

4.  Dentro de este script haremos tres pasos: <u>El primer paso</u>
    consiste en calcular las verosimilitudes de los genotipos a partir
    de los datos observados en el alineamiento. Para este paso usamos
    [`bcftools mpileup`](https://samtools.github.io/bcftools/bcftools.html#mpileup).
    Lee la descripción de las opciones de este programa en el enlace.
    Las opciones relevantes para nuestro análisis son: `-O`,
    `--threads`, `--max-depth`, `-q`, `-Q`, `-P`, `-a`, `-f` y `-b`. Usa
    una profundidad máxima de 1000, umbrales de calidad de base y de
    mapeo de 20 y especifica que nuestros datos se produjeron en una
    plataforma Illumina. Dedícale un poco más de atención a la opción
    `-a`, que se usa para especificar con qué información estará anotado
    nuestro archivo `vcf`. Queremos incluir la profundidad alélica
    (`AP`) y el número de bases de alta calidad que dan soporte a cada
    sitio (`DP`). Revisa el manual de `bcftools mpileup` (opción `-a`)
    para conocer cómo especificar estas dos anotaciones.

    La forma general de usar `bcftools mpileup` es:

    ``` shell
    # Llamaremos de esta forma bcftools mpileup
    # Resaltamos dos piezas de informacion importantes:
    # La referencia y la lista de alineamientos
    bcftools mpileup [opciones] -f ref.fa -b lista_de_bams.txt
    ```

    La salida de `bcftools mpileup` la re-dirigiremos hacia
    `bcftools call` usando el operador "pipe" de unix. Recuerdas cómo
    usar este operador?

5.  <u>El segundo paso</u> utiliza las verosimilitudes calculadas por la
    herramienta `mpileup` y las bases observadas en cada posición del
    alineamiento para determinar el genotipo de cada individuo en esa
    posición. El resultado conjunto de estos dos primeros pasos se
    escribe en un archivo `vcf` comprimido con `gzip` (extensión
    `.vcf.gz`). Utilizamos
    [`bcftools call`](https://samtools.github.io/bcftools/bcftools.html#call)
    para este propósito. Lee la descripción de las opciones de este
    programa en el enlace. Las opciones relevantes para nuestro análisis
    son: `-m`, `--threads`, `-f`, `-O` y `-o`. Utiliza el "multiallelic
    caller", dos procesadores, calidad del genotipo (GQ) en el campo de
    formato para cada muestra y vcf comprimido como tipo de archivo de
    salida. Dale un nombre informativo a tu archivo de salida.

    La forma general de usar `bcftools call` es:

    ``` shell
    # No olvides conectar la salida estandar de mpileup
    # con este comando
    bcftools call [opciones] -o genotipos.vcf.gz
    ```

6.  Finalmente en <u>el tercer paso</u> generamos un índice del archivo
    `vcf.gz` para hacer operaciones de forma más rápida con él. Utiliza
    [`bcftools         index`](https://samtools.github.io/bcftools/bcftools.html#index)
    con dos procesadores para construir este índice. Si se ejecuta
    correctamente debería crearse un archivo con un nombre idéntico al
    creado en el paso anterior pero con la extensión `.csi` añadida al
    final; este archivo es el índice.

    La forma general de usar `bcftools index` es:

    ``` shell
    # Sintaxis para construir un indice con bcftools
    # como archivo de entrada puedes tener formatos vcf o bcf
    bcftools index [opciones] genotipos.vcf.gz|genotipos.bcf
    ```

7.  **Atención!** Antes de enviar el trabajo a la cola muéstrale tu
    script a un monitor/instructor para verificar que no haya errores de
    sintáxis. Muéstrale también la línea que usarás para enviar el
    trabajo a la cola.

8.  Envía el trabajo a la cola. Asegúrate de enviar el trabajo desde el
    directorio donde están tus archivos de entrada.

# <span class="todo TODO">TODO</span> Operaciones con archivos VCF/BCF

## <span class="todo TODO">TODO</span> El formato VCF

## <span class="todo TODO">TODO</span> Qué veo en mi archivo VCF de genotipos?

## <span class="todo TODO">TODO</span> Extrayendo información

Es posible utilizar las herramientas de unix que hemos aprendido a usar
para explorar la información de un archivo `vcf`. Podemos incluso
explorar nuestro archivo sin necesidad de descomprimirlo (recuerda que
es un vcf comprimido). Explora el archivo usando las herramientas que
consideres necesarias y trata de **no** descomprimirlo usando `gunzip`.

**Responde a las preguntas:**

1.  Cuántas líneas tiene mi archivo de genotipos en total?
2.  Cuántas líneas tiene el encabezado?
3.  Cuántas líneas tiene el cuerpo principal?
4.  Si la región que extrajimos del scaffold `Hmel218003o` tiene 1500000
    pares de bases, por qué el cuerpo principal tiene más posiciones?
5.  Todas las posiciones que extrajimos del scaffold `Hmel218003o` están
    representadas?

## <span class="todo TODO">TODO</span> Tipos de variantes

Cuando genotipificamos podemos encontrar esencialmente tres tipos de
sitios: Sitios sin variación con respecto a la referencia, sitios con
variación simple (SNPs) o sitios que potencialmente pueden tener
mutaciones estructurales como inserciones o deleciones (INDELS).
Exploremos nuestro archivo para tener una mejor idea de cómo pueden
verse estas variantes.

**Responde a las preguntas:**

1.  Qué tipo de variante observamos en la posición 281946 del scaffold
    `Hmel218003o`?
2.  Cuál es el alelo encontrado en la referencia?
3.  Cuál es el alelo alternativo encontrado en algunas de las muestras?
4.  Cuáles muestras tienen el alelo alternativo en esta posición?
5.  Cuántas muestras no tienen genotipo en esta posición?
6.  Cuántos indels hay en el archivo de genotipos?

## <span class="todo TODO">TODO</span> Filtrando sitios

Recursos computacionales: 2 procesadores, 2 GB de memoria, \~30 min de
tiempo total de ejecución.

Usaremos [`vcftools`](https://vcftools.github.io/man_latest.html) para
filtrar. Existen otras herramientas disponibles para hacer esto, como
`bcftools` o `GATK`. `vcftools` es razonablemente simple y nos permite
calcular algunas estadísticas sobre nuestras muestras para decidir qué
filtros aplicar. Podemos visualizar estas estadísticas en `R` para
facilitar el análisis.

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
