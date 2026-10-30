---
comments: true
---

# 12.4 &nbsp; Tower of Hanoi

In merge sort and binary tree reconstruction, we divided the original problem into two subproblems, each half its size. The Tower of Hanoi uses a different division strategy.

!!! question

    Given three rods called `A`, `B`, and `C`, initially rod `A` holds $n$ disks arranged from smallest at the top to largest at the bottom. Move all $n$ disks to rod `C` while preserving their order, as shown in Figure 12-10. The following rules apply.
    
    1. A disk can only be removed from the top of one rod and placed on top of another.
    2. Only one disk may be moved at a time.
    3. A smaller disk must always be above a larger disk.

![Example of the Tower of Hanoi](hanota_problem.assets/hanota_example.png){ class="animation-figure" }

<p align="center"> Figure 12-10 &nbsp; Example of the Tower of Hanoi </p>

**Let $f(i)$ denote a Tower of Hanoi problem of size $i$**. For example, $f(3)$ means moving $3$ disks from `A` to `C`.

### 1. &nbsp; Considering the base cases

For $f(1)$, with just one disk, simply move it directly from `A` to `C`, as shown in Figure 12-11.

=== "<1>"
    ![Solution for a problem of size 1](hanota_problem.assets/hanota_f1_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png){ class="animation-figure" }

<p align="center"> Figure 12-11 &nbsp; Solution for a problem of size 1 </p>

For $f(2)$, with two disks, **we need to use `B` because the smaller disk must remain above the larger one**, as shown in Figure 12-12.

1. Move the smaller top disk from `A` to `B`.
2. Move the larger disk from `A` to `C`.
3. Move the smaller disk from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 2](hanota_problem.assets/hanota_f2_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f2_step2](hanota_problem.assets/hanota_f2_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f2_step3](hanota_problem.assets/hanota_f2_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f2_step4](hanota_problem.assets/hanota_f2_step4.png){ class="animation-figure" }

<p align="center"> Figure 12-12 &nbsp; Solution for a problem of size 2 </p>

We can summarize the solution to $f(2)$ as **moving two disks from `A` to `C` using `B`**. Here, `C` is the destination rod and `B` is the auxiliary rod.

### 2. &nbsp; Dividing the problem

For $f(3)$, with three disks, the situation is a little more complicated.

Since we know how to solve $f(1)$ and $f(2)$, we can use divide and conquer: **treat the top two disks on `A` as a group** and follow the steps in Figure 12-13. This moves all three disks from `A` to `C`.

1. Use `B` as the destination and `C` as the auxiliary rod to move two disks from `A` to `B`.
2. Move the remaining disk directly from `A` to `C`.
3. Use `C` as the destination and `A` as the auxiliary rod to move two disks from `B` to `C`.

=== "<1>"
    ![Solution for a problem of size 3](hanota_problem.assets/hanota_f3_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png){ class="animation-figure" }

<p align="center"> Figure 12-13 &nbsp; Solution for a problem of size 3 </p>

In essence, **we have divided $f(3)$ into two $f(2)$ subproblems and one $f(1)$ subproblem**. Solving these three subproblems in order solves the original problem. This shows that the subproblems are independent and their solutions can be combined.

We can now state the divide-and-conquer strategy for the Tower of Hanoi, illustrated in Figure 12-14: divide $f(n)$ into two subproblems $f(n-1)$ and one subproblem $f(1)$, then solve them in this order.

1. Move $n-1$ disks from `A` to `B` using `C`.
2. Move the remaining $1$ disk directly from `A` to `C`.
3. Move $n-1$ disks from `B` to `C` using `A`.

Each of the two $f(n-1)$ subproblems **can be divided recursively in the same way** until we reach the smallest subproblem, $f(1)$. The solution to $f(1)$ is a single move.

![Divide-and-conquer strategy for the Tower of Hanoi](hanota_problem.assets/hanota_divide_and_conquer.png){ class="animation-figure" }

<p align="center"> Figure 12-14 &nbsp; Divide-and-conquer strategy for the Tower of Hanoi </p>

### 3. &nbsp; Code implementation

We define a recursive function `dfs(i, src, buf, tar)` that moves the top $i$ disks from rod `src` to destination rod `tar` using auxiliary rod `buf`:

=== "Python"

    ```python title="hanota.py"
    def move(src: list[int], tar: list[int]):
        """Move one disk"""
        # Take a disk from the top of src
        pan = src.pop()
        # Place the disk on top of tar
        tar.append(pan)

    def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
        """Solve the Tower of Hanoi problem f(i)"""
        # If this subproblem has only one disk to move, move it directly from src to tar
        if i == 1:
            move(src, tar)
            return
        # Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf)
        # Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    void move(vector<int> &src, vector<int> &tar) {
        // Take a disk from the top of src
        int pan = src.back();
        src.pop_back();
        // Place the disk on top of tar
        tar.push_back(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
        // If only one disk remains to be moved from src, move it directly to tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    void move(List<Integer> src, List<Integer> tar) {
        // Take a disk from the top of src
        Integer pan = src.remove(src.size() - 1);
        // Place the disk on top of tar
        tar.add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // If only one disk remains to be moved from src, move it directly to tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    void Move(List<int> src, List<int> tar) {
        // Take a disk from the top of src
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // Place the disk on top of tar
        tar.Add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // If only one disk in this subproblem remains on src, move it directly to tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        DFS(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    func move(src, tar *list.List) {
        // Take a disk from the top of src
        pan := src.Back()
        // Place the disk on top of tar
        tar.PushBack(pan.Value)
        // Remove the disk from the top of src
        src.Remove(pan)
    }

    /* Solve the Tower of Hanoi problem f(i) */
    func dfsHanota(i int, src, buf, tar *list.List) {
        // If only one disk in this subproblem remains on src, move it directly to tar
        if i == 1 {
            move(src, tar)
            return
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfsHanota(i-1, src, tar, buf)
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    func move(src: inout [Int], tar: inout [Int]) {
        // Take a disk from the top of src
        let pan = src.popLast()!
        // Place the disk on top of tar
        tar.append(pan)
    }

    /* Solve the Tower of Hanoi problem f(i) */
    func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
        // If only one disk in this subproblem remains on src, move it directly to tar
        if i == 1 {
            move(src: &src, tar: &tar)
            return
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
        move(src: &src, tar: &tar)
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
    }

    /* Solve the Tower of Hanoi problem */
    func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
        let n = A.count
        // The end of each list represents the top of the peg
        // Move the top n disks from A to C using B
        dfs(i: n, src: &A, buf: &B, tar: &C)
    }
    ```

=== "JS"

    ```javascript title="hanota.js"
    /* Move one disk */
    function move(src, tar) {
        // Take a disk from the top of src
        const pan = src.pop();
        // Place the disk on top of tar
        tar.push(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    function dfs(i, src, buf, tar) {
        // If only one disk remains to be moved from src, move it directly to tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    function move(src: number[], tar: number[]): void {
        // Take a disk from the top of src
        const pan = src.pop();
        // Place the disk on top of tar
        tar.push(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
        // If only one disk remains to be moved from src, move it directly to tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    void move(List<int> src, List<int> tar) {
      // Take a disk from the top of src
      int pan = src.removeLast();
      // Place the disk on top of tar
      tar.add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
      // If only one disk remains to be moved from src, move it directly to tar
      if (i == 1) {
        move(src, tar);
        return;
      }
      // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
      dfs(i - 1, src, tar, buf);
      // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // Take a disk from the top of src
        let pan = src.pop().unwrap();
        // Place the disk on top of tar
        tar.push(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // If only one disk remains to be moved from src, move it directly to tar
        if i == 1 {
            move_pan(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    void move(int *src, int *srcSize, int *tar, int *tarSize) {
        // Take a disk from the top of src
        int pan = src[*srcSize - 1];
        src[*srcSize - 1] = 0;
        (*srcSize)--;
        // Place the disk on top of tar
        tar[*tarSize] = pan;
        (*tarSize)++;
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
        // If only one disk remains to be moved from src, move it directly to tar
        if (i == 1) {
            move(src, srcSize, tar, tarSize);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
    /* Move one disk */
    fun move(src: MutableList<Int>, tar: MutableList<Int>) {
        // Take a disk from the top of src
        val pan = src.removeAt(src.size - 1)
        // Place the disk on top of tar
        tar.add(pan)
    }

    /* Solve the Tower of Hanoi problem f(i) */
    fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
        // If only one disk in this subproblem remains on src, move it directly to tar
        if (i == 1) {
            move(src, tar)
            return
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        dfs(i - 1, src, tar, buf)
        // Subproblem f(1): move the remaining disk of this subproblem from src to tar
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
      # Take a disk from the top of src
      pan = src.pop
      # Place the disk on top of tar
      tar << pan
    end

    ### Solve the Tower of Hanoi problem f(i) ###
    def dfs(i, src, buf, tar)
      # If only one disk remains to be moved from src, move it directly to tar
      if i == 1
        move(src, tar)
        return
      end

      # Subproblem f(i-1): move the top i-1 disks from src to buf using tar
      dfs(i - 1, src, tar, buf)
      # Subproblem f(1): move the remaining disk in the current subproblem from src to tar
      move(src, tar)
      # Subproblem f(i-1): move the top i-1 disks from buf to tar using src
      dfs(i - 1, buf, src, tar)
    end

    ### Solve the Tower of Hanoi problem ###
    def solve_hanota(_A, _B, _C)
      n = _A.length
      # Move the top n disks from A to C using B
      dfs(n, _A, _B, _C)
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Move%20one%20disk%22%22%22%0A%20%20%20%20%23%20Take%20a%20disk%20from%20the%20top%20of%20src%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20Place%20the%20disk%20on%20top%20of%20tar%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int,%20src%3A%20list%5Bint%5D,%20buf%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Solve%20the%20Tower%20of%20Hanoi%20problem%20f%28i%29%22%22%22%0A%20%20%20%20%23%20If%20the%20current%20subproblem%20has%20only%20one%20disk,%20move%20it%20from%20src%20directly%20to%20tar%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Subproblem%20f%28i-1%29%3A%20move%20the%20top%20i-1%20disks%20from%20src%20to%20buf%20using%20tar%0A%20%20%20%20dfs%28i%20-%201,%20src,%20tar,%20buf%29%0A%20%20%20%20%23%20Subproblem%20f%281%29%3A%20move%20the%20remaining%20disk%20of%20this%20subproblem%20from%20src%20to%20tar%0A%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%23%20Subproblem%20f%28i-1%29%3A%20move%20the%20top%20i-1%20disks%20from%20buf%20to%20tar%20using%20src%0A%20%20%20%20dfs%28i%20-%201,%20buf,%20src,%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D,%20B%3A%20list%5Bint%5D,%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Solve%20the%20Tower%20of%20Hanoi%20problem%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20Move%20the%20top%20n%20disks%20from%20A%20to%20C%20using%20B%0A%20%20%20%20dfs%28n,%20A,%20B,%20C%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20The%20end%20of%20each%20list%20represents%20the%20top%20of%20the%20peg%0A%20%20%20%20A%20%3D%20%5B5,%204,%203,%202,%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22Initial%20state%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A,%20B,%20C%29%0A%0A%20%20%20%20print%28%22After%20moving%20the%20disks%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Move%20one%20disk%22%22%22%0A%20%20%20%20%23%20Take%20a%20disk%20from%20the%20top%20of%20src%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20Place%20the%20disk%20on%20top%20of%20tar%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int,%20src%3A%20list%5Bint%5D,%20buf%3A%20list%5Bint%5D,%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Solve%20the%20Tower%20of%20Hanoi%20problem%20f%28i%29%22%22%22%0A%20%20%20%20%23%20If%20the%20current%20subproblem%20has%20only%20one%20disk,%20move%20it%20from%20src%20directly%20to%20tar%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Subproblem%20f%28i-1%29%3A%20move%20the%20top%20i-1%20disks%20from%20src%20to%20buf%20using%20tar%0A%20%20%20%20dfs%28i%20-%201,%20src,%20tar,%20buf%29%0A%20%20%20%20%23%20Subproblem%20f%281%29%3A%20move%20the%20remaining%20disk%20of%20this%20subproblem%20from%20src%20to%20tar%0A%20%20%20%20move%28src,%20tar%29%0A%20%20%20%20%23%20Subproblem%20f%28i-1%29%3A%20move%20the%20top%20i-1%20disks%20from%20buf%20to%20tar%20using%20src%0A%20%20%20%20dfs%28i%20-%201,%20buf,%20src,%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D,%20B%3A%20list%5Bint%5D,%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Solve%20the%20Tower%20of%20Hanoi%20problem%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20Move%20the%20top%20n%20disks%20from%20A%20to%20C%20using%20B%0A%20%20%20%20dfs%28n,%20A,%20B,%20C%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20The%20end%20of%20each%20list%20represents%20the%20top%20of%20the%20peg%0A%20%20%20%20A%20%3D%20%5B5,%204,%203,%202,%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22Initial%20state%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A,%20B,%20C%29%0A%0A%20%20%20%20print%28%22After%20moving%20the%20disks%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

As shown in Figure 12-15, the Tower of Hanoi forms a recursion tree of height $n$. Each node represents a subproblem and corresponds to a call to `dfs()`. **The time complexity is therefore $O(2^n)$, and the space complexity is $O(n)$**.

![Recursion tree for the Tower of Hanoi](hanota_problem.assets/hanota_recursive_tree.png){ class="animation-figure" }

<p align="center"> Figure 12-15 &nbsp; Recursion tree for the Tower of Hanoi </p>

!!! quote

    The Tower of Hanoi comes from an ancient legend. In a temple in ancient India, monks had three tall diamond rods and $64$ gold disks of different sizes. They continually moved the disks, believing that the world would end when the last disk was placed in its correct position.

    Even at one move per second, however, this would take about $2^{64} \approx 1.84×10^{19}$ seconds, or roughly $585$ billion years, far longer than current estimates of the age of the universe. If the legend is true, we should have little reason to worry about the end of the world.
