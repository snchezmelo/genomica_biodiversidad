---
---

# <span class="todo TODO">TODO</span> Análisis poblacionales por sitios y ventanas

## <span class="todo TODO">TODO</span> Motivación y explicación

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
expresión a continuación para estimar F<sub>ST</sub>:

<img src="https://render.githubusercontent.com/render/math?math=\huge\F_{ST} = frac{\sigma_{P}^{2}}{\sigma_{P}^{2} %2B \sigma_{I}^{2} %2B \sigma_{G}^{2}}">

## <span class="todo TODO">TODO</span> Calculando índice de fijación F<sub>ST</sub> por sitio

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

4.  **Visualizando F<sub>ST</sub> por sitio a lo largo de Hmel218003o**

## <span class="todo TODO">TODO</span> Calculando índice de fijación F<sub>ST</sub> por ventana

Requerimientos computacionales: TBD

1.  **Preparando los datos**

    En este caso la preparación es la misma que cuando calculamos
    F<sub>ST</sub> por sitio.

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
    F<sub>ST</sub> con `vcftools`.

    Responde a las preguntas:

    -   [ ] ¿Qué estructura tienen los archivos (número de filas y
        columnas, encabezado)?

    -   [ ] ¿Qué inforamción puedes identificar en ellos (contenido de
        cada columna)?

    -   [ ] ¿Cuántos estimados de estructura aparecen?

    -   [ ] ¿Observas diferencias entre los dos estimados de estructura?

4.  **Visualizando F<sub>ST</sub> a lo largo de Hmel218003o**

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
