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

## Llamada de genotipos

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

Descripción del formato VCF.

## Extrayendo información

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

## Tipos de variantes

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
7.  Cómo harías para encontrar qué sitios tienen SNPs y qué sitios son
    invariantes?

## <span class="todo TODO">TODO</span> Filtrando sitios

Recursos computacionales: 2 procesadores, 2 GB de memoria, \~30 min de
tiempo total de ejecución.

Usaremos [`vcftools`](https://vcftools.github.io/man_latest.html) para
filtrar. Existen otras herramientas disponibles para hacer esto, como
`bcftools` o `GATK`. `vcftools` es razonablemente simple y nos permite
calcular algunas estadísticas sobre nuestras muestras para decidir qué
filtros aplicar. Podemos visualizar estas estadísticas en `R` para
facilitar el análisis.

### Calculando estadísticas en nuestros genotipos

1.  **Preparando el análisis por sitios:** Es necesario modificar
    nuestro archivo de genotipos para poder aplicar filtros
    correctamente y hacer análisis posteriores de forma correcta; la
    mayoría de análisis y modelos en genética de poblaciones están
    diseñados considerando individualmente sitios con dos alelos
    (bialélicos). Debemos entonces quitar los indels y los sitios con
    más de dos alelos de nuestro archivo `vcf`. Para quitar los indels
    usamos la opción `--remove-indels`. Para quedarnos con sitios con
    uno o dos alelos usamos la opción `--max-alleles`. La opción
    `--recode` se usa para tener información de salida en formato `vcf`.
    La opción `--recode-INFO-all` se usa para mantener el encabezado del
    vcf original y la opción `--out` se usa para darle un pre-fijo al
    nombre del archivo de salida. `vcftools` escribe un archivo sin
    comprimir, cuando tengas el resultado en un vcf comprímelo con
    `gzip`.

    La forma general de usar `vcftools` es la siguiente:

    ``` shell
    # Consulta los ejemplos en el manual de vcftools para que
    # tengas mas claridad de la sintaxis que usaras
    vcftools [--vcf ARCHIVO | --gzvcf ARCHIVO | --bcf ARCHIVO] \
             [--out PREFIJO] [OPCIONES DE FILTRO] [OPCIONES DE SALIDA]
    ```

    Puedes correr `vcftools` en una sesión interactiva de slurm,
    recuerda solicitar la sesión interactiva con `salloc`.

    **Atención:** Muéstrale tus líneas de comando a un monitor o
    instructor antes de correrlas.

    Si corriste `vcftools` correctamente debes observar algo parecido a
    esto:

    ``` shell
    VCFtools - 0.1.16
    (C) Adam Auton and Anthony Marcketta 2009

    Parameters as interpreted:
    ...

    Using zlib version: 1.2.11
    Warning: Expected at least 2 parts in INFO entry: ...
    Warning: Expected at least 2 parts in INFO entry: ...
    Warning: Expected at least 2 parts in INFO entry: ...
    After filtering, kept 18 out of 18 Individuals
    Outputting VCF file...
    After filtering, kept 1454897 out of a possible 1502460 Sites
    Run Time = 31.00 seconds
    ```

2.  **Contando alelos:**

    El primer criterio que usaremos para filtrar algunos sitios es el
    número de alelos que observamos en ellos. Si el número de individuos
    con alelos en un sitio es muy bajo, y si hay alelos "raros" en un
    sitio, podríamos tener efectos negativos en nuestros análisis
    posteriores. En parte esto se debe a que muchos de los modelos y
    análisis disponibles son sensibles a la presencia de variantes raras
    (presentes en baja frecuencia).

    Usaremos nuestro archivo con sitios invariantes y bi-alélicos para
    calcular los conteos de alelos por sitio. Llama a `vcftools` usando
    la opción `--counts2` para contar los alelos por sitio. No olvides
    especificar un prefijo para el nombre de salida (`--out`). El
    archivo de salida debe tener la extensión `.frq.count` (`vcftools`
    pone la extensión automáticamente).

    Abre el archivo resultante usando `less`, deberías ver algo como
    esto:

    ``` shell
    CHROM   POS     N_ALLELES       N_CHR   {COUNT}
    Hmel218003o     133     1       0       0
    Hmel218003o     134     1       2       2
    Hmel218003o     135     1       2       2
    Hmel218003o     136     1       2       2
    Hmel218003o     137     1       2       2
    ```

    Si te fijas, algunas filas tienen 6 elementos y otras tienen 5 ¿Por
    qué pasa esto? Revisa atentamente el archivo y trata de responder a
    la pregunta.

    Para trabajar con un archivo como este en `R` es más sencillo tener
    el mismo número de columnas en todas las filas. Las filas con 5
    columnas solo tienen el conteo del alelo de referencia y no del
    alelo alterno, ese conteo es de 0 (¿Por qué?) y debemos agregarlo
    por nuestra cuenta.

    Usaremos el lenguaje
    [`awk`](https://www.gnu.org/software/gawk/manual/gawk.html) para
    hacer esta tarea. `awk` procesa el archivo línea por línea y permite
    explorar varias propiedades de cada línea. El razonamiento es el
    siguiente: Si una línea tiene menos de 6 columnas (`NF`) entonces
    debemos imprimir la línea original ($0) y adjuntar un 0 al final (el
    número de alelos alternos en el sitio), separado por un caracter de
    tabulación `"\t"`. En caso contrario imprimimos la línea original
    (`$0`).

    El razonamiento anterior se captura en la siguiente línea de comando
    usando `awk`. Asegúrate de que entiendes la línea antes de
    ejecutarla. Si tienes dudas pide aclaraciones al personal docente o
    a tus compañeros de curso.

    ``` shell
    # Sintaxis:
    # awk 'codigo de awk' archivo
    awk '{if(NF < 6){print $0 "\t" 0} else {print $0}}' archivo.conteos
    ```

    Reemplaza el nombre `archivo.conteos` por el nombre de tu archivo.
    El resultado de la operación va a la salida estandar, re-dirígelo a
    un nuevo archivo con un nombre informativo; en mi caso el nuevo
    archivo se llama `heliconius.optixscaf.conteofull`.

    Finalmente debemos editar el encabezado para que sea leido
    correctamente por `R`. Abre el archivo con `nano` y cambia el nombre
    de la columna `{COUNT}` por `CONTEO_REF` y el `0` que aparece como
    nombre de la última columna por `CONTEO_ALT`.

    <u>Antes:</u>

    ``` shell
    CHROM  POS N_ALLELES   N_CHR   {COUNT} 0
    Hmel218003o    133 1   0   0   0
    Hmel218003o    134 1   2   2   0
    Hmel218003o    135 1   2   2   0
    ```

    <u>Después:</u>

    ``` shell
    CHROM  POS N_ALLELES   N_CHR   CONTEO_REF  CONTEO_ALT
    Hmel218003o    133 1   0   0   0
    Hmel218003o    134 1   2   2   0
    Hmel218003o    135 1   2   2   0
    ```

3.  **Calculando profundidad promedio de secuenciación por individuo:**

    La profundidad de sencuenciación es importante pues ayuda a informar
    los soportes estadísticos para llamar determinados alelos. En
    general, se considera que los datos soportados por profundidades
    bajas tienen un mayor nivel de incertidumbre que aquellos en donde
    la profundidad es mayor.

    A nivel de individuo la profundidad también tiene un efecto sobre la
    calidad de los análisis: Si un individuo tiene profundidad muy baja
    a lo largo de todo su genoma puede afectar las estadísticas de todo
    el set de datos y sería preferible excluirlo.

    Llama a `vcftools` usando la opción `--depth` para calcular la
    profundidad promedio por individuo. No olvides especificar un
    prefijo para el nombre de salida (`--out`). El archivo de salida
    debe tener la extensión `.idepth`. Para estos datos debemos ver
    valores entre 18 y 37 de profundidad aproximadamente.

4.  **Calculando profundidad promedio de secuenciación por sitio:**

    A nivel de sitio el efecto de la profundidad baja no es muy
    diferente: Si un sitio tiene baja profundidad de cobertura es más
    difícil confiar en los alelos presentes en ese sitio. También es
    recomendable remover sitios con baja profundidad de secuenciación.

    Calculamos la profundidad por sitio usando la opción
    `--site-mean-depth`. El archivo de salida debe tener la extensión
    `.ldepth.mean`.

5.  **Calculando calidad de alineamiento por sitio (`QUAL`):**

    La calidad de alineamiento por sitio nos dice qué tan bien alineadas
    están las lecturas que cubren una región determinada.

    Calculamos la calidad de alineamiento por sitio usando la opción
    `--site-quality`. El archivo de salida debe tener la extensión
    `.lqual`.

6.  **Calculando la proporción de datos perdidos por individuo:**

    Los sitios con datos perdidos son aquellos en donde no hubo
    evidencia suficiente para llamar un genotipo durante el paso de
    llamada. Estos sitios aparecen en el archivo `vcf` como `./.`,
    puedes dar un ejemplo de un sitio en algún indivuduo que no tenga
    genotipo llamado?

    Los individuos con una proporción grande de sitios perdidos pueden
    causar problemas en los análisis; de ser tenidos en cuenta sería
    necesario eliminar muchos sitios potencialmente informativos para
    mantener la calidad de los datos en general.

    Calculamos la proporción de datos perdidos por individuo usando la
    opción `--missing-indv`. La extensión del archivo de salida debe ser
    `.imiss`.

    El archivo de salida es pequeño y puedes explorarlo. Responde: ¿Qué
    individuos tienen las tasas más altas de datos perdidos? ¿Notas
    algún patrón? ¿Cuál puede ser la razón biológica para estas
    observaciones?

7.  **Calculando la proporción de datos perdidos por sitio:**

    La proporción de datos perdidos por sitio nos permite determinar
    regiones del genoma que fueron difíciles de alinear para la mayoría
    de los individuos y que por lo tanto no serán informativas. En
    cierta forma esto ya lo tenemos en cuenta cuando contamos el número
    de alelos por sitio. Tenemos 18 individuos dipliodes; un sitio con
    cantidad perfecta de información tendrá entonces 36 alelos.

    Calculamos la proporción de datos perdidos por sitio usando la
    opción `--missing-site`. La extensión del archivo de salida debe ser
    `.lmiss`

8.  **Transfiriendo los datos a nuestra máquina**

    Finalmente copia a tu máquina los archivos creados usando `scp` o
    `rsync`.

### <span class="todo TODO">TODO</span> Analizando y visualizando las estadísticas de los genotipos en `R`

1.  **Preparando el ambiente de trabajo**

    Debemos asegurarnos de que tenemos nuestro `R` en el estado
    apropiado antes de trabajar analizando los datos. Empecemos creando
    un nuevo script en `Rstudio` y dándole un nombre apropiado.

    ``` r
    ### Empezamos limpiando el ambiente de trabajo
    rm(list = ls())

    ### cambia la ruta actual de trabajo a la carpeta donde
    ### guardas los datos generados en la sección anterior
    setwd("~/ruta/de/trabajo")
    ```

    Si no lo tenemos instalado, instalamos el paquete
    [`tidyverse`](https://www.tidyverse.org/), que es una colección de
    paquetes diseñada para trabajar en análisis de datos.

    ``` r
    ### Si no tenemos instalado tidyverse, ejecutamos
    install.packages("tidyverse")

    ### Cargamos el paquete
    library(tidyverse)
    ```

2.  **Estadísticas por sitio: Conteo de alelos**

    ``` r
    ### Cargamos los datos de conteo de alelos
    conteo_alelos <- read_tsv("archivo.conteo")
    ```

    Debemos tomar decisiones sobre el número de alelos que queremos como
    representación mínima para un sitio. No tenemos muchas muestras,
    apenas 18 individuos dipliodes, entonces idealmente en todos los
    sitios deberíamos tener 36 alelos. Si examinamos en detalle los
    datos nos damos cuenta que muchos sitios están lejos de tener los 36
    alelos. ¿Cómo podemos ver un resumen de lo que está pasando con
    nuestros datos? Podemos revisarlo con la función `summary` de `R`.
    También podemos visualizarlo: Hagamos un histograma de los conteos
    de alelos por sitio usando las funciones del paquete `ggplot2`.

    ``` r
    ### Pintamos un histograma de los conteos de alelos por sitio
    ggplot(data=conteo_alelos, aes(x=N_CHR)) + geom_histogram() +
      labs(x="Num. alelos", y="Conteo")
    ```

    El resultado debe verse así:
    ![](./Imagenes/conteo_alelos_x_sitio.png)

    ¿Cómo podemos usar la información que acabamos de graficar para
    tomar decisiones? Podemos ver en la gráfica que la mayoría de sitios
    tienen 30 o más alelos, lo cual corresponde a tener información
    aproximadamente para el 83% de los individuos. Este número es
    razonable, tendríamos relativamente buena información en los sitios
    que tengan 30 o más alelos. Vamos a conservar los sitios con 30 o
    más alelos.

3.  **Estadísticas por sitio: Profundidad promedio**

    Normalmente en un experimento de secuenciación la profundidad es
    altamente variable; algunos sitios no tienen cobertura mientras que
    otros están cubiertos por cientos o miles de lecturas. Debemos
    examinar la variación de profundidad en los sitios que estamos
    analizando. Para esto cargamos y graficamos los datos de la
    siguiente forma:

    ``` r
    ### Cargamos los datos de profundidad promedio por sitio
    prof_avg_sitio <- read_tsv("heliconius.optixscaf.2.ldepth.mean")

    ### Pintamos un histograma de la profundidad por sitio
    ggplot(data=prof_avg_sitio, aes(x=MEAN_DEPTH)) + geom_histogram() +
      labs(x="Prof. prom. x sitio", y="Conteo")
    ```

    El resultado debe verse así:

    ![](./Imagenes/prof_promedio_sitio.png)

    Preguntas: ¿Cuál es el rango principal de distribución de los datos
    de profundidad? ¿Por qué el eje x tiene su límite derecho tan lejos?

    Normalmente se considera que en un experimento de secuenciación la
    profundidad debe ser mayor a 5 (5 lecturas soportando los alelos
    observados en una posición, a menos que el experimento haya sido
    diseñado desde el principio con baja profundidad). Según nuestra
    gráfica es raro observar sitios con profundidad de secuenciación de
    50 o más; las profundidades muy altas pueden ser resultado de
    artefactos y es razonable excluirlas. Vamos a limitar las
    profundidades por sitio al intervalo
    5 ≤ *p**r**o**f**u**n**d**i**d**a**d* ≤ 50.

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

### <span class="todo TODO">TODO</span> Aplicando los filtros al archivo VCF

1.  
2.  
3.  
