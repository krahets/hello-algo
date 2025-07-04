# Ordenamiento por selección

El <u>ordenamiento por selección</u> funciona con un principio muy simple: utiliza un bucle donde cada iteración selecciona el elemento más pequeño del intervalo no ordenado y lo mueve al final de la sección ordenada.

Supongamos que la longitud del arreglo es $n$, los pasos del ordenamiento por selección se muestran en la figura a continuación.

1.  Inicialmente, todos los elementos no están ordenados, es decir, el intervalo no ordenado (índice) es $[0, n-1]$.
2.  Seleccione el elemento más pequeño en el intervalo $[0, n-1]$ e intercámbielo con el elemento en el índice $0$. Después de esto, el primer elemento del arreglo está ordenado.
3.  Seleccione el elemento más pequeño en el intervalo $[1, n-1]$ e intercámbielo con el elemento en el índice $1$. Después de esto, los dos primeros elementos del arreglo están ordenados.
4.  Continúe de esta manera. Después de $n - 1$ rondas de selección e intercambio, los primeros $n - 1$ elementos están ordenados.
5.  El único elemento restante es posteriormente el elemento más grande y no necesita ordenamiento, por lo tanto, el arreglo está ordenado.

=== "<1>"
    ![Proceso de ordenamiento por selección](selection_sort.assets/selection_sort_step1.png)

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.png)

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.png)

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.png)

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.png)

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.png)

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.png)

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.png)

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.png)

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.png)

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.png)

En el código, usamos $k$ para registrar el elemento más pequeño dentro del intervalo no ordenado:

```src
[file]{selection_sort}-[class]{}-[func]{selection_sort}
```

## Características del algoritmo

-   **Complejidad temporal de $O(n^2)$, ordenamiento no adaptativo**: Hay $n - 1$ iteraciones en el bucle externo, con la longitud de la sección no ordenada comenzando en $n$ en la primera iteración y disminuyendo a $2$ en la última iteración, es decir, cada iteración del bucle externo contiene $n$, $n - 1$, $\dots$, $3$, $2$ iteraciones del bucle interno respectivamente, sumando un total de $\frac{(n - 1)(n + 2)}{2}$.
-   **Complejidad espacial de $O(1)$, ordenamiento in situ**: Utiliza espacio extra constante con punteros $i$ y $j$.
-   **Ordenamiento no estable**: Como se muestra en la figura a continuación, un elemento `nums[i]` puede intercambiarse a la derecha de un elemento igual, lo que hace que su orden relativo cambie.

![Ejemplo de inestabilidad del ordenamiento por selección](selection_sort.assets/selection_sort_instability.png)
