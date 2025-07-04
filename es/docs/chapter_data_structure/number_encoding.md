# Codificación de números *

!!! tip

    En este libro, los capítulos marcados con un asterisco '*' son lecturas opcionales. Si tiene poco tiempo o le resultan desafiantes, puede omitirlos inicialmente y volver a ellos después de completar los capítulos esenciales.

## Codificación de enteros

En la tabla de la sección anterior, observamos que todos los tipos enteros pueden representar un número negativo más que números positivos, como el rango `byte` de $[-128, 127]$. Este fenómeno parece contraintuitivo, y su razón subyacente implica el conocimiento de la codificación de signo-magnitud, complemento a uno y complemento a dos.

En primer lugar, es importante tener en cuenta que **los números se almacenan en las computadoras utilizando la forma de complemento a dos**. Antes de analizar por qué es así, definamos estos tres métodos de codificación:

-   **Signo-magnitud**: El bit más alto de una representación binaria de un número se considera el bit de signo, donde $0$ representa un número positivo y $1$ representa un número negativo. Los bits restantes representan el valor del número.
-   **Complemento a uno**: El complemento a uno de un número positivo es el mismo que su signo-magnitud. Para los números negativos, se obtiene invirtiendo todos los bits excepto el bit de signo.
-   **Complemento a dos**: El complemento a dos de un número positivo es el mismo que su signo-magnitud. Para los números negativos, se obtiene sumando $1$ a su complemento a uno.

La siguiente figura ilustra las conversiones entre signo-magnitud, complemento a uno y complemento a dos:

![Conversiones entre signo-magnitud, complemento a uno y complemento a dos](number_encoding.assets/1s_2s_complement.png)

Aunque el <u>signo-magnitud</u> es el más intuitivo, tiene limitaciones. Por un lado, **los números negativos en signo-magnitud no se pueden usar directamente en los cálculos**. Por ejemplo, en signo-magnitud, calcular $1 + (-2)$ da como resultado $-3$, lo cual es incorrecto.

$$
\begin{aligned}
& 1 + (-2) \\
& \rightarrow 0000 \; 0001 + 1000 \; 0010 \\
& = 1000 \; 0011 \\
& \rightarrow -3
\end{aligned}
$$

Para solucionar esto, las computadoras introdujeron el <u>complemento a uno</u>. Si convertimos a complemento a uno y calculamos $1 + (-2)$, luego convertimos el resultado de nuevo a signo-magnitud, obtenemos el resultado correcto de $-1$.

$$
\begin{aligned}
& 1 + (-2) \\
& \rightarrow 0000 \; 0001 \; \text{(Signo-magnitud)} + 1000 \; 0010 \; \text{(Signo-magnitud)} \\
& = 0000 \; 0001 \; \text{(Complemento a uno)} + 1111 \; 1101 \; \text{(Complemento a uno)} \\
& = 1111 \; 1110 \; \text{(Complemento a uno)} \\
& = 1000 \; 0001 \; \text{(Signo-magnitud)} \\
& \rightarrow -1
\end{aligned}
$$

Además, **hay dos representaciones de cero en signo-magnitud**: $+0$ y $-0$. Esto significa dos codificaciones binarias diferentes para cero, lo que podría generar ambigüedad. Por ejemplo, en las comprobaciones condicionales, no diferenciar entre cero positivo y negativo podría dar lugar a resultados incorrectos. Abordar esta ambigüedad requeriría comprobaciones adicionales, lo que podría reducir la eficiencia computacional.

$$
\begin{aligned}
+0 & \rightarrow 0000 \; 0000 \\
-0 & \rightarrow 1000 \; 0000
\end{aligned}
$$

Al igual que el signo-magnitud, el complemento a uno también sufre de la ambigüedad de cero positivo y negativo. Por lo tanto, las computadoras introdujeron además el <u>complemento a dos</u>. Observemos el proceso de conversión para cero negativo en signo-magnitud, complemento a uno y complemento a dos:

$$
\begin{aligned}
-0 \rightarrow \; & 1000 \; 0000 \; \text{(Signo-magnitud)} \\
= \; & 1111 \; 1111 \; \text{(Complemento a uno)} \\
= 1 \; & 0000 \; 0000 \; \text{(Complemento a dos)} \\
\end{aligned}
$$

Sumar $1$ al complemento a uno de cero negativo produce un acarreo, pero como la longitud del `byte` es de solo 8 bits, el $1$ acarreado al noveno bit se descarta. Por lo tanto, **el complemento a dos de cero negativo es $0000 \; 0000$**, el mismo que el cero positivo, resolviendo así la ambigüedad.

Un último enigma es el rango $[-128, 127]$ para `byte`, con un número negativo adicional, $-128$. Observamos que para el intervalo $[-127, +127]$, todos los enteros tienen su correspondiente signo-magnitud, complemento a uno y complemento a dos, lo que permite la conversión mutua entre ellos.

Sin embargo, **el complemento a dos $1000 \; 0000$ es una excepción sin un signo-magnitud correspondiente**. Según el método de conversión, su signo-magnitud sería $0000 \; 0000$, lo que indica cero. Esto presenta una contradicción porque su complemento a dos debería representarse a sí mismo. Las computadoras designan este complemento a dos especial $1000 \; 0000$ como representante de $-128$. De hecho, el cálculo de $(-1) + (-127)$ en complemento a dos da como resultado $-128$.

$$
\begin{aligned}
& (-127) + (-1) \\
& \rightarrow 1111 \; 1111 \; \text{(Signo-magnitud)} + 1000 \; 0001 \; \text{(Signo-magnitud)} \\
& = 1000 \; 0000 \; \text{(Complemento a uno)} + 1111 \; 1110 \; \text{(Complemento a uno)} \\
& = 1000 \; 0001 \; \text{(Complemento a dos)} + 1111 \; 1111 \; \text{(Complemento a dos)} \\
& = 1000 \; 0000 \; \text{(Complemento a dos)} \\
& \rightarrow -128
\end{aligned}
$$

Como habrás notado, todos estos cálculos son sumas, lo que insinúa un hecho importante: **los circuitos de hardware internos de las computadoras están diseñados principalmente en torno a las operaciones de suma**. Esto se debe a que la suma es más sencilla de implementar en hardware en comparación con otras operaciones como la multiplicación, la división y la resta, lo que permite una paralelización más fácil y una computación más rápida.

Es importante tener en cuenta que esto no significa que las computadoras solo puedan realizar sumas. **Al combinar la suma con operaciones lógicas básicas, las computadoras pueden ejecutar una variedad de otras operaciones matemáticas**. Por ejemplo, la resta $a - b$ se puede traducir en $a + (-b)$; la multiplicación y la división se pueden traducir en múltiples sumas o restas.

Ahora podemos resumir la razón para usar el complemento a dos en las computadoras: con la representación de complemento a dos, las computadoras pueden usar los mismos circuitos y operaciones para manejar la suma de números positivos y negativos, eliminando la necesidad de circuitos de hardware especiales para la resta y evitando la ambigüedad de cero positivo y negativo. Esto simplifica enormemente el diseño del hardware y mejora la eficiencia computacional.

El diseño del complemento a dos es bastante ingenioso, y debido a las limitaciones de espacio, nos detendremos aquí. Se anima a los lectores interesados a explorar más a fondo.

## Codificación de números de punto flotante

Es posible que haya notado algo intrigante: a pesar de tener la misma longitud de 4 bytes, ¿por qué un `float` tiene un rango de valores mucho mayor en comparación con un `int`? Esto parece contraintuitivo, ya que uno esperaría que el rango se redujera para `float` ya que necesita representar fracciones.

De hecho, **esto se debe al diferente método de representación utilizado por los números de punto flotante (`float`)**. Consideremos un número binario de 32 bits como:

$$
b_{31} b_{30} b_{29} \ldots b_2 b_1 b_0
$$

Según el estándar IEEE 754, un `float` de 32 bits consta de las siguientes tres partes:

-   Bit de signo $\mathrm{S}$: Ocupa 1 bit, correspondiente a $b_{31}$.
-   Bit de exponente $\mathrm{E}$: Ocupa 8 bits, correspondiente a $b_{30} b_{29} \ldots b_{23}$.
-   Bit de fracción $\mathrm{N}$: Ocupa 23 bits, correspondiente a $b_{22} b_{21} \ldots b_0$.

El valor de un número `float` binario se calcula como:

$$
\text{val} = (-1)^{b_{31}} \times 2^{\left(b_{30} b_{29} \ldots b_{23}\right)_2 - 127} \times \left(1 . b_{22} b_{21} \ldots b_0\right)_2
$$

Convertido a una fórmula decimal, esto se convierte en:

$$
\text{val} = (-1)^{\mathrm{S}} \times 2^{\mathrm{E} - 127} \times (1 + \mathrm{N})
$$

El rango de cada componente es:

$$
\begin{aligned}
\mathrm{S} \in & \{ 0, 1\}, \quad \mathrm{E} \in \{ 1, 2, \dots, 254 \} \\
(1 + \mathrm{N}) = & (1 + \sum_{i=1}^{23} b_{23-i} \times 2^{-i}) \subset [1, 2 - 2^{-23}]
\end{aligned}
$$

![Ejemplo de cálculo de un flotante en el estándar IEEE 754](number_encoding.assets/ieee_754_float.png)

Observando la figura anterior, dado un ejemplo de datos $\mathrm{S} = 0$, $\mathrm{E} = 124$, $\mathrm{N} = 2^{-2} + 2^{-3} = 0.375$, tenemos:

$$
\text{val} = (-1)^0 \times 2^{124 - 127} \times (1 + 0.375) = 0.171875
$$

Ahora podemos responder a la pregunta inicial: **La representación de `float` incluye un bit de exponente, lo que lleva a un rango mucho mayor que `int`**. Basado en el cálculo anterior, el número positivo máximo representable por `float` es aproximadamente $2^{254 - 127} \times (2 - 2^{-23}) \approx 3.4 \times 10^{38}$, y el número negativo mínimo se obtiene cambiando el bit de signo.

**Sin embargo, la compensación por el rango expandido de `float` es un sacrificio en la precisión**. El tipo entero `int` utiliza los 32 bits para representar el número, con valores distribuidos uniformemente; pero debido al bit de exponente, cuanto mayor sea el valor de un `float`, mayor será la diferencia entre números adyacentes.

Como se muestra en la tabla a continuación, los bits de exponente $\mathrm{E} = 0$ y $\mathrm{E} = 255$ tienen significados especiales, **utilizados para representar cero, infinito, $\mathrm{NaN}$, etc.**

<p align="center"> Tabla <id> &nbsp; Significado de los bits de exponente </p>

| Bit de exponente E | Bit de fracción $\mathrm{N} = 0$ | Bit de fracción $\mathrm{N} \ne 0$ | Fórmula de cálculo                                                    |
| ------------------ | ----------------------------- | ------------------------------- | ---------------------------------------------------------------------- |
| $0$                | $\pm 0$                       | Números subnormales               | $(-1)^{\mathrm{S}} \times 2^{-126} \times (0.\mathrm{N})$              |
| $1, 2, \dots, 254$ | Números normales                | Números normales                  | $(-1)^{\mathrm{S}} \times 2^{(\mathrm{E} -127)} \times (1.\mathrm{N})$ |
| $255$              | $\pm \infty$                  | $\mathrm{NaN}$                  |                                                                        |

Cabe señalar que los números subnormales mejoran significativamente la precisión de los números de punto flotante. El número normal positivo más pequeño es $2^{-126}$, y el número subnormal positivo más pequeño es $2^{-126} \times 2^{-23}$.

El `double` de doble precisión también utiliza un método de representación similar al `float`, que no se detalla aquí por brevedad.
