# Tower of Hanoi Problem

In both merge sort and binary tree construction, we break the original problem into two subproblems, each half the size of the original problem. However, for the Tower of Hanoi, we adopt a different decomposition strategy.

!!! question

    We are given three pillars, denoted as `A`, `B`, and `C`. Initially, pillar `A` has $n$ discs, arranged from top to bottom in ascending size. Our task is to move these $n$ discs to pillar `C`, maintaining their original order (as shown in the figure below). The following rules apply during the movement:
    
    1. A disc can be removed only from the top of a pillar and must be placed on the top of another pillar.
    2. Only one disc can be moved at a time.
    3. A smaller disc must always be on top of a larger disc.

![Example of the Tower of Hanoi](hanota_problem.assets/hanota_example.png)

**We denote the Tower of Hanoi problem of size $i$ as $f(i)$**. For example, $f(3)$ represents moving $3$ discs from pillar `A` to pillar `C`.

### Consider the base cases

As shown in the figure below, for the problem $f(1)$—which has only one disc—we can directly move it from `A` to `C`.

=== "<1>"
    ![Solution for a problem of size 1](hanota_problem.assets/hanota_f1_step1.png)

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png)

For $f(2)$—which has two discs—**we rely on pillar `B` to help keep the smaller disc above the larger disc**, as illustrated in the following figure:

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

The process of solving $f(2)$ can be summarized as: **moving two discs from `A` to `C` with the help of `B`**. Here, `C` is called the target pillar, and `B` is called the buffer pillar.

### Decomposition of subproblems

For the problem $f(3)$—that is, when there are three discs—the situation becomes slightly more complicated.

Since we already know the solutions to $f(1)$ and $f(2)$, we can adopt a divide-and-conquer perspective and **treat the top two discs on `A` as a single unit**, performing the steps shown in the figure below. This allows the three discs to be successfully moved from `A` to `C`.

1. Let `B` be the target pillar and `C` the buffer pillar, then move the two discs from `A` to `B`.
2. Move the remaining disc from `A` directly to `C`.
3. Let `C` be the target pillar and `A` the buffer pillar, then move the two discs from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 3](hanota_problem.assets/hanota_f3_step1.png)

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png)

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png)

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png)

Essentially, **we decompose $f(3)$ into two $f(2)$ subproblems and one $f(1)$ subproblem**. By solving these three subproblems in sequence, the original problem is solved, indicating that the subproblems are independent and their solutions can be merged.

From this, we can summarize the divide-and-conquer strategy for the Tower of Hanoi, illustrated in the figure below. We divide the original problem $f(n)$ into two subproblems $f(n-1)$ and one subproblem $f(1)$, and solve these three subproblems in the following order:

1. Move $n-1$ discs from `A` to `B`, using `C` as a buffer. 
2. Move the remaining disc directly from `A` to `C`.
3. Move $n-1$ discs from `B` to `C`, using `A` as a buffer. 

For each $f(n-1)$ subproblem, **we can apply the same recursive partition** until we reach the smallest subproblem $f(1)$. Because $f(1)$ is already known to require just a single move, it is trivial to solve.

![Divide-and-conquer strategy for solving the Tower of Hanoi](hanota_problem.assets/hanota_divide_and_conquer.png)

### Code implementation

In the code, we define a recursive function `dfs(i, src, buf, tar)` which moves the top $i$ discs from pillar `src` to pillar `tar`, using pillar `buf` as a buffer:

```src
[file]{hanota}-[class]{}-[func]{solve_hanota}
```

As shown in the figure below, the Tower of Hanoi problem can be visualized as a recursive tree of height $n$. Each node represents a subproblem, corresponding to a call to `dfs()`, **Hence, the time complexity is $O(2^n)$, and the space complexity is $O(n)$.**

![Recursive tree of the Tower of Hanoi](hanota_problem.assets/hanota_recursive_tree.png)

!!! quote

    The Tower of Hanoi originates from an ancient legend. In a temple in ancient India, monks had three tall diamond pillars and $64$ differently sized golden discs. They believed that when the last disc was correctly placed, the world would end.

    However, even if the monks moved one disc every second, it would take about $2^{64} \approx 1.84×10^{19}$ —approximately 585 billion years—far exceeding current estimates of the age of the universe. Thus, if the legend is true, we probably do not need to worry about the world ending.
