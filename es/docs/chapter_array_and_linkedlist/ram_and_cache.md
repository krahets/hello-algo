# Memoria y caché *

En las dos primeras secciones de este capítulo, exploramos los arreglos y las listas enlazadas, dos estructuras de datos fundamentales que representan el "almacenamiento continuo" y el "almacenamiento disperso", respectivamente.

De hecho, **la estructura física determina en gran medida la eficiencia con la que un programa utiliza la memoria y la caché**, lo que a su vez afecta el rendimiento general del algoritmo.

## Dispositivos de almacenamiento de la computadora

Hay tres tipos de dispositivos de almacenamiento en las computadoras: <u>disco duro</u>, <u>memoria de acceso aleatorio (RAM)</u> y <u>memoria caché</u>. La siguiente tabla muestra sus respectivos roles y características de rendimiento en los sistemas informáticos.

<p align="center"> Tabla <id> &nbsp; Dispositivos de almacenamiento de la computadora </p>

|             | Disco duro                                                      | Memoria                                                                   | Caché                                                                                           |
| ----------- | -------------------------------------------------------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| Uso       | Almacenamiento a largo plazo de datos, incluyendo SO, programas, archivos, etc. | Almacenamiento temporal de programas en ejecución y datos en procesamiento | Almacena datos e instrucciones de acceso frecuente, reduciendo el número de accesos de la CPU a la memoria |
| Volatilidad  | Los datos no se pierden después de apagar                               | Los datos se pierden después de apagar                                             | Los datos se pierden después de apagar                                                                    |
| Capacidad    | Mayor, nivel de TB                                               | Menor, nivel de GB                                                                   | Muy pequeña, nivel de MB                                                                            |
| Velocidad       | Más lento, varios cientos a miles de MB/s                      | Más rápido, varias decenas de GB/s                                             | Muy rápido, varias decenas a cientos de GB/s                                                     |
| Precio (USD) | Más barato, unos pocos centavos / GB                                      | Más caro, unos pocos dólares / GB                                             | Muy caro, con precio de CPU                                                                 |

El sistema de almacenamiento de la computadora se puede visualizar como una pirámide, como se muestra en la figura a continuación. Los dispositivos de almacenamiento en la parte superior de la pirámide son más rápidos, tienen capacidades más pequeñas y son más caros. Este diseño de varios niveles no es accidental, sino un resultado deliberado de una cuidadosa consideración por parte de científicos e ingenieros informáticos.

-   **Reemplazar los discos duros con memoria es un desafío**. En primer lugar, los datos en la memoria se pierden después de apagar, lo que la hace inadecuada para el almacenamiento de datos a largo plazo; en segundo lugar, la memoria es significativamente más cara que los discos duros, lo que limita su viabilidad para un uso generalizado en el mercado de consumo.
-   **Las cachés se enfrentan a una compensación entre gran capacidad y alta velocidad**. A medida que aumenta la capacidad de las cachés L1, L2 y L3, su tamaño físico crece, lo que aumenta la distancia del núcleo de la CPU. Esto da como resultado tiempos de transferencia de datos más largos y una mayor latencia de acceso. Con la tecnología actual, una estructura de caché de varios niveles proporciona el equilibrio óptimo entre capacidad, velocidad y costo.

![Sistema de almacenamiento de la computadora](ram_and_cache.assets/storage_pyramid.png)

!!! tip

    La jerarquía de almacenamiento en las computadoras refleja un cuidadoso equilibrio entre velocidad, capacidad y costo. Este tipo de compensación es común en varias industrias, donde encontrar el equilibrio óptimo entre beneficios y limitaciones es esencial.

En general, **los discos duros proporcionan almacenamiento a largo plazo para grandes volúmenes de datos, la memoria sirve como almacenamiento temporal para los datos que se procesan durante la ejecución del programa, y la caché almacena los datos e instrucciones a los que se accede con frecuencia para mejorar la eficiencia de la ejecución**. Juntos, garantizan el funcionamiento eficiente de los sistemas informáticos.

Como se muestra en la figura a continuación, durante la ejecución del programa, los datos se leen del disco duro a la memoria para el cálculo de la CPU. La caché, que actúa como una extensión de la CPU, **precarga inteligentemente los datos de la memoria**, lo que permite un acceso más rápido a los datos para la CPU. Esto mejora en gran medida la eficiencia de la ejecución del programa al tiempo que reduce la dependencia de una memoria más lenta.

![Flujo de datos entre el disco duro, la memoria y la caché](ram_and_cache.assets/computer_storage_devices.png)

## Eficiencia de la memoria de las estructuras de datos

En términos de utilización del espacio de memoria, los arreglos y las listas enlazadas tienen sus ventajas y limitaciones.

Por un lado, **la memoria es limitada y no puede ser compartida por varios programas**, por lo que optimizar el uso del espacio en las estructuras de datos es crucial. Los arreglos son eficientes en el espacio porque sus elementos están densamente empaquetados, sin requerir memoria adicional para referencias (punteros) como en las listas enlazadas. Sin embargo, los arreglos requieren la preasignación de un bloque contiguo de memoria, lo que puede llevar a un desperdicio si el espacio asignado excede la necesidad real. La expansión de un arreglo también incurre en una sobrecarga adicional de tiempo y espacio. Por el contrario, las listas enlazadas asignan y liberan memoria dinámicamente para cada nodo, lo que ofrece una mayor flexibilidad a costa de memoria adicional para los punteros.

Por otro lado, durante la ejecución del programa, **la asignación y desasignación repetida de memoria aumenta la fragmentación de la memoria**, lo que reduce la eficiencia de la utilización de la memoria. Los arreglos, debido a su método de almacenamiento continuo, tienen relativamente menos probabilidades de causar fragmentación de la memoria. Por el contrario, las listas enlazadas almacenan elementos en ubicaciones no contiguas, y las inserciones y eliminaciones frecuentes pueden exacerbar la fragmentación de la memoria.

## Eficiencia de la caché de las estructuras de datos

Aunque las cachés son mucho más pequeñas en capacidad de espacio que la memoria, son mucho más rápidas y desempeñan un papel crucial en la velocidad de ejecución del programa. Debido a su capacidad limitada, las cachés solo pueden almacenar un subconjunto de datos a los que se accede con frecuencia. Cuando la CPU intenta acceder a datos que no están presentes en la caché, se produce un <u>fallo de caché</u>, lo que requiere que la CPU recupere los datos necesarios de una memoria más lenta, lo que puede afectar el rendimiento.

Claramente, **cuantos menos fallos de caché, mayor será la eficiencia de lectura-escritura de datos de la CPU**, y mejor será el rendimiento del programa. La proporción de recuperación exitosa de datos de la caché por parte de la CPU se denomina <u>tasa de aciertos de caché</u>, una métrica que a menudo se utiliza para medir la eficiencia de la caché.

Para lograr una mayor eficiencia, las cachés adoptan los siguientes mecanismos de carga de datos.

-   **Líneas de caché**: Las cachés operan almacenando y cargando datos en unidades llamadas líneas de caché, en lugar de bytes individuales. Este enfoque mejora la eficiencia al transferir bloques de datos más grandes a la vez.
-   **Mecanismo de precarga**: Los procesadores predicen los patrones de acceso a datos (por ejemplo, acceso secuencial o de paso fijo) y precargan los datos en la caché basándose en estos patrones para aumentar la tasa de aciertos de caché.
-   **Localidad espacial**: Cuando se accede a un dato específico, es probable que se acceda pronto a los datos cercanos. Para aprovechar esto, las cachés cargan datos adyacentes junto con los datos solicitados, mejorando las tasas de aciertos.
-   **Localidad temporal**: Si se accede a los datos, es probable que se acceda a ellos de nuevo en un futuro próximo. Las cachés utilizan este principio para retener los datos a los que se ha accedido recientemente para mejorar la tasa de aciertos.

De hecho, **los arreglos y las listas enlazadas tienen diferentes eficiencias de utilización de la caché**, lo que se refleja principalmente en los siguientes aspectos.

-   **Espacio ocupado**: Los elementos de la lista enlazada ocupan más espacio que los elementos del arreglo, lo que resulta en que se retengan menos datos efectivos en la caché.
-   **Líneas de caché**: Los datos de la lista enlazada están dispersos por toda la memoria, y la caché se "carga por fila", por lo que la proporción de datos no válidos cargados es mayor.
-   **Mecanismo de precarga**: El patrón de acceso a datos de los arreglos es más "predecible" que el de las listas enlazadas, es decir, es más fácil para el sistema adivinar los datos que están a punto de cargarse.
-   **Localidad espacial**: Los arreglos se almacenan en un espacio de memoria continuo, por lo que es más probable que se acceda pronto a los datos cercanos a los datos que se están cargando.

En general, **los arreglos tienen una tasa de aciertos de caché más alta y generalmente son más eficientes en operación que las listas enlazadas**. Esto hace que las estructuras de datos basadas en arreglos sean más populares en la resolución de problemas algorítmicos.

Cabe señalar que **una alta eficiencia de caché no significa que los arreglos sean siempre mejores que las listas enlazadas**. La elección de la estructura de datos debe depender de los requisitos específicos de la aplicación. Por ejemplo, tanto los arreglos como las listas enlazadas pueden implementar la estructura de datos de "pila" (que se detallará en el próximo capítulo), pero son adecuadas para diferentes escenarios.

-   En los problemas de algoritmos, tendemos a elegir pilas basadas en arreglos porque proporcionan una mayor eficiencia operativa y capacidades de acceso aleatorio, con el único costo de la necesidad de preasignar una cierta cantidad de espacio de memoria para el arreglo.
-   Si el volumen de datos es muy grande, altamente dinámico y el tamaño esperado de la pila es difícil de estimar, entonces una pila basada en una lista enlazada es una mejor opción. Las listas enlazadas pueden distribuir una gran cantidad de datos en diferentes partes de la memoria y evitar la sobrecarga adicional de la expansión del arreglo.
