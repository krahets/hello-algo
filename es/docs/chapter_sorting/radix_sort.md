# Ordenamiento por radix

La sección anterior introdujo el ordenamiento por conteo, que es adecuado para escenarios donde el tamaño de los datos $n$ es grande pero el rango de datos $m$ es pequeño. Supongamos que necesitamos ordenar $n = 10^6$ ID de estudiantes, donde cada ID es un número de $8$ dígitos. Esto significa que el rango de datos $m = 10^8$ es muy grande. Usar el ordenamiento por conteo en este caso requeriría un espacio de memoria significativo. El ordenamiento por radix puede evitar esta situación.

El <u>ordenamiento por radix</u> comparte el mismo concepto central que el ordenamiento por conteo, que también ordena contando la frecuencia de los elementos. Mientras tanto, el ordenamiento por radix se basa en esto utilizando la relación progresiva entre los dígitos de los números. Procesa y ordena los dígitos uno a la vez, logrando el orden final ordenado.

## Proceso del algoritmo

Tomando los datos de ID de estudiante como ejemplo, supongamos que el dígito menos significativo es el $1^{\text{er}}$ y el más significativo es el $8^{\text{vo}}$, el proceso de ordenamiento por radix se ilustra en la figura a continuación.

1.  Inicialice el dígito $k = 1$.
2.  Realice un "ordenamiento por conteo" en el dígito $k^{\text{ésimo}}$ de los ID de estudiante. Una vez completado, los datos se ordenarán de menor a mayor según el dígito $k^{\text{ésimo}}$.
3.  Incremente $k$ en $1$, luego regrese al paso `2.` y continúe iterando hasta que todos los dígitos hayan sido ordenados, momento en el que finaliza el proceso.

![Proceso del algoritmo de ordenamiento por radix](radix_sort.assets/radix_sort_overview.png)

A continuación, analizamos la implementación del código. Para un número $x$ en base $d$, para obtener su dígito $k^{\text{ésimo}}$ $x_k$, se puede usar la siguiente fórmula de cálculo:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Donde $\lfloor a \rfloor$ denota el redondeo hacia abajo del número de punto flotante $a$, y $\bmod \: d$ denota el módulo de $d$. Para los datos de ID de estudiante, $d = 10$ y $k \in [1, 8]$.

Además, necesitamos modificar ligeramente el código de ordenamiento por conteo para permitir el ordenamiento basado en el dígito $k^{\text{ésimo}}$:

```src
[file]{radix_sort}-[class]{}-[func]{radix_sort}
```

!!! question "¿Por qué empezar a ordenar desde el dígito menos significativo?"

    En rondas de ordenamiento consecutivas, el resultado de una ronda posterior anulará el resultado de una ronda anterior. Por ejemplo, si el resultado de la primera ronda es $a < b$ y la segunda ronda es $a > b$, el resultado de la segunda ronda reemplazará el resultado de la primera ronda. Dado que los dígitos de orden superior tienen precedencia sobre los dígitos de orden inferior, tiene sentido ordenar los dígitos inferiores antes que los dígitos superiores.

## Características del algoritmo

En comparación con el ordenamiento por conteo, el ordenamiento por radix es adecuado para rangos numéricos más grandes, **pero asume que los datos se pueden representar en un número fijo de dígitos, y el número de dígitos no debe ser demasiado grande**. Por ejemplo, los números de punto flotante no son adecuados para el ordenamiento por radix, ya que su recuento de dígitos $k$ puede ser grande, lo que podría conducir a una complejidad temporal $O(nk) \gg O(n^2)$.

-   **La complejidad temporal es $O(nk)$, ordenamiento no adaptativo**: Suponiendo que el tamaño de los datos es $n$, los datos están en base $d$, y el número máximo de dígitos es $k$, entonces ordenar un solo dígito toma $O(n + d)$ tiempo, y ordenar los $k$ dígitos toma $O((n + d)k)$ tiempo. Generalmente, tanto $d$ como $k$ son relativamente pequeños, lo que lleva a una complejidad temporal que se acerca a $O(n)$.
-   **La complejidad espacial es $O(n + d)$, ordenamiento no in situ**: Al igual que el ordenamiento por conteo, el ordenamiento por radix se basa en arreglos `res` y `counter` de longitudes $n$ y $d$ respectivamente.
-   **Ordenamiento estable**: Cuando el ordenamiento por conteo es estable, el ordenamiento por radix también es estable; si el ordenamiento por conteo es inestable, el ordenamiento por radix no puede garantizar un orden de ordenamiento correcto.
