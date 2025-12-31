---
comments: true
---

# 12.4 &nbsp; Hanota Problem

In merge sort and building binary trees, we decompose the original problem into two subproblems, each half the size of the original problem. However, for the hanota problem, we adopt a different decomposition strategy.

!!! question

    Given three pillars, denoted as `A`, `B`, and `C`. Initially, pillar `A` has $n$ discs stacked on it, arranged from top to bottom in ascending order of size. Our task is to move these $n$ discs to pillar `C` while maintaining their original order (as shown in Figure 12-10). The following rules must be followed when moving the discs.

    1. A disc can only be taken from the top of one pillar and placed on top of another pillar.
    2. Only one disc can be moved at a time.
    3. A smaller disc must always be on top of a larger disc.

![Example of the hanota problem](hanota_problem.assets/hanota_example.png){ class="animation-figure" }

<p align="center"> Figure 12-10 &nbsp; Example of the hanota problem </p>

**We denote the hanota problem of size $i$ as $f(i)$**. For example, $f(3)$ represents moving $3$ discs from `A` to `C`.

### 1. &nbsp; Considering the Base Cases

As shown in Figure 12-11, for problem $f(1)$, when there is only one disc, we can move it directly from `A` to `C`.

=== "<1>"
    ![Solution for a problem of size 1](hanota_problem.assets/hanota_f1_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png){ class="animation-figure" }

<p align="center"> Figure 12-11 &nbsp; Solution for a problem of size 1 </p>

As shown in Figure 12-12, for problem $f(2)$, when there are two discs, **since we must always keep the smaller disc on top of the larger disc, we need to use `B` to assist in the move**.

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

The process of solving problem $f(2)$ can be summarized as: **moving two discs from `A` to `C` with the help of `B`**. Here, `C` is called the target pillar, and `B` is called the buffer pillar.

### 2. &nbsp; Subproblem Decomposition

For problem $f(3)$, when there are three discs, the situation becomes slightly more complex.

Since we already know the solutions to $f(1)$ and $f(2)$, we can think from a divide and conquer perspective, **treating the top two discs on `A` as a whole**, and execute the steps shown in Figure 12-13. This successfully moves the three discs from `A` to `C`.

1. Let `B` be the target pillar and `C` be the buffer pillar, and move two discs from `A` to `B`.
2. Move the remaining disc from `A` directly to `C`.
3. Let `C` be the target pillar and `A` be the buffer pillar, and move two discs from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 3](hanota_problem.assets/hanota_f3_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png){ class="animation-figure" }

<p align="center"> Figure 12-13 &nbsp; Solution for a problem of size 3 </p>

Essentially, **we divide problem $f(3)$ into two subproblems $f(2)$ and one subproblem $f(1)$**. By solving these three subproblems in order, the original problem is solved. This shows that the subproblems are independent and their solutions can be merged.

From this, we can summarize the divide and conquer strategy for solving the hanota problem shown in Figure 12-14: divide the original problem $f(n)$ into two subproblems $f(n-1)$ and one subproblem $f(1)$, and solve these three subproblems in the following order.

1. Move $n-1$ discs from `A` to `B` with the help of `C`.
2. Move the remaining $1$ disc directly from `A` to `C`.
3. Move $n-1$ discs from `B` to `C` with the help of `A`.

For these two subproblems $f(n-1)$, **we can recursively divide them in the same way** until reaching the smallest subproblem $f(1)$. The solution to $f(1)$ is known and requires only one move operation.

![Divide and conquer strategy for solving the hanota problem](hanota_problem.assets/hanota_divide_and_conquer.png){ class="animation-figure" }

<p align="center"> Figure 12-14 &nbsp; Divide and conquer strategy for solving the hanota problem </p>

### 3. &nbsp; Code Implementation

In the code, we declare a recursive function `dfs(i, src, buf, tar)`, whose purpose is to move the top $i$ discs from pillar `src` to target pillar `tar` with the help of buffer pillar `buf`:

=== "Python"

    ```python title="hanota.py"
    def move(src: list[int], tar: list[int]):
        """Move a disk"""
        # Take out a disk from the top of src
        pan = src.pop()
        # Place the disk on top of tar
        tar.append(pan)

    def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
        """Solve the Tower of Hanoi problem f(i)"""
        # If there is only one disk left in src, move it directly to tar
        if i == 1:
            move(src, tar)
            return
        # Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf)
        # Subproblem f(1): move the remaining disk from src to tar
        move(src, tar)
        # Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, src, tar)

    def solve_hanota(A: list[int], B: list[int], C: list[int]):
        """Solve the Tower of Hanoi problem"""
        n = len(A)
        # Move the top n disks from A to C using B
        dfs(n, A, B, C)
    ```

=== "C++"

    ```cpp title="hanota.cpp"
    /* Move a disk */
    void move(vector<int> &src, vector<int> &tar) {
        // Take out a disk from the top of src
        int pan = src.back();
        src.pop_back();
        // Place the disk on top of tar
        tar.push_back(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
        // If there is only one disk left in src, move it directly to tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk from src to tar
        move(src, tar);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
        int n = A.size();
        // Move the top n disks from A to C using B
        dfs(n, A, B, C);
    }
    ```

=== "Java"

    ```java title="hanota.java"
    /* Move a disk */
    void move(List<Integer> src, List<Integer> tar) {
        // Take out a disk from the top of src
        Integer pan = src.remove(src.size() - 1);
        // Place the disk on top of tar
        tar.add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // If there is only one disk left in src, move it directly to tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk from src to tar
        move(src, tar);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // Move the top n disks from A to C using B
        dfs(n, A, B, C);
    }
    ```

=== "C#"

    ```csharp title="hanota.cs"
    /* Move a disk */
    void Move(List<int> src, List<int> tar) {
        // Take out a disk from the top of src
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // Place the disk on top of tar
        tar.Add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // If there is only one disk left in src, move it directly to tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        DFS(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk from src to tar
        Move(src, tar);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        DFS(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // Move the top n disks from A to C using B
        DFS(n, A, B, C);
    }
    ```

=== "Go"

    ```go title="hanota.go"
    /* Move a disk */
    func move(src, tar *list.List) {
        // Take out a disk from the top of src
        pan := src.Back()
        // Place the disk on top of tar
        tar.PushBack(pan.Value)
        // Remove top disk from src
        src.Remove(pan)
    }

    /* Solve the Tower of Hanoi problem f(i) */
    func dfsHanota(i int, src, buf, tar *list.List) {
        // If there is only one disk left in src, move it directly to tar
        if i == 1 {
            move(src, tar)
            return
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfsHanota(i-1, src, tar, buf)
        // Subproblem f(1): move the remaining disk from src to tar
        move(src, tar)
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfsHanota(i-1, buf, src, tar)
    }

    /* Solve the Tower of Hanoi problem */
    func solveHanota(A, B, C *list.List) {
        n := A.Len()
        // Move the top n disks from A to C using B
        dfsHanota(n, A, B, C)
    }
    ```

=== "Swift"

    ```swift title="hanota.swift"
    /* Move a disk */
    func move(src: inout [Int], tar: inout [Int]) {
        // Take out a disk from the top of src
        let pan = src.popLast()!
        // Place the disk on top of tar
        tar.append(pan)
    }

    /* Solve the Tower of Hanoi problem f(i) */
    func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
        // If there is only one disk left in src, move it directly to tar
        if i == 1 {
            move(src: &src, tar: &tar)
            return
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
        // Subproblem f(1): move the remaining disk from src to tar
        move(src: &src, tar: &tar)
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
    }

    /* Solve the Tower of Hanoi problem */
    func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
        let n = A.count
        // The tail of the list is the top of the rod
        // Move top n disks from src to C using B
        dfs(i: n, src: &A, buf: &B, tar: &C)
    }
    ```

=== "JS"

    ```javascript title="hanota.js"
    /* Move a disk */
    function move(src, tar) {
        // Take out a disk from the top of src
        const pan = src.pop();
        // Place the disk on top of tar
        tar.push(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    function dfs(i, src, buf, tar) {
        // If there is only one disk left in src, move it directly to tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk from src to tar
        move(src, tar);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    function solveHanota(A, B, C) {
        const n = A.length;
        // Move the top n disks from A to C using B
        dfs(n, A, B, C);
    }
    ```

=== "TS"

    ```typescript title="hanota.ts"
    /* Move a disk */
    function move(src: number[], tar: number[]): void {
        // Take out a disk from the top of src
        const pan = src.pop();
        // Place the disk on top of tar
        tar.push(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
        // If there is only one disk left in src, move it directly to tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk from src to tar
        move(src, tar);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    function solveHanota(A: number[], B: number[], C: number[]): void {
        const n = A.length;
        // Move the top n disks from A to C using B
        dfs(n, A, B, C);
    }
    ```

=== "Dart"

    ```dart title="hanota.dart"
    /* Move a disk */
    void move(List<int> src, List<int> tar) {
      // Take out a disk from the top of src
      int pan = src.removeLast();
      // Place the disk on top of tar
      tar.add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
      // If there is only one disk left in src, move it directly to tar
      if (i == 1) {
        move(src, tar);
        return;
      }
      // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
      dfs(i - 1, src, tar, buf);
      // Subproblem f(1): move the remaining disk from src to tar
      move(src, tar);
      // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
      dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    void solveHanota(List<int> A, List<int> B, List<int> C) {
      int n = A.length;
      // Move the top n disks from A to C using B
      dfs(n, A, B, C);
    }
    ```

=== "Rust"

    ```rust title="hanota.rs"
    /* Move a disk */
    fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // Take out a disk from the top of src
        let pan = src.pop().unwrap();
        // Place the disk on top of tar
        tar.push(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // If there is only one disk left in src, move it directly to tar
        if i == 1 {
            move_pan(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk from src to tar
        move_pan(src, tar);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
        let n = A.len() as i32;
        // Move the top n disks from A to C using B
        dfs(n, A, B, C);
    }
    ```

=== "C"

    ```c title="hanota.c"
    /* Move a disk */
    void move(int *src, int *srcSize, int *tar, int *tarSize) {
        // Take out a disk from the top of src
        int pan = src[*srcSize - 1];
        src[*srcSize - 1] = 0;
        (*srcSize)--;
        // Place the disk on top of tar
        tar[*tarSize] = pan;
        (*tarSize)++;
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
        // If there is only one disk left in src, move it directly to tar
        if (i == 1) {
            move(src, srcSize, tar, tarSize);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
        // Subproblem f(1): move the remaining disk from src to tar
        move(src, srcSize, tar, tarSize);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
    }

    /* Solve the Tower of Hanoi problem */
    void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
        // Move the top n disks from A to C using B
        dfs(*ASize, A, ASize, B, BSize, C, CSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="hanota.kt"
    /* Move a disk */
    fun move(src: MutableList<Int>, tar: MutableList<Int>) {
        // Take out a disk from the top of src
        val pan = src.removeAt(src.size - 1)
        // Place the disk on top of tar
        tar.add(pan)
    }

    /* Solve the Tower of Hanoi problem f(i) */
    fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
        // If there is only one disk left in src, move it directly to tar
        if (i == 1) {
            move(src, tar)
            return
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf)
        // Subproblem f(1): move the remaining disk from src to tar
        move(src, tar)
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i - 1, buf, src, tar)
    }

    /* Solve the Tower of Hanoi problem */
    fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
        val n = A.size
        // Move the top n disks from A to C using B
        dfs(n, A, B, C)
    }
    ```

=== "Ruby"

    ```ruby title="hanota.rb"
    ### Move one disk ###
    def move(src, tar)
      # Take out a disk from the top of src
      pan = src.pop
      # Place the disk on top of tar
      tar << pan
    end

    ### Solve Tower of Hanoi f(i) ###
    def dfs(i, src, buf, tar)
      # If there is only one disk left in src, move it directly to tar
      if i == 1
        move(src, tar)
        return
      end

      # Subproblem f(i-1): move the top i-1 disks from src to buf using tar
      dfs(i - 1, src, tar, buf)
      # Subproblem f(1): move the remaining disk from src to tar
      move(src, tar)
      # Subproblem f(i-1): move the top i-1 disks from buf to tar using src
      dfs(i - 1, buf, src, tar)
    end

    ### Solve Tower of Hanoi ###
    def solve_hanota(_A, _B, _C)
      n = _A.length
      # Move the top n disks from A to C using B
      dfs(n, _A, _B, _C)
    end
    ```

As shown in Figure 12-15, the hanota problem forms a recursion tree of height $n$, where each node represents a subproblem corresponding to an invocation of the `dfs()` function, **therefore the time complexity is $O(2^n)$ and the space complexity is $O(n)$**.

![Recursion tree of the hanota problem](hanota_problem.assets/hanota_recursive_tree.png){ class="animation-figure" }

<p align="center"> Figure 12-15 &nbsp; Recursion tree of the hanota problem </p>

!!! quote

    The hanota problem originates from an ancient legend. In a temple in ancient India, monks had three tall diamond pillars and $64$ golden discs of different sizes. The monks continuously moved the discs, believing that when the last disc was correctly placed, the world would come to an end.

    However, even if the monks moved one disc per second, it would take approximately $2^{64} \approx 1.84×10^{19}$ seconds, which is about $5850$ billion years, far exceeding current estimates of the age of the universe. Therefore, if this legend is true, we should not need to worry about the end of the world.
