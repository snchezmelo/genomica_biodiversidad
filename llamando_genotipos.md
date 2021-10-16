
# &Iacute;ndice

1.  [Motivación](#org6b8b089)
2.  [Sub-muestreando los alineamientos](#org8670567)
    1.  [Extrayendo una región específica de los alineamientos](#org9f5c5bc)
3.  [Llamando genotipos](#org130afc7)
    1.  [Verosimilitudes de genotipos](#orgeac9583)
    2.  [Llamada de genotipos](#orgde25a6f)
4.  [Operaciones con archivos VCF/BCF](#org4abfcb4)
    1.  [El formato VCF](#orga8c0759)
    2.  [Qué veo en mi archivo de resultados?](#org1aa075a)
    3.  [Extrayendo información](#orgf7a76ae)
    4.  [Tipos de variantes](#orgc4e372e)
    5.  [Filtrando sitios](#org81a4c10)
        1.  [Calculando estadísticas en el set de datos](#orgf50d698)
        2.  [Analizando las estadísticas](#org55af6be)
        3.  [Aplicando los filtros al VCF](#org187388b)



<a id="org6b8b089"></a>

# TODO Motivación


<a id="org8670567"></a>

# Sub-muestreando los alineamientos


<a id="org9f5c5bc"></a>

## Extrayendo una región específica de los alineamientos

Recursos computacionales: 2 procesadores, 2 GB de memoria, ~10 min de
tiempo de ejecución.

En algunos casos estaremos interesados en extraer regiones específicas del
genoma en lugar de analizarlo completamente. En nuestro curso
particularmente queremos trabajar con algunos segmentos del genoma de
*Heliconius* por motivos prácticos; analizarlo todo nos tomaría mucho
tiempo aún con pocas muestras y además conocemos regiones en donde hay
genes interesantes. Para trabajar con una región específica del genoma
aprenderemos a extraer regiones de nuestro alineamiento. Esto debemos
hacerlo <span class="underline">muestra por muestra</span>. Usaremos `samtools` para esta tarea.

-   [ ] Crea un script de `bash` usando `nano` y solicita los recursos
    necesarios. No olvides cargar el módulo de `samtools`.

-   [ ] Dentro del script crea un ciclo `for` que itere sobre los alineamientos
    `.bam` que ya están ordenados y sin duplicados. Si no recuerdas cómo
    escribir un ciclo `for` en `bash` puedes consultarlo aquí <INSERTAR LINK>.

-   [ ] En cada iteración del ciclo debes llamar a `samtools view` con dos
    procesadores usando la opción `-@`. Debes usar la opción `-b` para que el
    archivo de salida tenga formato `bam` y debes especificar el nombre del
    archivo de salida usando la opción `-o`. Como argumentos para `samtools
         view` debes incluir primero el nombre del archivo `bam` original del que
    quieres extraer la región y luego debes especificar el nombre de la región
    que quieres extraer: La región que extraeremos corresponde al primer millón
    y medio de bases del scaffold `Hmel218003o` y la especificamos así:
    `Hmel218003o:1-1500000`. Dale una extensión informativa a cada archivo de
    salida: Estamos extrayendo parte del scaffold `Hmel218003o`; te sugerimos
    usar `C18S3` como parte del nombre de los archivos resultantes.
    
    Recuerda que la forma general de usar `samtools view` es:
    
        # Los argumentos dentro de los parentesis cuadrados [] son opcionales
        # Los argumentos dentro de los angulos <> son obligatorios
        samtools view [options] <in.bam>|<in.sam>|<in.cram> [region ...]

-   [ ] Dentro del ciclo `for`, después de extraer la región de interés es
    necesario crear un índice para cada archivo de salida. Esto lo podemos
    hacer usando `samtools index`.
    
    La forma general de usar `samtools index es`:
    
        # Los argumentos dentro de los parentesis cuadrados [] son opcionales
        # los argumentos dentro de los angulos <> son obligatorios
        samtools index [-@ threads] <in.bam>

-   [ ] **Atención!** Antes de enviar el trabajo a la cola muéstrale tu script a
    un monitor/instructor para verificar que no haya errores de sintáxis.

-   [ ] Envía el trabajo a la cola.


<a id="org130afc7"></a>

# TODO Llamando genotipos


<a id="orgeac9583"></a>

## TODO Verosimilitudes de genotipos


<a id="orgde25a6f"></a>

## TODO Llamada de genotipos

Recursos computacionales: 2 procesadores, 8 GB de memoria, ~20-25 min de
tiempo total de ejecución.

Vamos a hacer un paso conocido como "llamada de genotipos" usando los
alineamientos del scaffold `Hmel218003o` que extrajimos en la tarea
anterior. El resultado final será un archivo en el que cada base o posición
en el genoma aparece en una fila y cada una de nuestras muestras aparece en
una columna.

La estructura es similar a esta tabla, pero es un poco más compleja. Luego
veremos en detalle la estructura de este archivo.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">CHROM</th>
<th scope="col" class="org-right">POS</th>
<th scope="col" class="org-left">Muestra1</th>
<th scope="col" class="org-left">Muestra2</th>
<th scope="col" class="org-left">Muestra3</th>
<th scope="col" class="org-left">Muestra4</th>
<th scope="col" class="org-left">&#x2026;</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">Hmel218003o</td>
<td class="org-right">1</td>
<td class="org-left">0/0</td>
<td class="org-left">0/1</td>
<td class="org-left">0/0</td>
<td class="org-left">1/1</td>
<td class="org-left">&#x2026;</td>
</tr>


<tr>
<td class="org-left">Hmel218003o</td>
<td class="org-right">2</td>
<td class="org-left">0/0</td>
<td class="org-left">0/0</td>
<td class="org-left">0/0</td>
<td class="org-left">0/1</td>
<td class="org-left">&#x2026;</td>
</tr>


<tr>
<td class="org-left">Hmel218003o</td>
<td class="org-right">3</td>
<td class="org-left">0/1</td>
<td class="org-left">0/1</td>
<td class="org-left">0/1</td>
<td class="org-left">0/1</td>
<td class="org-left">&#x2026;</td>
</tr>


<tr>
<td class="org-left">Hmel218003o</td>
<td class="org-right">4</td>
<td class="org-left">0/0</td>
<td class="org-left">0/1</td>
<td class="org-left">0/1</td>
<td class="org-left">1/1</td>
<td class="org-left">&#x2026;</td>
</tr>


<tr>
<td class="org-left">Hmel218003o</td>
<td class="org-right">5</td>
<td class="org-left">0/1</td>
<td class="org-left">0/1</td>
<td class="org-left">0/1</td>
<td class="org-left">1/1</td>
<td class="org-left">&#x2026;</td>
</tr>


<tr>
<td class="org-left">Hmel218003o</td>
<td class="org-right">6</td>
<td class="org-left">0/0</td>
<td class="org-left">0/0</td>
<td class="org-left">0/1</td>
<td class="org-left">0/1</td>
<td class="org-left">&#x2026;</td>
</tr>


<tr>
<td class="org-left">&#x2026;</td>
<td class="org-right">&#x2026;</td>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
</tr>
</tbody>
</table>

-   [ ] 

-   [ ] 

-   [ ] 


<a id="org4abfcb4"></a>

# TODO Operaciones con archivos VCF/BCF


<a id="orga8c0759"></a>

## TODO El formato VCF


<a id="org1aa075a"></a>

## TODO Qué veo en mi archivo de resultados?


<a id="orgf7a76ae"></a>

## TODO Extrayendo información


<a id="orgc4e372e"></a>

## TODO Tipos de variantes


<a id="org81a4c10"></a>

## TODO Filtrando sitios

Usaremos [`vcftools`](https://vcftools.github.io/man_latest.html) para filtrar. Existen otras herramientas disponibles para
hacer esto, como `bcftools` o `GATK`. `vcftools` es razonablemente simple y
nos permite calcular algunas estadísticas sobre nuestras muestras para
decidir qué filtros aplicar. Podemos visualizar estas estadísticas en `R`
para facilitar el análisis. Recursos computacionales: 2 procesadores, 2 GB de
memoria, 30 min de tiempo total de ejecución (aprox.).


<a id="orgf50d698"></a>

### TODO Calculando estadísticas en el set de datos

-   [ ] **Preparando el análisis por sitios:** Es necesario modificar nuestro
    archivo de genotipos para poder aplicar filtros correctamente y hacer
    análisis posteriores de forma correcta; la mayoría de análisis y modelos
    en genética de poblaciones están diseñados considerando individualmente
    sitios con dos alelos.

-   [ ] **Calculando frecuencias alélicas:**
    
        vcftools --gzvcf heliconius.optixscaf.GT.vcf.gz --freq2 \
                 --out heliconius.optixscaf.2 --max-alleles 2
-   [ ] **Calculando profundidad promedio de secuenciación por individuo:**
-   [ ] **Calculando profundidad promedio de secuenciación por sitio:**
-   [ ] **Calculando calidad de inferencia de alelos (`QUAL`):**
-   [ ] **Calculando la proporción de datos perdidos por individuo:**
-   [ ] **Calculando la proporción de datos perdidos por sitio:**


<a id="org55af6be"></a>

### TODO Analizando las estadísticas

-   [ ] Visualizando la distribución de estadísticas en `R`
    
        ### cargamos el paquete ggplot2
        library(ggplot2)
        
        ### opcionalmente si tienes instalado tidyverse
        library(tidyverse)

-   [ ] **Estadísticas por sitio: Calidad de inferencia de alelos**

-   [ ] **Estadísticas por sitio: Profundidad promedio**

-   [ ] **Estadísticas por sitio: Datos perdidos**

-   [ ] **Estadísticas por sitio: Límite inferior para frecuencias alélicas**

-   [ ] **Estadísticas por individuo: Profundidad promedio**

-   [ ] **Estadísticas por individuo: Datos perdidos**


<a id="org187388b"></a>

### TODO Aplicando los filtros al VCF

-   [ ] 

-   [ ] 

-   [ ] 

