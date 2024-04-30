---
comments: true
---

# 12.4 &nbsp; Tower of Hanoi Problem

In both merge sorting and building binary trees, we decompose the original problem into two subproblems, each half the size of the original problem. However, for the Tower of Hanoi, we adopt a different decomposition strategy.

!!! question

    Given three pillars, denoted as `A`, `B`, and `C`. Initially, pillar `A` is stacked with $n$ discs, arranged in order from top to bottom from smallest to largest. Our task is to move these $n$ discs to pillar `C`, maintaining their original order (as shown in Figure 12-10). The following rules must be followed during the disc movement process:
    
    1. A disc can only be picked up from the top of a pillar and placed on top of another pillar.
    2. Only one disc can be moved at a time.
    3. A smaller disc must always be on top of a larger disc.

![Example of the Tower of Hanoi](hanota_problem.assets/hanota_example.png){ class="animation-figure" }

<p align="center"> Figure 12-10 &nbsp; Example of the Tower of Hanoi </p>

**We denote the Tower of Hanoi of size $i$ as $f(i)$**. For example, $f(3)$ represents the Tower of Hanoi of moving $3$ discs from `A` to `C`.

### 1. &nbsp; Consider the base case

As shown in Figure 12-11, for the problem $f(1)$, i.e., when there is only one disc, we can directly move it from `A` to `C`.

=== "<1>"
    ![Solution for a problem of size 1](hanota_problem.assets/hanota_f1_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png){ class="animation-figure" }

<p align="center"> Figure 12-11 &nbsp; Solution for a problem of size 1 </p>

As shown in Figure 12-12, for the problem $f(2)$, i.e., when there are two discs, **since the smaller disc must always be above the larger disc, `B` is needed to assist in the movement**.

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

The process of solving the problem $f(2)$ can be summarized as: **moving two discs from `A` to `C` with the help of `B`**. Here, `C` is called the target pillar, and `B` is called the buffer pillar.

### 2. &nbsp; Decomposition of subproblems

For the problem $f(3)$, i.e., when there are three discs, the situation becomes slightly more complicated.

Since we already know the solutions to $f(1)$ and $f(2)$, we can think from a divide-and-conquer perspective and **consider the two top discs on `A` as a unit**, performing the steps shown in Figure 12-13. This way, the three discs are successfully moved from `A` to `C`.

1. Let `B` be the target pillar and `C` the buffer pillar, and move the two discs from `A` to `B`.
2. Move the remaining disc from `A` directly to `C`.
3. Let `C` be the target pillar and `A` the buffer pillar, and move the two discs from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 3](hanota_problem.assets/hanota_f3_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png){ class="animation-figure" }

<p align="center"> Figure 12-13 &nbsp; Solution for a problem of size 3 </p>

Essentially, **we divide the problem $f(3)$ into two subproblems $f(2)$ and one subproblem $f(1)$**. By solving these three subproblems in order, the original problem is resolved. This indicates that the subproblems are independent, and their solutions can be merged.

From this, we can summarize the divide-and-conquer strategy for solving the Tower of Hanoi shown in Figure 12-14: divide the original problem $f(n)$ into two subproblems $f(n-1)$ and one subproblem $f(1)$, and solve these three subproblems in the following order.

1. Move $n-1$ discs with the help of `C` from `A` to `B`.
2. Move the remaining one disc directly from `A` to `C`.
3. Move $n-1$ discs with the help of `A` from `B` to `C`.

For these two subproblems $f(n-1)$, **they can be recursively divided in the same manner** until the smallest subproblem $f(1)$ is reached. The solution to $f(1)$ is already known and requires only one move.

![Divide and conquer strategy for solving the Tower of Hanoi](hanota_problem.assets/hanota_divide_and_conquer.png){ class="animation-figure" }

<p align="center"> Figure 12-14 &nbsp; Divide and conquer strategy for solving the Tower of Hanoi </p>

### 3. &nbsp; Code implementation

In the code, we declare a recursive function `dfs(i, src, buf, tar)` whose role is to move the $i$ discs on top of pillar `src` with the help of buffer pillar `buf` to the target pillar `tar`:

=== "Python"

    ```python title="hanota.py"
    def move(src: list[int], tar: list[int]):
        """移动一个圆盘"""
        # 从 src 顶部拿出一个圆盘
        pan = src.pop()
        # 将圆盘放入 tar 顶部
        tar.append(pan)

    def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
        """求解汉诺塔问题 f(i)"""
        # 若 src 只剩下一个圆盘，则直接将其移到 tar
        if i == 1:
            move(src, tar)
            return
        # 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf)
        # 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar)
        # 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar)

    def solve_hanota(A: list[int], B: list[int], C: list[int]):
        """求解汉诺塔问题"""
        n = len(A)
        # 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C)
    ```

=== "C++"

    ```cpp title="hanota.cpp"
    /* 移动一个圆盘 */
    void move(vector<int> &src, vector<int> &tar) {
        // 从 src 顶部拿出一个圆盘
        int pan = src.back();
        src.pop_back();
        // 将圆盘放入 tar 顶部
        tar.push_back(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
        int n = A.size();
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C);
    }
    ```

=== "Java"

    ```java title="hanota.java"
    /* 移动一个圆盘 */
    void move(List<Integer> src, List<Integer> tar) {
        // 从 src 顶部拿出一个圆盘
        Integer pan = src.remove(src.size() - 1);
        // 将圆盘放入 tar 顶部
        tar.add(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C);
    }
    ```

=== "C#"

    ```csharp title="hanota.cs"
    /* 移动一个圆盘 */
    void Move(List<int> src, List<int> tar) {
        // 从 src 顶部拿出一个圆盘
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // 将圆盘放入 tar 顶部
        tar.Add(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        DFS(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        Move(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        DFS(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        DFS(n, A, B, C);
    }
    ```

=== "Go"

    ```go title="hanota.go"
    /* 移动一个圆盘 */
    func move(src, tar *list.List) {
        // 从 src 顶部拿出一个圆盘
        pan := src.Back()
        // 将圆盘放入 tar 顶部
        tar.PushBack(pan.Value)
        // 移除 src 顶部圆盘
        src.Remove(pan)
    }

    /* 求解汉诺塔问题 f(i) */
    func dfsHanota(i int, src, buf, tar *list.List) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if i == 1 {
            move(src, tar)
            return
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfsHanota(i-1, src, tar, buf)
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar)
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfsHanota(i-1, buf, src, tar)
    }

    /* 求解汉诺塔问题 */
    func solveHanota(A, B, C *list.List) {
        n := A.Len()
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfsHanota(n, A, B, C)
    }
    ```

=== "Swift"

    ```swift title="hanota.swift"
    /* 移动一个圆盘 */
    func move(src: inout [Int], tar: inout [Int]) {
        // 从 src 顶部拿出一个圆盘
        let pan = src.popLast()!
        // 将圆盘放入 tar 顶部
        tar.append(pan)
    }

    /* 求解汉诺塔问题 f(i) */
    func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if i == 1 {
            move(src: &src, tar: &tar)
            return
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src: &src, tar: &tar)
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
    }

    /* 求解汉诺塔问题 */
    func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
        let n = A.count
        // 列表尾部是柱子顶部
        // 将 src 顶部 n 个圆盘借助 B 移到 C
        dfs(i: n, src: &A, buf: &B, tar: &C)
    }
    ```

=== "JS"

    ```javascript title="hanota.js"
    /* 移动一个圆盘 */
    function move(src, tar) {
        // 从 src 顶部拿出一个圆盘
        const pan = src.pop();
        // 将圆盘放入 tar 顶部
        tar.push(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    function dfs(i, src, buf, tar) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    function solveHanota(A, B, C) {
        const n = A.length;
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C);
    }
    ```

=== "TS"

    ```typescript title="hanota.ts"
    /* 移动一个圆盘 */
    function move(src: number[], tar: number[]): void {
        // 从 src 顶部拿出一个圆盘
        const pan = src.pop();
        // 将圆盘放入 tar 顶部
        tar.push(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    function solveHanota(A: number[], B: number[], C: number[]): void {
        const n = A.length;
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C);
    }
    ```

=== "Dart"

    ```dart title="hanota.dart"
    /* 移动一个圆盘 */
    void move(List<int> src, List<int> tar) {
      // 从 src 顶部拿出一个圆盘
      int pan = src.removeLast();
      // 将圆盘放入 tar 顶部
      tar.add(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
      // 若 src 只剩下一个圆盘，则直接将其移到 tar
      if (i == 1) {
        move(src, tar);
        return;
      }
      // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
      dfs(i - 1, src, tar, buf);
      // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
      move(src, tar);
      // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
      dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    void solveHanota(List<int> A, List<int> B, List<int> C) {
      int n = A.length;
      // 将 A 顶部 n 个圆盘借助 B 移到 C
      dfs(n, A, B, C);
    }
    ```

=== "Rust"

    ```rust title="hanota.rs"
    /* 移动一个圆盘 */
    fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // 从 src 顶部拿出一个圆盘
        let pan = src.remove(src.len() - 1);
        // 将圆盘放入 tar 顶部
        tar.push(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if i == 1 {
            move_pan(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move_pan(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
        let n = A.len() as i32;
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C);
    }
    ```

=== "C"

    ```c title="hanota.c"
    /* 移动一个圆盘 */
    void move(int *src, int *srcSize, int *tar, int *tarSize) {
        // 从 src 顶部拿出一个圆盘
        int pan = src[*srcSize - 1];
        src[*srcSize - 1] = 0;
        (*srcSize)--;
        // 将圆盘放入 tar 顶部
        tar[*tarSize] = pan;
        (*tarSize)++;
    }

    /* 求解汉诺塔问题 f(i) */
    void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i == 1) {
            move(src, srcSize, tar, tarSize);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, srcSize, tar, tarSize);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
    }

    /* 求解汉诺塔问题 */
    void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(*ASize, A, ASize, B, BSize, C, CSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="hanota.kt"
    /* 移动一个圆盘 */
    fun move(src: MutableList<Int>, tar: MutableList<Int>) {
        // 从 src 顶部拿出一个圆盘
        val pan = src.removeAt(src.size - 1)
        // 将圆盘放入 tar 顶部
        tar.add(pan)
    }

    /* 求解汉诺塔问题 f(i) */
    fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i == 1) {
            move(src, tar)
            return
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf)
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar)
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar)
    }

    /* 求解汉诺塔问题 */
    fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
        val n = A.size
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C)
    }
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%22%22%22%0A%20%20%20%20%23%20%E4%BB%8E%20src%20%E9%A1%B6%E9%83%A8%E6%8B%BF%E5%87%BA%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20%E5%B0%86%E5%9C%86%E7%9B%98%E6%94%BE%E5%85%A5%20tar%20%E9%A1%B6%E9%83%A8%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int,%20src%3A%20list%5Bint%5D,%20buf%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E6%B1%89%E8%AF%BA%E5%A1%94%E9%97%AE%E9%A2%98%20f%28i%29%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%20src%20%E5%8F%AA%E5%89%A9%E4%B8%8B%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E5%B0%86%E5%85%B6%E7%A7%BB%E5%88%B0%20tar%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%20f%28i-1%29%20%EF%BC%9A%E5%B0%86%20src%20%E9%A1%B6%E9%83%A8%20i-1%20%E4%B8%AA%E5%9C%86%E7%9B%98%E5%80%9F%E5%8A%A9%20tar%20%E7%A7%BB%E5%88%B0%20buf%0A%20%20%20%20dfs%28i%20-%201,%20src,%20tar,%20buf%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%20f%281%29%20%EF%BC%9A%E5%B0%86%20src%20%E5%89%A9%E4%BD%99%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%E7%A7%BB%E5%88%B0%20tar%0A%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%20f%28i-1%29%20%EF%BC%9A%E5%B0%86%20buf%20%E9%A1%B6%E9%83%A8%20i-1%20%E4%B8%AA%E5%9C%86%E7%9B%98%E5%80%9F%E5%8A%A9%20src%20%E7%A7%BB%E5%88%B0%20tar%0A%20%20%20%20dfs%28i%20-%201,%20buf,%20src,%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D,%20B%3A%20list%5Bint%5D,%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E6%B1%89%E8%AF%BA%E5%A1%94%E9%97%AE%E9%A2%98%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20%E5%B0%86%20A%20%E9%A1%B6%E9%83%A8%20n%20%E4%B8%AA%E5%9C%86%E7%9B%98%E5%80%9F%E5%8A%A9%20B%20%E7%A7%BB%E5%88%B0%20C%0A%20%20%20%20dfs%28n,%20A,%20B,%20C%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%97%E8%A1%A8%E5%B0%BE%E9%83%A8%E6%98%AF%E6%9F%B1%E5%AD%90%E9%A1%B6%E9%83%A8%0A%20%20%20%20A%20%3D%20%5B5,%204,%203,%202,%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%E4%B8%8B%EF%BC%9A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A,%20B,%20C%29%0A%0A%20%20%20%20print%28%22%E5%9C%86%E7%9B%98%E7%A7%BB%E5%8A%A8%E5%AE%8C%E6%88%90%E5%90%8E%EF%BC%9A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%22%22%22%0A%20%20%20%20%23%20%E4%BB%8E%20src%20%E9%A1%B6%E9%83%A8%E6%8B%BF%E5%87%BA%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20%E5%B0%86%E5%9C%86%E7%9B%98%E6%94%BE%E5%85%A5%20tar%20%E9%A1%B6%E9%83%A8%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int,%20src%3A%20list%5Bint%5D,%20buf%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E6%B1%89%E8%AF%BA%E5%A1%94%E9%97%AE%E9%A2%98%20f%28i%29%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%20src%20%E5%8F%AA%E5%89%A9%E4%B8%8B%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E5%B0%86%E5%85%B6%E7%A7%BB%E5%88%B0%20tar%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%20f%28i-1%29%20%EF%BC%9A%E5%B0%86%20src%20%E9%A1%B6%E9%83%A8%20i-1%20%E4%B8%AA%E5%9C%86%E7%9B%98%E5%80%9F%E5%8A%A9%20tar%20%E7%A7%BB%E5%88%B0%20buf%0A%20%20%20%20dfs%28i%20-%201,%20src,%20tar,%20buf%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%20f%281%29%20%EF%BC%9A%E5%B0%86%20src%20%E5%89%A9%E4%BD%99%E4%B8%80%E4%B8%AA%E5%9C%86%E7%9B%98%E7%A7%BB%E5%88%B0%20tar%0A%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%20f%28i-1%29%20%EF%BC%9A%E5%B0%86%20buf%20%E9%A1%B6%E9%83%A8%20i-1%20%E4%B8%AA%E5%9C%86%E7%9B%98%E5%80%9F%E5%8A%A9%20src%20%E7%A7%BB%E5%88%B0%20tar%0A%20%20%20%20dfs%28i%20-%201,%20buf,%20src,%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D,%20B%3A%20list%5Bint%5D,%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E6%B1%89%E8%AF%BA%E5%A1%94%E9%97%AE%E9%A2%98%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20%E5%B0%86%20A%20%E9%A1%B6%E9%83%A8%20n%20%E4%B8%AA%E5%9C%86%E7%9B%98%E5%80%9F%E5%8A%A9%20B%20%E7%A7%BB%E5%88%B0%20C%0A%20%20%20%20dfs%28n,%20A,%20B,%20C%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%97%E8%A1%A8%E5%B0%BE%E9%83%A8%E6%98%AF%E6%9F%B1%E5%AD%90%E9%A1%B6%E9%83%A8%0A%20%20%20%20A%20%3D%20%5B5,%204,%203,%202,%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%E4%B8%8B%EF%BC%9A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A,%20B,%20C%29%0A%0A%20%20%20%20print%28%22%E5%9C%86%E7%9B%98%E7%A7%BB%E5%8A%A8%E5%AE%8C%E6%88%90%E5%90%8E%EF%BC%9A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

As shown in Figure 12-15, the Tower of Hanoi forms a recursive tree with a height of $n$, each node representing a subproblem, corresponding to an open `dfs()` function, **thus the time complexity is $O(2^n)$, and the space complexity is $O(n)$**.

![Recursive tree of the Tower of Hanoi](hanota_problem.assets/hanota_recursive_tree.png){ class="animation-figure" }

<p align="center"> Figure 12-15 &nbsp; Recursive tree of the Tower of Hanoi </p>

!!! quote

    The Tower of Hanoi originates from an ancient legend. In a temple in ancient India, monks had three tall diamond pillars and $64$ differently sized golden discs. The monks continuously moved the discs, believing that when the last disc is correctly placed, the world would end.

    However, even if the monks moved a disc every second, it would take about $2^{64} \approx 1.84×10^{19}$ seconds, approximately 585 billion years, far exceeding current estimates of the age of the universe. Thus, if the legend is true, we probably do not need to worry about the world ending.
