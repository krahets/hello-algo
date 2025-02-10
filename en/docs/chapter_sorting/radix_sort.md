# Radix sort

The previous section introduced counting sort, which is suitable for scenarios where the data size $n$ is large but the data range $m$ is small. Suppose we need to sort $n = 10^6$ student IDs, where each ID is an $8$-digit number. This means the data range $m = 10^8$ is very large. Using counting sort in this case would require significant memory space. Radix sort can avoid this situation.

<u>Radix sort</u> shares the same core concept as counting sort, which also sorts by counting the frequency of elements. Meanwhile, radix sort builds upon this by utilizing the progressive relationship between the digits of numbers. It processes and sorts the digits one at a time, achieving the final sorted order.

## Algorithm process

Taking the student ID data as an example, assume the least significant digit is the $1^{st}$ and the most significant is the $8^{th}$, the radix sort process is illustrated in the figure below.

1. Initialize digit $k = 1$.
2. Perform "counting sort" on the $k^{th}$ digit of the student IDs. After completion, the data will be sorted from smallest to largest based on the $k^{th}$ digit.
3. Increment $k$ by $1$, then return to step `2.` and continue iterating until all digits have been sorted, at which point the process ends.

![Radix sort algorithm process](radix_sort.assets/radix_sort_overview.png)

Below we dissect the code implementation. For a number $x$ in base $d$, to obtain its $k^{th}$ digit $x_k$, the following calculation formula can be used:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Where $\lfloor a \rfloor$ denotes rounding down the floating point number $a$, and $\bmod \: d$ denotes taking the modulus of $d$. For student ID data, $d = 10$ and $k \in [1, 8]$.

Additionally, we need to slightly modify the counting sort code to allow sorting based on the $k^{th}$ digit:

```src
[file]{radix_sort}-[class]{}-[func]{radix_sort}
```

!!! question "Why start sorting from the least significant digit?"

    In consecutive sorting rounds, the result of a later round will override the result of an earlier round. For example, if the result of the first round is $a < b$ and the second round is $a > b$, the second round's result will replace the first round's result. Since higher-order digits take precedence over lower-order digits, it makes sense to sort the lower digits before the higher digits.

## Algorithm characteristics

Compared to counting sort, radix sort is suitable for larger numerical ranges, **but it assumes that the data can be represented in a fixed number of digits, and the number of digits should not be too large**. For example, floating-point numbers are unsuitable for radix sort, as their digit count $k$ may be large, potentially leading to a time complexity $O(nk) \gg O(n^2)$.

- **Time complexity is $O(nk)$, non-adaptive sorting**: Assuming the data size is $n$, the data is in base $d$, and the maximum number of digits is $k$, then sorting a single digit takes $O(n + d)$ time, and sorting all $k$ digits takes $O((n + d)k)$ time. Generally, both $d$ and $k$ are relatively small, leading to a time complexity approaching $O(n)$.
- **Space complexity is $O(n + d)$, non-in-place sorting**: Like counting sort, radix sort relies on arrays `res` and `counter` of lengths $n$ and $d$ respectively.
- **Stable sorting**: When counting sort is stable, radix sort is also stable; if counting sort is unstable, radix sort cannot ensure a correct sorting order.
