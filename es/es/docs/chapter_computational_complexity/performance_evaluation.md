# Evaluación del rendimiento de los algoritmos

En el diseño de algoritmos, perseguimos los siguientes dos objetivos en secuencia.

1. **Encontrar una solución al problema**: El algoritmo debe encontrar de manera confiable la solución correcta dentro del rango especificado de entradas.
2. **Buscar la solución óptima**: Para el mismo problema, pueden existir múltiples soluciones, y nuestro objetivo es encontrar el algoritmo más eficiente posible.

En otras palabras, bajo la premisa de poder resolver el problema, la eficiencia del algoritmo se ha convertido en el principal criterio para evaluar un algoritmo, que incluye las siguientes dos dimensiones.

- **Eficiencia de tiempo**: La velocidad a la que se ejecuta un algoritmo.
- **Eficiencia de espacio**: El tamaño del espacio de memoria ocupado por un algoritmo.

En resumen, **nuestro objetivo es diseñar estructuras de datos y algoritmos que sean rápidos y eficientes en el uso de la memoria**. Evaluar eficazmente la eficiencia de los algoritmos es crucial porque solo así podemos comparar varios algoritmos y guiar el proceso de diseño y optimización de algoritmos.

Existen principalmente dos métodos de evaluación de la eficiencia: pruebas reales y estimación teórica.

## Pruebas reales

Supongamos que tenemos los algoritmos `A` y `B`, ambos capaces de resolver el mismo problema, y necesitamos comparar sus eficiencias. El método más directo es usar una computadora para ejecutar estos dos algoritmos, monitorear y registrar su tiempo de ejecución y uso de memoria. Este método de evaluación refleja la situación real, pero tiene limitaciones significativas.

Por un lado, **es difícil eliminar la interferencia del entorno de prueba**. Las configuraciones de hardware pueden afectar el rendimiento del algoritmo. Por ejemplo, un algoritmo con un alto grado de paralelismo es más adecuado para ejecutarse en CPU de varios núcleos, mientras que un algoritmo que involucra operaciones de memoria intensivas funciona mejor con memoria de alto rendimiento. Los resultados de la prueba de un algoritmo pueden variar en diferentes máquinas. Esto significa que probar en varias máquinas para calcular la eficiencia promedio se vuelve impráctico.

Por otro lado, **realizar una prueba completa consume muchos recursos**. La eficiencia del algoritmo varía con el tamaño de los datos de entrada. Por ejemplo, con volúmenes de datos más pequeños, el algoritmo `A` podría ejecutarse más rápido que el `B`, pero con volúmenes de datos más grandes, los resultados de la prueba pueden ser los opuestos. Por lo tanto, para sacar conclusiones convincentes, necesitamos probar una amplia gama de tamaños de datos de entrada, lo que requiere recursos computacionales excesivos.

## Estimación teórica

Debido a las limitaciones significativas de las pruebas reales, podemos considerar evaluar la eficiencia del algoritmo únicamente a través de cálculos. Este método de estimación se conoce como <u>análisis de complejidad asintótica</u>, o simplemente <u>análisis de complejidad</u>.

El análisis de complejidad refleja la relación entre los recursos de tiempo y espacio necesarios para la ejecución del algoritmo y el tamaño de los datos de entrada. **Describe la tendencia de crecimiento en el tiempo y el espacio requeridos por el algoritmo a medida que aumenta el tamaño de los datos de entrada**. Esta definición puede sonar compleja, pero podemos desglosarla en tres puntos clave para entenderla mejor.

- "Recursos de tiempo y espacio" corresponden a <u>complejidad de tiempo</u> y <u>complejidad de espacio</u>, respectivamente.
- "A medida que aumenta el tamaño de los datos de entrada" significa que la complejidad refleja la relación entre la eficiencia del algoritmo y el volumen de datos de entrada.
- "La tendencia de crecimiento en tiempo y espacio" indica que el análisis de complejidad no se centra en los valores específicos del tiempo de ejecución o el espacio ocupado, sino en la "tasa" a la que aumenta el tiempo o el espacio.

**El análisis de complejidad supera las desventajas de los métodos de prueba reales**, lo que se refleja en los siguientes aspectos:

- No requiere ejecutar el código realmente, lo que lo hace más respetuoso con el medio ambiente y eficiente en energía.
- Es independiente del entorno de prueba y aplicable a todas las plataformas operativas.
- Puede reflejar la eficiencia del algoritmo bajo diferentes volúmenes de datos, especialmente en el rendimiento de algoritmos con grandes volúmenes de datos.

!!! tip

    Si todavía está confundido sobre el concepto de complejidad, no se preocupe. Lo cubriremos en detalle en los capítulos siguientes.

El análisis de complejidad nos proporciona una "regla" para evaluar la eficiencia de un algoritmo, lo que nos permite medir los recursos de tiempo y espacio necesarios para ejecutarlo y comparar la eficiencia de diferentes algoritmos.

La complejidad es un concepto matemático que puede ser abstracto y desafiante para los principiantes. Desde esta perspectiva, el análisis de complejidad podría no ser el tema más adecuado para presentar primero. Sin embargo, al discutir las características de una estructura de datos o algoritmo en particular, es difícil evitar analizar su velocidad y uso de espacio.

En resumen, se recomienda desarrollar una comprensión básica del análisis de complejidad antes de sumergirse profundamente en las estructuras de datos y los algoritmos, **para que pueda realizar un análisis de complejidad en algoritmos simples**.