# Exercises

## Check your understanding

### Time and space costs of iteration and recursion

Both functions below compute $1 + 2 + \dots + n$ for $n \ge 1$. Set `n` to 4,
answer the questions by tracing the program in execution order, and then compare the efficiency of the two implementations.

```src
[file]{complexity_exercises}-[class]{}-[func]{sum_iter}
```

<!-- numbered-subquestions -->

1. When the iterative function runs with `n = 4`, what value does the accumulator `res` hold after each iteration?
2. When the recursive function runs with `n = 4`, what values does the parameter `n` take, in order? How is the result computed as the calls return, starting at the deepest level?
3. What are the time and space complexities of each implementation? Explain using the execution traces from questions 1 and 2.

??? success "Sample answer"

    1. The loop variable `i` takes the successive values `1, 2, 3, 4`. At the end of each iteration, the running total `res` is
        `1, 3, 6, 10`, respectively, so the iterative function returns 10.

    2. The parameter `n` takes the following values in order: `4 → 3 → 2 → 1`.
        The deepest call returns 1. As the remaining calls return, they compute `2 + 1 = 3`, `3 + 3 = 6`, and `4 + 6 = 10` in order.
        At the deepest level, all four function calls are still active.

    3. The number of iterations or calls is proportional to $n$ in both implementations, so both have time complexity $O(n)$.
        Their space complexities differ. The iterative version uses a constant number of variables, so its space complexity is $O(1)$.
        In the recursive version, earlier calls wait for a result as recursion proceeds toward the base case. The call stack holds up to $n$ calls at once,
        so the space complexity is $O(n)$.

        When analyzing space complexity, count the space used by recursive calls as well as the variables in the code.

### Time complexity of three code snippets

Each of the following three snippets takes a positive integer $n$ as input. Rank them by time complexity, from lowest to highest, and give the complexity of each.

```src
[file]{complexity_exercises}-[class]{}-[func]{linear_loop}
```

??? success "Sample answer"

    From lowest to highest, they are snippet 3 ($O(\log n)$), snippet 1 ($O(n)$), and snippet 2 ($O(n^2)$).
    Snippet 3 halves $n$ on each iteration, so the loop runs about $\log_2 n$ times.
    The loop in snippet 1 runs exactly $n$ times. In snippet 2, the inner loop runs
    $n,n-1,\dots,1$ times on successive passes, for a total of $n(n+1)/2$ iterations. Its time complexity is therefore quadratic.

### Which reversal uses less space?

Consider two ways to reverse all the elements of the array `nums`:

<!-- numbered-subquestions -->

1. Create an array `res` of the same length, copy the elements into it in reverse order, and return it.
2. Move two indices, `i` and `j`, inward from the beginning and end, respectively, swapping `nums[i]` and `nums[j]` at each step.

    What is the space complexity of each approach? Which one reverses the array in place?

??? success "Sample answer"

    1. The first approach requires an auxiliary array as long as the input, so its space complexity is $O(n)$.

    2. The second approach uses only two index variables,
        so its space complexity is $O(1)$ and it operates in place.

        Reversing an array in place modifies the input.
        Prefer this approach only when the input may be modified. If you need to preserve the original array, the cost of copying in the first approach is unavoidable.

## Programming exercises

### Fibonacci number

The Fibonacci sequence satisfies $F(0)=0$ and $F(1)=1$, and for $n\ge2$,
$F(n)=F(n-1)+F(n-2)$.

Given a nonnegative integer `n`, use a loop to compute and return $F(n)$ without recursion.

??? tip "Hints"

    1. Handle n = 0 and n = 1 separately first.
    2. You need only the previous two terms to compute the next one. There is no need to store the whole sequence.
    3. When updating the two variables, keep each old value until you have finished using it.

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
