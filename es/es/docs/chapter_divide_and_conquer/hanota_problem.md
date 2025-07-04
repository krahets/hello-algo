# Problema de las Torres de Hanói

Tanto en el ordenamiento por mezcla como en la construcción de árboles binarios, dividimos el problema original en dos subproblemas, cada uno de la mitad del tamaño del problema original. Sin embargo, para las Torres de Hanói, adoptamos una estrategia de descomposición diferente.

!!! question

    Se nos dan tres pilares, denotados como `A`, `B` y `C`. Inicialmente, el pilar `A` tiene $n$ discos, dispuestos de arriba a abajo en tamaño ascendente. Nuestra tarea es mover estos $n$ discos al pilar `C`, manteniendo su orden original (como se muestra en la figura a continuación). Se aplican las siguientes reglas durante el movimiento:
    
    1. Un disco solo se puede quitar de la parte superior de un pilar y debe colocarse en la parte superior de otro pilar.
    2. Solo se puede mover un disco a la vez.
    3. Un disco más pequeño siempre debe estar encima de un disco más grande.

![Ejemplo de las Torres de Hanói](hanota_problem.assets/hanota_example.png)

**Denotamos el problema de las Torres de Hanói de tamaño $i$ como $f(i)$**. Por ejemplo, $f(3)$ representa mover $3$ discos del pilar `A` al pilar `C`.

### Considerar los casos base

Como se muestra en la figura a continuación, para el problema $f(1)$ —que tiene solo un disco— podemos moverlo directamente de `A` a `C`.

=== "<1>"
    ![Solución para un problema de tamaño 1](hanota_problem.assets/hanota_f1_step1.png)

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png)

Para $f(2)$ —que tiene dos discos— **dependemos del pilar `B` para ayudar a mantener el disco más pequeño por encima del disco más grande**, como se ilustra en la siguiente figura:

1.  Primero, mueva el disco más pequeño de `A` a `B`.
2.  Luego mueva el disco más grande de `A` a `C`.
3.  Finalmente, mueva el disco más pequeño de `B` a `C`.

=== "<1>"
    ![Solución para un problema de tamaño 2](hanota_problem.assets/hanota_f2_step1.png)

=== "<2>"
    ![hanota_f2_step2](hanota_problem.assets/hanota_f2_step2.png)

=== "<3>"
    ![hanota_f2_step3](hanota_problem.assets/hanota_f2_step3.png)

=== "<4>"
    ![hanota_f2_step4](hanota_problem.assets/hanota_f2_step4.png)

El proceso de resolución de $f(2)$ se puede resumir como: **mover dos discos de `A` a `C` con la ayuda de `B`**. Aquí, `C` se llama pilar objetivo, y `B` se llama pilar intermedio.

### Descomposición de subproblemas

Para el problema $f(3)$ —es decir, cuando hay tres discos— la situación se vuelve un poco más complicada.

Dado que ya conocemos las soluciones para $f(1)$ y $f(2)$, podemos adoptar una perspectiva de divide y vencerás y **tratar los dos discos superiores en `A` como una sola unidad**, realizando los pasos que se muestran en la figura a continuación. Esto permite que los tres discos se muevan con éxito de `A` a `C`.

1.  Sea `B` el pilar objetivo y `C` el pilar intermedio, luego mueva los dos discos de `A` a `B`.
2.  Mueva el disco restante de `A` directamente a `C`.
3.  Sea `C` el pilar objetivo y `A` el pilar intermedio, luego mueva los dos discos de `B` a `C`.

=== "<1>"
    ![Solución para un problema de tamaño 3](hanota_problem.assets/hanota_f3_step1.png)

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png)

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png)

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png)

Esencialmente, **descomponemos $f(3)$ en dos subproblemas $f(2)$ y un subproblema $f(1)$**. Al resolver estos tres subproblemas en secuencia, se resuelve el problema original, lo que indica que los subproblemas son independientes y sus soluciones se pueden fusionar.

De esto, podemos resumir la estrategia de divide y vencerás para las Torres de Hanói, ilustrada en la figura a continuación. Dividimos el problema original $f(n)$ en dos subproblemas $f(n-1)$ y un subproblema $f(1)$, y resolvemos estos tres subproblemas en el siguiente orden:

1.  Mueva $n-1$ discos de `A` a `B`, usando `C` como pilar intermedio.
2.  Mueva el disco restante directamente de `A` a `C`.
3.  Mueva $n-1$ discos de `B` a `C`, usando `A` como pilar intermedio.

Para cada subproblema $f(n-1)$, **podemos aplicar la misma partición recursiva** hasta que alcancemos el subproblema más pequeño $f(1)$. Debido a que ya se sabe que $f(1)$ requiere solo un movimiento, es trivial de resolver.

![Estrategia de divide y vencerás para resolver las Torres de Hanói](hanota_problem.assets/hanota_divide_and_conquer.png)

### Implementación del código

En el código, definimos una función recursiva `dfs(i, src, buf, tar)` que mueve los $i$ discos superiores del pilar `src` al pilar `tar`, usando el pilar `buf` como pilar intermedio:

```src
[file]{hanota}-[class]{}-[func]{solve_hanota}
```

Como se muestra en la figura a continuación, el problema de las Torres de Hanói se puede visualizar como un árbol recursivo de altura $n$. Cada nodo representa un subproblema, correspondiente a una llamada a `dfs()`, **por lo tanto, la complejidad temporal es $O(2^n)$, y la complejidad espacial es $O(n)$.**

![Árbol recursivo de las Torres de Hanói](hanota_problem.assets/hanota_recursive_tree.png)

!!! quote

    El problema de las Torres de Hanói se origina en una antigua leyenda. En un templo de la antigua India, los monjes tenían tres altos pilares de diamante y $64$ discos de oro de diferentes tamaños. Creían que cuando el último disco se colocara correctamente, el mundo terminaría.

    Sin embargo, incluso si los monjes movieran un disco cada segundo, tardarían aproximadamente $2^{64} \approx 1.84 \times 10^{19}$ —aproximadamente 585 mil millones de años— superando con creces las estimaciones actuales de la edad del universo. Por lo tanto, si la leyenda es cierta, probablemente no necesitamos preocuparnos por el fin del mundo.

```