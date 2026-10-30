# Radix sort

The previous section introduced counting sort, which suits a large number of elements $n$ with a small value range $m$. Suppose we need to sort $n = 10^6$ student IDs, each an $8$-digit number. The value range $m = 10^8$ is very large, so counting sort would require substantial memory. Radix sort avoids this problem.

<u>Radix sort</u> shares counting sort's core idea of sorting by counting occurrences. It also uses the relative significance of digit positions, sorting one digit at a time to obtain the final order.

## Algorithm steps

For the student IDs, number the least significant digit as $1$ and the most significant as $8$. Radix sort proceeds as shown below.

1. Initialize the digit position $k = 1$.
2. Apply counting sort to the $k$th digit of each student ID. The data is now sorted in ascending order by its $k$th digit.
3. Increase the digit position $k$ by $1$ and return to step `2.`. Continue until all digit positions have been processed.

![The radix sort process](radix_sort.assets/radix_sort_overview.png)

Now consider the implementation. For a number $x$ in base $d$, its $k$th digit $x_k$ can be obtained with the following formula:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Here, $\lfloor a \rfloor$ rounds the floating-point value $a$ down, and $\bmod \: d$ takes the remainder modulo $d$. For the student IDs, $d = 10$ and $k \in [1, 8]$.

We also need to modify counting sort slightly so that it sorts by the $k$th digit:

```src
[file]{radix_sort}-[class]{}-[func]{radix_sort}
```

!!! question "Why start with the least significant digit?"

    In successive rounds, a later sort takes precedence over an earlier one. For example, if the first round orders two elements as $a < b$ but the second orders them as $a > b$, the second result replaces the first. Higher digits have greater priority, so lower digits must be sorted first.

## Algorithm properties

Compared with counting sort, radix sort handles a larger range of values, **provided the data can be represented with a fixed number of digits and that number is not too large**. For example, floating-point numbers are unsuitable because their digit count $k$ may be so large that $O(nk) \gg O(n^2)$.

- **Time complexity: $O(nk)$; not adaptive**. For $n$ elements represented in base $d$ with at most $k$ digits, counting sort on one digit takes $O(n + d)$ time. Sorting all $k$ digits takes $O((n + d)k)$. Usually $d$ and $k$ are relatively small, so the complexity approaches $O(n)$.
- **Space complexity: $O(n + d)$; not in-place**. Like counting sort, radix sort requires arrays `res` and `counter` of lengths $n$ and $d$.
- **Stable**. Radix sort is stable when the counting sort used within it is stable. If counting sort is not stable, radix sort cannot guarantee a correctly sorted result.
