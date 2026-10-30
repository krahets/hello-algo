# Maximum product cutting problem

!!! question

    Given a positive integer $n$, split it into a sum of at least two positive integers. What is the largest possible product of those integers? The problem is illustrated in the figure below.

![Definition of the maximum product cutting problem](max_product_cutting_problem.assets/max_product_cutting_definition.png)

Suppose we split $n$ into $m$ integers that will be factors in the product. Denote the $i$-th factor by $n_i$, so that

$$
n = \sum_{i=1}^{m}n_i
$$

Our goal is to maximize the product of all these integer factors:

$$
\max(\prod_{i=1}^{m}n_i)
$$

We need to determine how many parts $m$ to create and what each $n_i$ should be.

### Choosing a greedy strategy

The product of two integers is often greater than their sum. Suppose we split off a factor of $2$ from $n$, giving the product $2(n-2)$. Comparing this product with $n$ gives:

$$
\begin{aligned}
2(n-2) & \geq n \newline
2n - n - 4 & \geq 0 \newline
n & \geq 4
\end{aligned}
$$

As shown in the figure below, when $n \geq 4$, splitting off a $2$ increases the product. **This suggests that every integer greater than or equal to $4$ should be split further**.

**Greedy strategy 1**: If a factor $\geq 4$ appears in a split, divide it further. The final split should contain only the factors $1$, $2$, and $3$.

![Splitting increases the product](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.png)

Next, consider which factor is best. Of $1$, $2$, and $3$, clearly $1$ is the worst: $1 \times (n-1) < n$ always holds, so splitting off a $1$ reduces the product.

As shown in the figure below, when $n = 6$, we have $3 \times 3 > 2 \times 2 \times 2$. **This means that splitting into factors of $3$ is better than splitting into factors of $2$**.

**Greedy strategy 2**: A split should contain at most two factors of $2$, because three $2$s can always be replaced with two $3$s to obtain a larger product.

![Optimal factors](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.png)

These observations lead to the following greedy strategy.

1. Starting with $n$, keep splitting off factors of $3$ until the remainder is $0$, $1$, or $2$.
2. If the remainder is $0$, then $n$ is a multiple of $3$, and no further action is needed.
3. If the remainder is $2$, keep it without splitting it further.
4. If the remainder is $1$, replace the last $3$ and the remaining $1$ with two $2$s, since $2 \times 2 > 1 \times 3$.

### Code implementation

As shown in the figure below, we do not need a loop to split the integer. Floor division gives the number of $3$s, denoted by $a$, and the modulo operation gives the remainder $b$. Thus:

$$
n = 3 a + b
$$

For the boundary cases $n \leq 3$, we must split off a $1$, giving a product of $1 \times (n - 1)$.

```src
[file]{max_product_cutting}-[class]{}-[func]{max_product_cutting}
```

![Calculating the maximum product](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.png)

**The time complexity depends on how the programming language implements exponentiation**. Python, for example, offers three common ways to compute powers.

- The `**` operator and the `pow()` function both have a time complexity of $O(\log⁡ a)$.
- The `math.pow()` function calls the C library's `pow()` function internally, performing floating-point exponentiation in $O(1)$ time.

The variables $a$ and $b$ use constant extra space, **so the space complexity is $O(1)$**.

### Proof of correctness

We use proof by contradiction, considering only $n \geq 4$.

1. **All factors are $\leq 3$**: Suppose an optimal split contains a factor $x$ that is $\geq 4$. We can split it further to obtain $2(x-2)$, giving a greater (or equal) product. This contradicts the assumption.
2. **The split contains no $1$**: Suppose an optimal split contains a factor of $1$. We can merge it into another factor to obtain a larger product, contradicting the assumption.
3. **The split contains at most two $2$s**: Suppose an optimal split contains three $2$s. Replacing them with two $3$s gives a larger product, contradicting the assumption.
