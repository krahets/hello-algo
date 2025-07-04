# Resumen

- Divide y vencerás es una estrategia común de diseño de algoritmos que consta de dos etapas —dividir (particionar) y vencer (fusionar)— y generalmente se implementa utilizando recursión.
- Para determinar si un problema es adecuado para un enfoque de divide y vencerás, verificamos si el problema se puede descomponer, si los subproblemas son independientes y si los subproblemas se pueden fusionar.
- El ordenamiento por mezcla es un ejemplo típico de la estrategia de divide y vencerás. Divide recursivamente un arreglo en dos subarreglos de igual longitud hasta que solo queda un elemento, y luego fusiona estos subarreglos capa por capa para completar el ordenamiento.
- La introducción de la estrategia de divide y vencerás a menudo mejora la eficiencia del algoritmo. Por un lado, reduce el número de operaciones; por otro lado, facilita la optimización paralela del sistema después de la división.
- Divide y vencerás se puede aplicar a numerosos problemas algorítmicos y se usa ampliamente en el diseño de estructuras de datos y algoritmos, apareciendo en muchos escenarios.
- En comparación con la búsqueda por fuerza bruta, la búsqueda adaptativa es más eficiente. Los algoritmos de búsqueda con una complejidad temporal de $O(\log n)$ suelen basarse en la estrategia de divide y vencerás.
- La búsqueda binaria es otra aplicación clásica de la estrategia de divide y vencerás. No implica la fusión de soluciones de subproblemas y se puede implementar mediante un enfoque recursivo de divide y vencerás.
- En el problema de la construcción de árboles binarios, la construcción del árbol (el problema original) se puede dividir en la construcción del subárbol izquierdo y el subárbol derecho (los subproblemas). Esto se puede lograr dividiendo los rangos de índices de los recorridos en preorden y en inorden.
- En el problema de las Torres de Hanói, un problema de tamaño $n$ se puede dividir en dos subproblemas de tamaño $n-1$ y un subproblema de tamaño $1$. Al resolver estos tres subproblemas en secuencia, se resuelve el problema original.
