<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
# Índice

- [Instalación de Atom](#instalación-de-atom)
    - [Descargando e instalando Atom](#descargando-e-instalando-atom)
    - [Interfaz de Atom y Markdown](#interfaz-de-atom-y-markdown)
    - [Exportando Markdown a PDF](#exportando-markdown-a-pdf)

<!-- markdown-toc end -->


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

Asegúrate de descargarlo en una ruta concida desde donde lo puedas
ejecutar.

## Interfaz de Atom y Markdown

Ejecuta Atom en tu máquina. Atom es capaz de manejar varios tipos de
archivo por defecto y puede usar colores para facilitar la distinción de
varios elementos de sintáxis de algunos lenguajes.

En particular, Atom puede manejar bien los archivos tipo Markdown
(`.md`).

![](./Imagenes/atom_interfaz2.png)

Abre un archivo de Markdown (extensión `.md`) en tu directorio de
trabajo. Mira la esquina inferior derecha; en esta parte Atom te dice
qué tipo de gramática está usando para interpretar el texto de tu
archivo.

![](./Imagenes/atom_gramatica.png)

Normalmente el editor es capaz de inferir la gramática automáticamente
pero si no, puedes hacer click en la sección a la que apunta la flecha y
escoger la gramática que quieres para tu archivo. Haz click y escoge
Markdown.

Atom ofrece la opción de pre-visualización de Markdown en el editor
usando la combinación `Ctrl + Shift + m`. Escribe texto usando sintaxis
de Markdown y activa la opción de pre-visualización.

## Exportando Markdown a PDF

Existen muchas herramientas para convertir textos entre varios formatos.
Hay muchos tipos de conversión; la conversión de Markdown a PDF es
bastante común. Atom es una aplicación modular, lo que significa que
puedes extender su funcionalidad instalando nuevos paquetes. Para
convertir Markdown a PDF necesitamos instalar un paquete nuevo llamado
`makrdown-pdf` (:astonished: vaya sorpresa). Sigue las instrucciones en
la imagen para instalarlo, es sencillo.

![](./Imagenes/instrucciones_markdown_pdf.png)

Después de instalado exporta tu arcchivo de Markdown a PDF. En el menú
superior haz click en `Packages` \> Markdown to PDF \> Convert, como lo
muestra la imagen.

![](./Imagenes/atom_markdown_a_pdf.png)

Deberías ver un recuadro verde en la parte superior derecha que te dice
que la conversión se hizo con éxito.

Examina el PDF que acabas de crear en tu explorador de archivos.
