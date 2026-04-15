# Radix Sort

The previous section introduced counting sort, which is suitable when the number of items $n$ is large but the value range $m$ is small. Suppose we need to sort $n = 10^6$ student IDs, each of which is an 8-digit number. Then the value range $m = 10^8$ is very large. Using counting sort would require a large amount of memory, whereas radix sort avoids this problem.

<u>Radix sort</u> is based on the same core idea as counting sort: it also sorts by counting occurrences. Building on this, radix sort exploits the positional relationship among digits and sorts them one digit at a time to obtain the final result.

## Algorithm Flow

Taking student ID data as an example, assume the lowest digit is the $1$st digit and the highest digit is the $8$th digit. The flow of radix sort is shown in the figure below.

1. Initialize the digit $k = 1$.
2. Perform "counting sort" on the $k$th digit of the student IDs. After completion, the data will be sorted from smallest to largest according to the $k$th digit.
3. Increase $k$ by $1$, then return to step `2.` and continue iterating until all digits are sorted, at which point the process ends.

![Radix sort algorithm flow](radix_sort.assets/radix_sort_overview.png)

Next, let us look at the code. For a number $x$ in base $d$, its $k$th digit $x_k$ can be obtained with the following formula:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Here, $\lfloor a \rfloor$ denotes rounding the floating-point number $a$ down, and $\bmod \: d$ denotes taking the remainder modulo $d$. For student ID data, $d = 10$ and $k \in [1, 8]$.

Additionally, we need to slightly modify the counting sort code to make it sort based on the $k$th digit of the number:

```src
[file]{radix_sort}-[class]{}-[func]{radix_sort}
```

!!! question "Why start sorting from the lowest digit?"

    In successive sorting passes, a later pass overrides the result of an earlier one. For example, if the first pass yields $a < b$ but the second yields $a > b$, then the result of the second pass prevails. Because higher-order digits have higher priority than lower-order digits, we should sort the lower digits first and then the higher digits.

## Algorithm Characteristics

Compared with counting sort, radix sort is suitable for larger value ranges, **but only when the data can be represented with a fixed number of digits and that digit count is not too large**. For example, floating-point numbers are not well suited to radix sort because the digit count $k$ can be too large, potentially leading to time complexity $O(nk) \gg O(n^2)$.

- **Time complexity of $O(nk)$, non-adaptive sorting**: Let the number of items be $n$, let the values be represented in base $d$, and let the maximum number of digits be $k$. Counting sort on one digit takes $O(n + d)$ time, so sorting all $k$ digits takes $O((n + d)k)$ time. In practice, $d$ and $k$ are usually relatively small, so the overall time complexity approaches $O(n)$.
- **Space complexity of $O(n + d)$, non-in-place sorting**: Same as counting sort, radix sort requires auxiliary arrays `res` and `counter` of lengths $n$ and $d$.
- **Stable sort**: When counting sort is stable, radix sort is also stable; when counting sort is unstable, radix sort cannot guarantee correct sorting results.
