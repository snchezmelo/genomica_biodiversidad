---
---

# <span class="todo TODO">TODO</span> Análisis poblacionales por sitios y ventanas

## Motivación y explicación

EL índice de fijación F<sub>ST</sub> es una medida de separación entre
grupos de individuos. En teoría F<sub>ST</sub> varía entre 0 y 1 en
donde 0 representa la ausencia de distancia genética entre poblaciones,
mientras que 1 significa que las poblaciones están totalmente separadas.

La diferenciación entre poblaciones puede variar a lo largo del genoma;
dos poblaciones pueden ser casi idénticas en una región y tener una
fuerte diferenciación en otra. Las regiones del genoma con evidencia de
divergencia fuerte son interesantes; podrían potencialmente albergar
genes que permitan a las poblaciones adaptarse a diferentes ambientes,
dependiendo de los alelos que tengan. En este caso la exploración de
estos patrones a lo largo del genoma se vuelve interesante.

El estimado que usaremos está basado en el método de [Weir y Cockerham
(1984)](https://www.jstor.org/stable/2408641). Este método esencialmente
estima las varianzas genéticas entre poblaciones (P), individuos de una
población (I) y genotipos de un individuo (G). Luego utiliza la
siguiente expresión para estimar el índice de fijación entre
poblaciones:

<img src="https://render.githubusercontent.com/render/math?math=\huge F_{ST} = \frac{\sigma_{P}^{2}}{\sigma_{P}^{2} %2B \sigma_{I}^{2} %2B \sigma_{G}^{2}}">

## Calculando índice de fijación F<sub>ST</sub> por sitio

Requerimientos computacionales: TBD

1.  **Preparando los datos**

    Para este análisis ya tenemos una gran parte preparada; nuestro
    archivo de genotipos ya fue filtrado en un paso anterior. Vamos a
    usar `vcftools` para analizar la estructura por ventana usando este
    archivo y otras piezas de información.

    Necesitamos preparar archivos de texto en los que especificamos la
    población a la que pertenece cada muestra. Usando `nano` crea un
    archivo por población. Cada archivo debe tener una columna con los
    identificadores de las muestras que pertenecen a determinada
    población tal y como aparecen en la línea `#CHROM` del archivo
    `vcf`. Para este análisis ignora a las muestras de especies
    'silvaniformes', utiliza solo las dos poblaciones de *H. timareta* y
    la población de *H. melpomene* (3 poblaciones en total). Estas
    poblaciones son más cercanas genéticamente entre sí que cualquiera
    de ellas con las silvaniformes.

2.  **Estimando la estructura a lo largo de Hmel218003o**

    Utiliza `vcftools` con las opciones `--weir-fst-pop <archivo
            identidades>`. Revisa [la documentación de
    `vcftools`](https://vcftools.github.io/man_latest.html) para
    informarte sobre cómo comparar individuos de dos poblaciones. En
    teoría puedes estimar la estructura genética entre más de dos grupos
    pero la interpretación de los resultados se vuelve compleja, por eso
    vamos a comparar **pares de poblaciones**. Recuerda especificar un
    prefijo para tu archivo de salida con la opción `--out <prefijo>`.

    <details>
    <summary> Trata de construir la línea de comando por tu cuenta. Si no puedes avanzar mira el código aquí </summary>

    ``` shell
    # comparacion timaretas: florencia thelxinoe
    vcftools --gzvcf heliconius.optixscaf.SNPS.NV.FL2.vcf.gz \
             --weir-fst-pop tim_fln_ids.txt --weir-fst-pop tim_thx_ids.txt \
             --out fln_thx_fst.SITIO

    # comparacion malleti florencia
    vcftools --gzvcf heliconius.optixscaf.SNPS.NV.FL2.vcf.gz \
             --weir-fst-pop tim_fln_ids.txt --weir-fst-pop melp_mallet_ids.txt \
             --out mallet_fln_fst.SITIO

    # comparacion malleti thelxinoe
    vcftools --gzvcf heliconius.optixscaf.SNPS.NV.FL2.vcf.gz \
             --weir-fst-pop tim_thx_ids.txt --weir-fst-pop melp_mallet_ids.txt \
             --out mallet_thx_fst.SITIO
    ```

    </details>

3.  **Examinando los resultados:**

    Examina los archivos de texto que resultaron de estimar
    F<sub>ST</sub> por sitios con `vcftools`.

    Responde a las preguntas:

    -   [ ] ¿Qué estructura tienen los archivos (número de filas y
        columnas, encabezado)?

    -   [ ] ¿Qué inforamción puedes identificar en ellos (contenido de
        cada columna)?

    -   [ ] ¿Cuántos estimados de estructura aparecen?

    -   [ ] ¿Qué valores aparecen más frecuentemente? ¿Cuál piensas que
        es la razón por la que observamos estos valores?

4.  **Visualizando F<sub>ST</sub> por sitio a lo largo de Hmel218003o**

    Antes de importar los datos a `R` vamos a procesar nuestro archivo
    para ignorar los valores no numéricos. De esta forma podemos
    procesar los datos un poco más fácil en `R`. Usa `grep` para excluir
    las posiciones con valores no numéricos y guarda el resultado en un
    nuevo archivo.

    Carga la librería `tidyverse` y los datos en `R`.

    ``` r
    ### limpia el ambiente de trabajo
    rm(list=ls())

    library(tidyverse)

    ### carga los datos
    fst_site <- read_tsv("archivo.weir.fst")

    ### recuerda cargar las tres comparaciones
    ```

    Ahora debemos agregarle una nueva columna a cada uno de los
    dataframes que indique la comparación que estamos haciendo. Puedes
    hacerlo usando la función
    [`mutate`](https://dplyr.tidyverse.org/reference/mutate.html) de
    `tidyverse`. En la nueva columna incluye el nombre de la comparación
    tantas veces como filas tenga el dataframe. Puedes hacer esto usando
    las funciones `rep` y `nrow`. `nrow(dataframe)` te debería dar el
    número de filas en el dataframe. Haz esto para los tres marcos de
    datos.

    <details>
    <summary> Trata de escribir el código por tu cuenta. Si no puedes avanzar mira el código aquí </summary>

    ``` r
    ###
    ### mutate le agrega la columna COMP al dataframe fst_site
    ### la columna que agrega es "comparacion" repetida nrow(fst_site) veces
    fst_site <- mutate(fst_site, COMP=rep("comparacion", nrow(fst_site)))
    ```

    </details>

    Junta los datos usando la función `rbind`. La función `rbind` junta
    las filas de los dataframes que entran como parámetro.

    <details>
    <summary> Si necesitas pistas de cómo hacerlo puedes ver el código aquí </summary>

    ``` r
    ### rbind une los datos de las tres comparaciones
    ### de forma vertical
    fst_todos <- rbind(fst_site1, fst_site2, fst_site3)
    ```

    </details>

    Pinta los datos uisando `ggplot`. Haz un gráfico de puntos
    (`geom_point()`) con la posición en `Hmel218003o` en el eje x y el
    índice de fijación por sitio en el eje y. En mi caso pinté las
    diferentes comparaciones usando diferentes colores. Puedes también
    pintarlas en paneles independientes usando la función `facet_wrap`.

    <details>
    <summary> Si necesitas pistas de cómo hacerlo puedes ver el código aquí </summary>

    ``` r
    ### Pintamos un grafico de puntos dandole colores diferentes a cada
    ### comparacion
    ggplot(data=fst_todos, aes(x=POS, y=WEIR_AND_COCKERHAM_FST, color=COMP)) +
      geom_point() + theme_bw() +
      labs(x="Posicion en Hmel218003o", y=expression("F"["ST"]))
    ```

    </details>

    Observemos la gráfica:

    ![](./Imagenes/fst_plot_site.png)

    Se ve terrible! :fearful: No podemos distinguir muchos detalles a lo
    largo de la región examinada.

    -   [ ] ¿Qué valores u observaciones se ven extrañas o incorrectas?

    -   [ ] ¿Qué podemos hacer para conservar solo los valores que
        tengan sentido?

    -   [ ] ¿Cómo podemos mejorar la visualización?

    ![](./Imagenes/fst_sitio_facets.png)

    -   [ ] ¿Podemos hacer inferencias basados en esta nueva versión?
        ¿Qué comparaciones muestran mayores índices de fijación en
        general?

## Calculando índice de fijación F<sub>ST</sub> por ventana

Requerimientos computacionales: TBD

1.  **Preparando los datos**

    En este caso los archivos de entrada son los mismos que cuando
    calculamos F<sub>ST</sub> por sitio.

2.  **Estimando la estructura a lo largo de Hmel218003o**

    Utiliza `vcftools` con las opciones
    `--weir-fst-pop <archivo identidades>`
    `--fst-window-size <tamaño ventana>`
    `--fst-window-step <tamaño paso>` para correr el análisis usando
    ventanas de un tamaño determinado por `<tamaño ventana>`, dando
    pasos que miden `<tamaño paso>` a lo largo del scaffold. Para
    empezar, usa un tamaño de ventana de 10000 bases y un tamaño de paso
    de 5000 bases. Recuerda qué información debes incluir para comparar
    dos poblaciones. Recuerda especificar un prefijo para tu archivo de
    salida con la opción `--out <prefijo>`.

    <details>
    <summary> Trata de construir la línea de comando por tu cuenta. Si no puedes avanzar mira el código aquí </summary>

    ``` shell
    # comparacion timaretas
    vcftools --gzvcf heliconius.optixscaf.SNPS.NV.FL2.vcf.gz \
             --weir-fst-pop tim_fln_ids.txt --weir-fst-pop tim_thx_ids.txt \
             --fst-window-size 10000 --fst-window-step 5000 --out fln_thx_fst

    # comparacion malleti florencia
    vcftools --gzvcf heliconius.optixscaf.SNPS.NV.FL2.vcf.gz \
             --weir-fst-pop tim_fln_ids.txt --weir-fst-pop melp_mallet_ids.txt \
             --fst-window-size 10000 --fst-window-step 5000 --out mallet_fln_fst

    # comparacion malleti thelxinoe
    vcftools --gzvcf heliconius.optixscaf.SNPS.NV.FL2.vcf.gz \
             --weir-fst-pop tim_thx_ids.txt --weir-fst-pop melp_mallet_ids.txt \
             --fst-window-size 10000 --fst-window-step 5000 --out mallet_thx_fst
    ```

    </details>

3.  **Examinando los resultados: Ventanas a lo largo de Hmel218003o**

    Examina los archivos de texto que resultaron de estimar
    F<sub>ST</sub> por ventanas con `vcftools`.

    Responde a las preguntas:

    -   [ ] ¿Qué estructura tienen los archivos (número de filas y
        columnas, encabezado)?

    -   [ ] ¿Qué inforamción puedes identificar en ellos (contenido de
        cada columna)?

    -   [ ] ¿Cuántos estimados de estructura aparecen?

    -   [ ] ¿Observas diferencias entre los dos estimados de estructura?

4.  **Visualizando F<sub>ST</sub> a lo largo de Hmel218003o**

    Graficar los resultados por ventana es muy similar a como lo hicimos
    por sitio. Carga la librería `tidyverse` y los datos en `R`.

    ``` r
    ### limpia el ambiente de trabajo
    rm(list=ls())

    library(tidyverse)

    ### carga los datos
    fst_site <- read_tsv("archivo.weir.ventanas.fst")

    ### recuerda cargar las tres comparaciones
    ```

    Ahora debemos agregarle una nueva columna a cada uno de los
    dataframes que indique la comparación que estamos haciendo. Puedes
    hacerlo usando la función
    [`mutate`](https://dplyr.tidyverse.org/reference/mutate.html) de
    `tidyverse`. En la nueva columna incluye el nombre de la comparación
    tantas veces como filas tenga el dataframe. Puedes hacer esto usando
    las funciones `rep` y `nrow`. `nrow(dataframe)` te debería dar el
    número de filas en el dataframe. Haz esto para los tres marcos de
    datos.

    <details>
    <summary> Trata de escribir el código por tu cuenta. Si no puedes avanzar mira el código aquí </summary>

    ``` r
    ###
    ### mutate le agrega la columna COMP al dataframe fst_site
    ### la columna que agrega es "comparacion" repetida nrow(fst_site) veces
    fst_site <- mutate(fst_site, COMP=rep("comparacion", nrow(fst_site)))
    ```

    </details>

    Junta los datos usando la función `rbind`. La función `rbind` junta
    las filas de los dataframes que entran como parámetro.

    <details>
    <summary> Si necesitas pistas de cómo hacerlo puedes ver el código aquí </summary>

    ``` r
    ### rbind une los datos de las tres comparaciones
    ### de forma vertical
    fst_todos <- rbind(fst_site1, fst_site2, fst_site3)
    ```

    </details>

    Pinta los datos uisando `ggplot`. Haz un gráfico de línea
    (`geom_line()`) o de punto (`geom_point()`).Usa la posición de
    inicio o fin de ventana en el eje x y el índice de fijación por
    sitio en el eje y. En mi caso pinté las diferentes comparaciones
    usando diferentes colores. Puedes también pintarlas en paneles
    independientes usando la función `facet_wrap`.

    <details>
    <summary> Si necesitas pistas de cómo hacerlo puedes ver el código aquí </summary>

    ``` r
    ### Pintamos un grafico de puntos dandole colores diferentes a cada
    ### comparacion
    ggplot(data=fst_todos, aes(x=POS, y=WEIR_AND_COCKERHAM_FST, color=COMP)) +
      geom_point() + theme_bw() +
      labs(x="Posicion en Hmel218003o", y=expression("F"["ST"]))
    ```

    </details>

    Observemos la gráfica:

    ![](./Imagenes/fst_ventana_10k.png)

    Responde a las preguntas:

    -   [ ] ¿Qué poblaciones tienen un menor nivel de estructuración
        entre sí?

    -   [ ] ¿Qué poblaciones tienen un mayor nivel de estructuración
        entre sí?

    -   [ ] ¿Qué explicación puede tener esta diferencia entre
        comparaciones?

    -   [ ] ¿Hay alguna región de `Hmel218003o` en donde los patrones
        observados se comportan de forma inesperada?

    <details>
    <summary> Mira una versión mejorada aquí ¿Qué cambios harías en el análisis para lograr una versión así? </summary>

    ![](./Imagenes/fst_ventana_50k.png)

    </details>

## <span class="todo TODO">TODO</span> Otros estadísticos poblacionales

## <span class="todo TODO">TODO</span> Estadísticos de selección

# <span class="todo TODO">TODO</span> Introgresión

## <span class="todo TODO">TODO</span> Motivación y explicación

## <span class="todo TODO">TODO</span> Estadísticas D: Explicación

## <span class="todo TODO">TODO</span> Referencias importantes

# <span class="todo TODO">TODO</span> Introgresión: Estimados globales a nivel genómico

## <span class="todo TODO">TODO</span> Herramientas de estimación

## <span class="todo TODO">TODO</span> Significancia estadística

## <span class="todo TODO">TODO</span> Fracción del genoma compartida entre especies

## <span class="todo TODO">TODO</span> Aplicación: Especiación con flujo genético

# <span class="todo TODO">TODO</span> Introgresión: Estimados por ventana

## <span class="todo TODO">TODO</span> Evolución de la adaptación

## <span class="todo TODO">TODO</span> Análisis por ventanas

## <span class="todo TODO">TODO</span> Regiones con sobrerrepesentación de patrones ABBA/BABA
