# Resumen

### Revisión clave

- Los arreglos y las listas enlazadas son dos estructuras de datos básicas, que representan dos métodos de almacenamiento en la memoria de la computadora: almacenamiento de espacio contiguo y almacenamiento de espacio no contiguo. Sus características se complementan entre sí.
- Los arreglos admiten el acceso aleatorio y usan menos memoria; sin embargo, son ineficientes en la inserción y eliminación de elementos y tienen una longitud fija después de la inicialización.
- Las listas enlazadas implementan una inserción y eliminación eficiente de nodos mediante el cambio de referencias (punteros) y pueden ajustar su longitud de forma flexible; sin embargo, tienen una menor eficiencia de acceso a los nodos y consumen más memoria.
- Los tipos comunes de listas enlazadas incluyen listas enlazadas simples, listas enlazadas circulares y listas doblemente enlazadas, cada una con sus propios escenarios de aplicación.
- Las listas son colecciones ordenadas de elementos que admiten la adición, eliminación y modificación, típicamente implementadas basándose en arreglos dinámicos, conservando las ventajas de los arreglos al tiempo que permiten un ajuste flexible de la longitud.
- El advenimiento de las listas mejoró significativamente la practicidad de los arreglos, pero puede conducir a cierto desperdicio de espacio de memoria.
- Durante la ejecución del programa, los datos se almacenan principalmente en la memoria. Los arreglos proporcionan una mayor eficiencia del espacio de memoria, mientras que las listas enlazadas son más flexibles en el uso de la memoria.
- Las cachés proporcionan un acceso rápido a los datos a las CPU a través de mecanismos como líneas de caché, precarga, localidad espacial y localidad temporal, lo que mejora significativamente la eficiencia de ejecución del programa.
- Debido a las mayores tasas de aciertos de caché, los arreglos son generalmente más eficientes que las listas enlazadas. Al elegir una estructura de datos, se debe tomar la decisión adecuada en función de las necesidades y escenarios específicos.

### Preguntas y respuestas

**P**: ¿Almacenar arreglos en la pila versus en el montón afecta la eficiencia de tiempo y espacio?

Los arreglos almacenados tanto en la pila como en el montón se almacenan en espacios de memoria contiguos, y la eficiencia de las operaciones de datos es esencialmente la misma. Sin embargo, las pilas y los montones tienen sus propias características, lo que lleva a las siguientes diferencias.

1.  Eficiencia de asignación y liberación: La pila es un bloque de memoria más pequeño, asignado automáticamente por el compilador; la memoria del montón es relativamente más grande y se puede asignar dinámicamente en el código, más propensa a la fragmentación. Por lo tanto, las operaciones de asignación y liberación en el montón son generalmente más lentas que en la pila.
2.  Limitación de tamaño: La memoria de la pila es relativamente pequeña, mientras que el tamaño del montón generalmente está limitado por la memoria disponible. Por lo tanto, el montón es más adecuado para almacenar arreglos grandes.
3.  Flexibilidad: El tamaño de los arreglos en la pila debe determinarse en tiempo de compilación, mientras que el tamaño de los arreglos en el montón se puede determinar dinámicamente en tiempo de ejecución.

**P**: ¿Por qué los arreglos requieren elementos del mismo tipo, mientras que las listas enlazadas no enfatizan los elementos del mismo tipo?

Las listas enlazadas consisten en nodos conectados por referencias (punteros), y cada nodo puede almacenar datos de diferentes tipos, como int, double, string, object, etc.

En contraste, los elementos del arreglo deben ser del mismo tipo, lo que permite el cálculo de desplazamientos para acceder a las posiciones de los elementos correspondientes. Por ejemplo, un arreglo que contenga tipos int y long, con elementos individuales que ocupen 4 bytes y 8 bytes respectivamente, no puede usar la siguiente fórmula para calcular los desplazamientos, ya que el arreglo contiene elementos de dos longitudes diferentes.

```shell
# Dirección de memoria del elemento = dirección de memoria del arreglo + longitud del elemento * índice del elemento
```

**P**: Después de eliminar un nodo, ¿es necesario establecer `P.next` en `None`?

No modificar `P.next` también es aceptable. Desde la perspectiva de la lista enlazada, recorrer desde el nodo cabeza hasta el nodo cola ya no encontrará `P`. Esto significa que el nodo `P` ha sido eliminado efectivamente de la lista, y hacia dónde apunta `P` ya no afecta a la lista.

Desde una perspectiva de recolección de basura, para lenguajes con mecanismos automáticos de recolección de basura como Java, Python y Go, si el nodo `P` se recolecta depende de si todavía hay referencias que apunten a él, no del valor de `P.next`. En lenguajes como C y C++, necesitamos liberar manualmente la memoria del nodo.

**P**: En las listas enlazadas, la complejidad temporal para las operaciones de inserción y eliminación es `O(1)`. Pero buscar el elemento antes de la inserción o eliminación toma `O(n)` tiempo, entonces ¿por qué la complejidad temporal no es `O(n)`?

Si un elemento se busca primero y luego se elimina, la complejidad temporal es de hecho `O(n)`. Sin embargo, la ventaja de `O(1)` de las listas enlazadas en la inserción y eliminación se puede realizar en otras aplicaciones. Por ejemplo, en la implementación de colas de doble extremo usando listas enlazadas, mantenemos punteros que siempre apuntan a los nodos cabeza y cola, lo que hace que cada operación de inserción y eliminación sea `O(1)`.

**P**: En la figura "Definición de lista enlazada y método de almacenamiento", ¿los nodos de almacenamiento de color azul claro ocupan una única dirección de memoria, o comparten la mitad con el valor del nodo?

La figura es solo una representación cualitativa; el análisis cuantitativo depende de situaciones específicas.

- Diferentes tipos de valores de nodo ocupan diferentes cantidades de espacio, como int, long, double e instancias de objetos.
- El espacio de memoria ocupado por las variables de puntero depende del sistema operativo y del entorno de compilación utilizados, generalmente 8 bytes o 4 bytes.

**P**: ¿Agregar elementos al final de una lista siempre es `O(1)`?

Si agregar un elemento excede la longitud de la lista, la lista debe expandirse primero. El sistema solicitará un nuevo bloque de memoria y moverá todos los elementos de la lista original, en cuyo caso la complejidad temporal se convierte en `O(n)`.

**P**: La afirmación "La aparición de las listas mejora en gran medida la practicidad de los arreglos, pero puede conducir a cierto desperdicio de espacio de memoria" - ¿se refiere a la memoria ocupada por variables adicionales como capacidad, longitud y multiplicador de expansión?

El desperdicio de espacio aquí se refiere principalmente a dos aspectos: por un lado, las listas se establecen con una longitud inicial, que no siempre necesitamos; por otro lado, para evitar expansiones frecuentes, la expansión generalmente se multiplica por un coeficiente, como $\times 1.5$. Esto da como resultado muchos espacios vacíos, que normalmente no podemos llenar por completo.

**P**: En Python, después de inicializar `n = [1, 2, 3]`, las direcciones de estos 3 elementos son contiguas, pero al inicializar `m = [2, 1, 3]` se muestra que el `id` de cada elemento no es consecutivo, sino idéntico a los de `n`. Si las direcciones de estos elementos no son contiguas, ¿sigue siendo `m` un arreglo?

Si reemplazamos los elementos de la lista con nodos de lista enlazada `n = [n1, n2, n3, n4, n5]`, estos 5 objetos de nodo también suelen estar dispersos por la memoria. Sin embargo, dado un índice de lista, aún podemos acceder a la dirección de memoria del nodo en tiempo `O(1)`, accediendo así al nodo correspondiente. Esto se debe a que el arreglo almacena referencias a los nodos, no los nodos mismos.

A diferencia de muchos lenguajes, en Python, los números también se envuelven como objetos, y las listas almacenan referencias a estos números, no los números mismos. Por lo tanto, encontramos que el mismo número en dos arreglos tiene el mismo `id`, y las direcciones de memoria de estos números no necesitan ser contiguas.

**P**: La `std::list` en C++ STL ya ha implementado una lista doblemente enlazada, pero parece que algunos libros de algoritmos no la usan directamente. ¿Hay alguna limitación?

Por un lado, a menudo preferimos usar arreglos para implementar algoritmos, usando listas enlazadas solo cuando sea necesario, principalmente por dos razones.

- Sobrecarga de espacio: Dado que cada elemento requiere dos punteros adicionales (uno para el elemento anterior y otro para el siguiente), `std::list` generalmente ocupa más espacio que `std::vector`.
- Poco amigable con la caché: Como los datos no se almacenan continuamente, `std::list` tiene una tasa de utilización de caché más baja. Generalmente, `std.vector` funciona mejor.

Por otro lado, las listas enlazadas son principalmente necesarias para árboles binarios y grafos. Las pilas y las colas a menudo se implementan utilizando las clases `stack` y `queue` del lenguaje de programación, en lugar de listas enlazadas.

**P**: ¿Inicializar una lista `res = [0] * self.size()` da como resultado que cada elemento de `res` haga referencia a la misma dirección?

No. Sin embargo, este problema surge con arreglos bidimensionales, por ejemplo, inicializar una lista bidimensional `res = [[0]] * self.size()` haría referencia a la misma lista `[0]` varias veces.

**P**: Al eliminar un nodo, ¿es necesario romper la referencia a su nodo sucesor?

Desde la perspectiva de las estructuras de datos y los algoritmos (resolución de problemas), está bien no romper el enlace, siempre que la lógica del programa sea correcta. Desde la perspectiva de las bibliotecas estándar, romper el enlace es más seguro y lógicamente más claro. Si el enlace no se rompe y el nodo eliminado no se recicla correctamente, podría afectar el reciclaje de la memoria del nodo sucesor.
