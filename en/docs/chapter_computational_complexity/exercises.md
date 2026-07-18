# Exercises

## Concept Review

### Time and Space Complexity of Iteration and Recursion

The two functions below both calculate $1 + 2 + \dots + n$ (assume $n \ge 1$). Set `n` to 4,
answer the questions by following the program's actual execution order, and then compare the efficiency of the two approaches.

```python
def sum_iter(n):
    s = 0
    for i in range(1, n + 1):
        s += i
    return s

def sum_recur(n):
    if n == 1:
        return 1
    return n + sum_recur(n - 1)
```

<!-- numbered-subquestions -->

1. When `sum_iter(4)` runs, what is the value of `s` after each loop iteration?
2. When `sum_recur(4)` runs, which function calls occur in order? As the calls return from the deepest level, how is the result obtained?
3. What are the time and space complexities of the two approaches? Explain your reasoning using the execution processes from Questions 1 and 2.

??? success "Answer"

    1. The loop variable `i` takes the values `1, 2, 3, 4`. After each iteration, `s` becomes
        `1, 3, 6, 10`, respectively, so `sum_iter(4)` returns 10.

    2. The function calls occur in this order:
        `sum_recur(4) → sum_recur(3) → sum_recur(2) → sum_recur(1)`.
        `sum_recur(1)` returns 1. The remaining calls then obtain `2 + 1 = 3`, `3 + 3 = 6`, and `4 + 6 = 10`, in that order.
        At the deepest point, all four function calls are still unfinished.

    3. Both functions perform a number of loop iterations or calls proportional to $n$, so both have a time complexity of $O(n)$.
        Their space complexities differ. The iterative version uses only a constant number of variables, so its space complexity is $O(1)$.
        In the recursive version, earlier calls must wait for a result before returning, so the call stack holds up to $n$ calls at the same time.
        Its space complexity is $O(n)$.

        When analyzing space complexity, remember to include the space used by recursive calls as well as the variables written in the code.

### Time Complexity of Three Code Fragments

Each of the following code fragments takes a positive integer $n$ as input. Order them from lowest to highest time complexity, and give the complexity of each one.

```python
# Fragment 1
s = 0
for i in range(n):
    s += i

# Fragment 2
s = 0
for i in range(n):
    for j in range(i, n):
        s += j

# Fragment 3
while n > 1:
    n = n // 2
```

??? success "Answer"

    From lowest to highest, the order is Fragment 3 with $O(\log n)$, Fragment 1 with $O(n)$, and Fragment 2 with $O(n^2)$.
    Fragment 3 halves $n$ in each iteration, so it runs about $\log_2 n$ times.
    The loop in Fragment 1 runs exactly $n$ times. The inner loop in Fragment 2 runs
    $n,n-1,\dots,1$ times, for a total of $n(n+1)/2$, so its time complexity is quadratic.

### Which Reversal Uses Less Space?

There are two ways to reverse all the elements in the array `nums`:

<!-- numbered-subquestions -->

1. Create a new array `res` of the same length, copy the elements into it in reverse order, and return it.
2. Move two indices `i` and `j` inward from the beginning and end, swapping `nums[i]` and `nums[j]` at each step.

    What is the space complexity of each approach? Which one is an "in-place" operation?

??? success "Answer"

    1. This approach needs an auxiliary array with the same length as the input, so its space complexity is $O(n)$.

    2. This approach uses only two index variables,
        so its space complexity is $O(1)$. It is an in-place operation.

        Note that an in-place reversal changes the input array,
        so it should be preferred only when modifying the input is allowed. If the original array must be kept, the copying cost of the first approach is unavoidable.

## Programming Exercises

### Fibonacci Number

The Fibonacci sequence is defined by $F(0)=0$, $F(1)=1$, and, for $n\ge2$,
$F(n)=F(n-1)+F(n-2)$.

Given a non-negative integer `n`, use a loop to calculate and return $F(n)$. Do not use recursion.

??? tip "Hints"

    1. Handle the cases where n is 0 or 1 separately
    2. Only the previous two terms are needed to calculate the next term; there is no need to store the entire sequence
    3. When updating the two variables, take care not to overwrite an old value before it is used

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
