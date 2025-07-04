# Problema de la capacidad máxima

!!! question

    Introduzca un arreglo $ht$, donde cada elemento representa la altura de una partición vertical. Dos particiones cualesquiera en el arreglo, junto con el espacio entre ellas, pueden formar un contenedor.
    
    La capacidad del contenedor es el producto de la altura y el ancho (área), donde la altura está determinada por la partición más corta, y el ancho es la diferencia en los índices del arreglo entre las dos particiones.
    
    Seleccione dos particiones en el arreglo que maximicen la capacidad del contenedor y devuelva esta capacidad máxima. Un ejemplo se muestra en la figura a continuación.

![Datos de ejemplo para el problema de la capacidad máxima](max_capacity_problem.assets/max_capacity_example.png)

El contenedor está formado por dos particiones cualesquiera, **por lo tanto, el estado de este problema se representa mediante los índices de las dos particiones, denotados como $[i, j]$**.

Según el enunciado del problema, la capacidad es igual al producto de la altura y el ancho, donde la altura está determinada por la partición más corta, y el ancho es la diferencia en los índices del arreglo entre las dos particiones. La fórmula para la capacidad $cap[i, j]$ es:

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

Suponiendo que la longitud del arreglo es $n$, el número de combinaciones de dos particiones (número total de estados) es $C_n^2 = \frac{n(n - 1)}{2}$. El enfoque más sencillo es **enumerar todos los estados posibles**, lo que resulta en una complejidad temporal de $O(n^2)$.

### Determinación de una estrategia codiciosa

Existe una solución más eficiente para este problema. Como se muestra en la figura a continuación, seleccionamos un estado $[i, j]$ donde los índices $i < j$ y la altura $ht[i] < ht[j]$, lo que significa que $i$ es la partición más corta y $j$ es la más alta.

![Estado inicial](max_capacity_problem.assets/max_capacity_initial_state.png)

Como se muestra en la figura a continuación, **si movemos la partición más alta $j$ más cerca de la partición más corta $i$, la capacidad definitivamente disminuirá**.

Esto se debe a que al mover la partición más alta $j$, el ancho $j-i$ definitivamente disminuye; y dado que la altura está determinada por la partición más corta, la altura solo puede permanecer igual (si $i$ sigue siendo la partición más corta) o disminuir (si la $j$ movida se convierte en la partición más corta).

![Estado después de mover la partición más alta hacia adentro](max_capacity_problem.assets/max_capacity_moving_long_board.png)

Por el contrario, **solo podemos aumentar la capacidad moviendo la partición más corta $i$ hacia adentro**. Aunque el ancho definitivamente disminuirá, **la altura puede aumentar** (si la partición más corta $i$ movida se vuelve más alta). Por ejemplo, en la figura a continuación, el área aumenta después de mover la partición más corta.

![Estado después de mover la partición más corta hacia adentro](max_capacity_problem.assets/max_capacity_moving_short_board.png)

Esto nos lleva a la estrategia codiciosa para este problema: inicializar dos punteros en los extremos del contenedor, y en cada ronda, mover el puntero correspondiente a la partición más corta hacia adentro hasta que los dos punteros se encuentren.

La figura a continuación ilustra la ejecución de la estrategia codiciosa.

1.  Inicialmente, los punteros $i$ y $j$ se colocan en los extremos del arreglo.
2.  Calcule la capacidad del estado actual $cap[i, j]$ y actualice la capacidad máxima.
3.  Compare las alturas de las particiones $i$ y $j$, y mueva el puntero de la partición más corta hacia adentro un paso.
4.  Repita los pasos `2.` y `3.` hasta que $i$ y $j$ se encuentren.

=== "<1>"
    ![El proceso codicioso para el problema de la capacidad máxima](max_capacity_problem.assets/max_capacity_greedy_step1.png)

=== "<2>"
    ![max_capacity_greedy_step2](max_capacity_problem.assets/max_capacity_greedy_step2.png)

=== "<3>"
    ![max_capacity_greedy_step3](max_capacity_problem.assets/max_capacity_greedy_step3.png)

=== "<4>"
    ![max_capacity_greedy_step4](max_capacity_problem.assets/max_capacity_greedy_step4.png)

=== "<5>"
    ![max_capacity_greedy_step5](max_capacity_problem.assets/max_capacity_greedy_step5.png)

=== "<6>"
    ![max_capacity_greedy_step6](max_capacity_problem.assets/max_capacity_greedy_step6.png)

=== "<7>"
    ![max_capacity_greedy_step7](max_capacity_problem.assets/max_capacity_greedy_step7.png)

=== "<8>"
    ![max_capacity_greedy_step8](max_capacity_problem.assets/max_capacity_greedy_step8.png)

=== "<9>"
    ![max_capacity_greedy_step9](max_capacity_problem.assets/max_capacity_greedy_step9.png)

### Implementación

El código se ejecuta en un bucle de $n$ veces como máximo, **por lo tanto, la complejidad temporal es $O(n)$**.

Las variables $i$, $j$ y $res$ utilizan una cantidad constante de espacio extra, **por lo tanto, la complejidad espacial es $O(1)$**.

```src
[file]{max_capacity}-[class]{}-[func]{max_capacity}
```

### Prueba de corrección

La razón por la que el método codicioso es más rápido que la enumeración es que cada ronda de selección codiciosa "salta" algunos estados.

Por ejemplo, bajo el estado $cap[i, j]$ donde $i$ es la partición más corta y $j$ es la partición más alta, mover codiciosamente la partición más corta $i$ hacia adentro un paso conduce a los estados "saltados" que se muestran en la figura a continuación. **Esto significa que las capacidades de estos estados no se pueden verificar más tarde**.

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![Estados saltados al mover la partición más corta](max_capacity_problem.assets/max_capacity_skipped_states.png)

Se observa que **estos estados saltados son en realidad todos los estados donde la partición más alta $j$ se mueve hacia adentro**. Ya hemos demostrado que mover la partición más alta hacia adentro definitivamente disminuirá la capacidad. Por lo tanto, los estados saltados no pueden ser la solución óptima, **y saltarlos no conduce a perder la solución óptima**.

El análisis muestra que la operación de mover la partición más corta es "segura", y la estrategia codiciosa es efectiva.
