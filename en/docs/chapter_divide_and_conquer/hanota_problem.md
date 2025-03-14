---
comments: true
---

# 12.4 &nbsp; Tower of Hanoi Problem

In both merge sort and binary tree construction, we break the original problem into two subproblems, each half the size of the original problem. However, for the Tower of Hanoi, we adopt a different decomposition strategy.

!!! question

    We are given three pillars, denoted as `A`, `B`, and `C`. Initially, pillar `A` has $n$ discs, arranged from top to bottom in ascending size. Our task is to move these $n$ discs to pillar `C`, maintaining their original order (as shown in Figure 12-10). The following rules apply during the movement:
    
    1. A disc can be removed only from the top of a pillar and must be placed on the top of another pillar.
    2. Only one disc can be moved at a time.
    3. A smaller disc must always be on top of a larger disc.

![Example of the Tower of Hanoi](hanota_problem.assets/hanota_example.png){ class="animation-figure" }

<p align="center"> Figure 12-10 &nbsp; Example of the Tower of Hanoi </p>

**We denote the Tower of Hanoi problem of size $i$ as $f(i)$**. For example, $f(3)$ represents moving $3$ discs from pillar `A` to pillar `C`.

### 1. &nbsp; Consider the base cases

As shown in Figure 12-11, for the problem $f(1)$—which has only one disc—we can directly move it from `A` to `C`.

=== "<1>"
    ![Solution for a problem of size 1](hanota_problem.assets/hanota_f1_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png){ class="animation-figure" }

<p align="center"> Figure 12-11 &nbsp; Solution for a problem of size 1 </p>

For $f(2)$—which has two discs—**we rely on pillar `B` to help keep the smaller disc above the larger disc**, as illustrated in the following figure:

1. First, move the smaller disc from `A` to `B`.
2. Then move the larger disc from `A` to `C`.
3. Finally, move the smaller disc from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 2](hanota_problem.assets/hanota_f2_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f2_step2](hanota_problem.assets/hanota_f2_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f2_step3](hanota_problem.assets/hanota_f2_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f2_step4](hanota_problem.assets/hanota_f2_step4.png){ class="animation-figure" }

<p align="center"> Figure 12-12 &nbsp; Solution for a problem of size 2 </p>

The process of solving $f(2)$ can be summarized as: **moving two discs from `A` to `C` with the help of `B`**. Here, `C` is called the target pillar, and `B` is called the buffer pillar.

### 2. &nbsp; Decomposition of subproblems

For the problem $f(3)$—that is, when there are three discs—the situation becomes slightly more complicated.

Since we already know the solutions to $f(1)$ and $f(2)$, we can adopt a divide-and-conquer perspective and **treat the top two discs on `A` as a single unit**, performing the steps shown in Figure 12-13. This allows the three discs to be successfully moved from `A` to `C`.

1. Let `B` be the target pillar and `C` the buffer pillar, then move the two discs from `A` to `B`.
2. Move the remaining disc from `A` directly to `C`.
3. Let `C` be the target pillar and `A` the buffer pillar, then move the two discs from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 3](hanota_problem.assets/hanota_f3_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png){ class="animation-figure" }

<p align="center"> Figure 12-13 &nbsp; Solution for a problem of size 3 </p>

Essentially, **we decompose $f(3)$ into two $f(2)$ subproblems and one $f(1)$ subproblem**. By solving these three subproblems in sequence, the original problem is solved, indicating that the subproblems are independent and their solutions can be merged.

From this, we can summarize the divide-and-conquer strategy for the Tower of Hanoi, illustrated in Figure 12-14. We divide the original problem $f(n)$ into two subproblems $f(n-1)$ and one subproblem $f(1)$, and solve these three subproblems in the following order:

1. Move $n-1$ discs from `A` to `B`, using `C` as a buffer. 
2. Move the remaining disc directly from `A` to `C`.
3. Move $n-1$ discs from `B` to `C`, using `A` as a buffer. 

For each $f(n-1)$ subproblem, **we can apply the same recursive partition** until we reach the smallest subproblem $f(1)$. Because $f(1)$ is already known to require just a single move, it is trivial to solve.

![Divide-and-conquer strategy for solving the Tower of Hanoi](hanota_problem.assets/hanota_divide_and_conquer.png){ class="animation-figure" }

<p align="center"> Figure 12-14 &nbsp; Divide-and-conquer strategy for solving the Tower of Hanoi </p>

### 3. &nbsp; Code implementation

In the code, we define a recursive function `dfs(i, src, buf, tar)` which moves the top $i$ discs from pillar `src` to pillar `tar`, using pillar `buf` as a buffer:

=== "Python"

    ```python title="hanota.py"
    def move(src: list[int], tar: list[int]):
        """Move a disc"""
        # Take out a disc from the top of src
        pan = src.pop()
        # Place the disc on top of tar
        tar.append(pan)

    def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
        """Solve the Tower of Hanoi problem f(i)"""
        # If only one disc remains on src, move it to tar
        if i == 1:
            move(src, tar)
            return
        # Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
        dfs(i - 1, src, tar, buf)
        # Subproblem f(1): move the remaining one disc from src to tar
        move(src, tar)
        # Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
        dfs(i - 1, buf, src, tar)

    def solve_hanota(A: list[int], B: list[int], C: list[int]):
        """Solve the Tower of Hanoi problem"""
        n = len(A)
        # Move the top n discs from A with the help of B to C
        dfs(n, A, B, C)
    ```

=== "C++"

    ```cpp title="hanota.cpp"
    /* Move a disc */
    void move(vector<int> &src, vector<int> &tar) {
        // Take out a disc from the top of src
        int pan = src.back();
        src.pop_back();
        // Place the disc on top of tar
        tar.push_back(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
        // If only one disc remains on src, move it to tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining one disc from src to tar
        move(src, tar);
        // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
        int n = A.size();
        // Move the top n discs from A with the help of B to C
        dfs(n, A, B, C);
    }
    ```

=== "Java"

    ```java title="hanota.java"
    /* Move a disc */
    void move(List<Integer> src, List<Integer> tar) {
        // Take out a disc from the top of src
        Integer pan = src.remove(src.size() - 1);
        // Place the disc on top of tar
        tar.add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // If only one disc remains on src, move it to tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining one disc from src to tar
        move(src, tar);
        // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // Move the top n discs from A with the help of B to C
        dfs(n, A, B, C);
    }
    ```

=== "C#"

    ```csharp title="hanota.cs"
    [class]{hanota}-[func]{Move}

    [class]{hanota}-[func]{DFS}

    [class]{hanota}-[func]{SolveHanota}
    ```

=== "Go"

    ```go title="hanota.go"
    [class]{}-[func]{move}

    [class]{}-[func]{dfsHanota}

    [class]{}-[func]{solveHanota}
    ```

=== "Swift"

    ```swift title="hanota.swift"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solveHanota}
    ```

=== "JS"

    ```javascript title="hanota.js"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solveHanota}
    ```

=== "TS"

    ```typescript title="hanota.ts"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solveHanota}
    ```

=== "Dart"

    ```dart title="hanota.dart"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solveHanota}
    ```

=== "Rust"

    ```rust title="hanota.rs"
    [class]{}-[func]{move_pan}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solve_hanota}
    ```

=== "C"

    ```c title="hanota.c"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solveHanota}
    ```

=== "Kotlin"

    ```kotlin title="hanota.kt"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solveHanota}
    ```

=== "Ruby"

    ```ruby title="hanota.rb"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solve_hanota}
    ```

=== "Zig"

    ```zig title="hanota.zig"
    [class]{}-[func]{move}

    [class]{}-[func]{dfs}

    [class]{}-[func]{solveHanota}
    ```

As shown in Figure 12-15, the Tower of Hanoi problem can be visualized as a recursive tree of height $n$. Each node represents a subproblem, corresponding to a call to `dfs()`, **Hence, the time complexity is $O(2^n)$, and the space complexity is $O(n)$.**

![Recursive tree of the Tower of Hanoi](hanota_problem.assets/hanota_recursive_tree.png){ class="animation-figure" }

<p align="center"> Figure 12-15 &nbsp; Recursive tree of the Tower of Hanoi </p>

!!! quote

    The Tower of Hanoi originates from an ancient legend. In a temple in ancient India, monks had three tall diamond pillars and $64$ differently sized golden discs. They believed that when the last disc was correctly placed, the world would end.

    However, even if the monks moved one disc every second, it would take about $2^{64} \approx 1.84×10^{19}$ —approximately 585 billion years—far exceeding current estimates of the age of the universe. Thus, if the legend is true, we probably do not need to worry about the world ending.
