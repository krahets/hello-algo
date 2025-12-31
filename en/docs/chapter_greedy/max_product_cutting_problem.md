---
comments: true
---

# 15.4 &nbsp; Max Product Cutting Problem

!!! question

    Given a positive integer $n$, split it into the sum of at least two positive integers, and find the maximum product of all integers after splitting, as shown in Figure 15-13.

![Problem definition of max product cutting](max_product_cutting_problem.assets/max_product_cutting_definition.png){ class="animation-figure" }

<p align="center"> Figure 15-13 &nbsp; Problem definition of max product cutting </p>

Suppose we split $n$ into $m$ integer factors, where the $i$-th factor is denoted as $n_i$, that is

$$
n = \sum_{i=1}^{m}n_i
$$

The goal of this problem is to find the maximum product of all integer factors, namely

$$
\max(\prod_{i=1}^{m}n_i)
$$

We need to think about: how large should the splitting count $m$ be, and what should each $n_i$ be?

### 1. &nbsp; Greedy Strategy Determination

Based on experience, the product of two integers is often greater than their sum. Suppose we split out a factor of $2$ from $n$, then their product is $2(n-2)$. We compare this product with $n$:

$$
\begin{aligned}
2(n-2) & \geq n \newline
2n - n - 4 & \geq 0 \newline
n & \geq 4
\end{aligned}
$$

As shown in Figure 15-14, when $n \geq 4$, splitting out a $2$ will increase the product, **which indicates that integers greater than or equal to $4$ should all be split**.

**Greedy strategy one**: If the splitting scheme includes factors $\geq 4$, then they should continue to be split. The final splitting scheme should only contain factors $1$, $2$, and $3$.

![Splitting causes product to increase](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.png){ class="animation-figure" }

<p align="center"> Figure 15-14 &nbsp; Splitting causes product to increase </p>

Next, consider which factor is optimal. Among the three factors $1$, $2$, and $3$, clearly $1$ is the worst, because $1 \times (n-1) < n$ always holds, meaning splitting out $1$ will actually decrease the product.

As shown in Figure 15-15, when $n = 6$, we have $3 \times 3 > 2 \times 2 \times 2$. **This means that splitting out $3$ is better than splitting out $2$**.

**Greedy strategy two**: In the splitting scheme, there should be at most two $2$s. Because three $2$s can always be replaced by two $3$s to obtain a larger product.

![Optimal splitting factor](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.png){ class="animation-figure" }

<p align="center"> Figure 15-15 &nbsp; Optimal splitting factor </p>

In summary, the following greedy strategies can be derived.

1. Input integer $n$, continuously split out factor $3$ until the remainder is $0$, $1$, or $2$.
2. When the remainder is $0$, it means $n$ is a multiple of $3$, so no further action is needed.
3. When the remainder is $2$, do not continue splitting, keep it.
4. When the remainder is $1$, since $2 \times 2 > 1 \times 3$, the last $3$ should be replaced with $2$.

### 2. &nbsp; Code Implementation

As shown in Figure 15-16, we don't need to use loops to split the integer, but can use integer division to get the count of $3$s as $a$, and modulo operation to get the remainder as $b$, at which point we have:

$$
n = 3 a + b
$$

Please note that for the edge case of $n \leq 3$, a $1$ must be split out, with product $1 \times (n - 1)$.

=== "Python"

    ```python title="max_product_cutting.py"
    def max_product_cutting(n: int) -> int:
        """Max product cutting: Greedy algorithm"""
        # When n <= 3, must cut out a 1
        if n <= 3:
            return 1 * (n - 1)
        # Greedily cut out 3, a is the number of 3s, b is the remainder
        a, b = n // 3, n % 3
        if b == 1:
            # When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return int(math.pow(3, a - 1)) * 2 * 2
        if b == 2:
            # When the remainder is 2, do nothing
            return int(math.pow(3, a)) * 2
        # When the remainder is 0, do nothing
        return int(math.pow(3, a))
    ```

=== "C++"

    ```cpp title="max_product_cutting.cpp"
    /* Max product cutting: Greedy algorithm */
    int maxProductCutting(int n) {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return (int)pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, do nothing
            return (int)pow(3, a) * 2;
        }
        // When the remainder is 0, do nothing
        return (int)pow(3, a);
    }
    ```

=== "Java"

    ```java title="max_product_cutting.java"
    /* Max product cutting: Greedy algorithm */
    int maxProductCutting(int n) {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
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
    /* Max product cutting: Greedy algorithm */
    int MaxProductCutting(int n) {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, do nothing
            return (int)Math.Pow(3, a) * 2;
        }
        // When the remainder is 0, do nothing
        return (int)Math.Pow(3, a);
    }
    ```

=== "Go"

    ```go title="max_product_cutting.go"
    /* Max product cutting: Greedy algorithm */
    func maxProductCutting(n int) int {
        // When n <= 3, must cut out a 1
        if n <= 3 {
            return 1 * (n - 1)
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        a := n / 3
        b := n % 3
        if b == 1 {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return int(math.Pow(3, float64(a-1))) * 2 * 2
        }
        if b == 2 {
            // When the remainder is 2, do nothing
            return int(math.Pow(3, float64(a))) * 2
        }
        // When the remainder is 0, do nothing
        return int(math.Pow(3, float64(a)))
    }
    ```

=== "Swift"

    ```swift title="max_product_cutting.swift"
    /* Max product cutting: Greedy algorithm */
    func maxProductCutting(n: Int) -> Int {
        // When n <= 3, must cut out a 1
        if n <= 3 {
            return 1 * (n - 1)
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        let a = n / 3
        let b = n % 3
        if b == 1 {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return pow(3, a - 1) * 2 * 2
        }
        if b == 2 {
            // When the remainder is 2, do nothing
            return pow(3, a) * 2
        }
        // When the remainder is 0, do nothing
        return pow(3, a)
    }
    ```

=== "JS"

    ```javascript title="max_product_cutting.js"
    /* Max product cutting: Greedy algorithm */
    function maxProductCutting(n) {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        let a = Math.floor(n / 3);
        let b = n % 3;
        if (b === 1) {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // When the remainder is 2, do nothing
            return Math.pow(3, a) * 2;
        }
        // When the remainder is 0, do nothing
        return Math.pow(3, a);
    }
    ```

=== "TS"

    ```typescript title="max_product_cutting.ts"
    /* Max product cutting: Greedy algorithm */
    function maxProductCutting(n: number): number {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        let a: number = Math.floor(n / 3);
        let b: number = n % 3;
        if (b === 1) {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // When the remainder is 2, do nothing
            return Math.pow(3, a) * 2;
        }
        // When the remainder is 0, do nothing
        return Math.pow(3, a);
    }
    ```

=== "Dart"

    ```dart title="max_product_cutting.dart"
    /* Max product cutting: Greedy algorithm */
    int maxProductCutting(int n) {
      // When n <= 3, must cut out a 1
      if (n <= 3) {
        return 1 * (n - 1);
      }
      // Greedily cut out 3, a is the number of 3s, b is the remainder
      int a = n ~/ 3;
      int b = n % 3;
      if (b == 1) {
        // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
        return (pow(3, a - 1) * 2 * 2).toInt();
      }
      if (b == 2) {
        // When the remainder is 2, do nothing
        return (pow(3, a) * 2).toInt();
      }
      // When the remainder is 0, do nothing
      return pow(3, a).toInt();
    }
    ```

=== "Rust"

    ```rust title="max_product_cutting.rs"
    /* Max product cutting: Greedy algorithm */
    fn max_product_cutting(n: i32) -> i32 {
        // When n <= 3, must cut out a 1
        if n <= 3 {
            return 1 * (n - 1);
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        let a = n / 3;
        let b = n % 3;
        if b == 1 {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            3_i32.pow(a as u32 - 1) * 2 * 2
        } else if b == 2 {
            // When the remainder is 2, do nothing
            3_i32.pow(a as u32) * 2
        } else {
            // When the remainder is 0, do nothing
            3_i32.pow(a as u32)
        }
    }
    ```

=== "C"

    ```c title="max_product_cutting.c"
    /* Max product cutting: Greedy algorithm */
    int maxProductCutting(int n) {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, do nothing
            return pow(3, a) * 2;
        }
        // When the remainder is 0, do nothing
        return pow(3, a);
    }
    ```

=== "Kotlin"

    ```kotlin title="max_product_cutting.kt"
    /* Max product cutting: Greedy algorithm */
    fun maxProductCutting(n: Int): Int {
        // When n <= 3, must cut out a 1
        if (n <= 3) {
            return 1 * (n - 1)
        }
        // Greedily cut out 3, a is the number of 3s, b is the remainder
        val a = n / 3
        val b = n % 3
        if (b == 1) {
            // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
            return 3.0.pow((a - 1)).toInt() * 2 * 2
        }
        if (b == 2) {
            // When the remainder is 2, do nothing
            return 3.0.pow(a).toInt() * 2 * 2
        }
        // When the remainder is 0, do nothing
        return 3.0.pow(a).toInt()
    }
    ```

=== "Ruby"

    ```ruby title="max_product_cutting.rb"
    ### Maximum cutting product: greedy ###
    def max_product_cutting(n)
      # When n <= 3, must cut out a 1
      return 1 * (n - 1) if n <= 3
      # Greedily cut out 3, a is the number of 3s, b is the remainder
      a, b = n / 3, n % 3
      # When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
      return (3.pow(a - 1) * 2 * 2).to_i if b == 1
      # When the remainder is 2, do nothing
      return (3.pow(a) * 2).to_i if b == 2
      # When the remainder is 0, do nothing
      3.pow(a).to_i
    end
    ```

![Calculation method for max product cutting](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.png){ class="animation-figure" }

<p align="center"> Figure 15-16 &nbsp; Calculation method for max product cutting </p>

**The time complexity depends on the implementation of the exponentiation operation in the programming language**. Taking Python as an example, there are three commonly used power calculation functions.

- Both the operator `**` and the function `pow()` have time complexity $O(\log⁡ a)$.
- The function `math.pow()` internally calls the C library's `pow()` function, which performs floating-point exponentiation, with time complexity $O(1)$.

Variables $a$ and $b$ use a constant amount of extra space, **therefore the space complexity is $O(1)$**.

### 3. &nbsp; Correctness Proof

Using proof by contradiction, only analyzing the case where $n \geq 4$.

1. **All factors $\leq 3$**: Suppose the optimal splitting scheme includes a factor $x \geq 4$, then it can definitely continue to be split into $2(x-2)$ to obtain a larger (or equal) product. This contradicts the assumption.
2. **The splitting scheme does not contain $1$**: Suppose the optimal splitting scheme includes a factor of $1$, then it can definitely be merged into another factor to obtain a larger product. This contradicts the assumption.
3. **The splitting scheme contains at most two $2$s**: Suppose the optimal splitting scheme includes three $2$s, then they can definitely be replaced by two $3$s for a larger product. This contradicts the assumption.
