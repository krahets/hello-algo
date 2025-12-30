# Iteration and Recursion

In algorithms, repeatedly executing a task is very common and closely related to complexity analysis. Therefore, before introducing time complexity and space complexity, let's first understand how to implement repeated task execution in programs, namely the two basic program control structures: iteration and recursion.

## Iteration

<u>Iteration</u> is a control structure for repeatedly executing a task. In iteration, a program repeatedly executes a segment of code under certain conditions until those conditions are no longer satisfied.

### For Loop

The `for` loop is one of the most common forms of iteration, **suitable for use when the number of iterations is known in advance**.

The following function implements the summation $1 + 2 + \dots + n$ based on a `for` loop, with the sum result recorded using the variable `res`. Note that in Python, `range(a, b)` corresponds to a "left-closed, right-open" interval, with the traversal range being $a, a + 1, \dots, b-1$:

```src
[file]{iteration}-[class]{}-[func]{for_loop}
```

The figure below shows the flowchart of this summation function.

![Flowchart of the summation function](iteration_and_recursion.assets/iteration.png)

The number of operations in this summation function is proportional to the input data size $n$, or has a "linear relationship". In fact, **time complexity describes precisely this "linear relationship"**. Related content will be introduced in detail in the next section.

### While Loop

Similar to the `for` loop, the `while` loop is also a method for implementing iteration. In a `while` loop, the program first checks the condition in each round; if the condition is true, it continues execution, otherwise it ends the loop.

Below we use a `while` loop to implement the summation $1 + 2 + \dots + n$:

```src
[file]{iteration}-[class]{}-[func]{while_loop}
```

**The `while` loop has greater flexibility than the `for` loop**. In a `while` loop, we can freely design the initialization and update steps of the condition variable.

For example, in the following code, the condition variable $i$ is updated twice per round, which is not convenient to implement using a `for` loop:

```src
[file]{iteration}-[class]{}-[func]{while_loop_ii}
```

Overall, **`for` loops have more compact code, while `while` loops are more flexible**; both can implement iterative structures. The choice of which to use should be determined based on the requirements of the specific problem.

### Nested Loops

We can nest one loop structure inside another. Below is an example using `for` loops:

```src
[file]{iteration}-[class]{}-[func]{nested_for_loop}
```

The figure below shows the flowchart of this nested loop.

![Flowchart of nested loops](iteration_and_recursion.assets/nested_iteration.png)

In this case, the number of operations of the function is proportional to $n^2$, or the algorithm's running time has a "quadratic relationship" with the input data size $n$.

We can continue adding nested loops, where each nesting is a "dimension increase", raising the time complexity to "cubic relationship", "quartic relationship", and so on.

## Recursion

<u>Recursion</u> is an algorithmic strategy that solves problems by having a function call itself. It mainly consists of two phases.

1. **Descend**: The program continuously calls itself deeper, usually passing in smaller or more simplified parameters, until reaching a "termination condition".
2. **Ascend**: After triggering the "termination condition", the program returns layer by layer from the deepest recursive function, aggregating the result of each layer.

From an implementation perspective, recursive code mainly consists of three elements.

1. **Termination condition**: Used to determine when to switch from "descending" to "ascending".
2. **Recursive call**: Corresponds to "descending", where the function calls itself, usually with smaller or more simplified parameters.
3. **Return result**: Corresponds to "ascending", returning the result of the current recursion level to the previous layer.

Observe the following code. We only need to call the function `recur(n)` to complete the calculation of $1 + 2 + \dots + n$:

```src
[file]{recursion}-[class]{}-[func]{recur}
```

The figure below shows the recursive process of this function.

![Recursive process of the summation function](iteration_and_recursion.assets/recursion_sum.png)

Although from a computational perspective, iteration and recursion can achieve the same results, **they represent two completely different paradigms for thinking about and solving problems**.

- **Iteration**: Solves problems "bottom-up". Starting from the most basic steps, these steps are then repeatedly executed or accumulated until the task is complete.
- **Recursion**: Solves problems "top-down". The original problem is decomposed into smaller subproblems that have the same form as the original problem. These subproblems continue to be decomposed into even smaller subproblems until reaching the base case (where the solution is known).

Taking the above summation function as an example, let the problem be $f(n) = 1 + 2 + \dots + n$.

- **Iteration**: Simulates the summation process in a loop, traversing from $1$ to $n$, performing the summation operation in each round to obtain $f(n)$.
- **Recursion**: Decomposes the problem into the subproblem $f(n) = n + f(n-1)$, continuously decomposing (recursively) until terminating at the base case $f(1) = 1$.

### Call Stack

Each time a recursive function calls itself, the system allocates memory for the newly opened function to store local variables, call addresses, and other information. This leads to two consequences.

- The function's context data is stored in a memory area called "stack frame space", which is not released until the function returns. Therefore, **recursion usually consumes more memory space than iteration**.
- Recursive function calls incur additional overhead. **Therefore, recursion is usually less time-efficient than loops**.

As shown in the figure below, before the termination condition is triggered, there are $n$ unreturned recursive functions existing simultaneously, with a **recursion depth of $n$**.

![Recursion call depth](iteration_and_recursion.assets/recursion_sum_depth.png)

In practice, the recursion depth allowed by programming languages is usually limited, and excessively deep recursion may lead to stack overflow errors.

### Tail Recursion

Interestingly, **if a function makes the recursive call as the very last step before returning**, the function can be optimized by the compiler or interpreter to have space efficiency comparable to iteration. This case is called <u>tail recursion</u>.

- **Regular recursion**: When a function returns to the previous level, it needs to continue executing code, so the system needs to save the context of the previous layer's call.
- **Tail recursion**: The recursive call is the last operation before the function returns, meaning that after returning to the previous level, there is no need to continue executing other operations, so the system does not need to save the context of the previous layer's function.

Taking the calculation of $1 + 2 + \dots + n$ as an example, we can set the result variable `res` as a function parameter to implement tail recursion:

```src
[file]{recursion}-[class]{}-[func]{tail_recur}
```

The execution process of tail recursion is shown in the figure below. Comparing regular recursion and tail recursion, the execution point of the summation operation is different.

- **Regular recursion**: The summation operation is performed during the "ascending" process, requiring an additional summation operation after each layer returns.
- **Tail recursion**: The summation operation is performed during the "descending" process; the "ascending" process only needs to return layer by layer.

![Tail recursion process](iteration_and_recursion.assets/tail_recursion_sum.png)

!!! tip

    Please note that many compilers or interpreters do not support tail recursion optimization. For example, Python does not support tail recursion optimization by default, so even if a function is in tail recursive form, it may still encounter stack overflow issues.

### Recursion Tree

When dealing with algorithmic problems related to "divide and conquer", recursion often provides a more intuitive approach and more readable code than iteration. Taking the "Fibonacci sequence" as an example.

!!! question

    Given a Fibonacci sequence $0, 1, 1, 2, 3, 5, 8, 13, \dots$, find the $n$-th number in the sequence.

Let the $n$-th number of the Fibonacci sequence be $f(n)$. Two conclusions can be easily obtained.

- The first two numbers of the sequence are $f(1) = 0$ and $f(2) = 1$.
- Each number in the sequence is the sum of the previous two numbers, i.e., $f(n) = f(n - 1) + f(n - 2)$.

Following the recurrence relation to make recursive calls, with the first two numbers as termination conditions, we can write the recursive code. Calling `fib(n)` will give us the $n$-th number of the Fibonacci sequence:

```src
[file]{recursion}-[class]{}-[func]{fib}
```

Observing the above code, we recursively call two functions within the function, **meaning that one call produces two call branches**. As shown in the figure below, such continuous recursive calling will eventually produce a <u>recursion tree</u> with $n$ levels.

![Recursion tree of the Fibonacci sequence](iteration_and_recursion.assets/recursion_tree.png)

Fundamentally, recursion embodies the paradigm of "decomposing a problem into smaller subproblems", and this divide-and-conquer strategy is crucial.

- From an algorithmic perspective, many important algorithmic strategies such as searching, sorting, backtracking, divide and conquer, and dynamic programming directly or indirectly apply this way of thinking.
- From a data structure perspective, recursion is naturally suited for handling problems related to linked lists, trees, and graphs, because they are well-suited for analysis using divide-and-conquer thinking.

## Comparison of the Two

Summarizing the above content, as shown in the table below, iteration and recursion differ in implementation, performance, and applicability.

<p align="center"> Table <id> &nbsp; Comparison of iteration and recursion characteristics </p>

|                | Iteration                                                | Recursion                                                                              |
| -------------- | -------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| Implementation | Loop structure                                           | Function calls itself                                                                  |
| Time efficiency | Generally more efficient, no function call overhead      | Each function call incurs overhead                                                     |
| Memory usage   | Usually uses a fixed amount of memory space              | Accumulated function calls may use a large amount of stack frame space                 |
| Suitable problems | Suitable for simple loop tasks, with intuitive and readable code | Suitable for subproblem decomposition, such as trees, graphs, divide and conquer, backtracking, etc., with concise and clear code structure |

!!! tip

    If you find the following content difficult to understand, you can review it after reading the "Stack" chapter.

What is the intrinsic relationship between iteration and recursion? Taking the above recursive function as an example, the summation operation is performed during the "ascending" phase of recursion. This means that the function called first actually completes its summation operation last, **and this working mechanism is similar to the "last-in, first-out" principle of stacks**.

In fact, recursive terminology such as "call stack" and "stack frame space" already hints at the close relationship between recursion and stacks.

1. **Descend**: When a function is called, the system allocates a new stack frame on the "call stack" for that function to store the function's local variables, parameters, return address, and other data.
2. **Ascend**: When the function completes execution and returns, the corresponding stack frame is removed from the "call stack", restoring the execution environment of the previous function.

Therefore, **we can use an explicit stack to simulate the behavior of the call stack**, thus transforming recursion into iterative form:

```src
[file]{recursion}-[class]{}-[func]{for_loop_recur}
```

Observing the above code, when recursion is transformed into iteration, the code becomes more complex. Although iteration and recursion can be converted into each other in many cases, it may not be worthwhile to do so for the following two reasons.

- The transformed code may be more difficult to understand and less readable.
- For some complex problems, simulating the behavior of the system call stack can be very difficult.

In summary, **choosing between iteration and recursion depends on the nature of the specific problem**. In programming practice, it is crucial to weigh the pros and cons of both and choose the appropriate method based on the context.
