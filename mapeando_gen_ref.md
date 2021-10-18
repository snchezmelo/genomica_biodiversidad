---
bibliography: /home/juanenciso/MEGA/phd_thesis_juan/thesis_bibliography.bib
description: "Genómica de la biodiversidad: Mapeando a genoma de
  referencia"
lang: es
title: Alineamiento de lecturas a un genoma de referencia
---

# <span class="todo TODO">TODO</span> Mapeo: Motivación

## <span class="todo TODO">TODO</span> Descripción general

# <span class="todo TODO">TODO</span> Mapeo: Calidad de los datos de lectura

## <span class="todo TODO">TODO</span> Estructura de los datos: El formato `fastq`

## <span class="todo TODO">TODO</span> Puntajes de calidad

## <span class="todo TODO">TODO</span> Evaluando la calidad

## <span class="todo TODO">TODO</span> Buenas y malas calidades

## <span class="todo TODO">TODO</span> Potenicales soluciones cuando la calidad no es buena

## <span class="todo TODO">TODO</span> Analizando las calidades de las lecturas

# <span class="todo TODO">TODO</span> Mapeo: Genoma de referencia

## <span class="todo TODO">TODO</span> Construcción y ensamblaje

## <span class="todo TODO">TODO</span> Estándares de calidad y herramientas complementarias

## <span class="todo TODO">TODO</span> Descargando un genoma de referencia

El genoma de referencia que usaremos es de la especie *H. melpomene*
(v2.5).  
Sigue estos pasos para descargarlo:  

1.  Ve al sitio web de [lepbase](http://lepbase.org/)
2.  Haz click en el botón señalado por las flechas (Downloads)  
    ![](./Imagenes/Lepbase_S1.png)
3.  En Downloads, escoge la carpeta que dice `v4`  
    ![](./Imagenes/Lepbase_S2.png)
4.  Dentro de `v4` ve a la carpeta `sequence`  
    ![](./Imagenes/Lepbase_S3.png)
5.  Dentro de `sequence` busca
    `Heliconius_melpomene_melpomene_Hmel2.5.scafolds.fa.gz`  
    ![](./Imagenes/Lepbase_S4.png)
6.  Dale click derecho al enlace y selecciona `Copiar enlace`
7.  Ve a tu carpeta de trabajo en el cluster y crea una nueva carpeta
    llamada `ref_hmel2.5`, cambia de directorio a esta carpeta.
8.  Descarga el archivo de la referencia con `wget` pegando el enlace
    que copiaste. Recuerda la ruta de ubicación de este archivo!
    Regístrala en tu archivo de comandos.

# <span class="todo TODO">TODO</span> Mapeo: Pasos y herramientas

## <span class="todo TODO">TODO</span> Preparando los archivos

1.  Es necesario preparar el genoma de referencia creando una nueva
    estructura de datos a partir del archivo `fasta` original. Esto lo
    hacemos usando el comando `index` de `bwa`. La sintaxis es
    `bwa index archivo.fa`, donde `archivo.fa` es la referencia en
    formato `fasta`. La referencia puede estar comprimida en este caso
    (`.gz`). Recuerda cargar el módulo `bwa` en centauro antes de crear
    el índice. Este paso no tarda mucho tiempo ( 5min) y requiere pocos
    recursos; puedes realizarlo en una sesión interactiva.
2.  Luego de indexar es necesario crear un archivo de texto con la
    información que usaremos para mapear nuestras lecturas al genoma de
    referencia. Usa `nano` para crear un nuevo archivo de texto.  
    Usa una línea por muestra y la siguiente estructura para cada
    línea:  
    Columna 1: El primer archivo de lecturas de la muestra (R1)  
    Columna 2: El segundo archivo de lecturas de la muestra (R2)  
    Columna 3: El archivo de la referencia (`fasta` o `fasta`
    comprimido).  
    Columna 4: El identificador de la muestra  
    Columna 5: El identificador de la referencia  

## <span class="todo TODO">TODO</span> Alineamiento de las lecturas

1.  Para este paso necesitamos escribir un script de bash usando `nano`
    (u otro editor de texto disponible en el cluster). Crea un nuevo
    archivo de texto usando el editor y ponle un nombre informativo, por
    ejemplo: `mapeo_bwa.sh`

2.  No olvides añadir el
    [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) en la
    primera línea. En las siguientes líneas escribe directivas para
    pedir al sistema 4 procesadores, 16GB de RAM y 12 horas de tiempo
    límite de ejecución. Escribe también directivas para que el sistema
    te envíe notificaciones al correo cuando el proceso inicie, termine
    o encuentre errores.

3.  Carga los módulos requeridos: Durante estos pasos del alineamiento
    vamos a usar [`bwa`](http://bio-bwa.sourceforge.net/bwa.shtml) para
    alinear las lecturas al genoma de referencia,
    [`samtools`](https://www.htslib.org/doc/samtools.html) para ordenar
    los alineamientos y optimizar el acceso a las lecturas mapeadas, y
    [`picard-tools`](https://broadinstitute.github.io/picard/) para
    quitar duplicados de PCR y hacer conversiones adicionales de
    formato. `bwa` y `samtools` están disponibles directamente como
    módulos en el cluster. Para `picard-tools` necesitamos cargar la
    versión 8 de `java`, cuyo módulo en el cluster es `java8/1.8.0.172`.

4.  Necesitamos establecer la forma en la que ingresamos a nuestro
    script la información necesaria para alinear las lecturas. Para esto
    usamos los **argumentos ordenados** de los scripts de `bash`.
    Recuerda que los números del 1 en adelante, precedidos del operador
    `$` sirven para asociar los argumentos con los que se llama el
    script (`$1` sería el primer argumento, `$2` sería el segundo y así
    sucesivamente). En este caso necesitamos 5 argumentos: Las rutas de
    los dos archivos de lecturas pareadas (R1 y R2), la ruta del archivo
    de la referencia, el identificador de la muestra y el identificador
    de la referencia que usaremos para alinear. Definamos entonces 5
    variables en nuestro script y asignémosles cada uno de los
    argumentos de entrada. Por ejemplo para declarar una variable que
    asignaremos al primer archivo de lecturas, podemos escribir algo
    como `lecturas_r1=$1`. Declara de la misma manera el resto de las
    variables.

5.  Escribamos el comando de `bwa`. Utilizaremos la función `mem` para
    hacer el alineamiento de nuestras lecturas pareadas. Inmediatamente
    después de escribir la función que usaremos, especificamos el número
    de procesadores que `bwa` usará para alinear, usando la opción `-t`.
    Vamos a usar 4 procesadores para el alineamiento. Usamos la opción
    `-M` para marcar los alineamientos más cortos como secundarios (para
    que los alineamientos sean compatibles con `picard`).

    Tal vez la parte más importante de este paso es establecer el **read
    group**. En este caso podemos asumir que cada muestra fue
    secuenciada una sola vez y en un solo instrumento, luego tenemos un
    solo **read group** por muestra. Si tuviéramos más de un **read
    group** por muestra sería recomendable hacer dos alineamientos y
    luego unirlos usando otras herramientas. Para establecer el read
    group usamos la opción `-R` seguida de la siguiente cadena de
    caracteres usando comillas dobles:
    `"@RG\tID:id_muestra\tSM:id_muestra\tPL:Illumina"`. Si revisamos
    esta expresión en detalle consta de tres campos separados por
    tabulación (`\t`). El primero, (`ID`), corresponde al identificador
    del corrido de secuenciación, que normalmente corresponde a uno de
    los carriles de la máquina secuenciadora. El segundo (`SM`)
    corresponde al identificador de la muestra. El tercero (`PL`)
    corresponde a la plataforma usada para secuenciar. En el caso de los
    datos de *Heliconius* la plataforma utilizada para todas las
    muestras fue Illuimina. En cada caso debes cambiar `id_muestra` por
    el identificador asociado a cada muestra. Establece el read group
    correctamente usando la opción `-R` y los detales correspondientes a
    cada muestra. Todas las muestras de *Heliconius* que usaremos fueron
    secuenciadas usando la plataforma `Illumina`.

    Los tres argumentos siguientes son la ruta de la referencia y la
    ruta de los archivos de lectura (R1 y luego R2). Asegúrate de
    especificar rutas absolutas para los tres archivos.

    La ruta utilizada por `bwa mem` para escribir el alineamiento es la
    **salida estándar**; esto significa que debemos re-dirigir los
    resultados con el operador adecuado hacia un archivo o hacia otro
    programa si queremos procesar directamente estos datos de salida. En
    este caso queremos optar por la segunda opción para ordenar el
    alineamiento según las coordenadas del genoma de referencia y para
    guardar el alineamiento en un formato amigable con el espacio en
    disco. Usando el operador `pipe` re-dirigimos la salida hacia la
    herramienta `samtools`, como necesitamos ordenar el alineamiento
    entonces la función de `samtools` que utilizaremos será `sort`.
    Especificamos que queremos usar 4 procesadores con la opción `-@` y
    usando la opción `-o` le damos el nombre al archivo de salida; como
    es un alineamiento ya ordenado vamos a finalizar el nombre del
    archivo con el sufijo `.sort.bam`. La última pieza de información
    que debemos darle a `samtools sort` es un `-` (guión): Esto le
    indica a `samtools` que la información debe ser leída usando la
    **entrada estándar** y no un archivo.

6.  Es necesario hacer un cambio de formato luego de hacer el
    alineamiento con `bwa`.

7.  

## <span class="todo TODO">TODO</span> Quitando duplicados de PCR

1.  Tenemos que quitar los duplicados de PCR \[@Ebbert2016\].

## <span class="todo TODO">TODO</span> Estadísticas del alineamiento

1.  
2.  
3.  
4.  

## <span class="todo TODO">TODO</span> Otros procesos posteriores
