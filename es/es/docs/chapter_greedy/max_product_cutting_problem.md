# Problema del corte de producto máximo

!!! question

    Dado un entero positivo $n$, divídalo en al menos dos enteros positivos que sumen $n$, y encuentre el producto máximo de estos enteros, como se ilustra en la figura a continuación.

![Definición del problema del corte de producto máximo](max_product_cutting_problem.assets/max_product_cutting_definition.png)

Supongamos que dividimos $n$ en $m$ factores enteros, donde el $i$-ésimo factor se denota como $n_i$, es decir,

$$
n = \sum_{i=1}^{m}n_i
$$

El objetivo de este problema es encontrar el producto máximo de todos los factores enteros, a saber,

$$
\max(\prod_{i=1}^{m}n_i)
$$

Necesitamos considerar: ¿Qué tan grande debe ser el número de divisiones $m$, y qué debe ser cada $n_i$?

### Determinación de la estrategia codiciosa

La experiencia sugiere que el producto de dos enteros suele ser mayor que su suma. Supongamos que dividimos un factor de $2$ de $n$, entonces su producto es $2(n-2)$. Compare este producto con $n$:

$$
\begin{aligned}
2(n-2) & \geq n \\
2n - n - 4 & \geq 0 \\
n & \geq 4
\end{aligned}
$$

Como se muestra en la figura a continuación, cuando $n \geq 4$, dividir un $2$ aumenta el producto, **lo que indica que los enteros mayores o iguales a $4$ deben dividirse**.

**Estrategia codiciosa uno**: Si el esquema de división incluye factores $\geq 4$, deben dividirse aún más. La división final solo debe incluir factores $1$, $2$ y $3$.

![Aumento del producto debido a la división](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.png)

A continuación, consideremos qué factor es óptimo. Entre los factores $1$, $2$ y $3$, claramente $1$ es el peor, ya que $1 \times (n-1) < n$ siempre se cumple, lo que significa que dividir un $1$ en realidad disminuye el producto.

Como se muestra en la figura a continuación, cuando $n = 6$, $3 \times 3 > 2 \times 2 \times 2$. **Esto significa que dividir un $3$ es mejor que dividir un $2$**.

**Estrategia codiciosa dos**: En el esquema de división, debe haber como máximo dos $2$. Porque tres $2$ siempre se pueden reemplazar por dos $3$ para obtener un producto mayor.

![Factores de división óptimos](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.png)

De lo anterior, se pueden derivar las siguientes estrategias codiciosas.

1.  Introduzca el entero $n$, divida continuamente el factor $3$ hasta que el resto sea $0$, $1$ o $2$.
2.  Cuando el resto es $0$, significa que $n$ es un múltiplo de $3$, por lo que no se realiza ninguna acción adicional.
3.  Cuando el resto es $2$, no continúe dividiendo, manténgalo.
4.  Cuando el resto es $1$, dado que $2 \times 2 > 1 \times 3$, el último $3$ debe reemplazarse por $2$.

### Implementación del código

Como se muestra en la figura a continuación, no necesitamos usar bucles para dividir el entero, sino que podemos usar la operación de división entera para obtener el número de $3$, $a$, y la operación de módulo para obtener el resto, $b$, por lo tanto:

$$
n = 3a + b
$$

Tenga en cuenta que, para el caso límite donde $n \leq 3$, se debe dividir un $1$, con un producto de $1 \times (n - 1)$.

```src
[file]{max_product_cutting}-[class]{}-[func]{max_product_cutting}
```

![Método de cálculo del producto máximo después del corte](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.png)

**La complejidad temporal depende de la implementación de la operación de potencia en el lenguaje de programación**. Para Python, las funciones de cálculo de potencia comúnmente utilizadas son de tres tipos:

-   Tanto el operador `**` como la función `pow()` tienen una complejidad temporal de $O(\log\unicode{x2061} a)$.
-   La función `math.pow()` llama internamente a la función `pow()` de la biblioteca del lenguaje C, realizando una exponenciación de punto flotante, con una complejidad temporal de $O(1)$.

Las variables $a$ y $b$ utilizan un espacio extra de tamaño constante, **por lo tanto, la complejidad espacial es $O(1)$**.

### Prueba de corrección

Usando la prueba por contradicción, solo analice los casos donde $n \geq 3$.

1.  **Todos los factores $\leq 3$**: Supongamos que el esquema de división óptimo incluye un factor $x \geq 4$, entonces definitivamente se puede dividir aún más en $2(x-2)$, obteniendo un producto mayor. Esto contradice la suposición.
2.  **El esquema de división no contiene $1$**: Supongamos que el esquema de división óptimo incluye un factor de $1$, entonces definitivamente se puede fusionar en otro factor para obtener un producto mayor. Esto contradice la suposición.
3.  **El esquema de división contiene como máximo dos $2$**: Supongamos que el esquema de división óptimo incluye tres $2$, entonces definitivamente se pueden reemplazar por dos $3$, logrando un producto mayor. Esto contradice la suposición.

```