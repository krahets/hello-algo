# Resumen

### Revisión clave

- Un montículo es un árbol binario completo que se puede clasificar como un montículo máximo o un montículo mínimo según su propiedad de construcción, donde el elemento superior de un montículo máximo es el más grande y el elemento superior de un montículo mínimo es el más pequeño.
- Una cola de prioridad se define como una cola con prioridad de desencolado, generalmente implementada usando un montículo.
- Las operaciones comunes de un montículo y sus complejidades temporales correspondientes incluyen: inserción de elementos en el montículo $O(\log n)$, eliminación del elemento superior del montículo $O(\log n)$ y acceso al elemento superior del montículo $O(1)$.
- Un árbol binario completo es adecuado para ser representado por un arreglo, por lo que los montículos se almacenan comúnmente usando arreglos.
- Las operaciones de heapify se utilizan para mantener las propiedades del montículo y se utilizan tanto en las operaciones de inserción como de eliminación del montículo.
- La complejidad temporal de construir un montículo dado una entrada de $n$ elementos se puede optimizar a $O(n)$, lo cual es altamente eficiente.
- Top-k es un problema algorítmico clásico que se puede resolver eficientemente utilizando la estructura de datos del montículo, con una complejidad temporal de $O(n \log k)$.

### Preguntas y respuestas

**P**: ¿El "montículo" en las estructuras de datos es el mismo concepto que el "montículo" en la gestión de memoria?

Los dos no son el mismo concepto, aunque ambos se denominan "montículo". El montículo en la memoria del sistema informático es parte de la asignación dinámica de memoria, donde el programa puede usarlo para almacenar datos durante la ejecución. El programa puede solicitar una cierta cantidad de memoria del montículo para almacenar estructuras complejas como objetos y arreglos. Cuando los datos asignados ya no son necesarios, el programa necesita liberar esta memoria para evitar fugas de memoria. En comparación con la memoria de la pila, la gestión y el uso de la memoria del montículo exigen más precaución, ya que un uso inadecuado puede provocar fugas de memoria y punteros colgantes.
