---
---

# <span class="todo TODO">TODO</span> Unix básico

## Preparación

**Si estás trabajando en Windows:** Asegúrate de tener instalado [Git
Bash
SDK](https://github.com/git-for-windows/build-extra/releases/tag/git-sdk-1.0.8).
Necesitamos familiarizarnos con el funcionamiento de Copiar y Pegar para
poder navegar fácilmente las diferentes rutas de archivos en nuestra
máquina y en el cluster. Si tienes Git Bash en Windows necesitamos
activar las funciones del teclado que te permiten copiar y pegar texto
en el emulador de terminal.

1.  Abre tu emulador de terminal

2.  Haz click derecho en cualquier parte de la ventana. En el menú
    desplegable haz click en `Options...`.

    ![](./Imagenes/habilitar_cp_gitbash1.png)

3.  En la ventana de opciones ve a la pestaña `Keys`. En la sección
    `Shortcuts` chequea la caja que dice `Ctrl+Shift+letter
            shortcuts`

    ![](./Imagenes/habilitar_cp_gitbash2.png)

4.  Prueba los nuevos cambios. Asegúrate de que puedes seleccionar y
    copiar texto usando `Ctrl + Shift + c` y pegar texto usando
    `Ctrl + Shift + v`.

**Si estás trabajando en Linux:** Este comportamiento está habilitado
por defecto en Linux. Prueba que puedes copiar usando `Ctrl + Shift + c`
y pegar usando `Ctrl + Shift + v` en tu emulador de terminal. Si no es
posible consulta al personal docente.

**Si estás trabajando en Mac:** Este comportamiento está habilitado
usando la forma usual de copiar y pegar en Mac. `⌘ + c` para copiar y
`⌘ + v` para pegar. Prueba que las combinaciones produzcan el
funcionamiento esperado, si no es así consulta al personal docente.

## Navegación del sistema de archivos

Ten un archivo de texto a la mano (NO uses un documento de Word). A
medida que avances en los ejercicios registra los comandos utilizados.
Es buena práctica hacer anotaciones y comentarios de los comandos que
usas, utiliza el caracter `#` para crear comentarios en tus archivos de
texto.

1.  Crea un directorio de trabajo en una ubicación a la que puedas
    acceder fácilmente y asegúrate que puedes acceder a él usando la
    interfaz gráfica y la línea de comandos.

2.  Navega hacia tu directorio de trabajo usando la línea de comandos y
    descarga allí el archivo
    [`linea_comando.zip`](https://github.com/juanenciso14/genomica_biodiversidad/blob/master/material/linea_comando.zip?raw=true)
    usando `wget`.

    Renombra el archivo usando la opción `-O` de `wget` seguida del
    nombre que le quieres dar al archivo. Si no lo renombras tendrá la
    extensión `?raw=true`, la cual no queremos.

3.  Descomprime el archivo que descargaste usando la herramienta
    `unzip`. Qué resulta de hacer esta operación? Qué tipo de objeto es
    `linea_comando`?

4.  Ve a tu carpeta home :house:.

5.  Ve a la carpeta `linea_comando` usando una <u>ruta absoluta</u>.

6.  Ve al directorio `carpeta_4` dentro de `linea_comando` usando una
    <u>ruta relativa</u>.

7.  Usando un solo comando y una <u>ruta relativa</u> ve al directorio
    `ssubcarpeta2.2.2`. Cuál es la ruta absoluta al directorio?

8.  Usando un solo comando y una <u>ruta relativa</u> ve al directorio
    `subCarpeta1.2`

9.  Usando un solo comando y la <u>ruta absoluta</u> ve a
    `subCarpeta3.1`

10. Vuelve a :house: utilizando una ruta relativa

## Creación de directorios y archivos

-   [ ] Replica la creación de `linea_comando` con todo su contenido.
    Algunos archivos están vacíos y otros contienen texto plano. Replica
    el contenido de estos archivos usando un editor de texto o el
    comando `echo` y el operador de re-dirección. Documenta en tu
    archivo de comandos todos los pasos que seguiste para crear
    `linea_comando`.

    ![](./Imagenes/tree_linea_comando.png)

## <span class="todo TODO">TODO</span> Programas disponibles en tu máquina

-   [ ] Comenta qué diferencias observas con herramientas disponibles en
    los sistemas de tus compañeros de grupo. Todos tienen las mismas
    herramientas disponibles? Todos tienen la herramienta `man`
    disponible?

-   [ ]

<!-- -->

-   [ ]

## <span class="todo TODO">TODO</span> Copia, movimiento y deleción de contenido

# <span class="todo TODO">TODO</span> Unix no tan básico

## <span class="todo TODO">TODO</span> 

## <span class="todo TODO">TODO</span> 

# <span class="todo TODO">TODO</span> Trabajando en el cluster de cómputo (CENTAURO)

## Conexión al cluster

Usaremos el programa `ssh` ([secure
shell](https://www.ssh.com/academy/ssh)) para conectarnos a CENTAURO
desde nuestra máquina. El ejemplo que veremos usa [Git Bash
(Windows)](https://gitforwindows.org/). La sintáxis para Linux y Mac (OS
X) es la misma.

1.  Descarga y copia la llave de acceso (archivo `.pem`) en una ruta que
    conozcas y a la que puedas acceder fácilmente. En este caso yo creé
    una carpeta llamada `Trabajo` y otra llamada `clstr` dentro de
    `Trabajo` en la ruta `/c/Usuarios/juand/`.

    ![](./Imagenes/ruta_archivo_pem.png)

2.  Abre una nueva ventana de `Git Bash` o del emulador de terminal con
    el que estés trabajando. Navega tu sistema usando los comandos
    aprendidos para moverte en el sistema de archivos. Ve a la carpeta
    en donde pusiste tu llave de acceso. Haz una lista de los archivos
    en la carpeta, ves la llave `.pem` dentro de esa carpeta?

3.  Utiliza secure shell (`ssh`) para abrir una conexión remota a
    Centauro. Utiliza la opción `-i` para especificar la ruta a la llave
    `.pem` y la opción `-p` para especificar el puerto de acceso
    (53841). A continuación especifica tu nombre de usuario asignado
    seguido de un `@` y finaliza con la dirección pública del cluster
    (`loginpub-hpc.urosario.edu.co`). Observa el ejemplo en la imagen,
    en este caso me estoy conectando desde mi carpeta `home` (`~`).

    ![](./Imagenes/conexion_centauro.png)

4.  Verifica que la conexión fue exitosa. Deberías observar el siguiente
    texto en pantalla:

    ![](./Imagenes/conexion_exitosa.png)

    Si no logras conectarte con éxito contacta al personal docente.

## <span class="todo TODO">TODO</span> Ambiente de trabajo

## <span class="todo TODO">TODO</span> Módulos

## <span class="todo TODO">TODO</span> La cola de trabajo

## <span class="todo TODO">TODO</span> Descarga de archivos de secuencia

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
Identificador de secuencia. **En tu máquina local haz lo siguiente**.

1.  Escoge uno de los individuos y copia su identificador de secuencia.

2.  Ve al [sitio web de EBI](https://www.ebi.ac.uk/) y pega el
    identificador en el buscador, como lo muestra la imagen.

    ![](./Imagenes/busca_EBI_1.png)

    Presiona el botón de búsqueda.

3.  En la lista de resultados haz click en el identificador
    correspondiente al primer resultado

    ![](./Imagenes/busca_EBI_2.png)

4.  En la siguiente página encuentras una sección con la información de
    la muestra, la plataforma en la que fue secuenciada y las
    características de la librería usada. En particular fíjate en los
    items **Library Layout**, **Library Strategy** y **Library Source**
    ¿Te dicen algo sobre los datos que vas a descargar?

    Ve al fondo de la página a la sección `Read Files`. En la tabla
    verás 7 columnas, la última (Generated FASTQ files: FTP) contiene
    los enlaces que usaremos para la descarga ¿Por qué hay dos enlaces
    si solo tenemos una muestra?

    ![](./Imagenes/busca_EBI_3.png)

5.  Vamos a descargar la información de **ambos** enlaces; necesitamos
    ambas piezas de información. Haz click derecho en cada uno de los
    enlaces, cópialos (copiar enlace) y pégalos en tu archivo de
    comandos.

6.  **Ve ahora al cluster, a tu carpeta de trabajo.** Crea un directorio
    llamado `descarga_muestras` y entra en él.

7.  Para esta tarea no enviaremos los trabajos a la cola porque <u>los
    nodos de trabajo no están conectados a internet</u> y no pueden
    realizar descargas. Usaremos un programa llamado `screen` en el nodo
    maestro. `screen` nos permite dejar una tarea ejecutándose y nos da
    la posibilidad de desacoplar nuestra sesión para que el trabajo se
    siga ejecutando aún cuando nos desconectemos del cluster. Escribe
    `screen -S <sesion>` en donde `<sesion>` debe ser reemplazado por el
    nombre que quieras darle a la sesión de descarga. Por ejemplo puedes
    llamarla `descarga_NGS`. Verás que se abre una nueva sesión de
    trabajo.

8.  En esta sesión nueva usarás `wget` para descargar uno de los dos
    archivos de secuencias de NGS que encontramos en ENA. La sintáxis
    recomendada para descargar este archivo con `wget` es la siguiente:

    `wget -O <nombre.de.archivo> <ruta/de/enlace>`

    En donde `<nombre.de.archivo>` es el nombre con el que quieres
    guardar el archivo en el cluster y `<ruta/de/enlace>` es una de las
    dos rutas que copiaste en tu editor de texto.

    Dale un nombre informativo a tu archivo. Puedes usar la información
    que encuentras en
    [`lista_muestras_descarga.txt`](./material/lista_muestras_descarga.txt)
    de la siguiente forma: `especie.subespecie.R1.fastq.gz` o
    `especie.subespecie.R2.fastq.gz` dependiendo de si bajas el primer
    (<sub>1</sub>) o el segundo (<sub>2</sub>) conjunto de secuencias.

9.  Ejecuta la línea que acabas de escribir. Asegúrate de que estás
    haciendo la descarga, puedes verificar que la descarga se está
    haciendo si no observas errores y `wget` imprime en pantalla algo
    como esto:

    ![](./Imagenes/busca_EBI_4.png)

10. Como puedes ver estos archivos toman bastante tiempo para descargar,
    es por eso que usamos `screen`; si nos desconectáramos así nada más
    perderíamos la descarga y nos tocaría iniciar nuevamente. Presiona
    `Ctrl + a` y luego `d` para desacoplar la sesión y dejar a `wget`
    trabajando después de que te desconectes. Verifica con un instructor
    que tu procedimiento de descarga funciona y que puedes desacoplar tu
    sesión de `screen`.
