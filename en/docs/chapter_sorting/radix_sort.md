# Radix Sort

The previous section introduced counting sort, which is suitable for situations where the data volume $n$ is large but the data range $m$ is small. Suppose we need to sort $n = 10^6$ student IDs, and the student ID is an 8-digit number, which means the data range $m = 10^8$ is very large. Using counting sort would require allocating a large amount of memory space, whereas radix sort can avoid this situation.

<u>Radix sort (radix sort)</u> has a core idea consistent with counting sort, which also achieves sorting by counting quantities. Building on this, radix sort utilizes the progressive relationship between the digits of numbers, sorting each digit in turn to obtain the final sorting result.

## Algorithm Flow

Taking student ID data as an example, assume the lowest digit is the $1$st digit and the highest digit is the $8$th digit. The flow of radix sort is shown in the figure below.

1. Initialize the digit $k = 1$.
2. Perform "counting sort" on the $k$th digit of the student IDs. After completion, the data will be sorted from smallest to largest according to the $k$th digit.
3. Increase $k$ by $1$, then return to step `2.` and continue iterating until all digits are sorted, at which point the process ends.

![Radix sort algorithm flow](radix_sort.assets/radix_sort_overview.png)

Below we analyze the code implementation. For a $d$-base number $x$, to get its $k$th digit $x_k$, the following calculation formula can be used:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Where $\lfloor a \rfloor$ denotes rounding down the floating-point number $a$, and $\bmod \: d$ denotes taking the modulo (remainder) with respect to $d$. For student ID data, $d = 10$ and $k \in [1, 8]$.

Additionally, we need to slightly modify the counting sort code to make it sort based on the $k$th digit of the number:

```src
[file]{radix_sort}-[class]{}-[func]{radix_sort}
```

!!! question "Why start sorting from the lowest digit?"

    In successive sorting rounds, the result of a later round will override the result of an earlier round. For example, if the first round result is $a < b$, while the second round result is $a > b$, then the second round's result will replace the first round's result. Since higher-order digits have higher priority than lower-order digits, we should sort the lower digits first and then sort the higher digits.

## Algorithm Characteristics

Compared to counting sort, radix sort is suitable for larger numerical ranges, **but the prerequisite is that the data must be representable in a fixed number of digits, and the number of digits should not be too large**. For example, floating-point numbers are not suitable for radix sort because their number of digits $k$ may be too large, potentially leading to time complexity $O(nk) \gg O(n^2)$.

- **Time complexity of $O(nk)$, non-adaptive sorting**: Let the data volume be $n$, the data be in base $d$, and the maximum number of digits be $k$. Then performing counting sort on a certain digit uses $O(n + d)$ time, and sorting all $k$ digits uses $O((n + d)k)$ time. Typically, both $d$ and $k$ are relatively small, and the time complexity approaches $O(n)$.
- **Space complexity of $O(n + d)$, non-in-place sorting**: Same as counting sort, radix sort requires auxiliary arrays `res` and `counter` of lengths $n$ and $d$.
- **Stable sorting**: When counting sort is stable, radix sort is also stable; when counting sort is unstable, radix sort cannot guarantee obtaining correct sorting results.
