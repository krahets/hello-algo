# Clasificación de las estructuras de datos

Las estructuras de datos comunes incluyen arreglos, listas enlazadas, pilas, colas, tablas hash, árboles, montículos y grafos. Se pueden clasificar en "estructura lógica" y "estructura física".

## Estructura lógica: lineal y no lineal

**Las estructuras lógicas revelan las relaciones lógicas entre los elementos de datos**. En los arreglos y las listas enlazadas, los datos se organizan en una secuencia específica, lo que demuestra la relación lineal entre los datos; mientras que en los árboles, los datos se organizan jerárquicamente de arriba hacia abajo, lo que muestra la relación derivada entre "ancestros" y "descendientes"; y los grafos se componen de nodos y aristas, lo que refleja la intrincada relación de red.

Como se muestra en la figura a continuación, las estructuras lógicas se pueden dividir en dos categorías principales: "lineales" y "no lineales". Las estructuras lineales son más intuitivas, lo que indica que los datos se organizan linealmente en relaciones lógicas; las estructuras no lineales, por el contrario, se organizan de forma no lineal.

-   **Estructuras de datos lineales**: Arreglos, Listas enlazadas, Pilas, Colas, Tablas hash.
-   **Estructuras de datos no lineales**: Árboles, Montículos, Grafos, Tablas hash.

Las estructuras de datos no lineales se pueden dividir a su vez en estructuras de árbol y estructuras de red.

-   **Estructuras de árbol**: Árboles, Montículos, Tablas hash, donde los elementos tienen una relación de uno a muchos.
-   **Estructuras de red**: Grafos, donde los elementos tienen relaciones de muchos a muchos.

![Estructuras de datos lineales y no lineales](classification_of_data_structure.assets/classification_logic_structure.png)

## Estructura física: contigua y dispersa

**Durante la ejecución de un algoritmo, los datos que se procesan se almacenan en la memoria**. La siguiente figura muestra un módulo de memoria de computadora donde cada cuadrado negro es un espacio de memoria física. Podemos pensar en la memoria como una vasta hoja de cálculo de Excel, donde cada celda es capaz de almacenar una cierta cantidad de datos.

**El sistema accede a los datos en la ubicación de destino mediante una dirección de memoria**. Como se muestra en la figura a continuación, la computadora asigna un identificador único a cada celda de la tabla de acuerdo con reglas específicas, asegurando que cada espacio de memoria tenga una dirección de memoria única. Con estas direcciones, el programa puede acceder a los datos almacenados en la memoria.

![Módulo de memoria, espacios de memoria, direcciones de memoria](classification_of_data_structure.assets/computer_memory_location.png)

!!! tip

    Cabe señalar que comparar la memoria con una hoja de cálculo de Excel es una analogía simplificada. El mecanismo de funcionamiento real de la memoria es más complejo, e involucra conceptos como el espacio de direcciones, la gestión de la memoria, los mecanismos de caché, la memoria virtual y la memoria física.

La memoria es un recurso compartido para todos los programas. Cuando un bloque de memoria es ocupado por un programa, no puede ser utilizado simultáneamente por otros programas. **Por lo tanto, considerar los recursos de memoria es crucial en el diseño de estructuras de datos y algoritmos**. Por ejemplo, el uso máximo de memoria del algoritmo no debe exceder la memoria libre restante del sistema; si hay una falta de bloques de memoria contiguos, entonces la estructura de datos elegida debe poder almacenarse en bloques de memoria no contiguos.

Como se ilustra en la figura a continuación, **la estructura física refleja la forma en que los datos se almacenan en la memoria de la computadora** y se puede dividir en almacenamiento de espacio contiguo (arreglos) y almacenamiento de espacio no contiguo (listas enlazadas). Los dos tipos de estructuras físicas exhiben características complementarias en términos de eficiencia de tiempo y eficiencia de espacio.

![Almacenamiento de espacio contiguo y almacenamiento de espacio disperso](classification_of_data_structure.assets/classification_phisical_structure.png)

**Cabe señalar que todas las estructuras de datos se implementan basándose en arreglos, listas enlazadas o una combinación de ambos**. Por ejemplo, las pilas y las colas se pueden implementar utilizando arreglos o listas enlazadas; mientras que las implementaciones de tablas hash pueden involucrar tanto arreglos como listas enlazadas.

-   **Implementaciones basadas en arreglos**: Pilas, Colas, Tablas hash, Árboles, Montículos, Grafos, Matrices, Tensores (arreglos con dimensiones $\geq 3$).
-   **Implementaciones basadas en listas enlazadas**: Pilas, Colas, Tablas hash, Árboles, Montículos, Grafos, etc.

Las estructuras de datos implementadas basándose en arreglos también se denominan "estructuras de datos estáticas", lo que significa que su longitud no se puede cambiar después de la inicialización. Por el contrario, las basadas en listas enlazadas se denominan "estructuras de datos dinámicas", que aún pueden ajustar su tamaño durante la ejecución del programa.

!!! tip

    Si le resulta difícil comprender la estructura física, se recomienda que lea el siguiente capítulo, "Arreglos y listas enlazadas", y vuelva a visitar esta sección más tarde.
