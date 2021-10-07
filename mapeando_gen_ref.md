
# Table of Contents

1.  [Mapeo: Motivación](#org42d91c7)
    1.  [Descripción general](#org7eb3f89)
2.  [Mapeo: Calidad de los datos de lectura](#orgb43c625)
    1.  [Estructura de los datos: El formato `fastq`](#orgc3d341f)
    2.  [Puntajes de calidad](#org9b459d3)
    3.  [Evaluando la calidad](#orgf8c265e)
    4.  [Buenas y malas calidades](#org4e7b3ff)
    5.  [Potenicales soluciones cuando la calidad no es buena](#org8f9806b)
    6.  [Analizando las calidades de las lecturas](#orgb3bd2d8)
3.  [Mapeo: Genoma de referencia](#orgaf27222)
    1.  [Construcción y ensamblaje](#org6d8bc27)
    2.  [Estándares de calidad y herramientas complementarias](#orgc80907a)
    3.  [Descargando un genoma de referencia](#org4400f6d)
4.  [Mapeo: Pasos y herramientas](#orga828726)
    1.  [Preparando los archivos](#orgfbcd3c3)
    2.  [Alineamiento de las lecturas](#org091ae5c)
    3.  [Estadísticas del alineamiento](#orgf4a8e48)
    4.  [Otros procesos posteriores](#org1d7eaee)


<a id="org42d91c7"></a>

# TODO Mapeo: Motivación


<a id="org7eb3f89"></a>

## TODO Descripción general


<a id="orgb43c625"></a>

# TODO Mapeo: Calidad de los datos de lectura


<a id="orgc3d341f"></a>

## TODO Estructura de los datos: El formato `fastq`


<a id="org9b459d3"></a>

## TODO Puntajes de calidad


<a id="orgf8c265e"></a>

## TODO Evaluando la calidad


<a id="org4e7b3ff"></a>

## TODO Buenas y malas calidades


<a id="org8f9806b"></a>

## TODO Potenicales soluciones cuando la calidad no es buena


<a id="orgb3bd2d8"></a>

## TODO Analizando las calidades de las lecturas


<a id="orgaf27222"></a>

# TODO Mapeo: Genoma de referencia


<a id="org6d8bc27"></a>

## TODO Construcción y ensamblaje


<a id="orgc80907a"></a>

## TODO Estándares de calidad y herramientas complementarias


<a id="org4400f6d"></a>

## TODO Descargando un genoma de referencia

El genoma de referencia que usaremos es de la especie *H. melpomene* (v2.5).   

Sigue estos pasos para descargarlo:   

1.  [ ] Ve al sitio web de [lepbase](http://lepbase.org/)
2.  [ ] Haz click en el botón señalado por las flechas (Downloads)   
    ![img](./Imagenes/Lepbase_S1.png)
3.  [ ] En Downloads, escoge la carpeta que dice `v4`   
    ![img](./Imagenes/Lepbase_S2.png)
4.  [ ] Dentro de `v4` ve a la carpeta `sequence`   
    ![img](./Imagenes/Lepbase_S3.png)
5.  [ ] Dentro de `sequence` busca `Heliconius_melpomene_melpomene_Hmel2.5.scafolds.fa.gz`   
    ![img](./Imagenes/Lepbase_S4.png)
6.  [ ] Dale click derecho al enlace y selecciona `Copiar enlace`
7.  [ ] Ve a tu carpeta de trabajo en el cluster y crea una nueva carpeta
    llamada `ref_hmel2.5`, cambia de directorio a esta carpeta.
8.  [ ] Descarga el archivo de la referencia con `wget` pegando el enlace que
    copiaste.


<a id="orga828726"></a>

# TODO Mapeo: Pasos y herramientas


<a id="orgfbcd3c3"></a>

## TODO Preparando los archivos

-   [ ] Es necesario preparar el genoma de referencia creando una nueva
    estructura de datos a partir del archivo `fasta` original. Esto lo hacemos
    usando el comando `index` de `bwa`. La sintaxis es `bwa index archivo.fa`,
    donde `archivo.fa` es la referencia en formato `fasta`. La referencia puede
    estar comprimida en este caso (`.gz`). Recuerda cargar el módulo `bwa` en
    centauro antes de crear el índice. Este paso no tarda mucho tiempo (\aprox
    5min) y requiere pocos recursos; puedes realizarlo en una sesión
    interactiva.
-   [ ] Luego de indexar es necesario crear un archivo de texto con la
    información que usaremos para mapear nuestras lecturas al genoma de
    referencia. Usa `nano` para crear un nuevo archivo de texto.   
    
    Usa una línea por muestra y la siguiente estructura para cada línea:   
    
    Columna 1: El primer archivo de lecturas de la muestra (R1)   
    Columna 2: El segundo archivo de lecturas de la muestra (R2)   
    Columna 3: El archivo de la referencia (`fasta` o `fasta` comprimido).   
    Columna 4: El identificador de la muestra   
    Columna 5: El identificador de la referencia


<a id="org091ae5c"></a>

## TODO Alineamiento de las lecturas

-   [ ] Para este paso necesitamos escribir un script de bash usando `nano` (u
    otro editor de texto disponible en el cluster). Crea un nuevo archivo de
    texto usando el editor y ponle un nombre informativo, por ejemplo:
    `mapeo_bwa.sh`
-   [ ] No olvides añadir el [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) en la primera línea. En las siguientes
    líneas escribe directivas para pedir al sistema 4 procesadores, 16GB de
    RAM y 12 horas de tiempo límite de ejecución. Escribe también directivas
    para que el sistema te envíe notificaciones al correo cuando el proceso
    inicie, termine o encuentre errores.
-   [ ] Carga los módulos requeridos: Durante estos pasos del alineamiento
    vamos a usar [`bwa`](http://bio-bwa.sourceforge.net/bwa.shtml) para alinear las lecturas al genoma de referencia,
    [`samtools`](https://www.htslib.org/doc/samtools.html) para ordenar los alineamientos y optimizar el acceso a las
    lecturas mapeadas, y [`picard-tools`](https://broadinstitute.github.io/picard/) para quitar duplicados de PCR y hacer
    conversiones adicionales de formato. `bwa` y `samtools` están disponibles
    directamente como módulos en el cluster. Para `picard-tools` necesitamos
    cargar la versión 8 de `java`, cuyo módulo en el cluster es
    `java8/1.8.0.172`.
-   [ ] Necesitamos establecer la forma en la que ingresamos a nuestro script
    la información necesaria para alinear las lecturas. Para esto usamos los
    **argumentos ordenados** de los scripts de `bash`. Recuerda que los números
    del 1 en adelante, precedidos del operador `$` sirven para asociar los
    argumentos con los que se llama el script (`$1` sería el primer argumento,
    `$2` sería el segundo y así sucesivamente). En este caso necesitamos 5
    argumentos: Las rutas de los dos archivos de lecturas pareadas (R1 y R2),
    la ruta del archivo de la referencia, el identificador de la muestra y el
    identificador de la referencia que usaremos para alinear. Definamos
    entonces 5 variables en nuestro script y asignémosles cada uno de los
    argumentos de entrada. Por ejemplo para declarar una variable que
    asignaremos al primer archivo de lecturas, podemos escribir algo como
    `lecturas_r1=$1`. Declara de la misma manera el resto de las variables.
-   [ ] Escribamos el comando de `bwa`. Utilizaremos la función `mem` para
    hacer el alineamiento de nuestras lecturas pareadas. Inmediatamente
    después de escribir la función que usaremos, especificamos el número de
    procesadores que `bwa` usará para alinear, usando la opción `-t`. Vamos a
    usar 4 procesadores para el alineamiento. Usamos la opción `-M` para
    marcar los alineamientos más cortos como secundarios (para que los
    alineamientos sean compatibles con `picard`).
    
    Tal vez la parte más importante de este paso es establecer el **read
    group**. En este caso podemos asumir que cada muestra fue secuenciada una
    sola vez y en un solo instrumento, luego tenemos un solo **read group** por
    muestra. Si tuviéramos más de un **read group** por muestra sería
    recomendable hacer dos alineamientos y luego unirlos usando otras
    herramientas. Para establecer el read group usamos la opción `-R` seguida
    de la siguiente cadena de caracteres usando comillas dobles:
    `"@RG\tID:id_muestra\tSM:id_muestra\tPL:Illumina"`. Si revisamos esta
    expresión en detalle consta de tres campos separados por tabulación
    (`\t`). El primero, (`ID`), corresponde al identificador del corrido de
    secuenciación, que normalmente corresponde a uno de los carriles de la
    máquina secuenciadora. El segundo (`SM`) corresponde al identificador de
    la muestra. El tercero (`PL`) corresponde a la plataforma usada para
    secuenciar. En el caso de los datos de *Heliconius* la plataforma
    utilizada para todas las muestras fue Illuimina. En cada caso debes
    cambiar `id_muestra` por el identificador asociado a cada muestra.
    Establece el read group correctamente usando la opción `-R` y los detales
    correspondientes a cada muestra. Todas las muestras de *Heliconius* que
    usaremos fueron secuenciadas usando la plataforma `Illumina`.
    
    Los tres argumentos siguientes son la ruta de la referencia y la ruta de
    los archivos de lectura (R1 y luego R2). Asegúrate de especificar rutas
    absolutas para los tres archivos.
    
    La salida por defecto de `bwa mem` es la **salida estándar**; esto significa
    que debemos re-dirigir los resultados con el operador adecuado hacia un
    archivo que va a contener todos los alineamientos de nuestras lecturas
    contra la referencia. Dale a este nuevo archivo un nombre informativo que
    contenga el identificador de la muestra, una pieza corta de información
    sobre la referencia usada para alinear, y la extensión de archivo `.sam`
    (\*\*s\*\*equence \*\*a\*\*lignment \*\*m\*\*ap).

-   [ ] Es necesario hacer un cambio de formato luego de hacer el alineamiento
    con `bwa`.

-   [ ] 


<a id="orgf4a8e48"></a>

## TODO Estadísticas del alineamiento

-   [ ] 

-   [ ] 

-   [ ] 

-   [ ] 


<a id="org1d7eaee"></a>

## TODO Otros procesos posteriores

