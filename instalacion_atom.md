<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
# Índice

- [Descargando los tutoriales de GitHub](#descargando-tutoriales)
- [Instalación de Atom](#instalación-de-atom)
  - [Descargando e instalando Atom](#descargando-e-instalando-atom)
  - [Interfaz de Atom y Markdown](#interfaz-de-atom-y-markdown)  
- [Markdown](#markdown)
  - [¿Por qué utilizar Markdown?](#porque_markdown)
  - [Markdown Sintaxis Básica](#markdown_syntax)
  - [Exportando Markdown a PDF](#exportando-markdown-a-pdf)

<!-- markdown-toc end -->

# Descargando los tutoriales de GitHub <a name = "descargando-tutoriales"></a>

Hay dos formas posibles de descargar los tutoriales de nuestro curso:  
1. Ir al repositorio en [GitHub con el material](https://github.com/juanenciso14/genomica_biodiversidad), haga clic en el botón verde "Code" y luego "Download Zip".Esto guardará un archivo zip en su computadora. Encuéntrelo y descomprímalo -  se convertirá en una carpeta llamada "genomica_biodiversidad" con todos los tutoriales que necesitaremos durante esta semana.

2. Si tiene git en su computadora, usando la terminal puede navegar a la carpeta que desea tener la carpeta con los tutoriales y hacer:  
`git clone https://github.com/juanenciso14/genomica_biodiversidad.git`  
El comando `git clone` lo usaremos en el clúster otras veces, por lo que tendrás la oportunidad de practicarlo sin tener que instalarlo en tu máquina. No veremos otras funcionalidades de `git` durante el curso. Pero si estás interesado en aprender más sobre él, hay varios tutoriales disponibles online, como este [video](https://www.youtube.com/watch?v=RGOj5yH7evk) y [este curso](https://swcarpentry.github.io/git-novice/).

<center>Ahora estamos listos para empezar :smile:</center>

# Instalación de Atom

Existen muchos y muy buenos editores de texto para distintos sistemas.
Atom es el editor recomendado para utilizar en este curso por su
facilidad de instalación y configuración y su funcionamiento consistente
en varias plataformas. Vamos a instalar Atom y a revisar de forma muy
básica cómo usar algunas de sus funcionalidades. El proceso está
ilustrado en Windows pero debería funcionar muy similarmente en Linux o
macOS.

## Descargando e instalando Atom

Ingresa al [sitio web de Atom](https://atom.io/) y descarga el
instalador para tu sistema operativo.

![](./Imagenes/atom_page.png)

Asegúrate de descargarlo en una ruta conocida desde donde lo puedas ejecutar e
instálalo siguiendo los pasos del ejecutable que descargaste.

## Interfaz de Atom y Markdown

Ejecuta Atom en tu máquina. Atom es capaz de manejar varios tipos de
archivo por defecto y puede usar colores para facilitar la distinción de
varios elementos de sintáxis de algunos lenguajes.

En particular, Atom puede manejar bien los archivos tipo Markdown
(`.md`).

![](./Imagenes/atom_interfaz2.png)

Vamos abrir en Atom la carpeta que acabamos de descargar con los tutoriales de este curso. Vaya a `File > Add Project Folder`, navegue hasta la carpeta del curso y haga clic en Open. En la barra de la izquierda se mostrarán todos los archivos y carpetas que tenemos en esta carpeta.

Abre un archivo de Markdown (extensión `.md`) que esta en esta barra de la izquierda.

Mira la esquina inferior derecha; en esta parte Atom te dice
qué tipo de gramática está usando para interpretar el texto de tu
archivo.

![](./Imagenes/atom_gramatica.png)

Normalmente el editor es capaz de inferir la gramática automáticamente
pero si no, puedes hacer click en la sección a la que apunta la flecha y
escoger la gramática que quieres para tu archivo. Haz click y escoge
Markdown.

Atom ofrece la opción de pre-visualización de Markdown en el editor
usando la combinación `Ctrl + Shift + m`.

# Markdown <a name = "markdown"></a>

[Markdown](https://www.markdownguide.org/getting-started/) es un lenguaje que puede usar para agregar elementos de formato a documentos de texto sin formato. En una aplicación como Word, hace clic en los botones para formatear palabras y frases, y los cambios son visibles de inmediato. Markdown no es así. Cuando se crea un archivo con formato de Markdown (`.md`), se agrega la sintaxis de Markdown al texto para indicar qué palabras y frases deben verse diferentes.

Por ejemplo, para indicar un encabezado, agregue un signo de número antes de él (por ejemplo, # Encabezado uno). O para poner una frase en negrita, agregue dos asteriscos antes y después (por ejemplo, **este texto está en negrita**).

## ¿Por qué utilizar Markdown? <a name = "porque_markdown"></a>

Quizás se pregunte por qué la gente usa Markdown en lugar de un editor "normal". ¿Por qué escribir con Markdown cuando puede presionar botones en una interfaz para formatear su texto? Resulta que hay un par de razones diferentes por las que la gente usa Markdown:
- Se puede utilizar para todo. La gente lo usa para crear sitios web, documentos, notas, libros, presentaciones, mensajes de correo electrónico y documentación técnica.
- Es portátil. Los archivos que contienen texto con formato Markdown se pueden abrir utilizando prácticamente cualquier aplicación.
- Es independiente de la plataforma. Puede crear texto con formato Markdown en cualquier dispositivo que ejecute cualquier sistema operativo.
- puede convertir en varios tipos de archivos, como .pdf, .HTML y muchos otros.

Aquí usaremos Markdown para editar los tutoriales con nuestras propias notas y al final los exportaremos a formato pdf.

## Markdown Sintaxis Básica <a name = "markdown_syntax"></a>

Hay varias Markdown *cheat sheets* disponibles, algunas interesantes para mirar son: [esta](https://www.markdownguide.org/cheat-sheet/) y [esta](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf).  

Aquí veremos la sintaxis básica que usamos para hacer estos tutoriales.

Los comandos básicos para recordar son:  
- Encabezamiento: # H1 ## H2 ### H3
- Negrito: **bold** o __bold__
- Itálico: *itálico* o _itálico_
- Blockquote: > blockquote  
- Lista no ordenada:
  - lalala
  - lala
- Lista ordenada:
  1. lalala
  2. lalala
- Código: `lalala`
- Regla horizontal: ---
- Link: [titulo](https://www.example.com)
- Imagen:
  - de un archivo: ![texto](ruta_de_la_imagen.png)

  - de la internet: ![texto](https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Markdown-mark.svg/1280px-Markdown-mark.svg.png)

Para empezar, en grupos vamos hacer [esto ejercício](https://www.markdowntutorial.com/es/).  
Después de terminar, abra un nuevo archivo en Atom y juegue un poco con la sintaxis de Markdown copiando un texto de [aquí](https://www.zendalibros.com/los-30-mejores-poemas-en-espanol/) para formatear de la manera que desee (abriendo el *preview* para mirar). Salve el archivo en formato `.md`.

Se tu te olvidas de la sintaxis no hay lío! Puedes escribir como un archivo de texto 😉

## Exportando Markdown a PDF

La conversión de Markdown a PDF es un procedimiento bastante común y vamos a
necesitar hacerla algunas veces. Atom es una aplicación modular, lo que
significa que puedes extender su funcionalidad instalando nuevos paquetes. Para
convertir Markdown a PDF necesitamos instalar un paquete nuevo llamado
`makrdown-pdf` (:astonished: vaya sorpresa). Sigue las instrucciones en la
imagen para instalarlo, es sencillo.

![](./Imagenes/instrucciones_markdown_pdf.png)

Después de instalado exporta el archivo que tu generó en el paso anterior de Markdown a PDF. En el menú superior haz click en `Packages` \> Markdown to PDF \> Convert, como lo muestra la imagen.

![](./Imagenes/atom_markdown_a_pdf.png)

Deberías ver un recuadro verde en la parte superior derecha que te dice
que la conversión se hizo con éxito.

Examina el PDF que acabas de crear en tu explorador de archivos.
