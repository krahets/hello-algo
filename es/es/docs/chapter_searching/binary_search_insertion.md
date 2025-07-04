# Inserción de búsqueda binaria

La búsqueda binaria no solo se utiliza para buscar elementos objetivo, sino también para resolver muchos problemas variantes, como la búsqueda de la posición de inserción de elementos objetivo.

## Caso sin elementos duplicados

!!! question

    Dado un arreglo ordenado `nums` de longitud $n$ con elementos únicos y un elemento `target`, inserte `target` en `nums` manteniendo su orden. Si `target` ya existe en el arreglo, insértelo a la izquierda del elemento existente. Devuelva el índice de `target` en el arreglo después de la inserción. Vea el ejemplo que se muestra en la figura a continuación.

![Datos de ejemplo para el punto de inserción de búsqueda binaria](binary_search_insertion.assets/binary_search_insertion_example.png)

Si desea reutilizar el código de búsqueda binaria de la sección anterior, debe responder las siguientes dos preguntas.

**Pregunta uno**: Si el arreglo ya contiene `target`, ¿sería el punto de inserción el índice del elemento existente?

El requisito de insertar `target` a la izquierda de elementos iguales significa que el `target` recién insertado reemplazará la posición original de `target`. En otras palabras, **cuando el arreglo contiene `target`, el punto de inserción es de hecho el índice de ese `target`**.

**Pregunta dos**: Cuando el arreglo no contiene `target`, ¿en qué índice se insertaría?

Consideremos además el proceso de búsqueda binaria: cuando `nums[m] < target`, el puntero $i$ se mueve, lo que significa que el puntero $i$ se acerca a un elemento mayor o igual que `target`. De manera similar, el puntero $j$ siempre se acerca a un elemento menor o igual que `target`.

Por lo tanto, al final de la búsqueda binaria, es seguro que: $i$ apunta al primer elemento mayor que `target`, y $j$ apunta al primer elemento menor que `target`. **Es fácil ver que cuando el arreglo no contiene `target`, el punto de inserción es $i$**. El código es el siguiente:

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion_simple}
```

## Caso con elementos duplicados

!!! question

    Basándose en la pregunta anterior, suponga que el arreglo puede contener elementos duplicados, todo lo demás permanece igual.

Cuando hay múltiples ocurrencias de `target` en el arreglo, una búsqueda binaria regular solo puede devolver el índice de una ocurrencia de `target`, **y no puede determinar cuántas ocurrencias de `target` hay a la izquierda y a la derecha de esa posición**.

El problema requiere insertar el elemento objetivo en la posición más a la izquierda, **por lo que necesitamos encontrar el índice del `target` más a la izquierda en el arreglo**. Inicialmente, considere implementar esto a través de los pasos que se muestran en la figura a continuación.

1.  Realice una búsqueda binaria para encontrar cualquier índice de `target`, digamos $k$.
2.  A partir del índice $k$, realice una búsqueda lineal hacia la izquierda hasta que se encuentre la ocurrencia más a la izquierda de `target`, luego devuelva este índice.

![Búsqueda lineal para el punto de inserción de elementos duplicados](binary_search_insertion.assets/binary_search_insertion_naive.png)

Aunque este método es factible, incluye búsqueda lineal, por lo que su complejidad temporal es $O(n)$. Este método es ineficiente cuando el arreglo contiene muchos `target` duplicados.

Ahora considere extender el código de búsqueda binaria. Como se muestra en la figura a continuación, el proceso general sigue siendo el mismo. En cada ronda, primero calculamos el índice medio $m$, luego comparamos el valor de `target` con `nums[m]`, lo que lleva a los siguientes casos.

-   Cuando `nums[m] < target` o `nums[m] > target`, significa que `target` aún no se ha encontrado, por lo tanto, use la búsqueda binaria normal para reducir el rango de búsqueda, **acercando los punteros $i$ y $j$ a `target`**.
-   Cuando `nums[m] == target`, indica que los elementos menores que `target` están en el rango $[i, m - 1]$, por lo tanto, use $j = m - 1$ para reducir el rango, **acercando así el puntero $j$ a los elementos menores que `target`**.

Después del bucle, $i$ apunta al `target` más a la izquierda, y $j$ apunta al primer elemento menor que `target`, **por lo tanto, el índice $i$ es el punto de inserción**.

=== "<1>"
    ![Pasos para el punto de inserción de búsqueda binaria de elementos duplicados](binary_search_insertion.assets/binary_search_insertion_step1.png)

=== "<2>"
    ![binary_search_insertion_step2](binary_search_insertion.assets/binary_search_insertion_step2.png)

=== "<3>"
    ![binary_search_insertion_step3](binary_search_insertion.assets/binary_search_insertion_step3.png)

=== "<4>"
    ![binary_search_insertion_step4](binary_search_insertion.assets/binary_search_insertion_step4.png)

=== "<5>"
    ![binary_search_insertion_step5](binary_search_insertion.assets/binary_search_insertion_step5.png)

=== "<6>"
    ![binary_search_insertion_step6](binary_search_insertion.assets/binary_search_insertion_step6.png)

=== "<7>"
    ![binary_search_insertion_step7](binary_search_insertion.assets/binary_search_insertion_step7.png)

=== "<8>"
    ![binary_search_insertion_step8](binary_search_insertion.assets/binary_search_insertion_step8.png)

Observe el siguiente código. Las operaciones en las ramas `nums[m] > target` y `nums[m] == target` son las mismas, por lo que estas dos ramas se pueden fusionar.

Incluso así, aún podemos mantener las condiciones expandidas, ya que esto hace que la lógica sea más clara y mejora la legibilidad.

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion}
```

!!! tip

    El código de esta sección utiliza "intervalo cerrado". Si está interesado en "cerrado por la izquierda, abierto por la derecha", intente implementar el código por su cuenta.

En resumen, la búsqueda binaria implica esencialmente establecer objetivos de búsqueda para los punteros $i$ y $j$. Estos objetivos podrían ser un elemento específico (como `target`) o un rango de elementos (como los menores que `target`).

En el bucle continuo de la búsqueda binaria, los punteros $i$ y $j$ se acercan gradualmente al objetivo predefinido. Finalmente, o encuentran la respuesta o se detienen después de cruzar el límite.
