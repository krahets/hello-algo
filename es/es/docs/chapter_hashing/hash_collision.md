# Colisión hash

La sección anterior mencionaba que, **en la mayoría de los casos, el espacio de entrada de una función hash es mucho mayor que el espacio de salida**, por lo que, teóricamente, las colisiones hash son inevitables. Por ejemplo, si el espacio de entrada son todos los enteros y el espacio de salida es el tamaño de la capacidad del arreglo, entonces inevitablemente varios enteros se asignarán al mismo índice de cubo.

Las colisiones hash pueden conducir a resultados de consulta incorrectos, lo que afecta gravemente la usabilidad de la tabla hash. Para abordar este problema, cada vez que ocurre una colisión hash, realizamos un redimensionamiento de la tabla hash hasta que la colisión desaparece. Este enfoque es bastante simple, directo y funciona bien. Sin embargo, parece ser bastante ineficiente, ya que la expansión de la tabla implica una gran cantidad de migración de datos, así como el recálculo del código hash, que son costosos. Para mejorar la eficiencia, podemos adoptar las siguientes estrategias:

1.  Mejorar la estructura de datos de la tabla hash de tal manera que **la localización del elemento objetivo siga funcionando bien en caso de una colisión hash**.
2.  La expansión es el último recurso antes de que sea necesaria, cuando se observan colisiones graves.

Existen principalmente dos métodos para mejorar la estructura de las tablas hash: "Encadenamiento separado" y "Direccionamiento abierto".

## Encadenamiento separado

En la tabla hash original, cada cubo puede almacenar solo un par clave-valor. El <u>encadenamiento separado</u> convierte un solo elemento en una lista enlazada, tratando los pares clave-valor como nodos de lista, almacenando todos los pares clave-valor en colisión en la misma lista enlazada. La figura a continuación muestra un ejemplo de una tabla hash con encadenamiento separado.

![Tabla hash de encadenamiento separado](hash_collision.assets/hash_table_chaining.png)

Las operaciones de una tabla hash implementada con encadenamiento separado han cambiado de la siguiente manera:

-   **Consulta de elementos**: Introduzca `key`, obtenga el índice del cubo a través de la función hash, luego acceda al nodo cabeza de la lista enlazada. Recorra la lista enlazada y compare la clave para encontrar el par clave-valor objetivo.
-   **Adición de elementos**: Acceda al nodo cabeza de la lista enlazada a través de la función hash, luego agregue el nodo (par clave-valor) a la lista.
-   **Eliminación de elementos**: Acceda a la cabeza de la lista enlazada basándose en el resultado de la función hash, luego recorra la lista enlazada para encontrar el nodo objetivo y eliminarlo.

El encadenamiento separado tiene las siguientes limitaciones:

-   **Mayor uso de espacio**: La lista enlazada contiene punteros de nodo, que consumen más espacio de memoria que los arreglos.
-   **Menor eficiencia de consulta**: Esto se debe a que se requiere un recorrido lineal de la lista enlazada para encontrar el elemento correspondiente.

El código a continuación proporciona una implementación simple de una tabla hash de encadenamiento separado, con dos cosas a tener en cuenta:

-   Se utilizan listas (arreglos dinámicos) en lugar de listas enlazadas para simplificar. En esta configuración, la tabla hash (arreglo) contiene múltiples cubos, cada uno de los cuales es una lista.
-   Esta implementación incluye un método de redimensionamiento de la tabla hash. Cuando el factor de carga excede $\frac{2}{3}$, expandimos la tabla hash al doble de su tamaño original.

```src
[file]{hash_map_chaining}-[class]{hash_map_chaining}-[func]{}
```

Cabe señalar que cuando la lista enlazada es muy larga, la eficiencia de consulta $O(n)$ es deficiente. **En este caso, la lista se puede convertir a un "árbol AVL" o "árbol rojo-negro"** para optimizar la complejidad temporal de la operación de consulta a $O(\log n)$.

## Direccionamiento abierto

El <u>direccionamiento abierto</u> no introduce estructuras de datos adicionales, sino que maneja las colisiones hash a través de "múltiples sondeos". Los métodos de sondeo incluyen principalmente el sondeo lineal, el sondeo cuadrático y el doble hash.

Usemos el sondeo lineal como ejemplo para introducir el mecanismo de las tablas hash de direccionamiento abierto.

### Sondeo lineal

El sondeo lineal utiliza una búsqueda lineal de paso fijo para el sondeo, a diferencia de las tablas hash ordinarias.

-   **Inserción de elementos**: Calcule el índice del cubo usando la función hash. Si el cubo ya contiene un elemento, recorra linealmente hacia adelante desde la posición de conflicto (generalmente con un tamaño de paso de $1$) hasta que se encuentre un cubo vacío, luego inserte el elemento.
-   **Búsqueda de elementos**: Si se encuentra una colisión hash, use el mismo tamaño de paso para recorrer linealmente hacia adelante hasta que se encuentre el elemento correspondiente y devuelva `value`; si se encuentra un cubo vacío, significa que el elemento objetivo no está en la tabla hash, así que devuelva `None`.

La figura a continuación muestra la distribución de pares clave-valor en una tabla hash de direccionamiento abierto (sondeo lineal). Según esta función hash, las claves con los mismos dos últimos dígitos se asignarán al mismo cubo. Mediante el sondeo lineal, se almacenan secuencialmente en ese cubo y en los cubos debajo de él.

![Distribución de pares clave-valor en la tabla hash de direccionamiento abierto (sondeo lineal)](hash_collision.assets/hash_table_linear_probing.png)

Sin embargo, **el sondeo lineal tiende a crear "agrupamiento"**. Específicamente, cuanto más largas sean las posiciones continuamente ocupadas en el arreglo, mayor será la probabilidad de que ocurran colisiones hash en estas posiciones continuas, lo que promoverá aún más el crecimiento del agrupamiento en esa posición, formando un círculo vicioso y, en última instancia, conduciendo a una degradación de la eficiencia de las operaciones de inserción, eliminación, consulta y actualización.

Es importante tener en cuenta que **no podemos eliminar directamente elementos en una tabla hash de direccionamiento abierto**. La eliminación de un elemento crea un cubo vacío `None` en el arreglo. Al buscar elementos, si el sondeo lineal encuentra este cubo vacío, regresará, lo que hará que los elementos debajo de este cubo sean inaccesibles. El programa puede asumir incorrectamente que estos elementos no existen, como se muestra en la figura a continuación.

![Problemas de consulta causados por la eliminación en el direccionamiento abierto](hash_collision.assets/hash_table_open_addressing_deletion.png)

Para resolver este problema, podemos adoptar el mecanismo de <u>eliminación perezosa</u>: en lugar de eliminar directamente elementos de la tabla hash, **use una constante `TOMBSTONE` para marcar el cubo**. En este mecanismo, tanto `None` como `TOMBSTONE` representan cubos vacíos y pueden contener pares clave-valor. Sin embargo, cuando el sondeo lineal encuentra `TOMBSTONE`, debe continuar recorriendo, ya que aún puede haber pares clave-valor debajo de él.

Sin embargo, **la eliminación perezosa puede acelerar la degradación del rendimiento de la tabla hash**. Cada operación de eliminación produce una marca de eliminación, y a medida que aumenta `TOMBSTONE`, el tiempo de búsqueda también aumentará porque el sondeo lineal puede necesitar omitir múltiples `TOMBSTONE` para encontrar el elemento objetivo.

Para abordar esto, considere registrar el índice del primer `TOMBSTONE` encontrado durante el sondeo lineal e intercambiar las posiciones del elemento objetivo buscado con ese `TOMBSTONE`. El beneficio de hacer esto es que cada vez que se consulta o agrega un elemento, el elemento se moverá a un cubo más cercano a su posición ideal (el punto de partida del sondeo), optimizando así la eficiencia de la consulta.

El código a continuación implementa una tabla hash de direccionamiento abierto (sondeo lineal) con eliminación perezosa. Para hacer un mejor uso del espacio de la tabla hash, tratamos la tabla hash como un "arreglo circular". Al ir más allá del final del arreglo, volvemos al principio y continuamos recorriendo.

```src
[file]{hash_map_open_addressing}-[class]{hash_map_open_addressing}-[func]{}
```

### Sondeo cuadrático

El sondeo cuadrático es similar al sondeo lineal y es una de las estrategias comunes de direccionamiento abierto. Cuando ocurre una colisión, el sondeo cuadrático no simplemente salta un número fijo de pasos, sino que salta un número de pasos igual al "cuadrado del número de sondeos", es decir, $1, 4, 9, \dots$ pasos.

El sondeo cuadrático tiene las siguientes ventajas:

-   El sondeo cuadrático intenta aliviar el efecto de agrupamiento del sondeo lineal saltando la distancia del cuadrado del número de sondeos.
-   El sondeo cuadrático salta distancias mayores para encontrar posiciones vacías, lo que ayuda a distribuir los datos de manera más uniforme.

Sin embargo, el sondeo cuadrático no es perfecto:

-   Todavía existe el agrupamiento, es decir, algunas posiciones tienen más probabilidades de ser ocupadas que otras.
-   Debido al crecimiento de los cuadrados, el sondeo cuadrático puede no sondear toda la tabla hash, lo que significa que incluso si hay cubos vacíos en la tabla hash, el sondeo cuadrático puede no ser capaz de acceder a ellos.

### Doble hash

Como su nombre indica, el método de doble hash utiliza múltiples funciones hash $f_1(x)$, $f_2(x)$, $f_3(x)$, $\dots$ para el sondeo.

-   **Inserción de elementos**: Si la función hash $f_1(x)$ encuentra un conflicto, intenta $f_2(x)$, y así sucesivamente, hasta que se encuentra una posición vacía y se inserta el elemento.
-   **Búsqueda de elementos**: Busque en el mismo orden de funciones hash hasta que se encuentre el elemento objetivo y se devuelva; si se encuentra una posición vacía o se han probado todas las funciones hash, indica que el elemento no está en la tabla hash, entonces devuelva `None`.

En comparación con el sondeo lineal, el método de doble hash es menos propenso al agrupamiento, pero múltiples funciones hash introducen una sobrecarga computacional adicional.

!!! tip

    Tenga en cuenta que las tablas hash de direccionamiento abierto (sondeo lineal, sondeo cuadrático y doble hash) tienen el problema de "no poder eliminar elementos directamente".

## Elección de lenguajes de programación

Los diferentes lenguajes de programación adoptan diferentes estrategias de implementación de tablas hash. Aquí hay algunos ejemplos:

- Python utiliza direccionamiento abierto. El diccionario `dict` utiliza números pseudoaleatorios para el sondeo.
- Java utiliza encadenamiento separado. Desde JDK 1.8, cuando la longitud del arreglo en `HashMap` alcanza 64 y la longitud de una lista enlazada alcanza 8, la lista enlazada se convierte en un árbol rojo-negro para mejorar el rendimiento de búsqueda.
- Go utiliza encadenamiento separado. Go estipula que cada cubo puede almacenar hasta 8 pares clave-valor, y si se excede la capacidad, se vincula un cubo de desbordamiento; cuando hay demasiados cubos de desbordamiento, se realiza una operación especial de redimensionamiento de igual capacidad para garantizar el rendimiento.
