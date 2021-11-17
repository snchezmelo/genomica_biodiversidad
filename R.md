# R
1. [Instalando y cargando paquetes](#paquetes)
2. [Setando directorio](#directorio)
3. [Leyendo data](#read_csv)
4. [Manipulando datos](#manipulando)
5. [Graficos con ggplot](#ggplot)

---
En grupos vamos recordar las principales herramientas que necesitaremos en R para este curso. Intente realizar las actividades abajo y avísenos si tiene alguna pregunta.

## 1. Instalando paquetes <a name = "paquetes"></a>
En este curso solo necesitaremos dos paquetes en R: `ggplot` y` tidyverse`. Es posible que algunos de ustedes ya los tengan, dado que se usan ampliamente. Compruebe si tiene estos paquetes y, si no los tiene, instálelos.

Abra una ventana de *script* y cargue los dos paquetes.

## 2. Setando directorio <a name = "directorio"></a>
En la ventana de *script*, configure la carpeta *material*, descargada de GitHub, para que sea su directorio de trabajo.

Listar todos los archivos en este directorio y solo los *.txt*.

## 3. Leyendo data <a name = "read_csv"></a>
Lee en R a una variable la tabla: *genes_ch1_mus_musculus.txt*

> PREGUNTA: ¿Cuántas columnas y líneas hay en esta tabla?

## 4. Manipulando datos <a name = "manipulando"></a>
Consulte el encabezado de esta tabla. Las columnas no tienen nombre, así que agregue "scaf" y "gen" como nombres para las columnas.

**_Pipes:_**  
[*Pipes*](https://style.tidyverse.org/pipes.html) `%>%` se usa ampliamente para manipulaciones de datos y se carga automáticamente con Tidyverse. El operador *pipe* se utiliza para ejecutar múltiples operaciones que están en secuencia y requieren la salida de la operación anterior como argumento de entrada. Entonces, la ejecución comienza desde el lado izquierdo con los datos como el primer argumento que se pasa a la función a su derecha y así sucesivamente. De esta manera se puede lograr una serie de manipulación de datos en un solo paso.

Ahora vamos usar *pipe* para hacer dos operaciones:
1. use la función del paquete *tidyverse* `rename` para cambiar el nombre de las columnas a: "Scaffold" y "Gene"
2. generar una nueva columna llamada "*Combined*" que combine las columnas *Scaffold* y *Gene* separados por un "_", por ejemplo: ENSMUSG00000051951_Xkr4.

Ahora aumentemos la dificultad. Descomprima el archivo "Mus_musculus.GRCm38.75_chr1.gtf.gz" y léalo en R. Recuerde mirar primero el archivo y considerar algunas líneas diferentes que el archivo puede tener al principio.

>**Tip:** use la función `read_table2`, pero busque el motivo.

Ahora cree una tabla con el recuento del número de veces que apareció cada categoría en la columna "X3".

## 5. Graficos con ggplot <a name = "ggplot"></a>
Para terminar recordemos un poco de `ggplot`. Para eso, hagamos un gráfico de barras de las categorías en la columna "X3".

>**Tip:** use `geom_bar(stat="identity")`
