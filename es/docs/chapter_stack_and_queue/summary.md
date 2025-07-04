# Resumen

### Revisión clave

- La pila es una estructura de datos que sigue el principio de Último en Entrar, Primero en Salir (LIFO) y se puede implementar utilizando arreglos o listas enlazadas.
- En términos de eficiencia temporal, la implementación de la pila basada en arreglos tiene una eficiencia promedio más alta. Sin embargo, durante la expansión, la complejidad temporal para una sola operación de inserción puede degradarse a $O(n)$. En contraste, la implementación de la pila basada en listas enlazadas ofrece una eficiencia más estable.
- Con respecto a la eficiencia espacial, la implementación de la pila basada en arreglos puede conducir a cierto grado de desperdicio de espacio. Sin embargo, es importante tener en cuenta que el espacio de memoria ocupado por los nodos en una lista enlazada es generalmente mayor que el de los elementos en un arreglo.
- Una cola es una estructura de datos que sigue el principio de Primero en Entrar, Primero en Salir (FIFO), y también se puede implementar utilizando arreglos o listas enlazadas. Las conclusiones con respecto a la eficiencia temporal y espacial para las colas son similares a las de las pilas.
- Una cola de doble extremo (deque) es un tipo de cola más flexible que permite agregar y eliminar elementos en ambos extremos.

### Preguntas y respuestas

**P**: ¿La funcionalidad de avance y retroceso del navegador se implementa con una lista doblemente enlazada?

La navegación de avance y retroceso de un navegador es esencialmente una manifestación del concepto de "pila". Cuando un usuario visita una nueva página, la página se agrega a la parte superior de la pila; cuando hace clic en el botón de retroceso, la página se saca de la parte superior de la pila. Una cola de doble extremo (deque) puede implementar convenientemente algunas operaciones adicionales, como se menciona en la sección "Cola de doble extremo".

**P**: Después de sacar de una pila, ¿es necesario liberar la memoria del nodo sacado?

Si el nodo sacado se seguirá utilizando más tarde, no es necesario liberar su memoria. En lenguajes como Java y Python que tienen recolección de basura automática, no es necesaria la liberación manual de memoria; en C y C++, se requiere la liberación manual de memoria.

**P**: Una cola de doble extremo parece dos pilas unidas. ¿Cuáles son sus usos?

Una cola de doble extremo, que es una combinación de una pila y una cola o dos pilas unidas, exhibe la lógica tanto de la pila como de la cola. Por lo tanto, puede implementar todas las aplicaciones de pilas y colas al tiempo que ofrece mayor flexibilidad.

**P**: ¿Cómo se implementan exactamente las funciones de deshacer y rehacer?

Las operaciones de deshacer y rehacer se implementan utilizando dos pilas: Pila `A` para deshacer y Pila `B` para rehacer.

1.  Cada vez que un usuario realiza una operación, se empuja a la Pila `A`, y la Pila `B` se vacía.
2.  Cuando el usuario ejecuta un "deshacer", la operación más reciente se saca de la Pila `A` y se empuja a la Pila `B`.
3.  Cuando el usuario ejecuta un "rehacer", la operación más reciente se saca de la Pila `B` y se empuja de nuevo a la Pila `A`.
