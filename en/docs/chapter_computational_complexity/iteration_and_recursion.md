# Iteration and recursion

Algorithms often repeat tasks, and repetition is closely tied to complexity analysis. Before introducing time and space complexity, let's examine two basic ways to repeat work in a program: iteration and recursion.

## Iteration

<u>Iteration</u> is a control structure for repeating a task. A program repeatedly executes a block of code while a condition holds, stopping when it no longer does.

### For loops

A `for` loop is one of the most common forms of iteration, **especially when the number of iterations is known in advance**.

The following function uses a `for` loop to compute $1 + 2 + \dots + n$, storing the result in `res`. In Python, `range(a, b)` includes the left endpoint but excludes the right, so it visits $a, a + 1, \dots, b-1$:

```src
[file]{iteration}-[class]{}-[func]{for_loop}
```

The figure below is a flowchart of this summation function.

![Flowchart of the summation function](iteration_and_recursion.assets/iteration.png)

Its operation count is proportional to the input size $n$: the relationship is linear. **Time complexity describes this relationship**, as the next section will explain.

### While loops

Like `for`, a `while` loop implements iteration. Before each iteration, it checks a condition: if true, execution continues; otherwise, the loop ends.

Here is a `while` loop computing $1 + 2 + \dots + n$:

```src
[file]{iteration}-[class]{}-[func]{while_loop}
```

**A `while` loop offers more flexibility than a `for` loop** in how its condition variables are initialized and updated.

For example, the following code updates the condition variable $i$ twice per iteration, which is less convenient to express with a `for` loop:

```src
[file]{iteration}-[class]{}-[func]{while_loop_ii}
```

In general, **`for` loops are more compact, while `while` loops are more flexible**. Both implement iteration; choose according to the problem's needs.

### Nested loops

We can place one loop inside another, as in the following `for`-loop example:

```src
[file]{iteration}-[class]{}-[func]{nested_for_loop}
```

The figure below shows the nested loop's flowchart.

![Flowchart of nested loops](iteration_and_recursion.assets/nested_iteration.png)

Here, the operation count is proportional to $n^2$: runtime has a quadratic relationship with input size $n$.

Adding further nesting increases the dimension each time, producing cubic, fourth-power, and higher-order time complexity.

## Recursion

 <u>Recursion</u> is an algorithmic strategy in which a function calls itself to solve a problem. It has two main phases.

1. **Descent**: The function calls itself more deeply, usually with smaller or simpler arguments, until a base case is reached.
2. **Return**: Once the base case is reached, calls return from the deepest level upward, combining results along the way.

In implementation, recursive code has three main elements.

1. **Base case**: Determines when descent stops and returning begins.
2. **Recursive call**: The function calls itself, usually with smaller or simpler arguments.
3. **Returned result**: The current level returns its result to the previous level.

In the following code, calling `recur(n)` computes $1 + 2 + \dots + n$:

```src
[file]{recursion}-[class]{}-[func]{recur}
```

The figure below illustrates the recursive process.

![Recursive process of the summation function](iteration_and_recursion.assets/recursion_sum.png)

Iteration and recursion can produce the same answer, **but represent two different ways of thinking about and solving a problem**.

- **Iteration** works bottom up, starting with basic steps and repeatedly performing or accumulating them until the task is complete.
- **Recursion** works top down, dividing the original problem into smaller subproblems of the same form, then repeating the division until reaching base cases with known solutions.

For the summation example, let $f(n) = 1 + 2 + \dots + n$.

- **Iteration**: Loop from $1$ to $n$, accumulating the sum at each step to obtain $f(n)$.
- **Recursion**: Decompose the problem as $f(n) = n + f(n-1)$ and keep doing so recursively until the base case $f(1) = 1$.

### The call stack

Each time a recursive function calls itself, the system allocates memory for the new call's local variables, return address, and other information. This has two consequences.

- The call's context is stored in a stack frame until it returns. **Recursion therefore usually uses more memory than iteration**.
- Each recursive call adds overhead. **Recursion is therefore usually slower than a loop**.

As shown in the figure below, before the base case is reached, $n$ recursive calls remain active at once: **the recursion depth is $n$**.

![Depth of recursive calls](iteration_and_recursion.assets/recursion_sum_depth.png)

Programming languages usually limit recursion depth, and excessively deep recursion may cause a stack overflow.

### Tail recursion

Interestingly, **if the recursive call is the last operation before a function returns**, a compiler or interpreter can optimize it to use as little space as iteration. This is called <u>tail recursion</u>.

- **Ordinary recursion**: After a call returns, its caller must continue executing code, so the caller's context must be preserved.
- **Tail recursion**: Nothing remains to be done after the recursive call returns, so the caller's context need not be retained.

For $1 + 2 + \dots + n$, passing the accumulated result `res` as a parameter gives a tail-recursive solution:

```src
[file]{recursion}-[class]{}-[func]{tail_recur}
```

The figure below illustrates tail recursion. Ordinary and tail recursion perform their additions at different points.

- **Ordinary recursion**: Addition occurs during the return phase, after each deeper call returns.
- **Tail recursion**: Addition occurs during descent; the return phase simply returns through the levels.

![Tail-recursive summation](iteration_and_recursion.assets/tail_recursion_sum.png)

!!! tip

    Many compilers and interpreters do not support tail-recursion optimization. Python, for example, does not optimize it by default, so even a tail-recursive function can run into a stack overflow.

### Recursion trees

For divide-and-conquer problems, recursion often provides a more intuitive approach and more readable code than iteration. Consider the Fibonacci sequence.

!!! question

    Given the Fibonacci sequence $0, 1, 1, 2, 3, 5, 8, 13, \dots$, find its $n$-th number.

Let $f(n)$ be its $n$-th number. Two facts follow.

- The first two numbers are $f(1) = 0$ and $f(2) = 1$.
- Every later number is the sum of the two preceding numbers: $f(n) = f(n - 1) + f(n - 2)$.

Use the recurrence for recursive calls and the first two numbers as base cases. Calling `fib(n)` then returns the $n$-th Fibonacci number:

```src
[file]{recursion}-[class]{}-[func]{fib}
```

The function makes two recursive calls, **so each call creates two branches**. Continuing this process produces a <u>recursion tree</u> with $n$ levels, as shown in the figure below.

![Recursion tree for the Fibonacci sequence](iteration_and_recursion.assets/recursion_tree.png)

Recursion embodies the idea of breaking a problem into smaller subproblems, a crucial divide-and-conquer strategy.

- In algorithms, searching, sorting, backtracking, divide and conquer, dynamic programming, and many other techniques use this idea directly or indirectly.
- In data structures, recursion naturally handles linked lists, trees, and graphs because divide-and-conquer reasoning suits them well.

## Comparing iteration and recursion

The table below summarizes their differences in implementation, performance, and suitability.

<p align="center"> Table <id> &nbsp; Comparing iteration and recursion </p>

|          | Iteration                                   | Recursion                                                         |
| -------- | -------------------------------------- | ------------------------------------------------------------ |
| Implementation | Loops                               | A function calls itself                                                 |
| Time efficiency | Usually high, with no function-call overhead           | Each call adds overhead                                     |
| Memory use | Usually a fixed amount of memory             | Accumulated calls may require many stack frames                           |
| Suitable problems | Simple repetitive tasks, with straightforward, readable code | Subproblem decomposition, including trees, graphs, divide and conquer, and backtracking; concise, clear structure |

!!! tip

    If the following discussion feels difficult, return to it after reading the section on stacks.

How are iteration and recursion connected? In the summation example, additions occur during the return phase. The first function called is the last to finish its addition, **matching a stack's last-in, first-out behavior**.

The terms call stack and stack frame already suggest this close relationship.

1. **Descent**: A function call adds a new stack frame to the call stack, holding local variables, parameters, the return address, and other data.
2. **Return**: When the function finishes, its frame is removed, restoring the caller's execution context.

Thus, **an explicit stack can simulate the call stack**, converting recursion into iteration:

```src
[file]{recursion}-[class]{}-[func]{for_loop_recur}
```

The resulting iterative code is more complicated. Although iteration and recursion can often be converted into each other, doing so is not always worthwhile.

- The converted code may be harder to understand and less readable.
- Simulating the call stack can be very difficult for complex problems.

**The choice between iteration and recursion depends on the problem**. In practice, weigh their strengths and weaknesses and choose the approach that fits the situation.
