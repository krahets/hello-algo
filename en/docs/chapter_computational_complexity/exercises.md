# Exercises

## Check your understanding

### Time and space in iteration and recursion

Both functions below compute $1 + 2 + \dots + n$ (assume $n \ge 1$). Set `n` to 4,
follow the program's execution order to answer the questions, and then compare the efficiency of the two approaches.

```src
[file]{complexity_exercises}-[class]{}-[func]{sum_iter}
```

<!-- numbered-subquestions -->

1. When the iterative function runs with `n = 4`, what is the value of the accumulator `res` at the end of each iteration?
2. When the recursive function runs with `n = 4`, what values does the parameter `n` take, in order? How is the result computed as the calls return, starting from the deepest call?
3. What are the time and space complexities of each approach? Explain using the execution steps from questions 1 and 2.

??? success "Reference answer"

    1. The loop variable `i` takes the values `1, 2, 3, 4` in order. At the end of each iteration, `res` becomes
        `1, 3, 6, 10`, respectively, so the iterative function returns 10.

    2. The parameter `n` follows the sequence `4 → 3 → 2 → 1`.
        The deepest call returns 1. The remaining calls then compute `2 + 1 = 3`, `3 + 3 = 6`, and `4 + 6 = 10`, in order.
        At the deepest point, all four function calls are still active.

    3. Both functions perform a number of iterations or calls proportional to $n$, so both have time complexity $O(n)$.
        Their space complexities differ: the iterative version uses only a constant number of variables, giving $O(1)$.
        In the recursive version, earlier calls must wait for their results until the base case is reached. The call stack therefore holds up to $n$ calls at once,
        giving space complexity $O(n)$.

        When analyzing space complexity, consider the space used by recursive calls as well as the variables in the code.

### Time complexity of three code snippets

Each of the following three code snippets takes a positive integer $n$ as input. Rank them from lowest to highest time complexity, and state each complexity.

```src
[file]{complexity_exercises}-[class]{}-[func]{linear_loop}
```

??? success "Reference answer"

    From lowest to highest: snippet 3, $O(\log n)$; snippet 1, $O(n)$; snippet 2, $O(n^2)$.
    Snippet 3 halves $n$ at each iteration, so it runs approximately $\log_2 n$ times.
    Snippet 1 runs its loop exactly $n$ times. In snippet 2, the inner loop runs
    $n,n-1,\dots,1$ times in successive iterations, for a total of $n(n+1)/2$, giving quadratic time complexity.

### Which reversal method uses less space?

There are two ways to reverse all the elements in an array `nums`:

<!-- numbered-subquestions -->

1. Create an array `res` of the same length, copy the elements into it in reverse order, and return it.
2. Move two indices, `i` and `j`, inward from the beginning and end, swapping `nums[i]` with `nums[j]` in pairs.

    What is the space complexity of each approach? Which operation is in-place?

??? success "Reference answer"

    1. An auxiliary array as long as the input is needed, giving space complexity $O(n)$.

    2. Only two index variables are used,
        giving space complexity $O(1)$. This is an in-place operation.

        Keep in mind that in-place reversal modifies the input array.
        Prefer it only when modifying the input is allowed. If the original array must be preserved, the copying cost of approach 1 is unavoidable.

## Programming exercises

### Fibonacci number

The Fibonacci sequence satisfies $F(0)=0$, $F(1)=1$, and, for $n\ge2$,
$F(n)=F(n-1)+F(n-2)$.

Given a nonnegative integer `n`, use a loop to compute and return $F(n)$ without recursion.

??? tip "Hints"

    1. Handle n equal to 0 or 1 separately first.
    2. Computing the next term requires only the previous two terms; there is no need to store the entire sequence.
    3. When updating the two variables, take care not to overwrite an old value before you have finished using it.

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
