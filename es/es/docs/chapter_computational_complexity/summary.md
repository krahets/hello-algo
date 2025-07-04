# Resumen

### Revisión clave

**Evaluación de la eficiencia del algoritmo**

- La eficiencia temporal y la eficiencia espacial son los dos criterios principales para evaluar los méritos de un algoritmo.
- Podemos evaluar la eficiencia del algoritmo mediante pruebas reales, pero es difícil eliminar la influencia del entorno de prueba y consume importantes recursos computacionales.
- El análisis de complejidad puede superar las desventajas de las pruebas reales. Sus resultados son aplicables en todas las plataformas operativas y pueden revelar la eficiencia de los algoritmos en diferentes escalas de datos.

**Complejidad temporal**

- La complejidad temporal mide la tendencia del tiempo de ejecución de un algoritmo con el aumento del volumen de datos, evaluando eficazmente la eficiencia del algoritmo. Sin embargo, puede fallar en ciertos casos, como con volúmenes de datos de entrada pequeños o cuando las complejidades temporales son las mismas, lo que dificulta la comparación precisa de la eficiencia de los algoritmos.
- La complejidad temporal en el peor de los casos se denota usando la notación de O grande, que representa el límite superior asintótico, reflejando el nivel de crecimiento del número de operaciones $T(n)$ a medida que $n$ se acerca al infinito.
- El cálculo de la complejidad temporal implica dos pasos: primero contar el número de operaciones y luego determinar el límite superior asintótico.
- Las complejidades temporales comunes, ordenadas de menor a mayor, incluyen $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$ y $O(n!)$, entre otras.
- La complejidad temporal de algunos algoritmos no es fija y depende de la distribución de los datos de entrada. Las complejidades temporales se dividen en casos peor, mejor y promedio. El mejor caso rara vez se usa porque los datos de entrada generalmente necesitan cumplir condiciones estrictas para lograr el mejor caso.
- La complejidad temporal promedio refleja la eficiencia de un algoritmo bajo entradas de datos aleatorias, asemejándose mucho al rendimiento del algoritmo en aplicaciones reales. El cálculo de la complejidad temporal promedio requiere tener en cuenta la distribución de los datos de entrada y la expectativa matemática posterior.

**Complejidad espacial**

- La complejidad espacial, similar a la complejidad temporal, mide la tendencia del espacio de memoria ocupado por un algoritmo con el aumento del volumen de datos.
- El espacio de memoria relevante utilizado durante la ejecución del algoritmo se puede dividir en espacio de entrada, espacio temporal y espacio de salida. Generalmente, el espacio de entrada no se incluye en los cálculos de complejidad espacial. El espacio temporal se puede dividir en datos temporales, espacio de marco de pila y espacio de instrucciones, donde el espacio de marco de pila generalmente afecta la complejidad espacial solo en funciones recursivas.
- Normalmente solo nos centramos en la complejidad espacial en el peor de los casos, lo que significa calcular la complejidad espacial del algoritmo bajo los peores datos de entrada y en el peor momento de la operación.
- Las complejidades espaciales comunes, ordenadas de menor a mayor, incluyen $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$ y $O(2^n)$, entre otras.

### Preguntas y respuestas

**P**: ¿La complejidad espacial de la recursión de cola es $O(1)$?

Teóricamente, la complejidad espacial de una función recursiva de cola se puede optimizar a $O(1)$. Sin embargo, la mayoría de los lenguajes de programación (como Java, Python, C++, Go, C#) no admiten la optimización automática de la recursión de cola, por lo que generalmente se considera que tiene una complejidad espacial de $O(n)$.

**P**: ¿Cuál es la diferencia entre los términos "función" y "método"?

Una <u>función</u> se puede ejecutar de forma independiente, con todos los parámetros pasados explícitamente. Un <u>método</u> está asociado a un objeto y se pasa implícitamente al objeto que lo llama, pudiendo operar sobre los datos contenidos en una instancia de una clase.

Aquí hay algunos ejemplos de lenguajes de programación comunes:

- C es un lenguaje de programación procedural sin conceptos orientados a objetos, por lo que solo tiene funciones. Sin embargo, podemos simular la programación orientada a objetos creando estructuras (struct), y las funciones asociadas a estas estructuras son equivalentes a los métodos en otros lenguajes de programación.
- Java y C# son lenguajes de programación orientados a objetos donde los bloques de código (métodos) suelen formar parte de una clase. Los métodos estáticos se comportan como funciones porque están vinculados a la clase y no pueden acceder a variables de instancia específicas.
- C++ y Python admiten tanto la programación procedural (funciones) como la programación orientada a objetos (métodos).

**P**: ¿La figura "Tipos comunes de complejidad espacial" refleja el tamaño absoluto del espacio ocupado?

No, la figura muestra las complejidades espaciales, que reflejan las tendencias de crecimiento, no el tamaño absoluto del espacio ocupado.

Si toma $n = 8$, podría encontrar que los valores de cada curva no corresponden a sus funciones. Esto se debe a que cada curva incluye un término constante, destinado a comprimir el rango de valores en un rango visualmente cómodo.

En la práctica, dado que normalmente no conocemos la complejidad del "término constante" de cada método, generalmente no es posible elegir la mejor solución para $n = 8$ basándose únicamente en la complejidad. Sin embargo, para $n = 8^5$, es mucho más fácil elegir, ya que la tendencia de crecimiento se vuelve dominante.
