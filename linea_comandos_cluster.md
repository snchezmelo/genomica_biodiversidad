---
---

# Unix básico

## Preparación

**Si está trabajando en Windows:** Asegúrese de tener instalado [Git
Bash
SDK](https://github.com/git-for-windows/build-extra/releases/tag/git-sdk-1.0.8).
Necesitamos familiarizarnos con el funcionamiento de Copiar y Pegar para
poder navegar fácilmente las diferentes rutas de archivos en nuestra
máquina y en el cluster. Si tiene Git Bash en Windows, necesitamos
activar las funciones del teclado que le permiten copiar y pegar texto
en el emulador de terminal.

1.  Abra su emulador de terminal

2.  Haga click derecho en cualquier parte de la ventana. En el menú
    desplegable haga click en `Options...`

    ![](./Imagenes/habilitar_cp_gitbash1.png)

3.  En la ventana de opciones, vaya a la pestaña `Keys`. En la sección
    `Shortcuts` chequee la caja que dice `Ctrl+Shift+letter
            shortcuts`

    ![](./Imagenes/habilitar_cp_gitbash2.png)

4.  Pruebe los nuevos cambios. Asegúrese de que puedes seleccionar y
    copiar texto usando `Ctrl + Shift + c` y pegar texto usando
    `Ctrl + Shift + v`.

**Si está trabajando en Linux:** Este comportamiento está habilitado
por defecto en Linux. Pruebe que puede copiar usando `Ctrl + Shift + c`
y pegar usando `Ctrl + Shift + v` en su emulador de terminal. Si no es
posible consulte al personal docente.

**Si está trabajando en mac OS:** Este comportamiento está habilitado
usando la forma usual de copiar y pegar en mac OS. `⌘ + c` para copiar y
`⌘ + v` para pegar. Pruebe que las combinaciones produzcan el
funcionamiento esperado, si no es así consulta al personal docente.

## Navegación del sistema de archivos

Tenga un archivo de texto a la mano (NO use un documento de Word). A
medida que avance en los ejercicios registre los comandos utilizados.
Es buena práctica hacer anotaciones y comentarios de los comandos que
usa, utilice el caracter `#` para crear comentarios en sus archivos de
texto.

1.  Cree un directorio de trabajo en una ubicación a la que pueda
    acceder fácilmente y asegúrese de que pueda acceder a él usando la
    interfaz gráfica y la línea de comandos.

2.  Navegue hacia su directorio de trabajo usando la línea de comandos y
    descargue allí el archivo
    [`linea_comando.zip`](https://github.com/juanenciso14/genomica_biodiversidad/blob/master/material/linea_comando.zip?raw=true)
    usando `wget`.

    Renombre el archivo usando la opción `-O` de `wget` seguida del
    nombre que le quiere dar al archivo. Si no lo renombra tendrá la
    extensión `?raw=true`, la cual no queremos.

3.  Descomprima el archivo que descargó usando la herramienta
    `unzip`. ¿Qué resulta de hacer esta operación? ¿Qué tipo de objeto es
    `linea_comando`?

4.  Vaya a su carpeta home :house:.

5.  Vaya a la carpeta `linea_comando` usando una <u>ruta absoluta</u>.

6.  Vaya al directorio `carpeta_4` dentro de `linea_comando` usando una
    <u>ruta relativa</u>.

7.  Usando un solo comando y una <u>ruta relativa</u>, vaya al directorio
    `ssubcarpeta2.2.2`. ¿Cuál es la ruta absoluta al directorio?

8.  Usando un solo comando y una <u>ruta relativa</u> vaya al directorio
    `subCarpeta1.2`

9.  Usando un solo comando y la <u>ruta absoluta</u> vaya a
    `subCarpeta3.1`

10. Vuelva a :house: utilizando una ruta relativa.

## Creación de directorios y archivos

-   [ ] Replique la creación de `linea_comando` con todo su contenido.
    Algunos archivos están vacíos y otros contienen texto plano. Replique
    el contenido de estos archivos usando un editor de texto o el
    comando `echo` y el operador de re-dirección. Documente en su
    archivo de comandos todos los pasos que siguió para crear
    `linea_comando`.

    ![](./Imagenes/tree_linea_comando.png)

## Programas disponibles en tu máquina

1.  Comente qué diferencias observa con las herramientas disponibles en
    los sistemas de sus compañeros de grupo. ¿Todos tienen las mismas
    herramientas disponibles?

2.  Revise las rutas disponibles en `$PATH`. Escoja una de las rutas que
    observas en `$PATH`, recuerde que están separadas por `:`. ¿Qué
    otras herramientas están disponibles en la ruta que escogió?
    Nombre por lo menos cuatro de ellas y describa qué hacen. Utilice
    `man` para explorar la documentación de las herramientas.

## Copia, movimiento y deleción de directorios y archivos

1.  Vaya a tu carpeta :house:

2.  Vaya a `linea_comando` usando una ruta relativa.

3.  Cree un archivo llamado `lista_carpetas.txt` que contenga la lista
    de carpetas dentro de `linea_comando` ¿Cómo ignorar los archivos y
    te quedarse solo con las carpetas? Consulte la ayuda de `ls` usando
    `man`.

4.  Mueva `archivo2.1.2.2.txt` y `Archivo2.1.2.3.txt` a `subcarpeta3.1`
    usando rutas relativas y un solo comando.

5.  Copie `archivo1.2.1.txt` y `archivo1.2.2.txt` a `subcarpeta2.2`. Use
    un solo comando.

6.  Copie el directorio `ssubcarpeta2.1.2` con todo su contenido a
    `carpeta_4` en un solo comando. ¿Encuentra errores? Consulte el
    manual de `cp` para recordar la opción apropiada que debe utilizar.

7.  Borre el directorio `subCarpeta1.2` con todo su contenido en un solo
    comando. Utilice la opción de verificación de la herramienta usada
    para borrar.

8.  Cree dos archivos vacíos en `carpeta_4` y nómbrelos como quiera.

9.  Vaya un nivel arriba del directorio `linea_comando`. Comprima la
    carpeta `linea_comando` usando el comando
    `zip -r linea_comando_<nombre>.zip
            linea_comando` donde `<nombre>` es su nombre. Recuerde no
    dejar espacios en los nombres de archivo.

# Unix no tan básico

## Genes con nombres duplicados

El archivo
[`genes_ch1_mus_musculus.txt`](./material/genes_ch1_mus_musculus.txt)
contiene identificadores de los genes del cromosoma 1 de *Mus musculus*
en la primera columna y los nombres comunes de estos genes en la segunda
columna. Algunos genes tienen nombres repetidos en la derecha. El
objetivo es encontrar las entradas con nombres comunes de genes que
estén duplicados. Las instrucciones utilizadas para resolver este punto
deben guardarse en un script de `bash` que contenga el paso por paso de
la solución.

1.  ¿Cuántas líneas tiene el archivo `gen_ch1_mus_musculus.txt`?
    ¿Cuántas palabras tiene este archivo? ¿Cuántos caracteres tiene este
    archivo?
2.  Use `head` y `tail` para responder: ¿Cuáles son los primeros 5 genes
    que aparecen en el archivo (segunda columna)? ¿Cuáles son los
    últimos 3 genes?
3.  Use el comando `cut` para cortar y acceder a columnas individuales
    del archivo de genes del ratón. La opción `-f<n>` le permite escoger
    columnas individuales o grupos de columnas que quiera cortar. Debe
    reemplazar `<n>` por el número de columna que quiera seleccionar.
4.  Use `head` y `tail` para imprimir las líneas de la 925 a la 938 del
    archivo `gen_ch1_mus_musculus.txt`, re-dirija la salida a `cut`
    usando el operador `|` y corte solamente los identificadores de los
    genes. ¿Qué identificadores se encontraron en esta selección?
    ¿Cuántos identificadores hay allí?
5.  Use los comandos `uniq`, `sort` y `grep` para contar la aparición de
    cada nombre en la segunda columna. ¿Qué opción de `uniq` debes usar
    para contar repeticiones?
6.  Genere una lista con los nombres de los genes repetidos y guárdala
    en un archivo llamado `repetidos_ch1_mmus.txt`
7.  Genere una lista con los nombres de los genes no repetidos y
    guárdala en un archivo llamado `no_repetidos_ch1_mmus.txt`
8.  Responda: ¿Cuántas líneas tiene originalmente el archivo
    `genes_ch1_mus_musculus.txt`?
9.  Responde: Ignorando las repeticiones, ¿cuántos genes únicos hay
    realmente en estos datos?
10. Responde: Reporta el número más alto de repeticiones que tiene un
    gen en este archivo.

## Marcadores de secuencias

Cuando se hacen experimentos de secuenciación a gran escala normalmente
se agregan etiquetas moleculares para poder identificar las muestras
correctamente al momento de procesar los datos. El archivo
[`tags_seqs.txt.gz`](./material/tags_seqs.txt.gz) contiene dos columnas:
En la columna izquierda hay identificadores moleculares únicos para cada
individuo. Estos tienen el formato `secuencia1-secuencia2`, las dos
secuencias en conjunto se usan para identificar diferentes detalles del
proceso de secuenciación. En la columna 2 del archivo están los
identificadores de cada individuo. <u>No descomprimas el archivo para
trabajar este punto</u>.

1.  Utilice la herramienta `zless` para verificar la estructura del
    archivo.

2.  Utilice la versión apropiada de `cat` junto con `cut` y `grep` para
    establecer qué individuos tienen asociadas las siguientes marcas en
    `secuencia2`.

    `TATCCTCT`

    `GTAAGGAG`

    `TAGATCGC`

    Recuerde re-dirigir la información entre herramientas usando el
    operador apropiado. Al usar cut puede especificar el delimitador
    usando la opción `-d` seguida del caracter delimitador entre
    comillas sencillas. Por ejemplo, si el delimitador es un caracter de
    tabulación (`\t`) usarías `-d'\t'`.

    Responda: ¿En total cuántos individuos tienen alguna de estas tres
    secuencias en la segunfa parte de la columna izquierda?

3.  Asigne la ruta absoluta del archivo `tags_seqs.txt.gz` a una
    variable de `bash`. Utilice el operador `$` para expandir el
    contenido de la variable y use esta expansión en una llamada a la
    versión adecuada de `grep` y las opciones adecuadas de este programa
    para contar el número de identificadores moleculares que empiezan
    con la base `T`. ¿Cuántos encontró?

4.  Use las versión apropiada las versiones apropiadas de `cat`, `grep`
    y `cut` para mostrar únicamente los individuos que pertenecen al
    outgroup. Los individuos del outgroup son aquellos cuyo nombre
    (segunda columna). Empieza con `out`.

5.  Use `cut` con las opciones apropiadas para quedarse solo con la
    información correspondiente a `secuencia2` y la segunda columna,
    excluyendo la parte de `secuencia1-` en cada fila.

# Trabajando en el cluster de cómputo (CENTAURO)

## Conexión al cluster

Usaremos el programa `ssh` ([secure
shell](https://www.ssh.com/academy/ssh)) para conectarnos a CENTAURO
desde nuestra máquina. El ejemplo que veremos usa [Git Bash
(Windows)](https://gitforwindows.org/). La sintáxis para Linux y mac OS
es la misma.

1.  Descargue y copie la llave de acceso (archivo `.pem`) en una ruta que
    conozca y a la que pueda acceder fácilmente. En este caso yo creé
    una carpeta llamada `Trabajo` y otra llamada `clstr` dentro de
    `Trabajo` en la ruta `/c/Usuarios/juand/`.

    ![](./Imagenes/ruta_archivo_pem.png)

2.  Abra una nueva ventana de `Git Bash` o del emulador de terminal con
    el que esté trabajando. Navegue su sistema usando los comandos
    aprendidos para moverse en el sistema de archivos. Vaya a la carpeta
    en donde puso su llave de acceso. Haga una lista de los archivos
    en la carpeta, ¿ve la llave `.pem` dentro de esa carpeta?

3.  Utilice secure shell (`ssh`) para abrir una conexión remota a
    Centauro. Utilice la opción `-i` para especificar la ruta a la llave
    `.pem` y la opción `-p` para especificar el puerto de acceso
    (53841). A continuación especifique tu nombre de usuario asignado
    seguido de un `@` y finalice con la dirección pública del cluster
    (`loginpub-hpc.urosario.edu.co`). Observe el ejemplo en la imagen,
    en este caso me estoy conectando desde mi carpeta `home` (`~`).

    ![](./Imagenes/conexion_centauro.png)

4.  Verifique que la conexión fue exitosa. Debería observar el siguiente
    texto en pantalla:

    ![](./Imagenes/conexion_exitosa.png)

    Si no logra conectarse con éxito, pida ayuda al personal docente.

## Buscando módulos

Podemos encontrar módulos disponibles en el cluster usando dos rutas: La
primera es utilizar el sub-comando `spider` de `module` seguido del
nombre que estamos buscando. La segunda es utilizar el sub-comando
`avail` de `module` y re-dirigir el resultado a `grep` para buscar el
patrón que queremos encontrar.

1.  Utilice `moldule avail` en conjunto `grep` para buscar algún módulo
    en particular. Pruebe buscando los módulos `java`, `stacks` y
    `OrthoMCL`. Describa qué observa en las tres búsquedas.
2.  Utilice el sub-comando `keyword` de `module` para buscar los tres
    módulos del numeral anterior. Describa qué observa en las tres
    búsquedas.
3.  Utilice el sub-comando `spider` de `module` para buscar los tres
    módulos del numeral 1. Describa qué observa en las tres búsquedas
4.  ¿Cómo describiría las diferencias entre `keyword` y `spider`?
5.  Consulte la ayuda de `module` usando la opción `-h` y responda:
    ¿Existe alguna forma de consultar los módulos que ya están cargados
    en su sesión? ¿Cómo lo hace?
6.  Consulte la ayuda de `module` la opción `-h` y responda: ¿Existe
    alguna forma de cargar versiones diferentes de un mismo módulo sin
    realizar dos cargas independientes? ¿Cómo lo hace?

¿Qué diferencias notas?

## La cola de trabajo

El archivo [`bash_loops1.tar.gz`](./material/bash_loops1.tar.gz) fue
creado con la herramienta `tar` y contiene varias carpetas, cada una de
ellas contiene un archivo de texto con un mensaje. Descomprima el
archivo usando `tar` con las opciones `-z`, `-x` y `-f` para poder
explorar la estructura de directorios contenida en el archivo. Explore
el contenido de uno de los archivos de texto para saber cuál es el
mensaje y luego genere una estructura idéntica a la de la carpeta
`bash_loops1`. Utilice un solo ciclo `for` para generar las carpetas y
crear los archivos con el mensaje. Agregue una pausa de un segundo a cada
iteración del `for` usando la herramienta `sleep`. Ponga las instrucciones
correspondientes a los primeros 3 pasos en un script de `bash` con el
código apropiado para poderlo enviar a la cola de trabajos del cluster
usando `sbatch`. A partir del paso 4 trabaja en una sesión interactiva.

1.  Solicite recursos para ejecutar el trabajo. Use las directivas
    `#SBATCH` en el inicio de tu script para enviar a la cola `normal`,
    solicita un solo procesador, 50MB de memoria RAM y 1h de tiempo de
    ejecución. No olvides incluir el `shebang`!.

2.  Adicionalmente, envíe notificaciones a tu correo cuando la tarea
    empiece, termine, o encuentre errores. Use directivas `#SBATCH` o
    incluya la solicitud de envío de notificaciones al correo y su
    dirección de correo electrónico como opciones en `sbatch`. Para esto
    use las opciones `--mail-type` y `--mail-user`.

3.  Haga una predicción de la duración del trabajo en minutos. Para esto
    puede suponer que cada iteración del ciclo tarda un poco más de un
    segundo debido al comando `sleep`. ¿Cuántas iteraciones tiene la
    tarea?

4.  Al finalizar la ejecución: Verifique la información de corrido que el
    sistema envió a tu correo electrónico, si no puede encontrar los
    mensajes revise tu carpeta **Spam**.

5.  Archive y comprima la estructura resultante usando `tar` y las
    opciones `c`, `z` y `f`. Consulta el manual de `tar` para saber qué
    hace cada opción y cómo organizar el comando.

    ``` shell
    # sintaxis de uso de tar
    tar [OPCIONES] archivo.tar.gz directorio
    ```

6.  Copie el archivo resultante (`bash_loops1.tar.gz`) a su máquina
    personal usando `scp` (haz esto desde tu máquina). La sintáxis para
    copiar archivos usando `scp` desde/hacia CENTAURO es:

    ``` shell
    # transfiriendo desde CENTAURO
    scp -i <ruta.llave.pem> -P 53841 \
        usuario@loginpub-hpc.urosario.edu.co:/ruta/al/archivo /rutal/local/

    # transfiriendo hacia CENTAURO
    scp -i <ruta.llave.pem> -P 53841 /rutal/local/archivo \
        usuario@loginpub-hpc.urosario.edu.co:/ruta/para/copiar/
    ```

7.  Envía el archivo resultante (`bash_loops1.tar.gz`) a su correo
    electrónico usando la herramienta `mailx`. La sintáxis para adjuntar
    archivos y enviarlos a una dirección de correo es la siguiente.

    ``` shell
    mailx -a <adjunto1> -a <adjunto2> \
          -s "Asunto" tu.direccion.de@correo.com

    # Presiona ENTER, luego Ctrl + d, luego ENTER nuevamente
    ```

    <details>
    <summary> Si no logras avanzar escribiendo el script de bash puedes encontrar la respuesta aquí. Asegúrate de hacerlo por tu cuenta primero! </summary>

    ``` shell
    #!/bin/bash
    #SBATCH -p normal
    #SBATCH -n 1
    #SBATCH --mem 500MB
    #SBATCH -t 0-1:00
    #SBATCH --mail-type=BEGIN,END,FAIL
    #SBATCH --mail-user=usuario@urosario.edu.co

    for i in {1..800}
    do
        mkdir carpeta_$i
        cd carpeta_$i
        echo "Hola mundo\nEstamos aprendiendo\nA usar el cluster" > \
             archivo_$i.txt
        cd ..
        sleep 1
    done

    # Para archivar y comprimir bash_loops1 use
    tar czf bash_loops1.tar.gz bash_loops1

    # tenga en cuenta la localizacion de bash_loops1
    ```

    </details>

## Descargando de archivos de secuencia y uso de `screen`

Los dos repositorios más grandes de secuencias de ácidos nucléicos
producidas usando secuenciación de nueva generación son el European
Nucleotide Archive [ENA (EBI)](https://www.ebi.ac.uk/) y el Sequence
Read Archive [SRA (NCBI)](https://www.ncbi.nlm.nih.gov/sra).
Aprenderemos a descargar datos de secuenciación desde ENA usando `wget`.
La descarga desde SRA es un poco más compleja y está fuera del alcance
de este curso.

El archivo
[`lista_muestras_descarga.txt`](./material/lista_muestras_descarga.txt)
contiene cuatro columnas con la siguiente información: i. Especie
abreviada ii. Subespecie abreviada iii. Identificador de muestra y iv.
Identificador de secuencia. **En su máquina local haga lo siguiente**.

1.  Escoja uno de los individuos y copie su identificador de secuencia.

2.  Vaya al [sitio web de EBI](https://www.ebi.ac.uk/) y pegue el
    identificador en el buscador, como lo muestra la imagen.

    ![](./Imagenes/busca_EBI_1.png)

    Presione el botón de búsqueda.

3.  En la lista de resultados haga click en el identificador
    correspondiente al primer resultado

    ![](./Imagenes/busca_EBI_2.png)

4.  En la siguiente página encuentra una sección con la información de
    la muestra, la plataforma en la que fue secuenciada y las
    características de la librería usada. En particular fíjese en los
    items **Library Layout**, **Library Strategy** y **Library Source**
    ¿Le dicen algo sobre los datos que va a descargar?

    Vaya al fondo de la página a la sección `Read Files`. En la tabla
    verá 7 columnas, la última (Generated FASTQ files: FTP) contiene
    los enlaces que usaremos para la descarga ¿Por qué hay dos enlaces
    si solo tenemos una muestra?

    ![](./Imagenes/busca_EBI_3.png)

5.  Vamos a descargar la información de **ambos** enlaces; necesitamos
    ambas piezas de información. Haga click derecho en cada uno de los
    enlaces, cópielos (copiar enlace) y péguelos en su archivo de
    comandos.

6.  **Vaya ahora al cluster, a su carpeta de trabajo.** Cree un directorio
    llamado `descarga_muestras` y entre a él.

7.  Para esta tarea no enviaremos los trabajos a la cola porque <u>los
    nodos de trabajo no están conectados a internet</u> y no pueden
    realizar descargas. Usaremos un programa llamado `screen` en el nodo
    maestro. `screen` nos permite dejar una tarea ejecutándose y nos da
    la posibilidad de desacoplar nuestra sesión para que el trabajo se
    siga ejecutando aún cuando nos desconectemos del cluster. Escriba
    `screen -S <sesion>` en donde `<sesion>` debe ser reemplazado por el
    nombre que quiera darle a la sesión de descarga. Por ejemplo,
    puede llamarla `descarga_NGS`. Verá que se abre una nueva sesión
    de trabajo.

8.  En esta sesión nueva usará `wget` para descargar uno de los dos
    archivos de secuencias de NGS que encontramos en ENA. La sintáxis
    recomendada para descargar este archivo con `wget` es la siguiente:

    `wget -O <nombre.de.archivo> <ruta/de/enlace>`

    En donde `<nombre.de.archivo>` es el nombre con el que quiere
    guardar el archivo en el cluster y `<ruta/de/enlace>` es una de las
    dos rutas que copió en su editor de texto.

    Dele un nombre informativo a su archivo. Puede usar la información
    que encuentra en
    [`lista_muestras_descarga.txt`](./material/lista_muestras_descarga.txt)
    de la siguiente forma: `especie.subespecie.R1.fastq.gz` o
    `especie.subespecie.R2.fastq.gz` dependiendo de si baja el primer
    (<sub>1</sub>) o el segundo (<sub>2</sub>) conjunto de secuencias.

9.  Ejecute la línea que acaba de escribir. Asegúrese de que está
    haciendo la descarga, puede verificar que la descarga se está
    haciendo si no observa errores y `wget` imprime en pantalla algo
    como esto:

    ![](./Imagenes/busca_EBI_4.png)

10. Como puede ver, estos archivos toman bastante tiempo para descargar,
    es por eso que usamos `screen`; si nos desconectáramos así nada más
    perderíamos la descarga y nos tocaría iniciar nuevamente. Presione
    `Ctrl + a` y luego `d` para desacoplar la sesión y dejar a `wget`
    trabajando después de que se desconecte. Verifique con un instructor
    que su procedimiento de descarga funciona y que puede desacoplar su
    sesión de `screen`.

11. **Re-acoplando la sesión desacoplada**. `screen` le permite
    conectarse nuevamente a la sesión en la que estaba trabajando antes
    mediante la opción `-r`. Si solo tiene una sesión de `screen`
    desacoplada puede ejecutar solamente `screen -r. Si tiene más de
    una sesión desacoplada, debe ejecutar `screen -r <sesion>` donde
    `<sesion>` es el nombre que le dio a su sesión de `screen` en el
    paso 7. Verifique que puede conectarse nuevamente a la sesión de
    descarga y desacople la sesión nuevamente con `Ctrl + a` y `d`.
