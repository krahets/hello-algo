# Maximum product after cutting

!!! question

    Given a positive integer $n$, write it as a sum of at least two positive integers. What is the largest possible product of those integers? The figure below illustrates the problem.

![Defining the maximum product after cutting](max_product_cutting_problem.assets/max_product_cutting_definition.svg)

Suppose we split $n$ into $m$ integer pieces, with piece $i$ denoted by $n_i$. Then

$$
n = \sum_{i=1}^{m}n_i
$$

Our goal is to maximize the product of all the pieces:

$$
\max(\prod_{i=1}^{m}n_i)
$$

How many pieces should we make ($m$), and how large should each piece $n_i$ be?

### Choosing a greedy strategy

The product of two integers is often greater than their sum. If we cut a piece of size $2$ from $n$, the two pieces have product $2(n-2)$. Let's compare this product with $n$:

$$
\begin{aligned}
2(n-2) & \geq n \newline
2n - n - 4 & \geq 0 \newline
n & \geq 4
\end{aligned}
$$

As the figure below shows, when $n \geq 4$, cutting off a piece of size $2$ increases the product. **This suggests that every integer greater than or equal to $4$ should be split**.

**First greedy rule**. If a split contains a factor $\geq 4$, split it again. The final split should contain only factors of $1$, $2$, and $3$.

![Cutting increases the product](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.svg)

Which factor is best? Of $1$, $2$, and $3$, the worst is $1$, because $1 \times (n-1) < n$ always holds. Cutting off a piece of size $1$ actually reduces the product.

As shown below, when $n = 6$, we have $3 \times 3 > 2 \times 2 \times 2$. **This means pieces of size $3$ are preferable to pieces of size $2$**.

**Second greedy rule**. A split should contain at most two factors of $2$. Three factors of $2$ can always be replaced by two factors of $3$ to obtain a larger product.

![Optimal factors for the split](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.svg)

These observations give us the following greedy strategy.

1. Given the integer $n$, repeatedly cut off pieces of size $3$ until the remainder is $0$, $1$, or $2$.
2. If the remainder is $0$, then $n$ is a multiple of $3$, so no adjustment is needed.
3. If the remainder is $2$, keep it as a piece without splitting it further.
4. If the remainder is $1$, then because $2 \times 2 > 1 \times 3$, replace the last $3$ and the leftover $1$ with two pieces of size $2$.

### Implementation

As the figure below shows, we can skip the loop that cuts individual pieces. Floor division gives the number $a$ of pieces of size $3$, and the remainder operation gives the leftover amount $b$. Thus:

$$
n = 3 a + b
$$

For the boundary cases $n \leq 3$, we must cut off a piece of size $1$, giving a product of $1 \times (n - 1)$.

```src
[file]{max_product_cutting}-[class]{}-[func]{max_product_cutting}
```

![Calculating the maximum product after cutting](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.svg)

**The time complexity depends on how the programming language implements exponentiation**. Python, for example, offers three common ways to compute a power.

- The `**` operator and the `pow()` function both take $O(\log⁡ a)$ time.
- The `math.pow()` function calls the C library's `pow()` function, which performs floating-point exponentiation in $O(1)$ time.

The variables $a$ and $b$ use a constant amount of extra space, **so the space complexity is $O(1)$**.

### Proof of correctness

We use proof by contradiction and consider only $n \geq 4$.

1. **All factors are $\leq 3$**. Suppose an optimal split contains a factor $x$ that is $\geq 4$. We can split it again to obtain the product $2(x-2)$, giving a larger or equal product. This contradicts the assumption.
2. **The split contains no factor of $1$**. Suppose an optimal split contains a factor of $1$. We can merge it into another piece to obtain a larger product, contradicting optimality.
3. **The split contains at most two factors of $2$**. Suppose an optimal split contains three factors of $2$. Replacing them with two factors of $3$ gives a larger product, contradicting optimality.
