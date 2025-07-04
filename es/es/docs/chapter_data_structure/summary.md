# Resumen

### Revisión clave

- Las estructuras de datos se pueden clasificar desde dos perspectivas: estructura lógica y estructura física. La estructura lógica describe las relaciones lógicas entre los datos, mientras que la estructura física describe cómo se almacenan los datos en la memoria.
- Las estructuras lógicas utilizadas con frecuencia incluyen estructuras lineales, árboles y redes. Generalmente dividimos las estructuras de datos en lineales (arreglos, listas enlazadas, pilas, colas) y no lineales (árboles, grafos, montículos) según su estructura lógica. La implementación de tablas hash puede involucrar estructuras de datos tanto lineales como no lineales.
- Cuando un programa se está ejecutando, los datos se almacenan en la memoria. Cada espacio de memoria tiene una dirección correspondiente, y el programa accede a los datos a través de estas direcciones.
- Las estructuras físicas se pueden dividir en almacenamiento de espacio continuo (arreglos) y almacenamiento de espacio discreto (listas enlazadas). Todas las estructuras de datos se implementan utilizando arreglos, listas enlazadas o una combinación de ambos.
- Los tipos de datos básicos en las computadoras incluyen enteros (`byte`, `short`, `int`, `long`), números de punto flotante (`float`, `double`), caracteres (`char`) y booleanos (`bool`). El rango de valores de un tipo de datos depende de su tamaño y representación.
- Signo-magnitud, complemento a 1, complemento a 2 son tres métodos de codificación de enteros en computadoras, y se pueden convertir entre sí. El bit más significativo del signo-magnitud es el bit de signo, y los bits restantes representan el valor del número.
- Los enteros se codifican mediante el complemento a 2 en las computadoras. Los beneficios de esta representación incluyen (i) la computadora puede unificar la suma de enteros positivos y negativos, (ii) no es necesario diseñar circuitos de hardware especiales para la resta, y (iii) no hay ambigüedad de cero positivo y negativo.
- La codificación de números de punto flotante consta de 1 bit de signo, 8 bits de exponente y 23 bits de fracción. Debido al bit de exponente, el rango de números de punto flotante es mucho mayor que el de los enteros, pero a costa de la precisión.
- ASCII es el conjunto de caracteres en inglés más antiguo, con 1 byte de longitud y un total de 127 caracteres. GBK es un conjunto de caracteres chinos popular, que incluye más de 20.000 caracteres chinos. Unicode tiene como objetivo proporcionar un estándar de conjunto de caracteres completo que incluya caracteres de varios idiomas del mundo, resolviendo así el problema de los caracteres ilegibles causado por métodos de codificación de caracteres inconsistentes.
- UTF-8 es el método de codificación Unicode más popular y general. Es un método de codificación de longitud variable con buena escalabilidad y eficiencia espacial. UTF-16 y UTF-32 son métodos de codificación de longitud fija. Al codificar caracteres chinos, UTF-16 ocupa menos espacio que UTF-8. Los lenguajes de programación como Java y C# usan la codificación UTF-16 de forma predeterminada.

### Preguntas y respuestas

**P**: ¿Por qué una tabla hash contiene estructuras de datos tanto lineales como no lineales?

La estructura subyacente de una tabla hash es un arreglo. Para resolver las colisiones de hash, podemos usar el "encadenamiento" (discutido en una sección posterior, "Colisión de hash"): cada cubo en el arreglo apunta a una lista enlazada, que puede transformarse en un árbol (generalmente un árbol rojo-negro) cuando su longitud es mayor que un cierto umbral.
Desde una perspectiva de almacenamiento, la estructura subyacente de una tabla hash es un arreglo, donde cada cubo podría contener un valor, una lista enlazada o un árbol. Por lo tanto, las tablas hash pueden contener estructuras de datos tanto lineales (arreglos, listas enlazadas) como no lineales (árboles).

**P**: ¿La longitud del tipo `char` es de 1 byte?

La longitud del tipo `char` está determinada por el método de codificación del lenguaje de programación. Por ejemplo, Java, JavaScript, TypeScript y C# utilizan la codificación UTF-16 (para guardar puntos de código Unicode), por lo que la longitud del tipo `char` es de 2 bytes.

**P**: ¿Hay alguna ambigüedad cuando nos referimos a las estructuras de datos basadas en arreglos como "estructuras de datos estáticas"? La pila también puede realizar operaciones "dinámicas" como sacar y empujar.

La pila puede implementar operaciones de datos dinámicas, pero la estructura de datos sigue siendo "estática" (la longitud es fija). Aunque las estructuras de datos basadas en arreglos pueden agregar o eliminar elementos dinámicamente, su capacidad es fija. Si el tamaño de la pila excede el tamaño preasignado, el arreglo antiguo se copiará en un arreglo recién creado y más grande.

**P**: Cuando se construye una pila (cola), su tamaño no se especifica, entonces ¿por qué son "estructuras de datos estáticas"?

En los lenguajes de programación de alto nivel, no necesitamos especificar manualmente la capacidad inicial de las pilas (colas); esta tarea se completa automáticamente dentro de la clase. Por ejemplo, la capacidad inicial de `ArrayList` de Java suele ser 10. Además, la operación de expansión también se completa automáticamente. Consulte el capítulo "Lista" posterior para obtener más detalles.

**P**: El método de convertir el signo-magnitud al complemento a 2 es "primero negar y luego sumar 1", por lo que convertir el complemento a 2 al signo-magnitud debería ser su operación inversa "primero restar 1 y luego negar".
Sin embargo, el complemento a 2 también se puede convertir al signo-magnitud mediante "primero negar y luego sumar 1", ¿por qué es esto?

**R**: Esto se debe a que la conversión mutua entre el signo-magnitud y el complemento a 2 es equivalente a calcular el "complemento". Primero definimos el complemento: suponiendo que $a + b = c$, entonces decimos que $a$ es el complemento de $b$ a $c$, y viceversa, $b$ es el complemento de $a$ a $c$.

Dado un número binario $0010$ con longitud $n = 4$, si este número es el signo-magnitud (ignorando el bit de signo), entonces su complemento a 2 se puede obtener mediante "primero negar y luego sumar 1":

$$
0010 \rightarrow 1101 \rightarrow 1110
$$

Observe que la suma del signo-magnitud y el complemento a 2 es $0010 + 1110 = 10000$, es decir, el complemento a 2 $1110$ es el "complemento" del signo-magnitud $0010$ a $10000$. **Esto significa que el "primero negar y luego sumar 1" anterior es equivalente a calcular el complemento a $10000$**.

Entonces, ¿cuál es el "complemento" de $1110$ a $10000$? Todavía podemos calcularlo mediante "negar primero y luego sumar 1":

$$
1110 \rightarrow 0001 \rightarrow 0010
$$

En otras palabras, el signo-magnitud y el complemento a 2 son el "complemento" del otro a $10000$, por lo que "signo-magnitud a complemento a 2" y "complemento a 2 a signo-magnitud" se pueden implementar con la misma operación (primero negar y luego sumar 1).

Por supuesto, también podemos usar la operación inversa de "primero negar y luego sumar 1" para encontrar el signo-magnitud del complemento a 2 $1110$, es decir, "primero restar 1 y luego negar":

$$
1110 \rightarrow 1101 \rightarrow 0010
$$

En resumen, "primero negar y luego sumar 1" y "primero restar 1 y luego negar" están calculando el complemento a $10000$, y son equivalentes.

Esencialmente, la operación "negar" es en realidad encontrar el complemento a $1111$ (porque `signo-magnitud + complemento a 1 = 1111` siempre se cumple); y el complemento a 1 más 1 es igual al complemento a 2 a $10000$.

Tomamos $n = 4$ como ejemplo en lo anterior, y se puede generalizar a cualquier número binario con cualquier número de dígitos.
