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
        """最大切分乘积：贪心"""
        # 当 n <= 3 时，必须切分出一个 1
        if n <= 3:
            return 1 * (n - 1)
        # 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        a, b = n // 3, n % 3
        if b == 1:
            # 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return int(math.pow(3, a - 1)) * 2 * 2
        if b == 2:
            # 当余数为 2 时，不做处理
            return int(math.pow(3, a)) * 2
        # 当余数为 0 时，不做处理
        return int(math.pow(3, a))
    ```

=== "C++"

    ```cpp title="max_product_cutting.cpp"
    /* 最大切分乘积：贪心 */
    int maxProductCutting(int n) {
        // 当 n <= 3 时，必须切分出一个 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return (int)pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 当余数为 2 时，不做处理
            return (int)pow(3, a) * 2;
        }
        // 当余数为 0 时，不做处理
        return (int)pow(3, a);
    }
    ```

=== "Java"

    ```java title="max_product_cutting.java"
    /* 最大切分乘积：贪心 */
    int maxProductCutting(int n) {
        // 当 n <= 3 时，必须切分出一个 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 当余数为 2 时，不做处理
            return (int) Math.pow(3, a) * 2;
        }
        // 当余数为 0 时，不做处理
        return (int) Math.pow(3, a);
    }
    ```

=== "C#"

    ```csharp title="max_product_cutting.cs"
    /* 最大切分乘积：贪心 */
    int MaxProductCutting(int n) {
        // 当 n <= 3 时，必须切分出一个 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 当余数为 2 时，不做处理
            return (int)Math.Pow(3, a) * 2;
        }
        // 当余数为 0 时，不做处理
        return (int)Math.Pow(3, a);
    }
    ```

=== "Go"

    ```go title="max_product_cutting.go"
    /* 最大切分乘积：贪心 */
    func maxProductCutting(n int) int {
        // 当 n <= 3 时，必须切分出一个 1
        if n <= 3 {
            return 1 * (n - 1)
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        a := n / 3
        b := n % 3
        if b == 1 {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return int(math.Pow(3, float64(a-1))) * 2 * 2
        }
        if b == 2 {
            // 当余数为 2 时，不做处理
            return int(math.Pow(3, float64(a))) * 2
        }
        // 当余数为 0 时，不做处理
        return int(math.Pow(3, float64(a)))
    }
    ```

=== "Swift"

    ```swift title="max_product_cutting.swift"
    /* 最大切分乘积：贪心 */
    func maxProductCutting(n: Int) -> Int {
        // 当 n <= 3 时，必须切分出一个 1
        if n <= 3 {
            return 1 * (n - 1)
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        let a = n / 3
        let b = n % 3
        if b == 1 {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return pow(3, a - 1) * 2 * 2
        }
        if b == 2 {
            // 当余数为 2 时，不做处理
            return pow(3, a) * 2
        }
        // 当余数为 0 时，不做处理
        return pow(3, a)
    }
    ```

=== "JS"

    ```javascript title="max_product_cutting.js"
    /* 最大切分乘积：贪心 */
    function maxProductCutting(n) {
        // 当 n <= 3 时，必须切分出一个 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        let a = Math.floor(n / 3);
        let b = n % 3;
        if (b === 1) {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // 当余数为 2 时，不做处理
            return Math.pow(3, a) * 2;
        }
        // 当余数为 0 时，不做处理
        return Math.pow(3, a);
    }
    ```

=== "TS"

    ```typescript title="max_product_cutting.ts"
    /* 最大切分乘积：贪心 */
    function maxProductCutting(n: number): number {
        // 当 n <= 3 时，必须切分出一个 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        let a: number = Math.floor(n / 3);
        let b: number = n % 3;
        if (b === 1) {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // 当余数为 2 时，不做处理
            return Math.pow(3, a) * 2;
        }
        // 当余数为 0 时，不做处理
        return Math.pow(3, a);
    }
    ```

=== "Dart"

    ```dart title="max_product_cutting.dart"
    /* 最大切分乘积：贪心 */
    int maxProductCutting(int n) {
      // 当 n <= 3 时，必须切分出一个 1
      if (n <= 3) {
        return 1 * (n - 1);
      }
      // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
      int a = n ~/ 3;
      int b = n % 3;
      if (b == 1) {
        // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
        return (pow(3, a - 1) * 2 * 2).toInt();
      }
      if (b == 2) {
        // 当余数为 2 时，不做处理
        return (pow(3, a) * 2).toInt();
      }
      // 当余数为 0 时，不做处理
      return pow(3, a).toInt();
    }
    ```

=== "Rust"

    ```rust title="max_product_cutting.rs"
    /* 最大切分乘积：贪心 */
    fn max_product_cutting(n: i32) -> i32 {
        // 当 n <= 3 时，必须切分出一个 1
        if n <= 3 {
            return 1 * (n - 1);
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        let a = n / 3;
        let b = n % 3;
        if b == 1 {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            3_i32.pow(a as u32 - 1) * 2 * 2
        } else if b == 2 {
            // 当余数为 2 时，不做处理
            3_i32.pow(a as u32) * 2
        } else {
            // 当余数为 0 时，不做处理
            3_i32.pow(a as u32)
        }
    }
    ```

=== "C"

    ```c title="max_product_cutting.c"
    /* 最大切分乘积：贪心 */
    int maxProductCutting(int n) {
        // 当 n <= 3 时，必须切分出一个 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 当余数为 2 时，不做处理
            return pow(3, a) * 2;
        }
        // 当余数为 0 时，不做处理
        return pow(3, a);
    }
    ```

=== "Kotlin"

    ```kotlin title="max_product_cutting.kt"
    /* 最大切分乘积：贪心 */
    fun maxProductCutting(n: Int): Int {
        // 当 n <= 3 时，必须切分出一个 1
        if (n <= 3) {
            return 1 * (n - 1)
        }
        // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
        val a = n / 3
        val b = n % 3
        if (b == 1) {
            // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
            return 3.0.pow((a - 1)).toInt() * 2 * 2
        }
        if (b == 2) {
            // 当余数为 2 时，不做处理
            return 3.0.pow(a).toInt() * 2 * 2
        }
        // 当余数为 0 时，不做处理
        return 3.0.pow(a).toInt()
    }
    ```

=== "Ruby"

    ```ruby title="max_product_cutting.rb"
    [class]{}-[func]{max_product_cutting}
    ```

=== "Zig"

    ```zig title="max_product_cutting.zig"
    [class]{}-[func]{maxProductCutting}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%88%87%E5%88%86%E4%B9%98%E7%A7%AF%EF%BC%9A%E8%B4%AA%E5%BF%83%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%20n%20%3C%3D%203%20%E6%97%B6%EF%BC%8C%E5%BF%85%E9%A1%BB%E5%88%87%E5%88%86%E5%87%BA%E4%B8%80%E4%B8%AA%201%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20*%20%28n%20-%201%29%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E5%9C%B0%E5%88%87%E5%88%86%E5%87%BA%203%20%EF%BC%8Ca%20%E4%B8%BA%203%20%E7%9A%84%E4%B8%AA%E6%95%B0%EF%BC%8Cb%20%E4%B8%BA%E4%BD%99%E6%95%B0%0A%20%20%20%20a,%20b%20%3D%20n%20//%203,%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BD%93%E4%BD%99%E6%95%B0%E4%B8%BA%201%20%E6%97%B6%EF%BC%8C%E5%B0%86%E4%B8%80%E5%AF%B9%201%20*%203%20%E8%BD%AC%E5%8C%96%E4%B8%BA%202%20*%202%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%20-%201%29%29%20*%202%20*%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BD%93%E4%BD%99%E6%95%B0%E4%B8%BA%202%20%E6%97%B6%EF%BC%8C%E4%B8%8D%E5%81%9A%E5%A4%84%E7%90%86%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%29%29%20*%202%0A%20%20%20%20%23%20%E5%BD%93%E4%BD%99%E6%95%B0%E4%B8%BA%200%20%E6%97%B6%EF%BC%8C%E4%B8%8D%E5%81%9A%E5%A4%84%E7%90%86%0A%20%20%20%20return%20int%28math.pow%283,%20a%29%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%88%87%E5%88%86%E4%B9%98%E7%A7%AF%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%88%87%E5%88%86%E4%B9%98%E7%A7%AF%EF%BC%9A%E8%B4%AA%E5%BF%83%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%20n%20%3C%3D%203%20%E6%97%B6%EF%BC%8C%E5%BF%85%E9%A1%BB%E5%88%87%E5%88%86%E5%87%BA%E4%B8%80%E4%B8%AA%201%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20*%20%28n%20-%201%29%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E5%9C%B0%E5%88%87%E5%88%86%E5%87%BA%203%20%EF%BC%8Ca%20%E4%B8%BA%203%20%E7%9A%84%E4%B8%AA%E6%95%B0%EF%BC%8Cb%20%E4%B8%BA%E4%BD%99%E6%95%B0%0A%20%20%20%20a,%20b%20%3D%20n%20//%203,%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BD%93%E4%BD%99%E6%95%B0%E4%B8%BA%201%20%E6%97%B6%EF%BC%8C%E5%B0%86%E4%B8%80%E5%AF%B9%201%20*%203%20%E8%BD%AC%E5%8C%96%E4%B8%BA%202%20*%202%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%20-%201%29%29%20*%202%20*%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BD%93%E4%BD%99%E6%95%B0%E4%B8%BA%202%20%E6%97%B6%EF%BC%8C%E4%B8%8D%E5%81%9A%E5%A4%84%E7%90%86%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%29%29%20*%202%0A%20%20%20%20%23%20%E5%BD%93%E4%BD%99%E6%95%B0%E4%B8%BA%200%20%E6%97%B6%EF%BC%8C%E4%B8%8D%E5%81%9A%E5%A4%84%E7%90%86%0A%20%20%20%20return%20int%28math.pow%283,%20a%29%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%88%87%E5%88%86%E4%B9%98%E7%A7%AF%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

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
