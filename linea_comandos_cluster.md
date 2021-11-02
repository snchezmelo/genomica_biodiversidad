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
    usando `wget` o `curl`.

    Si usas `wget` renombra el archivo usando la opción `-O` seguida del
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

## <span class="todo TODO">TODO</span> Creación de directorios y archivos

-   [ ] Replica la creación de `linea_comando` con todo su contenido.
    Algunos archivos están vacíos y otros contienen texto plano. Replica
    el contenido de estos archivos usando un editor de texto o el
    comando `echo` y el operador de re-dirección. Documenta en tu
    archivo de comandos todos los pasos que seguiste para crear
    `linea_comando` y todo su contenido.

    ![](./Imagenes/tree_linea_comando.png)

## <span class="todo TODO">TODO</span> Programas disponibles en tu máquina

Comenta qué diferencias observas con herramientas disponibles en los
sistemas de tus compañeros de grupo. Todos tienen las mismas
herramientas disponibles? Todos tienen la herramienta `man` disponible?

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
