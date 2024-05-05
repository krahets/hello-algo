---
comments: true
---

# 15.4 &nbsp; Maximum product cutting problem

!!! question

    Given a positive integer $n$, split it into at least two positive integers that sum up to $n$, and find the maximum product of these integers, as illustrated below.

![Definition of the maximum product cutting problem](max_product_cutting_problem.assets/max_product_cutting_definition.png){ class="animation-figure" }

<p align="center"> Figure 15-13 &nbsp; Definition of the maximum product cutting problem </p>

Assume we split $n$ into $m$ integer factors, where the $i$-th factor is denoted as $n_i$, that is,

$$
n = \sum_{i=1}^{m}n_i
$$

The goal of this problem is to find the maximum product of all integer factors, namely,

$$
\max(\prod_{i=1}^{m}n_i)
$$

We need to consider: How large should the number of splits $m$ be, and what should each $n_i$ be?

### 1. &nbsp; Greedy strategy determination

Experience suggests that the product of two integers is often greater than their sum. Suppose we split a factor of $2$ from $n$, then their product is $2(n-2)$. Compare this product with $n$:

$$
\begin{aligned}
2(n-2) & \geq n \newline
2n - n - 4 & \geq 0 \newline
n & \geq 4
\end{aligned}
$$

As shown in Figure 15-14, when $n \geq 4$, splitting out a $2$ increases the product, **which indicates that integers greater than or equal to $4$ should be split**.

**Greedy strategy one**: If the splitting scheme includes factors $\geq 4$, they should be further split. The final split should only include factors $1$, $2$, and $3$.

![Product increase due to splitting](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.png){ class="animation-figure" }

<p align="center"> Figure 15-14 &nbsp; Product increase due to splitting </p>

Next, consider which factor is optimal. Among the factors $1$, $2$, and $3$, clearly $1$ is the worst, as $1 \times (n-1) < n$ always holds, meaning splitting out $1$ actually decreases the product.

As shown in Figure 15-15, when $n = 6$, $3 \times 3 > 2 \times 2 \times 2$. **This means splitting out $3$ is better than splitting out $2$**.

**Greedy strategy two**: In the splitting scheme, there should be at most two $2$s. Because three $2$s can always be replaced by two $3$s to obtain a higher product.

![Optimal splitting factors](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.png){ class="animation-figure" }

<p align="center"> Figure 15-15 &nbsp; Optimal splitting factors </p>

From the above, the following greedy strategies can be derived.

1. Input integer $n$, continually split out factor $3$ until the remainder is $0$, $1$, or $2$.
2. When the remainder is $0$, it means $n$ is a multiple of $3$, so no further action is taken.
3. When the remainder is $2$, do not continue to split, keep it.
4. When the remainder is $1$, since $2 \times 2 > 1 \times 3$, the last $3$ should be replaced with $2$.

### 2. &nbsp; Code implementation

As shown in Figure 15-16, we do not need to use loops to split the integer but can use the floor division operation to get the number of $3$s, $a$, and the modulo operation to get the remainder, $b$, thus:

$$
n = 3a + b
$$

Please note, for the boundary case where $n \leq 3$, a $1$ must be split out, with a product of $1 \times (n - 1)$.

=== "Python"

    ```python title="max_product_cutting.py"
    def max_product_cutting(n: int) -> int:
        """Maximum product of cutting: Greedy"""
        # When n <= 3, must cut out a 1
        if n <= 3:
            return 1 * (n - 1)
        # Greedy cut out 3s, a is the number of 3s, b is the remainder
        a, b = n // 3, n % 3
        if b == 1:
            # When the remainder is 1, convert a pair of 1 * 3 into 2 * 2
            return int(math.pow(3, a - 1)) * 2 * 2
        if b == 2:
            # When the remainder is 2, do nothing
            return int(math.pow(3, a)) * 2
        # When the remainder is 0, do nothing
        return int(math.pow(3, a))
    ```

=== "C++"

    ```cpp title="max_product_cutting.cpp"
    [class]{}-[func]{maxProductCutting}
    ```

=== "Java"

    ```java title="max_product_cutting.java"
    /* Maximum product of cutting: Greedy */
    int maxProductCutting(int n) {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedy cut out 3s, a is the number of 3s, b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, convert a pair of 1 * 3 into 2 * 2
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, do nothing
            return (int) Math.pow(3, a) * 2;
        }
        // When the remainder is 0, do nothing
        return (int) Math.pow(3, a);
    }
    ```

=== "C#"

    ```csharp title="max_product_cutting.cs"
    [class]{max_product_cutting}-[func]{MaxProductCutting}
    ```

=== "Go"

    ```go title="max_product_cutting.go"
    [class]{}-[func]{maxProductCutting}
    ```

=== "Swift"

    ```swift title="max_product_cutting.swift"
    [class]{}-[func]{maxProductCutting}
    ```

=== "JS"

    ```javascript title="max_product_cutting.js"
    [class]{}-[func]{maxProductCutting}
    ```

=== "TS"

    ```typescript title="max_product_cutting.ts"
    [class]{}-[func]{maxProductCutting}
    ```

=== "Dart"

    ```dart title="max_product_cutting.dart"
    [class]{}-[func]{maxProductCutting}
    ```

=== "Rust"

    ```rust title="max_product_cutting.rs"
    [class]{}-[func]{max_product_cutting}
    ```

=== "C"

    ```c title="max_product_cutting.c"
    [class]{}-[func]{maxProductCutting}
    ```

=== "Kotlin"

    ```kotlin title="max_product_cutting.kt"
    [class]{}-[func]{maxProductCutting}
    ```

=== "Ruby"

    ```ruby title="max_product_cutting.rb"
    [class]{}-[func]{max_product_cutting}
    ```

=== "Zig"

    ```zig title="max_product_cutting.zig"
    [class]{}-[func]{maxProductCutting}
    ```

![Calculation method of the maximum product after cutting](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.png){ class="animation-figure" }

<p align="center"> Figure 15-16 &nbsp; Calculation method of the maximum product after cutting </p>

**Time complexity depends on the implementation of the power operation in the programming language**. For Python, the commonly used power calculation functions are three types:

- Both the operator `**` and the function `pow()` have a time complexity of $O(\log⁡ a)$.
- The `math.pow()` function internally calls the C language library's `pow()` function, performing floating-point exponentiation, with a time complexity of $O(1)$.

Variables $a$ and $b$ use constant size of extra space, **hence the space complexity is $O(1)$**.

### 3. &nbsp; Correctness proof

Using the proof by contradiction, only analyze cases where $n \geq 3$.

1. **All factors $\leq 3$**: Assume the optimal splitting scheme includes a factor $x \geq 4$, then it can definitely be further split into $2(x-2)$, obtaining a larger product. This contradicts the assumption.
2. **The splitting scheme does not contain $1$**: Assume the optimal splitting scheme includes a factor of $1$, then it can definitely be merged into another factor to obtain a larger product. This contradicts the assumption.
3. **The splitting scheme contains at most two $2$s**: Assume the optimal splitting scheme includes three $2$s, then they can definitely be replaced by two $3$s, achieving a higher product. This contradicts the assumption.
