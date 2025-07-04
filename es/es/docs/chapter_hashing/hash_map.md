# Tabla hash

Una <u>tabla hash</u>, también conocida como <u>mapa hash</u>, es una estructura de datos que establece un mapeo entre claves y valores, lo que permite una recuperación eficiente de elementos. Específicamente, cuando introducimos una `clave` en la tabla hash, podemos recuperar el `valor` correspondiente con una complejidad temporal de $O(1)$.

Como se muestra en la figura a continuación, dados $n$ estudiantes, cada estudiante tiene dos campos de datos: "Nombre" y "ID de estudiante". Si queremos implementar una función de consulta que tome un ID de estudiante como entrada y devuelva el nombre correspondiente, podemos usar la tabla hash que se muestra en la figura a continuación.

![Representación abstracta de una tabla hash](hash_map.assets/hash_table_lookup.png)

Además de las tablas hash, los arreglos y las listas enlazadas también se pueden usar para implementar la funcionalidad de consulta, pero la complejidad temporal es diferente. Su eficiencia se compara en la tabla a continuación:

-   **Insertar un elemento**: Simplemente agregue el elemento al final del arreglo (o lista enlazada). La complejidad temporal de esta operación es $O(1)$.
-   **Buscar un elemento**: Como el arreglo (o lista enlazada) no está ordenado, buscar un elemento requiere recorrer todos los elementos. La complejidad temporal de esta operación es $O(n)$.
-   **Eliminar un elemento**: Para eliminar un elemento, primero debemos localizarlo. Luego, lo eliminamos del arreglo (o lista enlazada). La complejidad temporal de esta operación es $O(n)$.

<p align="center"> Tabla <id> &nbsp; Comparación de la eficiencia temporal para operaciones comunes </p>

|                | Arreglo | Lista enlazada | Tabla hash |
| -------------- | ------ | ----------- | ---------- |
| Buscar elementos   | $O(n)$ | $O(n)$      | $O(1)$     |
| Insertar elementos    | $O(1)$ | $O(1)$      | $O(1)$     |
| Eliminar elementos | $O(n)$ | $O(n)$      | $O(1)$     |

Como se observa, **la complejidad temporal para las operaciones (inserción, eliminación, búsqueda y modificación) en una tabla hash es $O(1)$**, lo cual es altamente eficiente.

## Operaciones comunes de la tabla hash

Las operaciones comunes de una tabla hash incluyen: inicialización, consulta, adición de pares clave-valor y eliminación de pares clave-valor. Aquí hay un ejemplo de código:

=== "Python"

    ```python title="hash_map.py"
    # Inicializar tabla hash
    hmap: dict = {}

    # Operación de adición
    # Agregar par clave-valor (clave, valor) a la tabla hash
    hmap[12836] = "Xiao Ha"
    hmap[15937] = "Xiao Luo"
    hmap[16750] = "Xiao Suan"
    hmap[13276] = "Xiao Fa"
    hmap[10583] = "Xiao Ya"

    # Operación de consulta
    # Ingresar clave en la tabla hash, obtener valor
    name: str = hmap[15937]

    # Operación de eliminación
    # Eliminar par clave-valor (clave, valor) de la tabla hash
    hmap.pop(10583)
    ```

Hay tres formas comunes de recorrer una tabla hash: recorrer pares clave-valor, recorrer claves y recorrer valores. Aquí hay un ejemplo de código:

=== "Python"

    ```python title="hash_map.py"
    # Recorrer tabla hash
    # Recorrer pares clave-valor clave->valor
    for key, value in hmap.items():
        print(key, "->", value)
    # Recorrer solo claves
    for key in hmap.keys():
        print(key)
    # Recorrer solo valores
    for value in hmap.values():
        print(value)
    ```

## Implementación simple de una tabla hash

Primero, consideremos el caso más simple: **implementar una tabla hash usando solo un arreglo**. En la tabla hash, cada espacio vacío en el arreglo se llama <u>cubo</u>, y cada cubo puede almacenar un par clave-valor. Por lo tanto, la operación de consulta implica encontrar el cubo correspondiente a la `clave` y recuperar el `valor` de él.

Entonces, ¿cómo localizamos el cubo correspondiente basándonos en la `clave`? Esto se logra a través de una <u>función hash</u>. El papel de la función hash es mapear un espacio de entrada más grande a un espacio de salida más pequeño. En una tabla hash, el espacio de entrada consiste en todas las claves, y el espacio de salida consiste en todos los cubos (índices de arreglo). En otras palabras, dada una `clave`, **podemos usar la función hash para determinar la ubicación de almacenamiento del par clave-valor correspondiente en el arreglo**.

Con una `clave` dada, el cálculo de la función hash consta de dos pasos:

1.  Calcular el valor hash usando un cierto algoritmo hash `hash()`.
2.  Tomar el módulo del valor hash con el número de cubos (longitud del arreglo) `capacity` para obtener el `índice` del arreglo correspondiente a la clave.

```shell
index = hash(key) % capacity
```

Posteriormente, podemos usar el `índice` para acceder al cubo correspondiente en la tabla hash y así recuperar el `valor`.

Supongamos que la longitud del arreglo es `capacity = 100`, y el algoritmo hash se define como `hash(key) = key`. Por lo tanto, la función hash se puede expresar como `key % 100`. La siguiente figura ilustra el principio de funcionamiento de la función hash usando `key` como ID de estudiante y `value` como nombre.

![Principio de funcionamiento de la función hash](hash_map.assets/hash_function.png)

El siguiente código implementa una tabla hash simple. Aquí, encapsulamos `key` y `value` en una clase `Pair` para representar el par clave-valor.

```src
[file]{array_hash_map}-[class]{array_hash_map}-[func]{}
```

## Colisión hash y redimensionamiento

Esencialmente, el papel de la función hash es mapear todo el espacio de entrada de todas las claves al espacio de salida de todos los índices de arreglo. Sin embargo, el espacio de entrada suele ser mucho mayor que el espacio de salida. Por lo tanto, **teóricamente, siempre habrá casos en los que "múltiples entradas correspondan a la misma salida"**.

En el ejemplo anterior, con la función hash dada, cuando los dos últimos dígitos de la `clave` de entrada son los mismos, la función hash produce la misma salida. Por ejemplo, al consultar a dos estudiantes con ID de estudiante 12836 y 20336, encontramos:

```shell
12836 % 100 = 36
20336 % 100 = 36
```

Como se muestra en la figura a continuación, ambos ID de estudiante apuntan al mismo nombre, lo cual es obviamente incorrecto. Esta situación en la que múltiples entradas corresponden a la misma salida se denomina <u>colisión hash</u>.

![Ejemplo de colisión hash](hash_map.assets/hash_collision.png)

Es fácil entender que a medida que aumenta la capacidad $n$ de la tabla hash, la probabilidad de que varias claves se asignen al mismo cubo disminuye, lo que resulta en menos colisiones. Por lo tanto, **podemos reducir las colisiones hash redimensionando la tabla hash**.

Como se muestra en la figura a continuación, antes de redimensionar, los pares clave-valor `(136, A)` y `(236, D)` colisionan. Sin embargo, después de redimensionar, la colisión se resuelve.

![Redimensionamiento de la tabla hash](hash_map.assets/hash_table_reshash.png)

Similar a la expansión de arreglos, redimensionar una tabla hash requiere migrar todos los pares clave-valor de la tabla hash original a la nueva, lo que consume mucho tiempo. Además, dado que la `capacidad` de la tabla hash cambia, necesitamos recalcular las posiciones de almacenamiento de todos los pares clave-valor usando la función hash, lo que aumenta aún más la sobrecarga computacional del proceso de redimensionamiento. Por lo tanto, los lenguajes de programación a menudo asignan una capacidad suficientemente grande para la tabla hash para evitar redimensionamientos frecuentes.

El <u>factor de carga</u> es un concepto importante en las tablas hash. Se define como la relación entre el número de elementos en la tabla hash y el número de cubos. Se utiliza para medir la gravedad de las colisiones hash y **a menudo sirve como un disparador para el redimensionamiento de la tabla hash**. Por ejemplo, en Java, cuando el factor de carga excede $0.75$, el sistema redimensionará la tabla hash al doble de su tamaño original.
