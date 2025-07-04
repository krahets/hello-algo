# Estrategias de optimización hash

En los problemas de algoritmos, **a menudo reducimos la complejidad temporal de un algoritmo reemplazando una búsqueda lineal por una búsqueda basada en hash**. Usemos un problema de algoritmo para profundizar la comprensión.

!!! question

    Dado un arreglo de enteros `nums` y un elemento objetivo `target`, busque dos elementos en el arreglo cuya "suma" sea igual a `target`, y devuelva sus índices de arreglo. Cualquier solución es aceptable.

## Búsqueda lineal: intercambiando tiempo por espacio

Considere recorrer todas las combinaciones posibles directamente. Como se muestra en la figura a continuación, iniciamos un bucle anidado y, en cada iteración, determinamos si la suma de los dos enteros es igual a `target`. Si es así, devolvemos sus índices.

![Solución de búsqueda lineal para el problema de la suma de dos](replace_linear_by_hashing.assets/two_sum_brute_force.png)

El código se muestra a continuación:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_brute_force}
```

Este método tiene una complejidad temporal de $O(n^2)$ y una complejidad espacial de $O(1)$, lo que puede consumir mucho tiempo con grandes volúmenes de datos.

## Búsqueda hash: intercambiando espacio por tiempo

Considere usar una tabla hash, donde los pares clave-valor son los elementos del arreglo y sus índices, respectivamente. Recorra el arreglo, realizando los pasos que se muestran en la figura a continuación durante cada iteración.

1.  Compruebe si el número `target - nums[i]` está en la tabla hash. Si es así, devuelva directamente los índices de estos dos elementos.
2.  Agregue el par clave-valor `nums[i]` y el índice `i` a la tabla hash.

=== "<1>"
    ![Ayudar a la tabla hash a resolver la suma de dos](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png)

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png)

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png)

El código de implementación se muestra a continuación, requiriendo solo un único bucle:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_hash_table}
```

Este método reduce la complejidad temporal de $O(n^2)$ a $O(n)$ mediante el uso de la búsqueda hash, lo que mejora significativamente la eficiencia del tiempo de ejecución.

Como requiere mantener una tabla hash adicional, la complejidad espacial es $O(n)$. **Sin embargo, este método tiene una eficiencia tiempo-espacio más equilibrada en general, lo que lo convierte en la solución óptima para este problema**.
