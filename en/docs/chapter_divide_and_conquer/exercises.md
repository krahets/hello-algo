# Exercises

## Check your understanding

### Which tasks suit divide and conquer?

A student wants to solve the following tasks by splitting each in half, solving the halves separately, and combining the results.
For each task, decide whether divide and conquer is suitable, is possible but does not reduce the total work, or is unsuitable because the halves cannot be solved independently. Explain.

<!-- numbered-subquestions -->

1. Sort an unsorted array.
2. Find the maximum value in an array.
3. Execute a sequence of stack operations `push(x)` and `pop()` in order, outputting the element returned by each `pop()`.

??? success "Reference answer"

    1. Suitable: split in half, sort the halves independently, and merge in $O(n)$ time. This is exactly merge sort.
    2. Possible, but without reducing the total work: the two halves must still examine all $n$ elements between them,
        taking $O(n)$ time, just like a direct scan.
    3. The halves cannot be solved independently: the stack contents at the start of the second half depend on the results of the first half.
        The second half therefore cannot run independently of the first half's result.

### How fast exponentiation reduces computation

The following recursive function uses divide and conquer to compute $x^n$:

```src
[file]{fast_power}-[class]{}-[func]{fast_pow}
```

Run it with `x = 3` and `n = 5`:

<!-- numbered-subquestions -->

1. What values does `n` take in successive recursive calls?
2. Starting with the deepest call, what value does each call return?
3. Why should the recursive result be saved in `half` instead of making the same recursive call on each side of the multiplication?

??? success "Reference answer"

    1. The parameter follows `5 → 2 → 1 → 0`, halving the exponent each time until the base case is reached.

    2. When `n = 0`, the return value is 1. When `n = 1`, it is $1×1×3=3$.
        When `n = 2`, it is $3×3=9$; when `n = 5`, it is $9×9×3=243$.

    3. Calling the same subproblem on both sides of the multiplication repeats exactly the same computation.
        Saving the result in `half` means each level makes only one recursive call, with recursion depth approximately $\log n$.
        Making two calls would cause substantial repeated computation.

### Splitting traversal sequences into left and right subtrees

A binary tree with distinct node values has these preorder and inorder traversals:

- Preorder: `[A, B, D, E, C]`
- Inorder: `[D, B, E, A, C]`

Split only at the root level; there is no need to recurse further or draw the entire tree.

<!-- numbered-subquestions -->

1. What is the root node?
2. Which parts of the inorder sequence belong to the left and right subtrees?
3. Which parts of the preorder sequence belong to the left and right subtrees? What are the root's immediate children?

??? success "Reference answer"

    1. The first node in preorder is the root, so the root is `A`.

    2. `A` splits the inorder sequence into two parts: `[D, B, E]` for the left subtree and `[C]` for the right subtree.

    3. The left subtree has three nodes, so the three preorder elements after root `A` belong to the left subtree:
        `[B, D, E]`. The remaining `[C]` belongs to the right subtree.
        Thus, the root's left child is `B`, and its right child is `C`.

## Programming exercises

### Fast exponentiation

Given a real number `x` and an integer `n`, compute $x^n$ without calling a built-in power function.
Use recursive divide and conquer: halve the exponent at each step and reuse the computed subproblem result.
For this problem, $x^0=1$, including when `x = 0`. When `n < 0`, `x != 0` is guaranteed, and the answer can be expressed as $(1/x)^{-n}$.

??? tip "Hints"

    1. When n is 0, the answer is 1.
    2. After computing x to the power n // 2, save it in half instead of making the recursive call a second time.
    3. When n < 0, first replace x with 1 / x and n with -n. In C++ or Java, you can convert n to a 64-bit integer first to avoid overflow when negating the smallest 32-bit integer.

[LeetCode](https://leetcode.com/problems/powx-n/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
