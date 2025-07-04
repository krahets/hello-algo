# Resumen

### Revisión clave

- Dada una `clave` de entrada, una tabla hash puede recuperar el `valor` correspondiente en tiempo $O(1)$, lo cual es altamente eficiente.
- Las operaciones comunes de la tabla hash incluyen consultar, agregar pares clave-valor, eliminar pares clave-valor y recorrer la tabla hash.
- La función hash mapea una `clave` a un índice de arreglo, lo que permite acceder al cubo correspondiente y recuperar el `valor`.
- Dos claves diferentes pueden terminar con el mismo índice de arreglo después del hash, lo que lleva a resultados de consulta erróneos. Este fenómeno se conoce como colisión hash.
- Cuanto mayor sea la capacidad de la tabla hash, menor será la probabilidad de colisiones hash. Por lo tanto, el redimensionamiento de la tabla hash puede mitigar las colisiones hash. Similar al redimensionamiento de arreglos, el redimensionamiento de tablas hash es costoso.
- El factor de carga, definido como el número de elementos dividido por el número de cubos, refleja la gravedad de las colisiones hash y a menudo se utiliza como condición para activar el redimensionamiento de la tabla hash.
- El encadenamiento aborda las colisiones hash convirtiendo cada elemento en una lista enlazada, almacenando todos los elementos en colisión en la misma lista. Sin embargo, las listas excesivamente largas pueden reducir la eficiencia de la consulta, lo que se puede mejorar convirtiendo las listas en árboles rojo-negro.
- El direccionamiento abierto maneja las colisiones hash a través de múltiples sondeos. El sondeo lineal utiliza un tamaño de paso fijo, pero no puede eliminar elementos y es propenso a la agrupación. El hash múltiple utiliza varias funciones hash para el sondeo, lo que reduce la agrupación en comparación con el sondeo lineal, pero aumenta la sobrecarga computacional.
- Diferentes lenguajes de programación adoptan varias implementaciones de tablas hash. Por ejemplo, `HashMap` de Java utiliza encadenamiento, mientras que `dict` de Python emplea direccionamiento abierto.
- En las tablas hash, deseamos algoritmos hash con determinismo, alta eficiencia y distribución uniforme. En criptografía, los algoritmos hash también deben poseer resistencia a colisiones y el efecto avalancha.
- Los algoritmos hash suelen utilizar números primos grandes como módulos para garantizar una distribución uniforme de los valores hash y reducir las colisiones hash.
- Los algoritmos hash comunes incluyen MD5, SHA-1, SHA-2 y SHA-3. MD5 se usa a menudo para comprobaciones de integridad de archivos, mientras que SHA-2 se usa comúnmente en aplicaciones y protocolos seguros.
- Los lenguajes de programación suelen proporcionar algoritmos hash incorporados para los tipos de datos para calcular los índices de los cubos en las tablas hash. Generalmente, solo los objetos inmutables son hasheables.

### Preguntas y respuestas

**P**: ¿Cuándo se degrada la complejidad temporal de una tabla hash a $O(n)$?

La complejidad temporal de una tabla hash puede degradarse a $O(n)$ cuando las colisiones hash son graves. Cuando la función hash está bien diseñada, la capacidad se establece adecuadamente y las colisiones se distribuyen uniformemente, la complejidad temporal es $O(1)$. Generalmente consideramos que la complejidad temporal es $O(1)$ cuando se utilizan tablas hash incorporadas en los lenguajes de programación.

**P**: ¿Por qué no usar la función hash $f(x) = x$? Esto eliminaría las colisiones.

Bajo la función hash $f(x) = x$, cada elemento corresponde a un índice de cubo único, lo que equivale a un arreglo. Sin embargo, el espacio de entrada suele ser mucho mayor que el espacio de salida (longitud del arreglo), por lo que el último paso de una función hash suele ser tomar el módulo de la longitud del arreglo. En otras palabras, el objetivo de una tabla hash es mapear un espacio de estado más grande a uno más pequeño mientras proporciona una eficiencia de consulta de $O(1)$.

**P**: ¿Por qué las tablas hash pueden ser más eficientes que los arreglos, las listas enlazadas o los árboles binarios, aunque las tablas hash se implementan utilizando estas estructuras?

En primer lugar, las tablas hash tienen una mayor eficiencia temporal pero una menor eficiencia espacial. Una parte significativa de la memoria en las tablas hash permanece sin usar.

En segundo lugar, las tablas hash solo son más eficientes en tiempo en casos de uso específicos. Si una característica se puede implementar con la misma complejidad temporal utilizando un arreglo o una lista enlazada, generalmente es más rápido que usar una tabla hash. Esto se debe a que el cálculo de la función hash incurre en una sobrecarga, lo que hace que el factor constante en la complejidad temporal sea mayor.

Por último, la complejidad temporal de las tablas hash puede degradarse. Por ejemplo, en el encadenamiento, realizamos operaciones de búsqueda en una lista enlazada o un árbol rojo-negro, lo que aún corre el riesgo de degradarse a tiempo $O(n)$.

**P**: ¿El hash múltiple también tiene el defecto de no poder eliminar elementos directamente? ¿Se puede reutilizar el espacio marcado como eliminado?

El hash múltiple es una forma de direccionamiento abierto, y todos los métodos de direccionamiento abierto tienen el inconveniente de no poder eliminar elementos directamente; requieren marcar los elementos como eliminados. Los espacios marcados se pueden reutilizar. Al insertar nuevos elementos en la tabla hash, y la función hash apunta a una posición marcada como eliminada, esa posición puede ser utilizada por el nuevo elemento. Esto mantiene la secuencia de sondeo de la tabla hash al tiempo que garantiza un uso eficiente del espacio.

**P**: ¿Por qué ocurren colisiones hash durante el proceso de búsqueda en el sondeo lineal?

Durante el proceso de búsqueda, la función hash apunta al cubo y al par clave-valor correspondientes. Si la `clave` no coincide, indica una colisión hash. Por lo tanto, el sondeo lineal buscará hacia abajo con un tamaño de paso predeterminado hasta que se encuentre el par clave-valor correcto o la búsqueda falle.

**P**: ¿Por qué redimensionar una tabla hash puede aliviar las colisiones hash?

El último paso de una función hash a menudo implica tomar el módulo de la longitud del arreglo $n$, para mantener la salida dentro del rango del índice del arreglo. Al redimensionar, la longitud del arreglo $n$ cambia, y los índices correspondientes a las claves también pueden cambiar. Las claves que antes se asignaban al mismo cubo podrían distribuirse en varios cubos después del redimensionamiento, mitigando así las colisiones hash.
