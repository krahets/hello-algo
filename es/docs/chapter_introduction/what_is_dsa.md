# ¿Qué es un algoritmo?

## Definición de un algoritmo

Un <u>algoritmo</u> es un conjunto de instrucciones o pasos para resolver un problema específico en una cantidad finita de tiempo. Tiene las siguientes características:

- El problema está claramente definido, incluidas las definiciones inequívocas de entrada y salida.
- El algoritmo es factible, lo que significa que se puede completar en un número finito de pasos, tiempo y espacio de memoria.
- Cada paso tiene un significado definitivo. La salida es consistentemente la misma bajo las mismas entradas y condiciones.

## Definición de una estructura de datos

Una <u>estructura de datos</u> es una forma de organizar y almacenar datos en una computadora, con los siguientes objetivos de diseño:

- Minimizar la ocupación de espacio para ahorrar memoria de la computadora.
- Hacer que las operaciones de datos sean lo más rápidas posible, cubriendo el acceso, la adición, la eliminación, la actualización de datos, etc.
- Proporcionar una representación de datos concisa e información lógica para permitir una ejecución eficiente del algoritmo.

**Diseñar estructuras de datos es un acto de equilibrio, que a menudo requiere compensaciones**. Si desea mejorar en un aspecto, a menudo necesita comprometerse en otro. Aquí hay dos ejemplos:

- En comparación con los arreglos, las listas enlazadas ofrecen más comodidad en la adición y eliminación de datos, pero sacrifican la velocidad de acceso a los datos.
- Los grafos, en comparación con las listas enlazadas, proporcionan información lógica más rica pero requieren más espacio de memoria.

## Relación entre estructuras de datos y algoritmos

Como se muestra en la figura a continuación, las estructuras de datos y los algoritmos están muy relacionados y estrechamente integrados, específicamente en los siguientes tres aspectos:

- Las estructuras de datos son la base de los algoritmos. Proporcionan almacenamiento de datos estructurado y métodos para manipular datos para algoritmos.
- Los algoritmos son el escenario donde entran en juego las estructuras de datos. La estructura de datos por sí sola solo almacena información de datos; es a través de la aplicación de algoritmos que se pueden resolver problemas específicos.
- Los algoritmos a menudo se pueden implementar en función de diferentes estructuras de datos, but su eficiencia de ejecución puede variar mucho. Elegir la estructura de datos adecuada es clave.

![Relación entre estructuras de datos y algoritmos](what_is_dsa.assets/relationship_between_data_structure_and_algorithm.png)

Las estructuras de datos y los algoritmos se pueden comparar con un conjunto de bloques de construcción, como se ilustra en la figura a continuación. Un conjunto de bloques de construcción incluye numerosas piezas, acompañadas de instrucciones de montaje detalladas. Seguir estas instrucciones paso a paso nos permite construir un intrincado modelo de bloques.

![Montaje de bloques](what_is_dsa.assets/assembling_blocks.png)

La correspondencia detallada entre los dos se muestra en la tabla a continuación.

<p align="center"> Tabla <id> &nbsp; Comparación de estructuras de datos y algoritmos con bloques de construcción </p>

| Estructuras de datos y algoritmos | Bloques de construcción                                                 |
| ------------------------------ | --------------------------------------------------------------- |
| Datos de entrada                     | Bloques sin montar                                              |
| Estructura de datos                 | Organización de bloques, incluida la forma, el tamaño, las conexiones, etc. |
| Algoritmo                      | Una serie de pasos para ensamblar los bloques en la forma deseada |
| Datos de salida                    | Modelo de bloque completado                                           |

Vale la pena señalar que las estructuras de datos y los algoritmos son independientes de los lenguajes de programación. Por esta razón, este libro puede proporcionar implementaciones en múltiples lenguajes de programación.

!!! tip "Abreviatura convencional"

    En las discusiones de la vida real, a menudo nos referimos a "Estructuras de datos y algoritmos" simplemente como "Algoritmos". Por ejemplo, los conocidos problemas de algoritmos de LeetCode en realidad prueban tanto el conocimiento de la estructura de datos como el del algoritmo.
