# Exercises

## Concept Review

### Which Tasks Are Suitable for Divide and Conquer?

A student wants to solve each task below by "dividing it into two halves, solving each half separately, and then combining the results."
Classify each task as "suitable for divide and conquer," "can use divide and conquer, but it will not reduce the total work," or "the two halves cannot be solved independently," and explain why.

<!-- numbered-subquestions -->

1. Sort an unsorted array.
2. Find the maximum value in an array.
3. Execute a sequence of `push(x)` and `pop()` stack operations in order, and output the element returned by each `pop()`.

??? success "Answer"

    1. Suitable: divide the array in half, sort each half independently, and merge them in $O(n)$ time. This is exactly merge sort.
    2. Divide and conquer can be used, but it does not reduce the total work. The two halves still require examining all $n$ elements in total,
        so the time complexity remains $O(n)$, just like a direct scan.
    3. The two halves cannot be solved independently. The stack's contents at the beginning of the second half depend on the result of executing the first half,
        so the two halves cannot be completed without knowing each other's results.

### How Exponentiation by Squaring Reduces Computation

The recursive function below uses divide and conquer to calculate $x^n$:

```python
def fast_pow(x, n):
    if n == 0:
        return 1
    half = fast_pow(x, n // 2)
    if n % 2 == 0:
        return half * half
    return half * half * x
```

Use it to calculate `fast_pow(3, 5)`:

<!-- numbered-subquestions -->

1. As the recursive calls proceed, which values does the argument `n` take in order?
2. Starting from the deepest call, what value does each level return?
3. Why should the result be stored in `half` instead of writing `fast_pow(x, n // 2)` twice?

??? success "Answer"

    1. The argument takes the values `5 → 2 → 1 → 0`. The exponent is halved at each step until the base case is reached.

    2. When `n = 0`, the function returns 1. When `n = 1`, it returns $1×1×3=3$.
        When `n = 2`, it returns $3×3=9$. When `n = 5`, it returns $9×9×3=243$.

    3. If `fast_pow(x, n // 2)` were written once on each side of the multiplication, the two recursive calls would calculate exactly the same subproblem.
        Storing the result in `half` means that each level makes only one recursive call, so the recursion depth is about $\log n$.
        Making two calls would cause a great deal of repeated computation.

### Split Traversal Sequences into Left and Right Subtrees

A binary tree has no duplicate nodes. Its preorder and inorder traversals are:

- Preorder: `[A, B, D, E, C]`
- Inorder: `[D, B, E, A, C]`

Split the sequences only once, at the root. You do not need to continue recursively or draw the whole tree:

<!-- numbered-subquestions -->

1. Which node is the root?
2. Which subsequences of the inorder traversal correspond to the left and right subtrees?
3. Which subsequences of the preorder traversal correspond to the left and right subtrees? Which nodes are the root's direct children?

??? success "Answer"

    1. The first node in a preorder traversal is the root, so the root is `A`.

    2. `A` divides the inorder traversal into two parts: `[D, B, E]` for the left subtree and `[C]` for the right subtree.

    3. The left subtree contains 3 nodes, so the 3 preorder elements after the root `A` belong to the left subtree,
        giving `[B, D, E]`. The remaining `[C]` belongs to the right subtree.
        Therefore, the root's left child is `B`, and its right child is `C`.

## Programming Exercises

### Exponentiation by Squaring

Given a real number `x` and an integer `n`, calculate $x^n$ without calling the language's built-in power function.
Use recursive divide and conquer: halve the exponent at each step and reuse the result of the subproblem already calculated.
This exercise defines $x^0=1$, including when `x = 0`. When `n < 0`, `x != 0` is guaranteed, and the answer can be transformed into $(1/x)^{-n}$.

??? tip "Hints"

    1. When n is 0, the answer is 1
    2. After calculating x to the power n // 2, store the result in half rather than making the recursive call a second time
    3. When n < 0, first change x to 1 / x and then change n to -n; in C++ or Java, first convert n to a 64-bit integer to avoid overflow when negating the smallest 32-bit integer

[LeetCode](https://leetcode.com/problems/powx-n/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
