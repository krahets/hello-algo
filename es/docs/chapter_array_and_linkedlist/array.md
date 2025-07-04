# Arreglo

Un <u>arreglo</u> es una estructura de datos lineal que funciona como una fila de elementos similares, almacenados juntos en la memoria de una computadora en espacios contiguos. Es como una secuencia que mantiene un almacenamiento organizado. Cada elemento de esta fila tiene su "lugar" único conocido como <u>índice</u>. Consulte la figura a continuación para observar cómo funcionan los arreglos y comprender estos términos clave.

![Definición de arreglo y método de almacenamiento](array.assets/array_definition.png)

## Operaciones comunes en arreglos

### Inicialización de arreglos

Los arreglos se pueden inicializar de dos maneras según las necesidades: sin valores iniciales o con valores iniciales especificados. Cuando no se especifican valores iniciales, la mayoría de los lenguajes de programación establecerán los elementos del arreglo en $0$:

=== "Python"

    ```python title="array.py"
    # Inicializar arreglo
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

### Acceso a elementos

Los elementos de un arreglo se almacenan en espacios de memoria contiguos, lo que simplifica el cálculo de la dirección de memoria de cada elemento. La fórmula que se muestra en la figura a continuación ayuda a determinar la dirección de memoria de un elemento, utilizando la dirección de memoria del arreglo (específicamente, la dirección del primer elemento) y el índice del elemento. Este cálculo agiliza el acceso directo al elemento deseado.

![Cálculo de la dirección de memoria para elementos de arreglo](array.assets/array_memory_location_calculation.png)

Como se observa en la figura anterior, la indexación de arreglos comienza convencionalmente en $0$. Si bien esto podría parecer contraintuitivo, considerando que el conteo generalmente comienza en $1$, dentro de la fórmula de cálculo de direcciones, **un índice es esencialmente un desplazamiento desde la dirección de memoria**. Para la dirección del primer elemento, este desplazamiento es $0$, lo que valida su índice como $0$.

El acceso a los elementos de un arreglo es muy eficiente, lo que nos permite acceder aleatoriamente a cualquier elemento en tiempo $O(1)$.

```src
[file]{array}-[class]{}-[func]{random_access}
```

### Inserción de elementos

Los elementos del arreglo están densamente empaquetados en la memoria, sin espacio disponible para acomodar datos adicionales entre ellos. Como se ilustra en la figura a continuación, insertar un elemento en el medio de un arreglo requiere desplazar todos los elementos posteriores una posición hacia atrás para crear espacio para el nuevo elemento.

![Ejemplo de inserción de elementos en un arreglo](array.assets/array_insert_element.png)

Es importante tener en cuenta que, debido a la longitud fija de un arreglo, la inserción de un elemento inevitablemente resultará en la pérdida del último elemento del arreglo. Las soluciones para abordar este problema se explorarán en el capítulo "Lista".

```src
[file]{array}-[class]{}-[func]{insert}
```

### Eliminación de elementos

De manera similar, como se muestra en la figura a continuación, para eliminar un elemento en el índice $i$, todos los elementos que siguen al índice $i$ deben moverse una posición hacia adelante.

![Ejemplo de eliminación de elementos de un arreglo](array.assets/array_remove_element.png)

Tenga en cuenta que después de la eliminación, el antiguo último elemento se vuelve "sin sentido", por lo que no requiere ninguna modificación específica.

```src
[file]{array}-[class]{}-[func]{remove}
```

En resumen, las operaciones de inserción y eliminación en arreglos presentan las siguientes desventajas:

-   **Alta complejidad temporal**: Tanto la inserción como la eliminación en un arreglo tienen una complejidad temporal promedio de $O(n)$, donde $n$ es la longitud del arreglo.
-   **Pérdida de elementos**: Debido a la longitud fija de los arreglos, los elementos que exceden la capacidad del arreglo se pierden durante la inserción.
-   **Desperdicio de memoria**: Inicializar un arreglo más largo y utilizar solo la parte frontal da como resultado elementos finales "sin sentido" durante la inserción, lo que lleva a un desperdicio de espacio de memoria.

### Recorrido de arreglos

En la mayoría de los lenguajes de programación, podemos recorrer un arreglo utilizando índices o iterando directamente sobre cada elemento:

```src
[file]{array}-[class]{}-[func]{traverse}
```

### Búsqueda de elementos

Localizar un elemento específico dentro de un arreglo implica iterar a través del arreglo, verificando cada elemento para determinar si coincide con el valor deseado.

Debido a que los arreglos son estructuras de datos lineales, esta operación se conoce comúnmente como "búsqueda lineal".

```src
[file]{array}-[class]{}-[func]{find}
```

### Expansión de arreglos

En entornos de sistemas complejos, garantizar la disponibilidad de espacio de memoria después de un arreglo para una extensión segura de la capacidad se vuelve un desafío. En consecuencia, en la mayoría de los lenguajes de programación, **la longitud de un arreglo es inmutable**.

Para expandir un arreglo, es necesario crear un arreglo más grande y luego copiar los elementos del arreglo original. Esta operación tiene una complejidad temporal de $O(n)$ y puede llevar mucho tiempo para arreglos grandes. El código es el siguiente:

```src
[file]{array}-[class]{}-[func]{extend}
```

## Ventajas y limitaciones de los arreglos

Los arreglos se almacenan en espacios de memoria contiguos y constan de elementos del mismo tipo. Este enfoque proporciona una información previa sustancial que los sistemas pueden aprovechar para optimizar la eficiencia de las operaciones de la estructura de datos.

-   **Alta eficiencia espacial**: Los arreglos asignan un bloque contiguo de memoria para los datos, eliminando la necesidad de una sobrecarga estructural adicional.
-   **Soporte para acceso aleatorio**: Los arreglos permiten el acceso en tiempo $O(1)$ a cualquier elemento.
-   **Localidad de caché**: Al acceder a los elementos del arreglo, la computadora no solo los carga, sino que también almacena en caché los datos circundantes, utilizando la caché de alta velocidad para mejorar las velocidades de las operaciones posteriores.

Sin embargo, el almacenamiento continuo de espacio es un arma de doble filo, con las siguientes limitaciones:

-   **Baja eficiencia en la inserción y eliminación**: A medida que los arreglos acumulan muchos elementos, la inserción o eliminación de elementos requiere el desplazamiento de un gran número de elementos.
-   **Longitud fija**: La longitud de un arreglo es fija después de la inicialización. La expansión de un arreglo requiere copiar todos los datos a un nuevo arreglo, lo que incurre en costos significativos.
-   **Desperdicio de espacio**: Si el tamaño del arreglo asignado excede lo necesario, el espacio adicional se desperdicia.

## Aplicaciones típicas de los arreglos

Los arreglos son estructuras de datos fundamentales y ampliamente utilizadas. Encuentran aplicación frecuente en varios algoritmos y sirven en la implementación de estructuras de datos complejas.

-   **Acceso aleatorio**: Los arreglos son ideales para almacenar datos cuando se requiere un muestreo aleatorio. Al generar una secuencia aleatoria basada en índices, podemos lograr un muestreo aleatorio de manera eficiente.
-   **Ordenamiento y búsqueda**: Los arreglos son la estructura de datos más utilizada para algoritmos de ordenamiento y búsqueda. Técnicas como el ordenamiento rápido, el ordenamiento por fusión, la búsqueda binaria, etc., operan principalmente en arreglos.
-   **Tablas de búsqueda**: Los arreglos sirven como tablas de búsqueda eficientes para la recuperación rápida de elementos o relaciones. Por ejemplo, la asignación de caracteres a códigos ASCII se vuelve sencilla utilizando los valores de los códigos ASCII como índices y almacenando los elementos correspondientes en el arreglo.
-   **Aprendizaje automático**: Dentro del dominio de las redes neuronales, los arreglos desempeñan un papel fundamental en la ejecución de operaciones cruciales de álgebra lineal que involucran vectores, matrices y tensores. Los arreglos sirven como la estructura de datos principal y más utilizada en la programación de redes neuronales.
-   **Implementación de estructuras de datos**: Los arreglos sirven como bloques de construcción para implementar varias estructuras de datos como pilas, colas, tablas hash, montículos, grafos, etc. Por ejemplo, la representación de una matriz de adyacencia de un grafo es esencialmente un arreglo bidimensional.
