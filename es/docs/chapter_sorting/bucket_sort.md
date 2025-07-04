# Ordenamiento por cubetas

Los algoritmos de ordenamiento mencionados anteriormente son todos "algoritmos de ordenamiento basados en comparación", que ordenan elementos comparando sus valores. Dichos algoritmos de ordenamiento no pueden tener una complejidad temporal mejor que $O(n \log n)$. A continuación, discutiremos varios "algoritmos de ordenamiento sin comparación" que podrían lograr una complejidad temporal lineal.

El <u>ordenamiento por cubetas</u> es una aplicación típica de la estrategia de divide y vencerás. Funciona estableciendo una serie de cubetas ordenadas, cada una de las cuales contiene un rango de datos, y distribuyendo los datos de entrada de manera uniforme entre estas cubetas. Y luego, los datos de cada cubeta se ordenan individualmente. Finalmente, los datos ordenados de todas las cubetas se fusionan en secuencia para producir el resultado final.

## Proceso del algoritmo

Considere un arreglo de longitud $n$, con números flotantes en el rango $[0, 1)$. El proceso de ordenamiento por cubetas se ilustra en la figura a continuación.

1.  Inicialice $k$ cubetas y distribuya $n$ elementos en estas $k$ cubetas.
2.  Ordene cada cubeta individualmente (usando la función de ordenamiento incorporada del lenguaje de programación).
3.  Combine los resultados en el orden de la cubeta más pequeña a la más grande.

![Proceso del algoritmo de ordenamiento por cubetas](bucket_sort.assets/bucket_sort_overview.png)

El código se muestra a continuación:

```src
[file]{bucket_sort}-[class]{}-[func]{bucket_sort}
```

## Características del algoritmo

El ordenamiento por cubetas es adecuado para manejar conjuntos de datos muy grandes. Por ejemplo, si los datos de entrada incluyen 1 millón de elementos y las limitaciones de memoria del sistema impiden cargar todos los datos al mismo tiempo, puede dividir los datos en 1.000 cubetas y ordenar cada cubeta por separado antes de fusionar los resultados.

-   **La complejidad temporal es $O(n + k)$**: Suponiendo que los elementos se distribuyen uniformemente entre las cubetas, el número de elementos en cada cubeta es $n/k$. Suponiendo que ordenar una sola cubeta toma $O(n/k \log(n/k))$ tiempo, ordenar todas las cubetas toma $O(n \log(n/k))$ tiempo. **Cuando el número de cubetas $k$ es relativamente grande, la complejidad temporal se acerca a $O(n)$**. La fusión de los resultados requiere recorrer todas las cubetas y elementos, lo que lleva $O(n + k)$ tiempo. En el peor de los casos, todos los datos se distribuyen en una sola cubeta, y ordenar esa cubeta toma $O(n^2)$ tiempo.
-   **La complejidad espacial es $O(n + k)$, ordenamiento no in situ**: Requiere espacio adicional para $k$ cubetas y un total de $n$ elementos.
-   Si el ordenamiento por cubetas es estable depende de si el algoritmo de ordenamiento utilizado dentro de cada cubeta es estable.

## Cómo lograr una distribución uniforme

La complejidad temporal teórica del ordenamiento por cubetas puede alcanzar $O(n)$. **La clave es distribuir uniformemente los elementos entre todas las cubetas**, ya que los datos del mundo real a menudo no se distribuyen uniformemente. Por ejemplo, es posible que queramos distribuir uniformemente todos los productos en eBay por rango de precios en 10 cubetas. Sin embargo, la distribución de los precios de los productos puede no ser uniforme, con muchos por debajo de $100 y pocos por encima de $500. Si el rango de precios se divide uniformemente en 10, la diferencia en el número de productos en cada cubeta será significativa.

Para lograr una distribución uniforme, podemos establecer inicialmente un límite aproximado para dividir aproximadamente los datos en 3 cubetas. **Una vez completada la distribución, las cubetas con más elementos se pueden dividir aún más en 3 cubetas, hasta que el número de elementos en todas las cubetas sea aproximadamente igual**.

Como se muestra en la figura a continuación, este método esencialmente construye un árbol recursivo, con el objetivo de asegurar que el recuento de elementos en los nodos hoja sea lo más uniforme posible. Por supuesto, no es necesario dividir los datos en 3 cubetas en cada ronda; la estrategia de partición se puede adaptar a las características únicas de los datos.

![División recursiva de cubetas](bucket_sort.assets/scatter_in_buckets_recursively.png)

Si conocemos la distribución de probabilidad de los precios de los productos de antemano, **podemos establecer los límites de precios para cada cubeta basándonos en la distribución de probabilidad de los datos**. Cabe señalar que no es necesariamente necesario calcular específicamente la distribución de datos; en su lugar, se puede aproximar basándose en las características de los datos utilizando un modelo de probabilidad.

Como se muestra en la figura a continuación, suponiendo que los precios de los productos siguen una distribución normal, podemos definir intervalos de precios razonables para equilibrar la distribución de los artículos entre las cubetas.

![División de cubetas basada en la distribución de probabilidad](bucket_sort.assets/scatter_in_buckets_distribution.png)
