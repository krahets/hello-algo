---
comments: true
---

# 15.4 &nbsp; Maximum product cutting problem

!!! question

    Given a positive integer $n$, split it into a sum of at least two positive integers. What is the largest possible product of those integers? The problem is illustrated in Figure 15-13.

![Definition of the maximum product cutting problem](max_product_cutting_problem.assets/max_product_cutting_definition.png){ class="animation-figure" }

<p align="center"> Figure 15-13 &nbsp; Definition of the maximum product cutting problem </p>

Suppose we split $n$ into $m$ integers that will be factors in the product. Denote the $i$-th factor by $n_i$, so that

$$
n = \sum_{i=1}^{m}n_i
$$

Our goal is to maximize the product of all these integer factors:

$$
\max(\prod_{i=1}^{m}n_i)
$$

We need to determine how many parts $m$ to create and what each $n_i$ should be.

### 1. &nbsp; Choosing a greedy strategy

The product of two integers is often greater than their sum. Suppose we split off a factor of $2$ from $n$, giving the product $2(n-2)$. Comparing this product with $n$ gives:

$$
\begin{aligned}
2(n-2) & \geq n \newline
2n - n - 4 & \geq 0 \newline
n & \geq 4
\end{aligned}
$$

As shown in Figure 15-14, when $n \geq 4$, splitting off a $2$ increases the product. **This suggests that every integer greater than or equal to $4$ should be split further**.

**Greedy strategy 1**: If a factor $\geq 4$ appears in a split, divide it further. The final split should contain only the factors $1$, $2$, and $3$.

![Splitting increases the product](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.png){ class="animation-figure" }

<p align="center"> Figure 15-14 &nbsp; Splitting increases the product </p>

Next, consider which factor is best. Of $1$, $2$, and $3$, clearly $1$ is the worst: $1 \times (n-1) < n$ always holds, so splitting off a $1$ reduces the product.

As shown in Figure 15-15, when $n = 6$, we have $3 \times 3 > 2 \times 2 \times 2$. **This means that splitting into factors of $3$ is better than splitting into factors of $2$**.

**Greedy strategy 2**: A split should contain at most two factors of $2$, because three $2$s can always be replaced with two $3$s to obtain a larger product.

![Optimal factors](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.png){ class="animation-figure" }

<p align="center"> Figure 15-15 &nbsp; Optimal factors </p>

These observations lead to the following greedy strategy.

1. Starting with $n$, keep splitting off factors of $3$ until the remainder is $0$, $1$, or $2$.
2. If the remainder is $0$, then $n$ is a multiple of $3$, and no further action is needed.
3. If the remainder is $2$, keep it without splitting it further.
4. If the remainder is $1$, replace the last $3$ and the remaining $1$ with two $2$s, since $2 \times 2 > 1 \times 3$.

### 2. &nbsp; Code implementation

As shown in Figure 15-16, we do not need a loop to split the integer. Floor division gives the number of $3$s, denoted by $a$, and the modulo operation gives the remainder $b$. Thus:

$$
n = 3 a + b
$$

For the boundary cases $n \leq 3$, we must split off a $1$, giving a product of $1 \times (n - 1)$.

=== "Python"

    ```python title="max_product_cutting.py"
    def max_product_cutting(n: int) -> int:
        """Maximum product after splitting: greedy algorithm"""
        # When n <= 3, one part must be 1
        if n <= 3:
            return 1 * (n - 1)
        # Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        a, b = n // 3, n % 3
        if b == 1:
            # When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return int(math.pow(3, a - 1)) * 2 * 2
        if b == 2:
            # When the remainder is 2, no adjustment is needed
            return int(math.pow(3, a)) * 2
        # When the remainder is 0, no adjustment is needed
        return int(math.pow(3, a))
    ```

=== "C++"

    ```cpp title="max_product_cutting.cpp"
    /* Maximum product after splitting: greedy algorithm */
    int maxProductCutting(int n) {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return (int)pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, no adjustment is needed
            return (int)pow(3, a) * 2;
        }
        // When the remainder is 0, no adjustment is needed
        return (int)pow(3, a);
    }
    ```

=== "Java"

    ```java title="max_product_cutting.java"
    /* Maximum product after splitting: greedy algorithm */
    int maxProductCutting(int n) {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, no adjustment is needed
            return (int) Math.pow(3, a) * 2;
        }
        // When the remainder is 0, no adjustment is needed
        return (int) Math.pow(3, a);
    }
    ```

=== "C#"

    ```csharp title="max_product_cutting.cs"
    /* Maximum product after splitting: greedy algorithm */
    int MaxProductCutting(int n) {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, no adjustment is needed
            return (int)Math.Pow(3, a) * 2;
        }
        // When the remainder is 0, no adjustment is needed
        return (int)Math.Pow(3, a);
    }
    ```

=== "Go"

    ```go title="max_product_cutting.go"
    /* Maximum product after splitting: greedy algorithm */
    func maxProductCutting(n int) int {
        // When n <= 3, one part must be 1
        if n <= 3 {
            return 1 * (n - 1)
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        a := n / 3
        b := n % 3
        if b == 1 {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return int(math.Pow(3, float64(a-1))) * 2 * 2
        }
        if b == 2 {
            // When the remainder is 2, no adjustment is needed
            return int(math.Pow(3, float64(a))) * 2
        }
        // When the remainder is 0, no adjustment is needed
        return int(math.Pow(3, float64(a)))
    }
    ```

=== "Swift"

    ```swift title="max_product_cutting.swift"
    /* Maximum product after splitting: greedy algorithm */
    func maxProductCutting(n: Int) -> Int {
        // When n <= 3, one part must be 1
        if n <= 3 {
            return 1 * (n - 1)
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        let a = n / 3
        let b = n % 3
        if b == 1 {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return pow(3, a - 1) * 2 * 2
        }
        if b == 2 {
            // When the remainder is 2, no adjustment is needed
            return pow(3, a) * 2
        }
        // When the remainder is 0, no adjustment is needed
        return pow(3, a)
    }
    ```

=== "JS"

    ```javascript title="max_product_cutting.js"
    /* Maximum product after splitting: greedy algorithm */
    function maxProductCutting(n) {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        let a = Math.floor(n / 3);
        let b = n % 3;
        if (b === 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // When the remainder is 2, no adjustment is needed
            return Math.pow(3, a) * 2;
        }
        // When the remainder is 0, no adjustment is needed
        return Math.pow(3, a);
    }
    ```

=== "TS"

    ```typescript title="max_product_cutting.ts"
    /* Maximum product after splitting: greedy algorithm */
    function maxProductCutting(n: number): number {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        let a: number = Math.floor(n / 3);
        let b: number = n % 3;
        if (b === 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // When the remainder is 2, no adjustment is needed
            return Math.pow(3, a) * 2;
        }
        // When the remainder is 0, no adjustment is needed
        return Math.pow(3, a);
    }
    ```

=== "Dart"

    ```dart title="max_product_cutting.dart"
    /* Maximum product after splitting: greedy algorithm */
    int maxProductCutting(int n) {
      // When n <= 3, one part must be 1
      if (n <= 3) {
        return 1 * (n - 1);
      }
      // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
      int a = n ~/ 3;
      int b = n % 3;
      if (b == 1) {
        // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
        return (pow(3, a - 1) * 2 * 2).toInt();
      }
      if (b == 2) {
        // When the remainder is 2, no adjustment is needed
        return (pow(3, a) * 2).toInt();
      }
      // When the remainder is 0, no adjustment is needed
      return pow(3, a).toInt();
    }
    ```

=== "Rust"

    ```rust title="max_product_cutting.rs"
    /* Maximum product after splitting: greedy algorithm */
    fn max_product_cutting(n: i32) -> i32 {
        // When n <= 3, one part must be 1
        if n <= 3 {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        let a = n / 3;
        let b = n % 3;
        if b == 1 {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            3_i32.pow(a as u32 - 1) * 2 * 2
        } else if b == 2 {
            // When the remainder is 2, no adjustment is needed
            3_i32.pow(a as u32) * 2
        } else {
            // When the remainder is 0, no adjustment is needed
            3_i32.pow(a as u32)
        }
    }
    ```

=== "C"

    ```c title="max_product_cutting.c"
    /* Maximum product after splitting: greedy algorithm */
    int maxProductCutting(int n) {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, no adjustment is needed
            return pow(3, a) * 2;
        }
        // When the remainder is 0, no adjustment is needed
        return pow(3, a);
    }
    ```

=== "Kotlin"

    ```kotlin title="max_product_cutting.kt"
    /* Maximum product after splitting: greedy algorithm */
    fun maxProductCutting(n: Int): Int {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1)
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        val a = n / 3
        val b = n % 3
        if (b == 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return 3.0.pow((a - 1)).toInt() * 2 * 2
        }
        if (b == 2) {
            // When the remainder is 2, no adjustment is needed
            return 3.0.pow(a).toInt() * 2 * 2
        }
        // When the remainder is 0, no adjustment is needed
        return 3.0.pow(a).toInt()
    }
    ```

=== "Ruby"

    ```ruby title="max_product_cutting.rb"
    ### Maximum product after splitting: greedy algorithm ###
    def max_product_cutting(n)
      # When n <= 3, one part must be 1
      return 1 * (n - 1) if n <= 3
      # Greedily split off parts of size 3; a is the number of 3s and b is the remainder
      a, b = n / 3, n % 3
      # When the remainder is 1, replace one pair 1 * 3 with 2 * 2
      return (3.pow(a - 1) * 2 * 2).to_i if b == 1
      # When the remainder is 2, no adjustment is needed
      return (3.pow(a) * 2).to_i if b == 2
      # When the remainder is 0, no adjustment is needed
      3.pow(a).to_i
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Maximum%20product%20after%20splitting%3A%20greedy%20algorithm%22%22%22%0A%20%20%20%20%23%20When%20n%20%3C%3D%203,%20one%20part%20must%20be%201%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20%2A%20%28n%20-%201%29%0A%20%20%20%20%23%20Greedily%20split%20off%20parts%20of%20size%203%3B%20a%20is%20the%20number%20of%203s%20and%20b%20is%20the%20remainder%0A%20%20%20%20a,%20b%20%3D%20n%20//%203,%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20When%20the%20remainder%20is%201,%20replace%20one%20pair%201%20%2A%203%20with%202%20%2A%202%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%20-%201%29%29%20%2A%202%20%2A%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20When%20the%20remainder%20is%202,%20no%20adjustment%20is%20needed%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%29%29%20%2A%202%0A%20%20%20%20%23%20When%20the%20remainder%20is%200,%20no%20adjustment%20is%20needed%0A%20%20%20%20return%20int%28math.pow%283,%20a%29%29%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20Greedy%20algorithm%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22Maximum%20product%20after%20splitting%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Maximum%20product%20after%20splitting%3A%20greedy%20algorithm%22%22%22%0A%20%20%20%20%23%20When%20n%20%3C%3D%203,%20one%20part%20must%20be%201%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20%2A%20%28n%20-%201%29%0A%20%20%20%20%23%20Greedily%20split%20off%20parts%20of%20size%203%3B%20a%20is%20the%20number%20of%203s%20and%20b%20is%20the%20remainder%0A%20%20%20%20a,%20b%20%3D%20n%20//%203,%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20When%20the%20remainder%20is%201,%20replace%20one%20pair%201%20%2A%203%20with%202%20%2A%202%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%20-%201%29%29%20%2A%202%20%2A%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20When%20the%20remainder%20is%202,%20no%20adjustment%20is%20needed%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%29%29%20%2A%202%0A%20%20%20%20%23%20When%20the%20remainder%20is%200,%20no%20adjustment%20is%20needed%0A%20%20%20%20return%20int%28math.pow%283,%20a%29%29%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20Greedy%20algorithm%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22Maximum%20product%20after%20splitting%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

![Calculating the maximum product](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.png){ class="animation-figure" }

<p align="center"> Figure 15-16 &nbsp; Calculating the maximum product </p>

**The time complexity depends on how the programming language implements exponentiation**. Python, for example, offers three common ways to compute powers.

- The `**` operator and the `pow()` function both have a time complexity of $O(\log⁡ a)$.
- The `math.pow()` function calls the C library's `pow()` function internally, performing floating-point exponentiation in $O(1)$ time.

The variables $a$ and $b$ use constant extra space, **so the space complexity is $O(1)$**.

### 3. &nbsp; Proof of correctness

We use proof by contradiction, considering only $n \geq 4$.

1. **All factors are $\leq 3$**: Suppose an optimal split contains a factor $x$ that is $\geq 4$. We can split it further to obtain $2(x-2)$, giving a greater (or equal) product. This contradicts the assumption.
2. **The split contains no $1$**: Suppose an optimal split contains a factor of $1$. We can merge it into another factor to obtain a larger product, contradicting the assumption.
3. **The split contains at most two $2$s**: Suppose an optimal split contains three $2$s. Replacing them with two $3$s gives a larger product, contradicting the assumption.
