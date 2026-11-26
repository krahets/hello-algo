---
comments: true
---

# 12.6 &nbsp; Exercises

## 12.6.1 &nbsp; Check your understanding

### 1. &nbsp; Which tasks suit divide and conquer?

A student wants to split each of the following tasks in half, solve the halves separately, and combine their results.
Classify each task as “well suited to divide and conquer,” “can be divided without reducing the total work,” or “the halves cannot be solved independently.” Explain your reasoning.

<!-- numbered-subquestions -->

1. Sort an unsorted array.
2. Find the maximum value in an array.
3. Perform a sequence of stack operations `push(x)` and `pop()` in order, and output the element returned by each `pop()`.

??? success "Sample answer"

    1. Well suited. Split the array in half, sort the halves independently, and merge them in $O(n)$ time. This is merge sort.
    2. The task can be divided, but the total work stays the same. Together, the two halves still require examining all $n$ elements,
        which takes $O(n)$ time, just like a direct scan.
    3. The halves cannot be solved independently. The contents of the stack at the start of the second half depend on the result of the first,
        so the two halves cannot run independently without knowing each other’s results.

### 2. &nbsp; How does exponentiation by squaring save work?

The following recursive function uses divide and conquer to compute $x^n$:

=== "Python"

    ```python title="fast_power.py"
    def fast_pow(x: int, n: int) -> int:
        """Exponentiation by squaring"""
        if n == 0:
            return 1
        half = fast_pow(x, n // 2)
        if n % 2 == 0:
            return half * half
        return half * half * x
    ```

=== "C++"

    ```cpp title="fast_power.cpp"
    /* Exponentiation by squaring */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Java"

    ```java title="fast_power.java"
    /* Exponentiation by squaring */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "C#"

    ```csharp title="fast_power.cs"
    /* Exponentiation by squaring */
    int FastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = FastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Go"

    ```go title="fast_power.go"
    /* Exponentiation by squaring */
    func fastPow(x, n int) int {
        if n == 0 {
            return 1
        }
        half := fastPow(x, n/2)
        if n%2 == 0 {
            return half * half
        }
        return half * half * x
    }
    ```

=== "Swift"

    ```swift title="fast_power.swift"
    /* Exponentiation by squaring */
    func fastPow(x: Int, n: Int) -> Int {
        if n == 0 {
            return 1
        }
        let half = fastPow(x: x, n: n / 2)
        if n % 2 == 0 {
            return half * half
        }
        return half * half * x
    }
    ```

=== "JS"

    ```javascript title="fast_power.js"
    /* Exponentiation by squaring */
    function fastPow(x, n) {
        if (n === 0) {
            return 1;
        }
        const half = fastPow(x, Math.floor(n / 2));
        if (n % 2 === 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "TS"

    ```typescript title="fast_power.ts"
    /* Exponentiation by squaring */
    function fastPow(x: number, n: number): number {
        if (n === 0) {
            return 1;
        }
        const half = fastPow(x, Math.floor(n / 2));
        if (n % 2 === 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Dart"

    ```dart title="fast_power.dart"
    /* Exponentiation by squaring */
    int fastPow(int x, int n) {
      if (n == 0) {
        return 1;
      }
      int half = fastPow(x, n ~/ 2);
      if (n % 2 == 0) {
        return half * half;
      }
      return half * half * x;
    }
    ```

=== "Rust"

    ```rust title="fast_power.rs"
    /* Exponentiation by squaring */
    fn fast_pow(x: i32, n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let half = fast_pow(x, n / 2);
        if n % 2 == 0 {
            return half * half;
        }
        half * half * x
    }
    ```

=== "C"

    ```c title="fast_power.c"
    /* Exponentiation by squaring */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Kotlin"

    ```kotlin title="fast_power.kt"
    /* Exponentiation by squaring */
    fun fastPow(x: Int, n: Int): Int {
        if (n == 0) {
            return 1
        }
        val half = fastPow(x, n / 2)
        if (n % 2 == 0) {
            return half * half
        }
        return half * half * x
    }
    ```

=== "Ruby"

    ```ruby title="fast_power.rb"
    ### Exponentiation by squaring ###
    def fast_pow(x, n)
      return 1 if n == 0

      half = fast_pow(x, n / 2)
      return half * half if n.even?

      half * half * x
    end
    ```

Let `x = 3` and `n = 5`. Trace the function:

<!-- numbered-subquestions -->

1. What values does the argument `n` take in successive recursive calls?
2. As the calls return, starting with the deepest one, what value does each return?
3. Why store the recursive result in `half` instead of calling the same subproblem once for each factor?

??? success "Sample answer"

    1. The argument takes the values `5 → 2 → 1 → 0`. Each call halves the exponent until it reaches the base case.

    2. For `n = 0`, the function returns 1. For `n = 1`, it returns $1×1×3=3$.
        For `n = 2`, it returns $3×3=9$. For `n = 5`, it returns $9×9×3=243$.

    3. Calling the same subproblem for each factor would perform exactly the same calculation twice.
        Saving the result in `half` means each level makes just one recursive call, and the recursion depth is about $\log n$.
        Making both calls would repeat a great deal of work.

### 3. &nbsp; Separating the left and right subtrees in traversal sequences

A binary tree with distinct node values has the following preorder and inorder traversals:

- Preorder: `[A, B, D, E, C]`
- Inorder: `[D, B, E, A, C]`

Split the sequences only at the root. You do not need to recurse further or draw the whole tree.

<!-- numbered-subquestions -->

1. Which node is the root?
2. Which segments of the inorder traversal represent the left and right subtrees?
3. Which segments of the preorder traversal represent the left and right subtrees? Which nodes are the root’s immediate children?

??? success "Sample answer"

    1. The first node in preorder is the root, so the root is `A`.

    2. `A` splits the inorder traversal into two parts: `[D, B, E]` for the left subtree and `[C]` for the right.

    3. The left subtree contains three nodes, so the three preorder elements after the root `A` belong to the left subtree,
        giving `[B, D, E]`. The remaining segment, `[C]`, belongs to the right subtree.
        The root’s left child is therefore `B` and its right child is `C`.

## 12.6.2 &nbsp; Programming exercises

### 1. &nbsp; Exponentiation by squaring

Given a real number `x` and an integer `n`, compute $x^n$ without calling the language’s built-in power function.
Use recursive divide and conquer. Halve the exponent at each step and reuse the result of the subproblem.
For this problem, $x^0=1$ even when `x = 0`. When `n < 0`, you may assume `x != 0` and compute the answer as $(1/x)^{-n}$.

??? tip "Hints"

    1. When n is 0, the answer is 1
    2. Save x raised to the power n // 2 as half to avoid a second recursive call
    3. If n < 0, first set x to 1 / x and n to -n. In C++ or Java, you can first promote n to a 64-bit integer to avoid overflow when negating the smallest 32-bit integer

[LeetCode](https://leetcode.com/problems/powx-n/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
