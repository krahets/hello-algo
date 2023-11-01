# Radix Sort

In the previous section, we introduced counting sort, which is suitable for cases where the amount of data $n$ is large but the data range $m$ is small. Suppose we need to sort $n = 10^6$ school numbers, which is a $8$ bit number, which means the data range $m = 10^8$ is very large, and using counting sort would require allocating a lot of memory space, which can be avoided by radix sort.

The core idea of "radix sort" is the same as counting sort, which is also realized by counting the number of digits. Based on this, radix sort utilizes the progressive relationship between each digit and sorts each digit in turn to get the final sort result.

## Algorithmic Flow

Taking the school number data as an example, assuming that the lowest digit of the number is the $1$th digit and the highest digit is the $8$th digit, the flow of radix sort is shown in the figure below.

1. Initialization bits $k = 1$ .
2. Performs "counting sort" on the $k$ digit of the student number. When finished, the data is sorted from smallest to largest by the $k$ digit.
3. Increase $k$ by $1$ and return to step `2.` Continue iteration until it ends when all bits are sorted.

![Radix sort algorithm flow](radix_sort.assets/radix_sort_overview.png)

Let's dissect the code implementation. For a $d$ progressive number $x$, to get its first $k$ bit $x_k$, you can use the following formula:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

where $\lfloor a \rfloor$ denotes rounding down the floating point number $a$ and $\bmod \: d$ denotes rounding up $d$. For school number data, $d = 10$ and $k \in [1, 8]$ .

In addition, we need to make a small change to the counting sort code so that it can sort the numbers according to the $k$th bit of the number.

```src
[file]{radix_sort}-[class]{}-[func]{radix_sort}
```

!!! Question "Why do you start sorting from the lowest position?"

    In consecutive sorting rounds, the later sorting round overwrites the result of the previous sorting round. For example, if the result of the first sorting round $a < b$ and the result of the second sorting round $a > b$, then the result of the second round will replace the result of the first round. Since the higher digits of a number have higher priority than the lower digits, we should sort the lower digits first before sorting the higher digits.

## Algorithm Properties

Compared to counting sort, radix sort is suitable for larger ranges of values, **provided that the data can be represented in a fixed bit format and the number of bits is not too large**. For example, floating point numbers are not suitable for radix sort because the number of bits $k$ is too large, which may result in a time complexity $O(nk) \gg O(n^2)$ .

- **Time complexity $O(nk)$**: Given a data size of $n$, a data $d$ progression, and a maximum number of bits $k$, it takes $O(n + d)$ time to perform a counting sort on a particular bit, and $O((n + d)k)$ time to sort all the $k$ bits. Typically, both $d$ and $k$ are relatively small and the time complexity tends to be $O(n)$.
- **Space complexity $O(n + d)$, Non-in-place sort**: like counting sort, radix sort requires the help of arrays `res` and `counter` of length $n$ and $d$.
- **Stable sort**: same as counting sort.
