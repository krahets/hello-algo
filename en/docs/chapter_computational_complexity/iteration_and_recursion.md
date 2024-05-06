---
comments: true
---

# 2.2 &nbsp; Iteration and recursion

In algorithms, the repeated execution of a task is quite common and is closely related to the analysis of complexity. Therefore, before delving into the concepts of time complexity and space complexity, let's first explore how to implement repetitive tasks in programming. This involves understanding two fundamental programming control structures: iteration and recursion.

## 2.2.1 &nbsp; Iteration

<u>Iteration</u> is a control structure for repeatedly performing a task. In iteration, a program repeats a block of code as long as a certain condition is met until this condition is no longer satisfied.

### 1. &nbsp; For loops

The `for` loop is one of the most common forms of iteration, and **it's particularly suitable when the number of iterations is known in advance**.

The following function uses a `for` loop to perform a summation of $1 + 2 + \dots + n$, with the sum being stored in the variable `res`. It's important to note that in Python, `range(a, b)` creates an interval that is inclusive of `a` but exclusive of `b`, meaning it iterates over the range from $a$ up to $b−1$.

=== "Python"

    ```python title="iteration.py"
    def for_loop(n: int) -> int:
        """for loop"""
        res = 0
        # Loop sum 1, 2, ..., n-1, n
        for i in range(1, n + 1):
            res += i
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* for loop */
    int forLoop(int n) {
        int res = 0;
        // Loop sum 1, 2, ..., n-1, n
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* for loop */
    int forLoop(int n) {
        int res = 0;
        // Loop sum 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    [class]{iteration}-[func]{ForLoop}
    ```

=== "Go"

    ```go title="iteration.go"
    [class]{}-[func]{forLoop}
    ```

=== "Swift"

    ```swift title="iteration.swift"
    [class]{}-[func]{forLoop}
    ```

=== "JS"

    ```javascript title="iteration.js"
    [class]{}-[func]{forLoop}
    ```

=== "TS"

    ```typescript title="iteration.ts"
    [class]{}-[func]{forLoop}
    ```

=== "Dart"

    ```dart title="iteration.dart"
    [class]{}-[func]{forLoop}
    ```

=== "Rust"

    ```rust title="iteration.rs"
    [class]{}-[func]{for_loop}
    ```

=== "C"

    ```c title="iteration.c"
    [class]{}-[func]{forLoop}
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    [class]{}-[func]{forLoop}
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    [class]{}-[func]{for_loop}
    ```

=== "Zig"

    ```zig title="iteration.zig"
    [class]{}-[func]{forLoop}
    ```

Figure 2-1 represents this sum function.

![Flowchart of the sum function](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-1 &nbsp; Flowchart of the sum function </p>

The number of operations in this summation function is proportional to the size of the input data $n$, or in other words, it has a linear relationship. **This "linear relationship" is what time complexity describes**. This topic will be discussed in more detail in the next section.

### 2. &nbsp; While loops

Similar to `for` loops, `while` loops are another approach for implementing iteration. In a `while` loop, the program checks a condition at the beginning of each iteration; if the condition is true, the execution continues, otherwise, the loop ends.

Below we use a `while` loop to implement the sum $1 + 2 + \dots + n$.

=== "Python"

    ```python title="iteration.py"
    def while_loop(n: int) -> int:
        """while loop"""
        res = 0
        i = 1  # Initialize condition variable
        # Loop sum 1, 2, ..., n-1, n
        while i <= n:
            res += i
            i += 1  # Update condition variable
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while loop */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Loop sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Update condition variable
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while loop */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Loop sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Update condition variable
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    [class]{iteration}-[func]{WhileLoop}
    ```

=== "Go"

    ```go title="iteration.go"
    [class]{}-[func]{whileLoop}
    ```

=== "Swift"

    ```swift title="iteration.swift"
    [class]{}-[func]{whileLoop}
    ```

=== "JS"

    ```javascript title="iteration.js"
    [class]{}-[func]{whileLoop}
    ```

=== "TS"

    ```typescript title="iteration.ts"
    [class]{}-[func]{whileLoop}
    ```

=== "Dart"

    ```dart title="iteration.dart"
    [class]{}-[func]{whileLoop}
    ```

=== "Rust"

    ```rust title="iteration.rs"
    [class]{}-[func]{while_loop}
    ```

=== "C"

    ```c title="iteration.c"
    [class]{}-[func]{whileLoop}
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    [class]{}-[func]{whileLoop}
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    [class]{}-[func]{while_loop}
    ```

=== "Zig"

    ```zig title="iteration.zig"
    [class]{}-[func]{whileLoop}
    ```

**`while` loops provide more flexibility than `for` loops**, especially since they allow for custom initialization and modification of the condition variable at each step.

For example, in the following code, the condition variable $i$ is updated twice each round, which would be inconvenient to implement with a `for` loop.

=== "Python"

    ```python title="iteration.py"
    def while_loop_ii(n: int) -> int:
        """while loop (two updates)"""
        res = 0
        i = 1  # Initialize condition variable
        # Loop sum 1, 4, 10, ...
        while i <= n:
            res += i
            # Update condition variable
            i += 1
            i *= 2
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while loop (two updates) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Loop sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while loop (two updates) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Loop sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    [class]{iteration}-[func]{WhileLoopII}
    ```

=== "Go"

    ```go title="iteration.go"
    [class]{}-[func]{whileLoopII}
    ```

=== "Swift"

    ```swift title="iteration.swift"
    [class]{}-[func]{whileLoopII}
    ```

=== "JS"

    ```javascript title="iteration.js"
    [class]{}-[func]{whileLoopII}
    ```

=== "TS"

    ```typescript title="iteration.ts"
    [class]{}-[func]{whileLoopII}
    ```

=== "Dart"

    ```dart title="iteration.dart"
    [class]{}-[func]{whileLoopII}
    ```

=== "Rust"

    ```rust title="iteration.rs"
    [class]{}-[func]{while_loop_ii}
    ```

=== "C"

    ```c title="iteration.c"
    [class]{}-[func]{whileLoopII}
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    [class]{}-[func]{whileLoopII}
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    [class]{}-[func]{while_loop_ii}
    ```

=== "Zig"

    ```zig title="iteration.zig"
    [class]{}-[func]{whileLoopII}
    ```

Overall, **`for` loops are more concise, while `while` loops are more flexible**. Both can implement iterative structures. Which one to use should be determined based on the specific requirements of the problem.

### 3. &nbsp; Nested loops

We can nest one loop structure within another. Below is an example using `for` loops:

=== "Python"

    ```python title="iteration.py"
    def nested_for_loop(n: int) -> str:
        """Double for loop"""
        res = ""
        # Loop i = 1, 2, ..., n-1, n
        for i in range(1, n + 1):
            # Loop j = 1, 2, ..., n-1, n
            for j in range(1, n + 1):
                res += f"({i}, {j}), "
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* Double for loop */
    string nestedForLoop(int n) {
        ostringstream res;
        // Loop i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; ++i) {
            // Loop j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; ++j) {
                res << "(" << i << ", " << j << "), ";
            }
        }
        return res.str();
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* Double for loop */
    String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // Loop i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Loop j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    [class]{iteration}-[func]{NestedForLoop}
    ```

=== "Go"

    ```go title="iteration.go"
    [class]{}-[func]{nestedForLoop}
    ```

=== "Swift"

    ```swift title="iteration.swift"
    [class]{}-[func]{nestedForLoop}
    ```

=== "JS"

    ```javascript title="iteration.js"
    [class]{}-[func]{nestedForLoop}
    ```

=== "TS"

    ```typescript title="iteration.ts"
    [class]{}-[func]{nestedForLoop}
    ```

=== "Dart"

    ```dart title="iteration.dart"
    [class]{}-[func]{nestedForLoop}
    ```

=== "Rust"

    ```rust title="iteration.rs"
    [class]{}-[func]{nested_for_loop}
    ```

=== "C"

    ```c title="iteration.c"
    [class]{}-[func]{nestedForLoop}
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    [class]{}-[func]{nestedForLoop}
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    [class]{}-[func]{nested_for_loop}
    ```

=== "Zig"

    ```zig title="iteration.zig"
    [class]{}-[func]{nestedForLoop}
    ```

Figure 2-2 represents this nested loop.

![Flowchart of the nested loop](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-2 &nbsp; Flowchart of the nested loop </p>

In such cases, the number of operations of the function is proportional to $n^2$, meaning the algorithm's runtime and the size of the input data $n$ has a 'quadratic relationship.'

We can further increase the complexity by adding more nested loops, each level of nesting effectively "increasing the dimension," which raises the time complexity to "cubic," "quartic," and so on.

## 2.2.2 &nbsp; Recursion

<u>Recursion</u> is an algorithmic strategy where a function solves a problem by calling itself. It primarily involves two phases:

1. **Calling**: This is where the program repeatedly calls itself, often with progressively smaller or simpler arguments, moving towards the "termination condition."
2. **Returning**: Upon triggering the "termination condition," the program begins to return from the deepest recursive function, aggregating the results of each layer.

From an implementation perspective, recursive code mainly includes three elements.

1. **Termination Condition**: Determines when to switch from "calling" to "returning."
2. **Recursive Call**: Corresponds to "calling," where the function calls itself, usually with smaller or more simplified parameters.
3. **Return Result**: Corresponds to "returning," where the result of the current recursion level is returned to the previous layer.

Observe the following code, where simply calling the function `recur(n)` can compute the sum of $1 + 2 + \dots + n$:

=== "Python"

    ```python title="recursion.py"
    def recur(n: int) -> int:
        """Recursion"""
        # Termination condition
        if n == 1:
            return 1
        # Recursive: recursive call
        res = recur(n - 1)
        # Return: return result
        return n + res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Recursion */
    int recur(int n) {
        // Termination condition
        if (n == 1)
            return 1;
        // Recursive: recursive call
        int res = recur(n - 1);
        // Return: return result
        return n + res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Recursion */
    int recur(int n) {
        // Termination condition
        if (n == 1)
            return 1;
        // Recursive: recursive call
        int res = recur(n - 1);
        // Return: return result
        return n + res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    [class]{recursion}-[func]{Recur}
    ```

=== "Go"

    ```go title="recursion.go"
    [class]{}-[func]{recur}
    ```

=== "Swift"

    ```swift title="recursion.swift"
    [class]{}-[func]{recur}
    ```

=== "JS"

    ```javascript title="recursion.js"
    [class]{}-[func]{recur}
    ```

=== "TS"

    ```typescript title="recursion.ts"
    [class]{}-[func]{recur}
    ```

=== "Dart"

    ```dart title="recursion.dart"
    [class]{}-[func]{recur}
    ```

=== "Rust"

    ```rust title="recursion.rs"
    [class]{}-[func]{recur}
    ```

=== "C"

    ```c title="recursion.c"
    [class]{}-[func]{recur}
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    [class]{}-[func]{recur}
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    [class]{}-[func]{recur}
    ```

=== "Zig"

    ```zig title="recursion.zig"
    [class]{}-[func]{recur}
    ```

Figure 2-3 shows the recursive process of this function.

![Recursive process of the sum function](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-3 &nbsp; Recursive process of the sum function </p>

Although iteration and recursion can achieve the same results from a computational standpoint, **they represent two entirely different paradigms of thinking and problem-solving**.

- **Iteration**: Solves problems "from the bottom up." It starts with the most basic steps, and then repeatedly adds or accumulates these steps until the task is complete.
- **Recursion**: Solves problems "from the top down." It breaks down the original problem into smaller sub-problems, each of which has the same form as the original problem. These sub-problems are then further decomposed into even smaller sub-problems, stopping at the base case whose solution is known.

Let's take the earlier example of the summation function, defined as $f(n) = 1 + 2 + \dots + n$.

- **Iteration**: In this approach, we simulate the summation process within a loop. Starting from $1$ and traversing to $n$, we perform the summation operation in each iteration to eventually compute $f(n)$.
- **Recursion**: Here, the problem is broken down into a sub-problem: $f(n) = n + f(n-1)$. This decomposition continues recursively until reaching the base case, $f(1) = 1$, at which point the recursion terminates.

### 1. &nbsp; Call stack

Every time a recursive function calls itself, the system allocates memory for the newly initiated function to store local variables, the return address, and other relevant information. This leads to two primary outcomes.

- The function's context data is stored in a memory area called "stack frame space" and is only released after the function returns. Therefore, **recursion generally consumes more memory space than iteration**.
- Recursive calls introduce additional overhead. **Hence, recursion is usually less time-efficient than loops.**

As shown in Figure 2-4, there are $n$ unreturned recursive functions before triggering the termination condition, indicating a **recursion depth of $n$**.

![Recursion call depth](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> Figure 2-4 &nbsp; Recursion call depth </p>

In practice, the depth of recursion allowed by programming languages is usually limited, and excessively deep recursion can lead to stack overflow errors.

### 2. &nbsp; Tail recursion

Interestingly, **if a function performs its recursive call as the very last step before returning,** it can be optimized by the compiler or interpreter to be as space-efficient as iteration. This scenario is known as <u>tail recursion</u>.

- **Regular recursion**: In standard recursion, when the function returns to the previous level, it continues to execute more code, requiring the system to save the context of the previous call.
- **Tail recursion**: Here, the recursive call is the final operation before the function returns. This means that upon returning to the previous level, no further actions are needed, so the system does not need to save the context of the previous level.

For example, in calculating $1 + 2 + \dots + n$, we can make the result variable `res` a parameter of the function, thereby achieving tail recursion:

=== "Python"

    ```python title="recursion.py"
    def tail_recur(n, res):
        """Tail recursion"""
        # Termination condition
        if n == 0:
            return res
        # Tail recursive call
        return tail_recur(n - 1, res + n)
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Tail recursion */
    int tailRecur(int n, int res) {
        // Termination condition
        if (n == 0)
            return res;
        // Tail recursive call
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Tail recursion */
    int tailRecur(int n, int res) {
        // Termination condition
        if (n == 0)
            return res;
        // Tail recursive call
        return tailRecur(n - 1, res + n);
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    [class]{recursion}-[func]{TailRecur}
    ```

=== "Go"

    ```go title="recursion.go"
    [class]{}-[func]{tailRecur}
    ```

=== "Swift"

    ```swift title="recursion.swift"
    [class]{}-[func]{tailRecur}
    ```

=== "JS"

    ```javascript title="recursion.js"
    [class]{}-[func]{tailRecur}
    ```

=== "TS"

    ```typescript title="recursion.ts"
    [class]{}-[func]{tailRecur}
    ```

=== "Dart"

    ```dart title="recursion.dart"
    [class]{}-[func]{tailRecur}
    ```

=== "Rust"

    ```rust title="recursion.rs"
    [class]{}-[func]{tail_recur}
    ```

=== "C"

    ```c title="recursion.c"
    [class]{}-[func]{tailRecur}
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    [class]{}-[func]{tailRecur}
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    [class]{}-[func]{tail_recur}
    ```

=== "Zig"

    ```zig title="recursion.zig"
    [class]{}-[func]{tailRecur}
    ```

The execution process of tail recursion is shown in Figure 2-5. Comparing regular recursion and tail recursion, the point of the summation operation is different.

- **Regular recursion**: The summation operation occurs during the "returning" phase, requiring another summation after each layer returns.
- **Tail recursion**: The summation operation occurs during the "calling" phase, and the "returning" phase only involves returning through each layer.

![Tail recursion process](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-5 &nbsp; Tail recursion process </p>

!!! tip

    Note that many compilers or interpreters do not support tail recursion optimization. For example, Python does not support tail recursion optimization by default, so even if the function is in the form of tail recursion, it may still encounter stack overflow issues.

### 3. &nbsp; Recursion tree

When dealing with algorithms related to "divide and conquer", recursion often offers a more intuitive approach and more readable code than iteration. Take the "Fibonacci sequence" as an example.

!!! question

    Given a Fibonacci sequence $0, 1, 1, 2, 3, 5, 8, 13, \dots$, find the $n$th number in the sequence.

Let the $n$th number of the Fibonacci sequence be $f(n)$, it's easy to deduce two conclusions:

- The first two numbers of the sequence are $f(1) = 0$ and $f(2) = 1$.
- Each number in the sequence is the sum of the two preceding ones, that is, $f(n) = f(n - 1) + f(n - 2)$.

Using the recursive relation, and considering the first two numbers as termination conditions, we can write the recursive code. Calling `fib(n)` will yield the $n$th number of the Fibonacci sequence:

=== "Python"

    ```python title="recursion.py"
    def fib(n: int) -> int:
        """Fibonacci sequence: Recursion"""
        # Termination condition f(1) = 0, f(2) = 1
        if n == 1 or n == 2:
            return n - 1
        # Recursive call f(n) = f(n-1) + f(n-2)
        res = fib(n - 1) + fib(n - 2)
        # Return result f(n)
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Fibonacci sequence: Recursion */
    int fib(int n) {
        // Termination condition f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Recursive call f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Return result f(n)
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Fibonacci sequence: Recursion */
    int fib(int n) {
        // Termination condition f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Recursive call f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Return result f(n)
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    [class]{recursion}-[func]{Fib}
    ```

=== "Go"

    ```go title="recursion.go"
    [class]{}-[func]{fib}
    ```

=== "Swift"

    ```swift title="recursion.swift"
    [class]{}-[func]{fib}
    ```

=== "JS"

    ```javascript title="recursion.js"
    [class]{}-[func]{fib}
    ```

=== "TS"

    ```typescript title="recursion.ts"
    [class]{}-[func]{fib}
    ```

=== "Dart"

    ```dart title="recursion.dart"
    [class]{}-[func]{fib}
    ```

=== "Rust"

    ```rust title="recursion.rs"
    [class]{}-[func]{fib}
    ```

=== "C"

    ```c title="recursion.c"
    [class]{}-[func]{fib}
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    [class]{}-[func]{fib}
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    [class]{}-[func]{fib}
    ```

=== "Zig"

    ```zig title="recursion.zig"
    [class]{}-[func]{fib}
    ```

Observing the above code, we see that it recursively calls two functions within itself, **meaning that one call generates two branching calls**. As illustrated in Figure 2-6, this continuous recursive calling eventually creates a <u>recursion tree</u> with a depth of $n$.

![Fibonacci sequence recursion tree](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> Figure 2-6 &nbsp; Fibonacci sequence recursion tree </p>

Fundamentally, recursion embodies the paradigm of "breaking down a problem into smaller sub-problems." This divide-and-conquer strategy is crucial.

- From an algorithmic perspective, many important strategies like searching, sorting, backtracking, divide-and-conquer, and dynamic programming directly or indirectly use this way of thinking.
- From a data structure perspective, recursion is naturally suited for dealing with linked lists, trees, and graphs, as they are well suited for analysis using the divide-and-conquer approach.

## 2.2.3 &nbsp; Comparison

Summarizing the above content, the following table shows the differences between iteration and recursion in terms of implementation, performance, and applicability.

<p align="center"> Table: Comparison of iteration and recursion characteristics </p>

<div class="center-table" markdown>

|                   | Iteration                                                   | Recursion                                                                                                                        |
| ----------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Approach          | Loop structure                                              | Function calls itself                                                                                                            |
| Time Efficiency   | Generally higher efficiency, no function call overhead      | Each function call generates overhead                                                                                            |
| Memory Usage      | Typically uses a fixed size of memory space                 | Accumulative function calls can use a substantial amount of stack frame space                                                    |
| Suitable Problems | Suitable for simple loop tasks, intuitive and readable code | Suitable for problem decomposition, like trees, graphs, divide-and-conquer, backtracking, etc., concise and clear code structure |

</div>

!!! tip

    If you find the following content difficult to understand, consider revisiting it after reading the "Stack" chapter.

So, what is the intrinsic connection between iteration and recursion? Taking the above recursive function as an example, the summation operation occurs during the recursion's "return" phase. This means that the initially called function is the last to complete its summation operation, **mirroring the "last in, first out" principle of a stack**.

Recursive terms like "call stack" and "stack frame space" hint at the close relationship between recursion and stacks.

1. **Calling**: When a function is called, the system allocates a new stack frame on the "call stack" for that function, storing local variables, parameters, return addresses, and other data.
2. **Returning**: When a function completes execution and returns, the corresponding stack frame is removed from the "call stack," restoring the execution environment of the previous function.

Therefore, **we can use an explicit stack to simulate the behavior of the call stack**, thus transforming recursion into an iterative form:

=== "Python"

    ```python title="recursion.py"
    def for_loop_recur(n: int) -> int:
        """Simulate recursion with iteration"""
        # Use an explicit stack to simulate the system call stack
        stack = []
        res = 0
        # Recursive: recursive call
        for i in range(n, 0, -1):
            # Simulate "recursive" by "pushing onto the stack"
            stack.append(i)
        # Return: return result
        while stack:
            # Simulate "return" by "popping from the stack"
            res += stack.pop()
        # res = 1+2+3+...+n
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Simulate recursion with iteration */
    int forLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        stack<int> stack;
        int res = 0;
        // Recursive: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recursive" by "pushing onto the stack"
            stack.push(i);
        }
        // Return: return result
        while (!stack.empty()) {
            // Simulate "return" by "popping from the stack"
            res += stack.top();
            stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Simulate recursion with iteration */
    int forLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Recursive: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recursive" by "pushing onto the stack"
            stack.push(i);
        }
        // Return: return result
        while (!stack.isEmpty()) {
            // Simulate "return" by "popping from the stack"
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    [class]{recursion}-[func]{ForLoopRecur}
    ```

=== "Go"

    ```go title="recursion.go"
    [class]{}-[func]{forLoopRecur}
    ```

=== "Swift"

    ```swift title="recursion.swift"
    [class]{}-[func]{forLoopRecur}
    ```

=== "JS"

    ```javascript title="recursion.js"
    [class]{}-[func]{forLoopRecur}
    ```

=== "TS"

    ```typescript title="recursion.ts"
    [class]{}-[func]{forLoopRecur}
    ```

=== "Dart"

    ```dart title="recursion.dart"
    [class]{}-[func]{forLoopRecur}
    ```

=== "Rust"

    ```rust title="recursion.rs"
    [class]{}-[func]{for_loop_recur}
    ```

=== "C"

    ```c title="recursion.c"
    [class]{}-[func]{forLoopRecur}
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    [class]{}-[func]{forLoopRecur}
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    [class]{}-[func]{for_loop_recur}
    ```

=== "Zig"

    ```zig title="recursion.zig"
    [class]{}-[func]{forLoopRecur}
    ```

Observing the above code, when recursion is transformed into iteration, the code becomes more complex. Although iteration and recursion can often be transformed into each other, it's not always advisable to do so for two reasons:

- The transformed code may become more challenging to understand and less readable.
- For some complex problems, simulating the behavior of the system's call stack can be quite challenging.

In conclusion, **whether to choose iteration or recursion depends on the specific nature of the problem**. In programming practice, it's crucial to weigh the pros and cons of both and choose the most suitable approach for the situation at hand.
