# Búsqueda binaria

La <u>búsqueda binaria</u> es un algoritmo de búsqueda eficiente que utiliza una estrategia de divide y vencerás. Aprovecha el orden ordenado de los elementos en un arreglo reduciendo el intervalo de búsqueda a la mitad en cada iteración, continuando hasta que se encuentra el elemento objetivo o el intervalo de búsqueda se vuelve vacío.

!!! question

    Dado un arreglo `nums` de longitud $n$, donde los elementos están ordenados en orden ascendente sin duplicados. Encuentre y devuelva el índice del elemento `target` en este arreglo. Si el arreglo no contiene el elemento, devuelva $-1$. Un ejemplo se muestra en la figura a continuación.

![Datos de ejemplo de búsqueda binaria](binary_search.assets/binary_search_example.png)

Como se muestra en la figura a continuación, primero inicializamos los punteros con $i = 0$ y $j = n - 1$, apuntando al primer y último elemento del arreglo respectivamente. También representan todo el intervalo de búsqueda $[0, n - 1]$. Tenga en cuenta que los corchetes indican un intervalo cerrado, que incluye los propios valores límite.

Y luego se pueden realizar los siguientes dos pasos en un bucle.

1.  Calcule el índice del punto medio $m = \lfloor {(i + j) / 2} \rfloor$, donde $\lfloor \: \rfloor$ denota la operación de piso.
2.  Basándose en la comparación entre el valor de `nums[m]` y `target`, se elegirá uno de los siguientes tres casos para ejecutar.
    1.  Si `nums[m] < target`, indica que `target` está en el intervalo $[m + 1, j]$, por lo tanto, establezca $i = m + 1$.
    2.  Si `nums[m] > target`, indica que `target` está en el intervalo $[i, m - 1]$, por lo tanto, establezca $j = m - 1$.
    3.  Si `nums[m] = target`, indica que se encontró `target`, salga del bucle y devuelva el índice $m$.

Si el arreglo no contiene el elemento objetivo, el intervalo de búsqueda eventualmente se reducirá a vacío, terminando por devolver $-1$.

=== "<1>"
    ![Proceso de búsqueda binaria](binary_search.assets/binary_search_step1.png)

=== "<2>"
    ![binary_search_step2](binary_search.assets/binary_search_step2.png)

=== "<3>"
    ![binary_search_step3](binary_search.assets/binary_search_step3.png)

=== "<4>"
    ![binary_search_step4](binary_search.assets/binary_search_step4.png)

=== "<5>"
    ![binary_search_step5](binary_search.assets/binary_search_step5.png)

=== "<6>"
    ![binary_search_step6](binary_search.assets/binary_search_step6.png)

=== "<7>"
    ![binary_search_step7](binary_search.assets/binary_search_step7.png)

Vale la pena señalar que, dado que $i$ y $j$ son ambos de tipo `int`, **$i + j$ podría exceder el rango del tipo `int`**. Para evitar el desbordamiento de números grandes, generalmente usamos la fórmula $m = \lfloor {i + (j - i) / 2} \rfloor$ para calcular el punto medio.

El código es el siguiente:

```src
[file]{binary_search}-[class]{}-[func]{binary_search}
```

**La complejidad temporal es $O(\log n)$**: En el bucle binario, el intervalo disminuye a la mitad en cada ronda, por lo tanto, el número de iteraciones es $\log_2 n$.

**La complejidad espacial es $O(1)$**: Los punteros $i$ y $j$ ocupan un espacio de tamaño constante.

## Métodos de representación de intervalos

Además del intervalo cerrado anterior, otra representación de intervalo común es el intervalo "cerrado por la izquierda y abierto por la derecha", definido como $[0, n)$, donde el límite izquierdo se incluye a sí mismo y el límite derecho no. En esta representación, el intervalo $[i, j)$ está vacío cuando $i = j$.

Podemos implementar un algoritmo de búsqueda binaria con la misma funcionalidad basándonos en esta representación:

```src
[file]{binary_search}-[class]{}-[func]{binary_search_lcro}
```

Como se muestra en la figura a continuación, bajo los dos tipos de representaciones de intervalos, la inicialización, la condición del bucle y la operación de reducción del intervalo del algoritmo de búsqueda binaria difieren.

Dado que ambos límites en la representación de "intervalo cerrado" son inclusivos, las operaciones para reducir el intervalo a través de los punteros $i$ y $j$ también son simétricas. Esto hace que sea menos propenso a errores, **por lo tanto, generalmente se recomienda usar el enfoque de "intervalo cerrado"**.

![Dos tipos de definiciones de intervalos](binary_search.assets/binary_search_ranges.png)

## Ventajas y limitaciones

La búsqueda binaria funciona bien tanto en aspectos de tiempo como de espacio.

-   La búsqueda binaria es eficiente en tiempo. Con grandes conjuntos de datos, la complejidad temporal logarítmica ofrece una gran ventaja. Por ejemplo, dado un conjunto de datos con un tamaño $n = 2^{20}$, la búsqueda lineal requiere $2^{20} = 1048576$ iteraciones, mientras que la búsqueda binaria solo requiere $\log_2 2^{20} = 20$ bucles.
-   La búsqueda binaria no necesita espacio extra. En comparación con los algoritmos de búsqueda que dependen de espacio adicional (como la búsqueda hash), la búsqueda binaria es más eficiente en espacio.

Sin embargo, la búsqueda binaria puede no ser adecuada para todos los escenarios debido a las siguientes preocupaciones.

-   La búsqueda binaria solo se puede aplicar a datos ordenados. Los datos no ordenados deben ordenarse antes de aplicar la búsqueda binaria, lo que puede no valer la pena, ya que el algoritmo de ordenación suele tener una complejidad temporal de $O(n \log n)$. Tal costo es incluso mayor que la búsqueda lineal, sin mencionar la propia búsqueda binaria. Para escenarios con inserciones frecuentes, el costo de mantener el arreglo en orden es bastante alto, ya que la complejidad temporal de insertar nuevos elementos en posiciones específicas es $O(n)$.
-   La búsqueda binaria solo puede usar arreglos. La búsqueda binaria requiere un acceso a elementos no continuo (salto), lo cual es ineficiente en una lista enlazada. Como resultado, las listas enlazadas o las estructuras de datos basadas en listas enlazadas pueden no ser adecuadas para este algoritmo.
-   La búsqueda lineal funciona mejor en conjuntos de datos pequeños. En la búsqueda lineal, solo se requiere 1 operación de decisión para cada iteración; mientras que en la búsqueda binaria, implica 1 suma, 1 división, 1 a 3 operaciones de decisión, 1 suma (resta), totalizando de 4 a 6 operaciones. Por lo tanto, si el tamaño de los datos $n$ es pequeño, la búsqueda lineal es más rápida que la búsqueda binaria.

```