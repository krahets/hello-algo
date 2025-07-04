# Problema Top-k

!!! question

    Dado un arreglo desordenado `nums` de longitud $n$, devuelva los $k$ elementos más grandes del arreglo.

Para este problema, primero introduciremos dos soluciones sencillas, luego explicaremos un método más eficiente basado en montículos.

## Método 1: Selección iterativa

Podemos realizar $k$ rondas de iteraciones como se muestra en la figura a continuación, extrayendo los elementos $1^{\text{er}}$, $2^{\text{do}}$, $\dots$, $k^{\text{ésimo}}$ más grandes en cada ronda, con una complejidad temporal de $O(nk)$.

Este método solo es adecuado cuando $k \ll n$, ya que la complejidad temporal se acerca a $O(n^2)$ cuando $k$ está cerca de $n$, lo cual consume mucho tiempo.

![Encontrando iterativamente los k elementos más grandes](top_k.assets/top_k_traversal.png)

!!! tip

    Cuando $k = n$, podemos obtener una secuencia ordenada completa, lo que equivale al algoritmo de "ordenación por selección".

## Método 2: Ordenación

Como se muestra en la figura a continuación, podemos ordenar primero el arreglo `nums` y luego devolver los últimos $k$ elementos, con una complejidad temporal de $O(n \log n)$.

Claramente, este método "excede" la tarea, ya que solo necesitamos encontrar los $k$ elementos más grandes, sin necesidad de ordenar los otros elementos.

![Ordenación para encontrar los k elementos más grandes](top_k.assets/top_k_sorting.png)

## Método 3: Montículo

Podemos resolver el problema Top-k de manera más eficiente basándonos en montículos, como se muestra en el siguiente proceso.

1.  Inicialice un montículo mínimo, donde el elemento superior es el más pequeño.
2.  Primero, inserte los primeros $k$ elementos del arreglo en el montículo.
3.  A partir del elemento $k + 1^{\text{ésimo}}$, si el elemento actual es mayor que el elemento superior del montículo, elimine el elemento superior del montículo e inserte el elemento actual en el montículo.
4.  Después de completar el recorrido, el montículo contiene los $k$ elementos más grandes.

=== "<1>"
    ![Encontrar los k elementos más grandes basándose en el montículo](top_k.assets/top_k_heap_step1.png)

=== "<2>"
    ![top_k_heap_step2](top_k.assets/top_k_heap_step2.png)

=== "<3>"
    ![top_k_heap_step3](top_k.assets/top_k_heap_step3.png)

=== "<4>"
    ![top_k_heap_step4](top_k.assets/top_k_heap_step4.png)

=== "<5>"
    ![top_k_heap_step5](top_k.assets/top_k_heap_step5.png)

=== "<6>"
    ![top_k_heap_step6](top_k.assets/top_k_heap_step6.png)

=== "<7>"
    ![top_k_heap_step7](top_k.assets/top_k_heap_step7.png)

=== "<8>"
    ![top_k_heap_step8](top_k.assets/top_k_heap_step8.png)

=== "<9>"
    ![top_k_heap_step9](top_k.assets/top_k_heap_step9.png)

El código de ejemplo es el siguiente:

```src
[file]{top_k}-[class]{}-[func]{top_k_heap}
```

Se realizan un total de $n$ rondas de inserciones y eliminaciones de montículos, siendo el tamaño máximo del montículo $k$, por lo que la complejidad temporal es $O(n \log k)$. Este método es muy eficiente; cuando $k$ es pequeño, la complejidad temporal tiende a $O(n)$; cuando $k$ es grande, la complejidad temporal no excederá $O(n \log n)$.

Además, este método es adecuado para escenarios con flujos de datos dinámicos. Al agregar datos continuamente, podemos mantener los elementos dentro del montículo, logrando así actualizaciones dinámicas de los $k$ elementos más grandes.
