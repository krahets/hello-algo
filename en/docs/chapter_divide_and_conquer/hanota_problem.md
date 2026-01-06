# Hanota Problem

In merge sort and building binary trees, we decompose the original problem into two subproblems, each half the size of the original problem. However, for the hanota problem, we adopt a different decomposition strategy.

!!! question

    Given three pillars, denoted as `A`, `B`, and `C`. Initially, pillar `A` has $n$ discs stacked on it, arranged from top to bottom in ascending order of size. Our task is to move these $n$ discs to pillar `C` while maintaining their original order (as shown in the figure below). The following rules must be followed when moving the discs.

    1. A disc can only be taken from the top of one pillar and placed on top of another pillar.
    2. Only one disc can be moved at a time.
    3. A smaller disc must always be on top of a larger disc.

![Example of the hanota problem](hanota_problem.assets/hanota_example.png)

**We denote the hanota problem of size $i$ as $f(i)$**. For example, $f(3)$ represents moving $3$ discs from `A` to `C`.

### Considering the Base Cases

As shown in the figure below, for problem $f(1)$, when there is only one disc, we can move it directly from `A` to `C`.

=== "<1>"
    ![Solution for a problem of size 1](hanota_problem.assets/hanota_f1_step1.png)

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png)

As shown in the figure below, for problem $f(2)$, when there are two discs, **since we must always keep the smaller disc on top of the larger disc, we need to use `B` to assist in the move**.

1. First, move the smaller disc from `A` to `B`.
2. Then move the larger disc from `A` to `C`.
3. Finally, move the smaller disc from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 2](hanota_problem.assets/hanota_f2_step1.png)

=== "<2>"
    ![hanota_f2_step2](hanota_problem.assets/hanota_f2_step2.png)

=== "<3>"
    ![hanota_f2_step3](hanota_problem.assets/hanota_f2_step3.png)

=== "<4>"
    ![hanota_f2_step4](hanota_problem.assets/hanota_f2_step4.png)

The process of solving problem $f(2)$ can be summarized as: **moving two discs from `A` to `C` with the help of `B`**. Here, `C` is called the target pillar, and `B` is called the buffer pillar.

### Subproblem Decomposition

For problem $f(3)$, when there are three discs, the situation becomes slightly more complex.

Since we already know the solutions to $f(1)$ and $f(2)$, we can think from a divide and conquer perspective, **treating the top two discs on `A` as a whole**, and execute the steps shown in the figure below. This successfully moves the three discs from `A` to `C`.

1. Let `B` be the target pillar and `C` be the buffer pillar, and move two discs from `A` to `B`.
2. Move the remaining disc from `A` directly to `C`.
3. Let `C` be the target pillar and `A` be the buffer pillar, and move two discs from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 3](hanota_problem.assets/hanota_f3_step1.png)

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png)

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png)

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png)

Essentially, **we divide problem $f(3)$ into two subproblems $f(2)$ and one subproblem $f(1)$**. By solving these three subproblems in order, the original problem is solved. This shows that the subproblems are independent and their solutions can be merged.

From this, we can summarize the divide and conquer strategy for solving the hanota problem shown in the figure below: divide the original problem $f(n)$ into two subproblems $f(n-1)$ and one subproblem $f(1)$, and solve these three subproblems in the following order.

1. Move $n-1$ discs from `A` to `B` with the help of `C`.
2. Move the remaining $1$ disc directly from `A` to `C`.
3. Move $n-1$ discs from `B` to `C` with the help of `A`.

For these two subproblems $f(n-1)$, **we can recursively divide them in the same way** until reaching the smallest subproblem $f(1)$. The solution to $f(1)$ is known and requires only one move operation.

![Divide and conquer strategy for solving the hanota problem](hanota_problem.assets/hanota_divide_and_conquer.png)

### Code Implementation

In the code, we declare a recursive function `dfs(i, src, buf, tar)`, whose purpose is to move the top $i$ discs from pillar `src` to target pillar `tar` with the help of buffer pillar `buf`:

```src
[file]{hanota}-[class]{}-[func]{solve_hanota}
```

As shown in the figure below, the hanota problem forms a recursion tree of height $n$, where each node represents a subproblem corresponding to an invocation of the `dfs()` function, **therefore the time complexity is $O(2^n)$ and the space complexity is $O(n)$**.

![Recursion tree of the hanota problem](hanota_problem.assets/hanota_recursive_tree.png)

!!! quote

    The hanota problem originates from an ancient legend. In a temple in ancient India, monks had three tall diamond pillars and $64$ golden discs of different sizes. The monks continuously moved the discs, believing that when the last disc was correctly placed, the world would come to an end.

    However, even if the monks moved one disc per second, it would take approximately $2^{64} \approx 1.84×10^{19}$ seconds, which is about $5850$ billion years, far exceeding current estimates of the age of the universe. Therefore, if this legend is true, we should not need to worry about the end of the world.
