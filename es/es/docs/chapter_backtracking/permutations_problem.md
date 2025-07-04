# Problema de permutación

El problema de la permutación es una aplicación típica del algoritmo de backtracking. Implica encontrar todas las posibles disposiciones (permutaciones) de elementos de un conjunto dado, como un arreglo o una cadena.

La siguiente tabla muestra varios ejemplos, incluidos arreglos de entrada y sus permutaciones correspondientes.

<p align="center"> Tabla <id> &nbsp; Ejemplos de permutación </p>

| Arreglo de entrada | Permutaciones                                                       |
| :---------- | :----------------------------------------------------------------- |
| $[1]$       | $[1]$                                                              |
| $[1, 2]$    | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$ | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

## Casos sin elementos duplicados

!!! question

    Dado un arreglo de enteros sin elementos duplicados, devuelva todas las permutaciones posibles.

Desde una perspectiva de backtracking, **podemos ver el proceso de generación de permutaciones como una serie de elecciones.** Supongamos que el arreglo de entrada es $[1, 2, 3]$. Si elegimos $1$ primero, luego $3$, y finalmente $2$, obtenemos la permutación $[1, 3, 2]$. "Backtracking" significa deshacer una elección anterior y explorar opciones alternativas.

Desde una perspectiva de codificación, el conjunto de candidatos `choices` consta de todos los elementos del arreglo de entrada, mientras que `state` contiene los elementos seleccionados hasta ahora. Dado que cada elemento solo se puede elegir una vez, **todos los elementos en `state` deben ser únicos**.

Como se ilustra en la figura a continuación, podemos expandir el proceso de búsqueda en un árbol recursivo, donde cada nodo representa el `state` actual. Comenzando desde el nodo raíz, después de tres rondas de selecciones, llegamos a los nodos hoja, cada uno correspondiente a una permutación.

![Árbol recursivo de permutación](permutations_problem.assets/permutations_i.png)

### Poda de elección repetida

Para asegurar que cada elemento se seleccione solo una vez, introducimos un arreglo booleano `selected`, donde `selected[i]` indica si `choices[i]` ha sido elegido. Luego basamos nuestros pasos de poda en este arreglo:

-   Después de elegir `choice[i]`, establezca `selected[i]` en $	ext{True}$ para marcarlo como elegido.
-   Mientras itera a través de `choices`, omita todos los elementos marcados como elegidos (es decir, pode esas ramas).

Como se muestra en la figura a continuación, supongamos que elegimos 1 en la primera ronda, luego 3 en la segunda ronda y finalmente 2 en la tercera ronda. Necesitamos podar la rama para el elemento 1 en la segunda ronda y las ramas para los elementos 1 y 3 en la tercera ronda.

![Ejemplo de poda de permutación](permutations_problem.assets/permutations_i_pruning.png)

De la figura, podemos ver que este proceso de poda reduce el espacio de búsqueda de $O(n^n)$ a $O(n!)$.

### Implementación del código

Con esta comprensión, podemos "rellenar los espacios en blanco" de nuestro código de marco. Para mantener el código general conciso, no implementaremos cada parte del marco por separado, sino que expandiremos todo en la función `backtrack()`:

```src
[file]{permutations_i}-[class]{}-[func]{permutations_i}
```

## Considerando elementos duplicados

!!! question

    Dado un arreglo de enteros **que puede contener elementos duplicados**, devuelva todas las permutaciones únicas.

Supongamos que el arreglo de entrada es $[1, 1, 2]$. Para distinguir entre los dos elementos idénticos $1$, etiquetamos el segundo como $\hat{1}$.

Como se muestra en la figura a continuación, la mitad de las permutaciones producidas por este método son duplicados:

![Permutaciones duplicadas](permutations_problem.assets/permutations_ii.png)

Entonces, ¿cómo podemos eliminar estas permutaciones duplicadas? Un enfoque directo es usar un conjunto hash para eliminar duplicados después de generar todas las permutaciones. Sin embargo, esto es menos elegante **porque las ramas que producen duplicados son inherentemente innecesarias y deben podarse de antemano,** lo que mejora la eficiencia del algoritmo.

### Poda de elementos iguales

Mirando la figura a continuación, en la primera ronda, elegir $1$ o $\hat{1}$ conduce a las mismas permutaciones, por lo que podamos $\hat{1}$.

De manera similar, después de elegir $2$ en la primera ronda, elegir $1$ o $\hat{1}$ en la segunda ronda también conduce a ramas duplicadas, por lo que podamos $\hat{1}$ también.

Esencialmente, **nuestro objetivo es asegurar que múltiples elementos idénticos solo se seleccionen una vez por ronda de elecciones.**

![Poda de permutaciones duplicadas](permutations_problem.assets/permutations_ii_pruning.png)

### Implementación del código

Basándonos en el código del problema anterior, introducimos un conjunto hash `duplicated` en cada ronda. Este conjunto rastrea los elementos que ya hemos intentado, para que podamos podar los duplicados:

```src
[file]{permutations_ii}-[class]{}-[func]{permutations_ii}
```

Suponiendo que todos los elementos son distintos, hay $n!$ (factorial) permutaciones de $n$ elementos. Registrar cada resultado requiere copiar una lista de longitud $n$, lo que lleva $O(n)$ tiempo. **Por lo tanto, la complejidad temporal total es $O(n!n)$.**

La profundidad máxima de recursión es $n$, utilizando $O(n)$ de espacio de pila. El arreglo `selected` también requiere $O(n)$ de espacio. Debido a que puede haber hasta $n$ conjuntos `duplicated` separados en un momento dado, colectivamente ocupan $O(n^2)$ de espacio. **Por lo tanto, la complejidad espacial es $O(n^2)$.**

### Comparación de los dos métodos de poda

Aunque tanto `selected` como `duplicated` sirven como mecanismos de poda, se dirigen a diferentes problemas:

-   **Poda de elección repetida** (a través de `selected`): Hay un único arreglo `selected` para toda la búsqueda, que indica qué elementos ya están en el estado actual. Esto evita que el mismo elemento aparezca más de una vez en `state`.
-   **Poda de elementos iguales** (a través de `duplicated`): Cada llamada a la función `backtrack` utiliza su propio conjunto `duplicated`, registrando qué elementos ya han sido elegidos en esa iteración específica (bucle `for`). Esto asegura que los elementos iguales se seleccionen solo una vez por ronda de elecciones.

La figura a continuación muestra el alcance de estas dos estrategias de poda. Cada nodo en el árbol representa una elección; la ruta desde la raíz hasta cualquier hoja corresponde a una permutación completa.

![Alcance de las dos condiciones de poda](permutations_problem.assets/permutations_ii_pruning_summary.png)

