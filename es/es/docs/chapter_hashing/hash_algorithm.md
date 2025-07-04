# Algoritmos hash

Las dos secciones anteriores introdujeron el principio de funcionamiento de las tablas hash y los métodos para manejar las colisiones hash. Sin embargo, tanto el direccionamiento abierto como el encadenamiento **solo pueden garantizar que la tabla hash funcione normalmente cuando ocurren colisiones, pero no pueden reducir la frecuencia de las colisiones hash**.

Si las colisiones hash ocurren con demasiada frecuencia, el rendimiento de la tabla hash se deteriorará drásticamente. Como se muestra en la figura a continuación, para una tabla hash de encadenamiento, en el caso ideal, los pares clave-valor se distribuyen uniformemente entre los cubos, logrando una eficiencia de consulta óptima; en el peor de los casos, todos los pares clave-valor se almacenan en el mismo cubo, degradando la complejidad temporal a $O(n)$.

![Casos ideales y peores de colisiones hash](hash_algorithm.assets/hash_collision_best_worst_condition.png)

**La distribución de los pares clave-valor está determinada por la función hash**. Recordando los pasos para calcular una función hash, primero se calcula el valor hash y luego se le aplica el módulo de la longitud del arreglo:

```shell
index = hash(key) % capacity
```

Observando la fórmula anterior, cuando la capacidad de la tabla hash `capacity` es fija, **el algoritmo hash `hash()` determina el valor de salida**, determinando así la distribución de los pares clave-valor en la tabla hash.

Esto significa que, para reducir la probabilidad de colisiones hash, debemos centrarnos en el diseño del algoritmo hash `hash()`.

## Objetivos de los algoritmos hash

Para lograr una estructura de datos de tabla hash "rápida y estable", los algoritmos hash deben tener las siguientes características:

-   **Determinismo**: Para la misma entrada, el algoritmo hash siempre debe producir la misma salida. Solo así la tabla hash puede ser confiable.
-   **Alta eficiencia**: El proceso de cálculo del valor hash debe ser lo suficientemente rápido. Cuanto menor sea la sobrecarga computacional, más práctica será la tabla hash.
-   **Distribución uniforme**: El algoritmo hash debe garantizar que los pares clave-valor se distribuyan uniformemente en la tabla hash. Cuanto más uniforme sea la distribución, menor será la probabilidad de colisiones hash.

De hecho, los algoritmos hash no solo se utilizan para implementar tablas hash, sino que también se aplican ampliamente en otros campos.

-   **Almacenamiento de contraseñas**: Para proteger la seguridad de las contraseñas de los usuarios, los sistemas generalmente no almacenan las contraseñas en texto plano, sino los valores hash de las contraseñas. Cuando un usuario ingresa una contraseña, el sistema calcula el valor hash de la entrada y lo compara con el valor hash almacenado. Si coinciden, la contraseña se considera correcta.
-   **Verificación de integridad de datos**: El remitente de los datos puede calcular el valor hash de los datos y enviarlo; el receptor puede volver a calcular el valor hash de los datos recibidos y compararlo con el valor hash recibido. Si coinciden, los datos se consideran intactos.

Para aplicaciones criptográficas, para evitar la ingeniería inversa, como deducir la contraseña original a partir del valor hash, los algoritmos hash necesitan características de seguridad de nivel superior.

-   **Unidireccionalidad**: Debería ser imposible deducir cualquier información sobre los datos de entrada a partir del valor hash.
-   **Resistencia a colisiones**: Debería ser extremadamente difícil encontrar dos entradas diferentes que produzcan el mismo valor hash.
-   **Efecto avalancha**: Cambios menores en la entrada deberían conducir a cambios significativos e impredecibles en la salida.

Tenga en cuenta que **"Distribución uniforme" y "Resistencia a colisiones" son dos conceptos separados**. Satisfacer la distribución uniforme no significa necesariamente resistencia a colisiones. Por ejemplo, bajo una entrada `key` aleatoria, la función hash `key % 100` puede producir una salida distribuida uniformemente. Sin embargo, este algoritmo hash es demasiado simple, y todas las `key` con los mismos dos últimos dígitos tendrán la misma salida, lo que facilita la deducción de una `key` utilizable a partir del valor hash, lo que permite descifrar la contraseña.

## Diseño de algoritmos hash

El diseño de algoritmos hash es un problema complejo que requiere la consideración de muchos factores. Sin embargo, para algunos escenarios menos exigentes, también podemos diseñar algunos algoritmos hash simples.

-   **Hash aditivo**: Suma los códigos ASCII de cada carácter de la entrada y utiliza la suma total como valor hash.
-   **Hash multiplicativo**: Utiliza la no correlación de la multiplicación, multiplicando cada ronda por una constante, acumulando los códigos ASCII de cada carácter en el valor hash.
-   **Hash XOR**: Acumula el valor hash mediante la operación XOR de cada elemento de los datos de entrada.
-   **Hash rotatorio**: Acumula el código ASCII de cada carácter en un valor hash, realizando una operación de rotación en el valor hash antes de cada acumulación.

```src
[file]{simple_hash}-[class]{}-[func]{rot_hash}
```

Se observa que el último paso de cada algoritmo hash es tomar el módulo del número primo grande $1000000007$ para asegurar que el valor hash esté dentro de un rango apropiado. Vale la pena reflexionar por qué se enfatiza el módulo de un número primo, o cuáles son las desventajas del módulo de un número compuesto. Esta es una pregunta interesante.

Para concluir: **Usar un número primo grande como módulo puede maximizar la distribución uniforme de los valores hash**. Dado que un número primo no comparte factores comunes con otros números, puede reducir los patrones periódicos causados por la operación de módulo, evitando así las colisiones hash.

Por ejemplo, supongamos que elegimos el número compuesto $9$ como módulo, que se puede dividir por $3$, entonces todas las `key` divisibles por $3$ se asignarán a los valores hash $0$, $3$, $6$.

$$
\begin{aligned}
\text{módulo} & = 9 \\
\text{clave} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \\
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

Si la `key` de entrada tiene este tipo de distribución de secuencia aritmética, entonces los valores hash se agruparán, lo que exacerbará las colisiones hash. Ahora, supongamos que reemplazamos `módulo` con el número primo $13$, ya que no hay factores comunes entre `key` y `módulo`, la uniformidad de los valores hash de salida mejorará significativamente.

$$
\begin{aligned}
\text{módulo} & = 13 \\
\text{clave} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \\
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

Cabe señalar que si se garantiza que la `key` se distribuye de forma aleatoria y uniforme, entonces elegir un número primo o un número compuesto como módulo puede producir valores hash distribuidos uniformemente. Sin embargo, cuando la distribución de la `key` tiene cierta periodicidad, el módulo de un número compuesto es más probable que resulte en agrupamiento.

En resumen, generalmente elegimos un número primo como módulo, y este número primo debe ser lo suficientemente grande como para eliminar los patrones periódicos tanto como sea posible, mejorando la robustez del algoritmo hash.

## Algoritmos hash comunes

No es difícil ver que los algoritmos hash simples mencionados anteriormente son bastante "frágiles" y están lejos de alcanzar los objetivos de diseño de los algoritmos hash. Por ejemplo, dado que la suma y la XOR obedecen la ley conmutativa, el hash aditivo y el hash XOR no pueden distinguir cadenas con el mismo contenido pero en diferente orden, lo que puede exacerbar las colisiones hash y causar problemas de seguridad.

En la práctica, generalmente usamos algunos algoritmos hash estándar, como MD5, SHA-1, SHA-2 y SHA-3. Pueden mapear datos de entrada de cualquier longitud a un valor hash de longitud fija.

Durante el siglo pasado, los algoritmos hash han estado en un proceso continuo de actualización y optimización. Algunos investigadores se esfuerzan por mejorar el rendimiento de los algoritmos hash, mientras que otros, incluidos los hackers, se dedican a encontrar problemas de seguridad en los algoritmos hash. La siguiente tabla muestra los algoritmos hash comúnmente utilizados en aplicaciones prácticas.

- MD5 y SHA-1 han sido atacados con éxito varias veces y, por lo tanto, se abandonan en varias aplicaciones de seguridad.
- La serie SHA-2, especialmente SHA-256, es uno de los algoritmos hash más seguros hasta la fecha, sin ataques exitosos reportados, por lo que se usa comúnmente en varias aplicaciones y protocolos de seguridad.
- SHA-3 tiene costos de implementación más bajos y mayor eficiencia computacional en comparación con SHA-2, pero su cobertura de uso actual no es tan extensa como la serie SHA-2.

<p align="center"> Tabla <id> &nbsp; Algoritmos hash comunes </p>

|                 | MD5                                             | SHA-1                               | SHA-2                                                             | SHA-3                        |
| --------------- | ----------------------------------------------- | ----------------------------------- | ----------------------------------------------------------------- | ---------------------------- |
| Año de lanzamiento    | 1992                                            | 1995                                | 2002                                                              | 2008                         |
| Longitud de salida   | 128 bits                                         | 160 bits                             | 256/512 bits                                                       | 224/256/384/512 bits          |
| Colisiones hash | Frecuentes                                        | Frecuentes                            | Raras                                                              | Raras                         |
| Nivel de seguridad  | Bajo, ha sido atacado con éxito             | Bajo, ha sido atacado con éxito | Alto                                                              | Alto                         |
| Aplicaciones    | Abandonado, todavía se usa para comprobaciones de integridad de datos | Abandonado                           | Verificación de transacciones de criptomonedas, firmas digitales, etc. | Se puede usar para reemplazar SHA-2 |

# Valores hash en estructuras de datos

Sabemos que las claves en una tabla hash pueden ser de varios tipos de datos, como enteros, decimales o cadenas. Los lenguajes de programación suelen proporcionar algoritmos hash incorporados para estos tipos de datos para calcular los índices de los cubos en la tabla hash. Tomando Python como ejemplo, podemos usar la función `hash()` para calcular los valores hash para varios tipos de datos.

- Los valores hash de enteros y booleanos son sus propios valores.
- El cálculo de los valores hash para números de punto flotante y cadenas es más complejo, y se anima a los lectores interesados a estudiarlo por su cuenta.
- El valor hash de una tupla es una combinación de los valores hash de cada uno de sus elementos, lo que da como resultado un único valor hash.
- El valor hash de un objeto se genera en función de su dirección de memoria. Al anular el método hash de un objeto, los valores hash se pueden generar en función del contenido.

!!! tip

    Tenga en cuenta que la definición y los métodos de las funciones de cálculo de valores hash incorporadas en diferentes lenguajes de programación varían.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    # El valor hash del entero 3 es 3

    bol = True
    hash_bol = hash(bol)
    # El valor hash del booleano True es 1

    dec = 3.14159
    hash_dec = hash(dec)
    # El valor hash del decimal 3.14159 es 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    # El valor hash de la cadena "Hello 算法" es 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    # El valor hash de la tupla (12836, '小哈') es 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    # El valor hash del objeto ListNode en 0x1058fd810 es 274267521
    ```

En muchos lenguajes de programación, **solo los objetos inmutables pueden servir como `key` en una tabla hash**. Si usamos una lista (arreglo dinámico) como `key`, cuando el contenido de la lista cambia, su valor hash también cambia, y ya no podríamos encontrar el `value` original en la tabla hash.

Aunque las variables miembro de un objeto personalizado (como un nodo de lista enlazada) son mutables, es hasheable. **Esto se debe a que el valor hash de un objeto generalmente se genera en función de su dirección de memoria**, e incluso si el contenido del objeto cambia, la dirección de memoria permanece igual, por lo que el valor hash permanece sin cambios.

Es posible que haya notado que los valores hash de salida en diferentes consolas son diferentes. **Esto se debe a que el intérprete de Python agrega una sal aleatoria a la función hash de cadena cada vez que se inicia**. Este enfoque previene eficazmente los ataques HashDoS y mejora la seguridad del algoritmo hash.
