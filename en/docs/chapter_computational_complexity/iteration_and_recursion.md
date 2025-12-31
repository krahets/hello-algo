---
comments: true
---

# 2.2 &nbsp; Iteration and Recursion

In algorithms, repeatedly executing a task is very common and closely related to complexity analysis. Therefore, before introducing time complexity and space complexity, let's first understand how to implement repeated task execution in programs, namely the two basic program control structures: iteration and recursion.

## 2.2.1 &nbsp; Iteration

<u>Iteration</u> is a control structure for repeatedly executing a task. In iteration, a program repeatedly executes a segment of code under certain conditions until those conditions are no longer satisfied.

### 1. &nbsp; For Loop

The `for` loop is one of the most common forms of iteration, **suitable for use when the number of iterations is known in advance**.

The following function implements the summation $1 + 2 + \dots + n$ based on a `for` loop, with the sum result recorded using the variable `res`. Note that in Python, `range(a, b)` corresponds to a "left-closed, right-open" interval, with the traversal range being $a, a + 1, \dots, b-1$:

=== "Python"

    ```python title="iteration.py"
    def for_loop(n: int) -> int:
        """for loop"""
        res = 0
        # Sum 1, 2, ..., n-1, n
        for i in range(1, n + 1):
            res += i
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* for loop */
    int forLoop(int n) {
        int res = 0;
        // Sum 1, 2, ..., n-1, n
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
        // Sum 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* for loop */
    int ForLoop(int n) {
        int res = 0;
        // Sum 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* for loop */
    func forLoop(n int) int {
        res := 0
        // Sum 1, 2, ..., n-1, n
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* for loop */
    func forLoop(n: Int) -> Int {
        var res = 0
        // Sum 1, 2, ..., n-1, n
        for i in 1 ... n {
            res += i
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* for loop */
    function forLoop(n) {
        let res = 0;
        // Sum 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* for loop */
    function forLoop(n: number): number {
        let res = 0;
        // Sum 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* for loop */
    int forLoop(int n) {
      int res = 0;
      // Sum 1, 2, ..., n-1, n
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* for loop */
    fn for_loop(n: i32) -> i32 {
        let mut res = 0;
        // Sum 1, 2, ..., n-1, n
        for i in 1..=n {
            res += i;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* for loop */
    int forLoop(int n) {
        int res = 0;
        // Sum 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* for loop */
    fun forLoop(n: Int): Int {
        var res = 0
        // Sum 1, 2, ..., n-1, n
        for (i in 1..n) {
            res += i
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### for loop ###
    def for_loop(n)
      res = 0

      # Sum 1, 2, ..., n-1, n
      for i in 1..n
        res += i
      end

      res
    end
    ```

Figure 2-1 shows the flowchart of this summation function.

![Flowchart of the summation function](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-1 &nbsp; Flowchart of the summation function </p>

The number of operations in this summation function is proportional to the input data size $n$, or has a "linear relationship". In fact, **time complexity describes precisely this "linear relationship"**. Related content will be introduced in detail in the next section.

### 2. &nbsp; While Loop

Similar to the `for` loop, the `while` loop is also a method for implementing iteration. In a `while` loop, the program first checks the condition in each round; if the condition is true, it continues execution, otherwise it ends the loop.

Below we use a `while` loop to implement the summation $1 + 2 + \dots + n$:

=== "Python"

    ```python title="iteration.py"
    def while_loop(n: int) -> int:
        """while loop"""
        res = 0
        i = 1  # Initialize condition variable
        # Sum 1, 2, ..., n-1, n
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
        // Sum 1, 2, ..., n-1, n
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
        // Sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Update condition variable
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* while loop */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // Update condition variable
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while loop */
    func whileLoop(n int) int {
        res := 0
        // Initialize condition variable
        i := 1
        // Sum 1, 2, ..., n-1, n
        for i <= n {
            res += i
            // Update condition variable
            i++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while loop */
    func whileLoop(n: Int) -> Int {
        var res = 0
        var i = 1 // Initialize condition variable
        // Sum 1, 2, ..., n-1, n
        while i <= n {
            res += i
            i += 1 // Update condition variable
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while loop */
    function whileLoop(n) {
        let res = 0;
        let i = 1; // Initialize condition variable
        // Sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Update condition variable
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while loop */
    function whileLoop(n: number): number {
        let res = 0;
        let i = 1; // Initialize condition variable
        // Sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Update condition variable
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while loop */
    int whileLoop(int n) {
      int res = 0;
      int i = 1; // Initialize condition variable
      // Sum 1, 2, ..., n-1, n
      while (i <= n) {
        res += i;
        i++; // Update condition variable
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while loop */
    fn while_loop(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // Initialize condition variable

        // Sum 1, 2, ..., n-1, n
        while i <= n {
            res += i;
            i += 1; // Update condition variable
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while loop */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Update condition variable
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while loop */
    fun whileLoop(n: Int): Int {
        var res = 0
        var i = 1 // Initialize condition variable
        // Sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i
            i++ // Update condition variable
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### while loop ###
    def while_loop(n)
      res = 0
      i = 1 # Initialize condition variable

      # Sum 1, 2, ..., n-1, n
      while i <= n
        res += i
        i += 1 # Update condition variable
      end

      res
    end
    ```

**The `while` loop has greater flexibility than the `for` loop**. In a `while` loop, we can freely design the initialization and update steps of the condition variable.

For example, in the following code, the condition variable $i$ is updated twice per round, which is not convenient to implement using a `for` loop:

=== "Python"

    ```python title="iteration.py"
    def while_loop_ii(n: int) -> int:
        """while loop (two updates)"""
        res = 0
        i = 1  # Initialize condition variable
        # Sum 1, 4, 10, ...
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
        // Sum 1, 4, 10, ...
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
        // Sum 1, 4, 10, ...
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
    /* while loop (two updates) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i += 1; 
            i *= 2;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while loop (two updates) */
    func whileLoopII(n int) int {
        res := 0
        // Initialize condition variable
        i := 1
        // Sum 1, 4, 10, ...
        for i <= n {
            res += i
            // Update condition variable
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while loop (two updates) */
    func whileLoopII(n: Int) -> Int {
        var res = 0
        var i = 1 // Initialize condition variable
        // Sum 1, 4, 10, ...
        while i <= n {
            res += i
            // Update condition variable
            i += 1
            i *= 2
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while loop (two updates) */
    function whileLoopII(n) {
        let res = 0;
        let i = 1; // Initialize condition variable
        // Sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while loop (two updates) */
    function whileLoopII(n: number): number {
        let res = 0;
        let i = 1; // Initialize condition variable
        // Sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while loop (two updates) */
    int whileLoopII(int n) {
      int res = 0;
      int i = 1; // Initialize condition variable
      // Sum 1, 4, 10, ...
      while (i <= n) {
        res += i;
        // Update condition variable
        i++;
        i *= 2;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while loop (two updates) */
    fn while_loop_ii(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // Initialize condition variable

        // Sum 1, 4, 10, ...
        while i <= n {
            res += i;
            // Update condition variable
            i += 1;
            i *= 2;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while loop (two updates) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while loop (two updates) */
    fun whileLoopII(n: Int): Int {
        var res = 0
        var i = 1 // Initialize condition variable
        // Sum 1, 4, 10, ...
        while (i <= n) {
            res += i
            // Update condition variable
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### while loop (two updates) ###
    def while_loop_ii(n)
      res = 0
      i = 1 # Initialize condition variable

      # Sum 1, 4, 10, ...
      while i <= n
        res += i
        # Update condition variable
        i += 1
        i *= 2
      end

      res
    end
    ```

Overall, **`for` loops have more compact code, while `while` loops are more flexible**; both can implement iterative structures. The choice of which to use should be determined based on the requirements of the specific problem.

### 3. &nbsp; Nested Loops

We can nest one loop structure inside another. Below is an example using `for` loops:

=== "Python"

    ```python title="iteration.py"
    def nested_for_loop(n: int) -> str:
        """Nested for loop"""
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
    /* Nested for loop */
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
    /* Nested for loop */
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
    /* Nested for loop */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // Loop i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Loop j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* Nested for loop */
    func nestedForLoop(n int) string {
        res := ""
        // Loop i = 1, 2, ..., n-1, n
        for i := 1; i <= n; i++ {
            for j := 1; j <= n; j++ {
                // Loop j = 1, 2, ..., n-1, n
                res += fmt.Sprintf("(%d, %d), ", i, j)
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* Nested for loop */
    func nestedForLoop(n: Int) -> String {
        var res = ""
        // Loop i = 1, 2, ..., n-1, n
        for i in 1 ... n {
            // Loop j = 1, 2, ..., n-1, n
            for j in 1 ... n {
                res.append("(\(i), \(j)), ")
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* Nested for loop */
    function nestedForLoop(n) {
        let res = '';
        // Loop i = 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            // Loop j = 1, 2, ..., n-1, n
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* Nested for loop */
    function nestedForLoop(n: number): string {
        let res = '';
        // Loop i = 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            // Loop j = 1, 2, ..., n-1, n
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* Nested for loop */
    String nestedForLoop(int n) {
      String res = "";
      // Loop i = 1, 2, ..., n-1, n
      for (int i = 1; i <= n; i++) {
        // Loop j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; j++) {
          res += "($i, $j), ";
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* Nested for loop */
    fn nested_for_loop(n: i32) -> String {
        let mut res = vec![];
        // Loop i = 1, 2, ..., n-1, n
        for i in 1..=n {
            // Loop j = 1, 2, ..., n-1, n
            for j in 1..=n {
                res.push(format!("({}, {}), ", i, j));
            }
        }
        res.join("")
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* Nested for loop */
    char *nestedForLoop(int n) {
        // n * n is the number of points, "(i, j), " string max length is 6+10*2, plus extra space for null character \0
        int size = n * n * 26 + 1;
        char *res = malloc(size * sizeof(char));
        // Loop i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Loop j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                char tmp[26];
                snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
                strncat(res, tmp, size - strlen(res) - 1);
            }
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* Nested for loop */
    fun nestedForLoop(n: Int): String {
        val res = StringBuilder()
        // Loop i = 1, 2, ..., n-1, n
        for (i in 1..n) {
            // Loop j = 1, 2, ..., n-1, n
            for (j in 1..n) {
                res.append(" ($i, $j), ")
            }
        }
        return res.toString()
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### Nested for loop ###
    def nested_for_loop(n)
      res = ""

      # Loop i = 1, 2, ..., n-1, n
      for i in 1..n
        # Loop j = 1, 2, ..., n-1, n
        for j in 1..n
          res += "(#{i}, #{j}), "
        end
      end

      res
    end
    ```

Figure 2-2 shows the flowchart of this nested loop.

![Flowchart of nested loops](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-2 &nbsp; Flowchart of nested loops </p>

In this case, the number of operations of the function is proportional to $n^2$, or the algorithm's running time has a "quadratic relationship" with the input data size $n$.

We can continue adding nested loops, where each nesting is a "dimension increase", raising the time complexity to "cubic relationship", "quartic relationship", and so on.

## 2.2.2 &nbsp; Recursion

<u>Recursion</u> is an algorithmic strategy that solves problems by having a function call itself. It mainly consists of two phases.

1. **Descend**: The program continuously calls itself deeper, usually passing in smaller or more simplified parameters, until reaching a "termination condition".
2. **Ascend**: After triggering the "termination condition", the program returns layer by layer from the deepest recursive function, aggregating the result of each layer.

From an implementation perspective, recursive code mainly consists of three elements.

1. **Termination condition**: Used to determine when to switch from "descending" to "ascending".
2. **Recursive call**: Corresponds to "descending", where the function calls itself, usually with smaller or more simplified parameters.
3. **Return result**: Corresponds to "ascending", returning the result of the current recursion level to the previous layer.

Observe the following code. We only need to call the function `recur(n)` to complete the calculation of $1 + 2 + \dots + n$:

=== "Python"

    ```python title="recursion.py"
    def recur(n: int) -> int:
        """Recursion"""
        # Termination condition
        if n == 1:
            return 1
        # Recurse: recursive call
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
        // Recurse: recursive call
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
        // Recurse: recursive call
        int res = recur(n - 1);
        // Return: return result
        return n + res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* Recursion */
    int Recur(int n) {
        // Termination condition
        if (n == 1)
            return 1;
        // Recurse: recursive call
        int res = Recur(n - 1);
        // Return: return result
        return n + res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Recursion */
    func recur(n int) int {
        // Termination condition
        if n == 1 {
            return 1
        }
        // Recurse: recursive call
        res := recur(n - 1)
        // Return: return result
        return n + res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Recursion */
    func recur(n: Int) -> Int {
        // Termination condition
        if n == 1 {
            return 1
        }
        // Recurse: recursive call
        let res = recur(n: n - 1)
        // Return: return result
        return n + res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Recursion */
    function recur(n) {
        // Termination condition
        if (n === 1) return 1;
        // Recurse: recursive call
        const res = recur(n - 1);
        // Return: return result
        return n + res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Recursion */
    function recur(n: number): number {
        // Termination condition
        if (n === 1) return 1;
        // Recurse: recursive call
        const res = recur(n - 1);
        // Return: return result
        return n + res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Recursion */
    int recur(int n) {
      // Termination condition
      if (n == 1) return 1;
      // Recurse: recursive call
      int res = recur(n - 1);
      // Return: return result
      return n + res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Recursion */
    fn recur(n: i32) -> i32 {
        // Termination condition
        if n == 1 {
            return 1;
        }
        // Recurse: recursive call
        let res = recur(n - 1);
        // Return: return result
        n + res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Recursion */
    int recur(int n) {
        // Termination condition
        if (n == 1)
            return 1;
        // Recurse: recursive call
        int res = recur(n - 1);
        // Return: return result
        return n + res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Recursion */
    fun recur(n: Int): Int {
        // Termination condition
        if (n == 1)
            return 1
        // Descend: recursive call
        val res = recur(n - 1)
        // Return: return result
        return n + res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Recursion ###
    def recur(n)
      # Termination condition
      return 1 if n == 1
      # Recurse: recursive call
      res = recur(n - 1)
      # Return: return result
      n + res
    end
    ```

Figure 2-3 shows the recursive process of this function.

![Recursive process of the summation function](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-3 &nbsp; Recursive process of the summation function </p>

Although from a computational perspective, iteration and recursion can achieve the same results, **they represent two completely different paradigms for thinking about and solving problems**.

- **Iteration**: Solves problems "bottom-up". Starting from the most basic steps, these steps are then repeatedly executed or accumulated until the task is complete.
- **Recursion**: Solves problems "top-down". The original problem is decomposed into smaller subproblems that have the same form as the original problem. These subproblems continue to be decomposed into even smaller subproblems until reaching the base case (where the solution is known).

Taking the above summation function as an example, let the problem be $f(n) = 1 + 2 + \dots + n$.

- **Iteration**: Simulates the summation process in a loop, traversing from $1$ to $n$, performing the summation operation in each round to obtain $f(n)$.
- **Recursion**: Decomposes the problem into the subproblem $f(n) = n + f(n-1)$, continuously decomposing (recursively) until terminating at the base case $f(1) = 1$.

### 1. &nbsp; Call Stack

Each time a recursive function calls itself, the system allocates memory for the newly opened function to store local variables, call addresses, and other information. This leads to two consequences.

- The function's context data is stored in a memory area called "stack frame space", which is not released until the function returns. Therefore, **recursion usually consumes more memory space than iteration**.
- Recursive function calls incur additional overhead. **Therefore, recursion is usually less time-efficient than loops**.

As shown in Figure 2-4, before the termination condition is triggered, there are $n$ unreturned recursive functions existing simultaneously, with a **recursion depth of $n$**.

![Recursion call depth](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> Figure 2-4 &nbsp; Recursion call depth </p>

In practice, the recursion depth allowed by programming languages is usually limited, and excessively deep recursion may lead to stack overflow errors.

### 2. &nbsp; Tail Recursion

Interestingly, **if a function makes the recursive call as the very last step before returning**, the function can be optimized by the compiler or interpreter to have space efficiency comparable to iteration. This case is called <u>tail recursion</u>.

- **Regular recursion**: When a function returns to the previous level, it needs to continue executing code, so the system needs to save the context of the previous layer's call.
- **Tail recursion**: The recursive call is the last operation before the function returns, meaning that after returning to the previous level, there is no need to continue executing other operations, so the system does not need to save the context of the previous layer's function.

Taking the calculation of $1 + 2 + \dots + n$ as an example, we can set the result variable `res` as a function parameter to implement tail recursion:

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
    /* Tail recursion */
    int TailRecur(int n, int res) {
        // Termination condition
        if (n == 0)
            return res;
        // Tail recursive call
        return TailRecur(n - 1, res + n);
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Tail recursion */
    func tailRecur(n int, res int) int {
        // Termination condition
        if n == 0 {
            return res
        }
        // Tail recursive call
        return tailRecur(n-1, res+n)
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Tail recursion */
    func tailRecur(n: Int, res: Int) -> Int {
        // Termination condition
        if n == 0 {
            return res
        }
        // Tail recursive call
        return tailRecur(n: n - 1, res: res + n)
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Tail recursion */
    function tailRecur(n, res) {
        // Termination condition
        if (n === 0) return res;
        // Tail recursive call
        return tailRecur(n - 1, res + n);
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Tail recursion */
    function tailRecur(n: number, res: number): number {
        // Termination condition
        if (n === 0) return res;
        // Tail recursive call
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Tail recursion */
    int tailRecur(int n, int res) {
      // Termination condition
      if (n == 0) return res;
      // Tail recursive call
      return tailRecur(n - 1, res + n);
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Tail recursion */
    fn tail_recur(n: i32, res: i32) -> i32 {
        // Termination condition
        if n == 0 {
            return res;
        }
        // Tail recursive call
        tail_recur(n - 1, res + n)
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Tail recursion */
    int tailRecur(int n, int res) {
        // Termination condition
        if (n == 0)
            return res;
        // Tail recursive call
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Tail recursion */
    tailrec fun tailRecur(n: Int, res: Int): Int {
        // Add tailrec keyword to enable tail recursion optimization
        // Termination condition
        if (n == 0)
            return res
        // Tail recursive call
        return tailRecur(n - 1, res + n)
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Tail recursion ###
    def tail_recur(n, res)
      # Termination condition
      return res if n == 0
      # Tail recursive call
      tail_recur(n - 1, res + n)
    end
    ```

The execution process of tail recursion is shown in Figure 2-5. Comparing regular recursion and tail recursion, the execution point of the summation operation is different.

- **Regular recursion**: The summation operation is performed during the "ascending" process, requiring an additional summation operation after each layer returns.
- **Tail recursion**: The summation operation is performed during the "descending" process; the "ascending" process only needs to return layer by layer.

![Tail recursion process](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-5 &nbsp; Tail recursion process </p>

!!! tip

    Please note that many compilers or interpreters do not support tail recursion optimization. For example, Python does not support tail recursion optimization by default, so even if a function is in tail recursive form, it may still encounter stack overflow issues.

### 3. &nbsp; Recursion Tree

When dealing with algorithmic problems related to "divide and conquer", recursion often provides a more intuitive approach and more readable code than iteration. Taking the "Fibonacci sequence" as an example.

!!! question

    Given a Fibonacci sequence $0, 1, 1, 2, 3, 5, 8, 13, \dots$, find the $n$-th number in the sequence.

Let the $n$-th number of the Fibonacci sequence be $f(n)$. Two conclusions can be easily obtained.

- The first two numbers of the sequence are $f(1) = 0$ and $f(2) = 1$.
- Each number in the sequence is the sum of the previous two numbers, i.e., $f(n) = f(n - 1) + f(n - 2)$.

Following the recurrence relation to make recursive calls, with the first two numbers as termination conditions, we can write the recursive code. Calling `fib(n)` will give us the $n$-th number of the Fibonacci sequence:

=== "Python"

    ```python title="recursion.py"
    def fib(n: int) -> int:
        """Fibonacci sequence: recursion"""
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
    /* Fibonacci sequence: recursion */
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
    /* Fibonacci sequence: recursion */
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
    /* Fibonacci sequence: recursion */
    int Fib(int n) {
        // Termination condition f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Recursive call f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // Return result f(n)
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Fibonacci sequence: recursion */
    func fib(n int) int {
        // Termination condition f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // Recursive call f(n) = f(n-1) + f(n-2)
        res := fib(n-1) + fib(n-2)
        // Return result f(n)
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Fibonacci sequence: recursion */
    func fib(n: Int) -> Int {
        // Termination condition f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // Recursive call f(n) = f(n-1) + f(n-2)
        let res = fib(n: n - 1) + fib(n: n - 2)
        // Return result f(n)
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Fibonacci sequence: recursion */
    function fib(n) {
        // Termination condition f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // Recursive call f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // Return result f(n)
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Fibonacci sequence: recursion */
    function fib(n: number): number {
        // Termination condition f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // Recursive call f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // Return result f(n)
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Fibonacci sequence: recursion */
    int fib(int n) {
      // Termination condition f(1) = 0, f(2) = 1
      if (n == 1 || n == 2) return n - 1;
      // Recursive call f(n) = f(n-1) + f(n-2)
      int res = fib(n - 1) + fib(n - 2);
      // Return result f(n)
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Fibonacci sequence: recursion */
    fn fib(n: i32) -> i32 {
        // Termination condition f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1;
        }
        // Recursive call f(n) = f(n-1) + f(n-2)
        let res = fib(n - 1) + fib(n - 2);
        // Return result
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Fibonacci sequence: recursion */
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

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Fibonacci sequence: recursion */
    fun fib(n: Int): Int {
        // Termination condition f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1
        // Recursive call f(n) = f(n-1) + f(n-2)
        val res = fib(n - 1) + fib(n - 2)
        // Return result f(n)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Fibonacci sequence: recursion ###
    def fib(n)
      # Termination condition f(1) = 0, f(2) = 1
      return n - 1 if n == 1 || n == 2
      # Recursive call f(n) = f(n-1) + f(n-2)
      res = fib(n - 1) + fib(n - 2)
      # Return result f(n)
      res
    end
    ```

Observing the above code, we recursively call two functions within the function, **meaning that one call produces two call branches**. As shown in Figure 2-6, such continuous recursive calling will eventually produce a <u>recursion tree</u> with $n$ levels.

![Recursion tree of the Fibonacci sequence](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> Figure 2-6 &nbsp; Recursion tree of the Fibonacci sequence </p>

Fundamentally, recursion embodies the paradigm of "decomposing a problem into smaller subproblems", and this divide-and-conquer strategy is crucial.

- From an algorithmic perspective, many important algorithmic strategies such as searching, sorting, backtracking, divide and conquer, and dynamic programming directly or indirectly apply this way of thinking.
- From a data structure perspective, recursion is naturally suited for handling problems related to linked lists, trees, and graphs, because they are well-suited for analysis using divide-and-conquer thinking.

## 2.2.3 &nbsp; Comparison of the Two

Summarizing the above content, as shown in Table 2-1, iteration and recursion differ in implementation, performance, and applicability.

<p align="center"> Table 2-1 &nbsp; Comparison of iteration and recursion characteristics </p>

<div class="center-table" markdown>

|                | Iteration                                                | Recursion                                                                              |
| -------------- | -------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| Implementation | Loop structure                                           | Function calls itself                                                                  |
| Time efficiency | Generally more efficient, no function call overhead      | Each function call incurs overhead                                                     |
| Memory usage   | Usually uses a fixed amount of memory space              | Accumulated function calls may use a large amount of stack frame space                 |
| Suitable problems | Suitable for simple loop tasks, with intuitive and readable code | Suitable for subproblem decomposition, such as trees, graphs, divide and conquer, backtracking, etc., with concise and clear code structure |

</div>

!!! tip

    If you find the following content difficult to understand, you can review it after reading the "Stack" chapter.

What is the intrinsic relationship between iteration and recursion? Taking the above recursive function as an example, the summation operation is performed during the "ascending" phase of recursion. This means that the function called first actually completes its summation operation last, **and this working mechanism is similar to the "last-in, first-out" principle of stacks**.

In fact, recursive terminology such as "call stack" and "stack frame space" already hints at the close relationship between recursion and stacks.

1. **Descend**: When a function is called, the system allocates a new stack frame on the "call stack" for that function to store the function's local variables, parameters, return address, and other data.
2. **Ascend**: When the function completes execution and returns, the corresponding stack frame is removed from the "call stack", restoring the execution environment of the previous function.

Therefore, **we can use an explicit stack to simulate the behavior of the call stack**, thus transforming recursion into iterative form:

=== "Python"

    ```python title="recursion.py"
    def for_loop_recur(n: int) -> int:
        """Simulate recursion using iteration"""
        # Use an explicit stack to simulate the system call stack
        stack = []
        res = 0
        # Recurse: recursive call
        for i in range(n, 0, -1):
            # Simulate "recurse" with "push"
            stack.append(i)
        # Return: return result
        while stack:
            # Simulate "return" with "pop"
            res += stack.pop()
        # res = 1+2+3+...+n
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Simulate recursion using iteration */
    int forLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        stack<int> stack;
        int res = 0;
        // Recurse: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recurse" with "push"
            stack.push(i);
        }
        // Return: return result
        while (!stack.empty()) {
            // Simulate "return" with "pop"
            res += stack.top();
            stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Simulate recursion using iteration */
    int forLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Recurse: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recurse" with "push"
            stack.push(i);
        }
        // Return: return result
        while (!stack.isEmpty()) {
            // Simulate "return" with "pop"
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* Simulate recursion using iteration */
    int ForLoopRecur(int n) {
        // Use an explicit stack to simulate the system call stack
        Stack<int> stack = new();
        int res = 0;
        // Recurse: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recurse" with "push"
            stack.Push(i);
        }
        // Return: return result
        while (stack.Count > 0) {
            // Simulate "return" with "pop"
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Simulate recursion using iteration */
    func forLoopRecur(n int) int {
        // Use an explicit stack to simulate the system call stack
        stack := list.New()
        res := 0
        // Recurse: recursive call
        for i := n; i > 0; i-- {
            // Simulate "recurse" with "push"
            stack.PushBack(i)
        }
        // Return: return result
        for stack.Len() != 0 {
            // Simulate "return" with "pop"
            res += stack.Back().Value.(int)
            stack.Remove(stack.Back())
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Simulate recursion using iteration */
    func forLoopRecur(n: Int) -> Int {
        // Use an explicit stack to simulate the system call stack
        var stack: [Int] = []
        var res = 0
        // Recurse: recursive call
        for i in (1 ... n).reversed() {
            // Simulate "recurse" with "push"
            stack.append(i)
        }
        // Return: return result
        while !stack.isEmpty {
            // Simulate "return" with "pop"
            res += stack.removeLast()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Simulate recursion using iteration */
    function forLoopRecur(n) {
        // Use an explicit stack to simulate the system call stack
        const stack = [];
        let res = 0;
        // Recurse: recursive call
        for (let i = n; i > 0; i--) {
            // Simulate "recurse" with "push"
            stack.push(i);
        }
        // Return: return result
        while (stack.length) {
            // Simulate "return" with "pop"
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Simulate recursion using iteration */
    function forLoopRecur(n: number): number {
        // Use an explicit stack to simulate the system call stack
        const stack: number[] = [];
        let res: number = 0;
        // Recurse: recursive call
        for (let i = n; i > 0; i--) {
            // Simulate "recurse" with "push"
            stack.push(i);
        }
        // Return: return result
        while (stack.length) {
            // Simulate "return" with "pop"
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Simulate recursion using iteration */
    int forLoopRecur(int n) {
      // Use an explicit stack to simulate the system call stack
      List<int> stack = [];
      int res = 0;
      // Recurse: recursive call
      for (int i = n; i > 0; i--) {
        // Simulate "recurse" with "push"
        stack.add(i);
      }
      // Return: return result
      while (!stack.isEmpty) {
        // Simulate "return" with "pop"
        res += stack.removeLast();
      }
      // res = 1+2+3+...+n
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Simulate recursion using iteration */
    fn for_loop_recur(n: i32) -> i32 {
        // Use an explicit stack to simulate the system call stack
        let mut stack = Vec::new();
        let mut res = 0;
        // Recurse: recursive call
        for i in (1..=n).rev() {
            // Simulate "recurse" with "push"
            stack.push(i);
        }
        // Return: return result
        while !stack.is_empty() {
            // Simulate "return" with "pop"
            res += stack.pop().unwrap();
        }
        // res = 1+2+3+...+n
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Simulate recursion using iteration */
    int forLoopRecur(int n) {
        int stack[1000]; // Use a large array to simulate stack
        int top = -1;    // Stack top index
        int res = 0;
        // Recurse: recursive call
        for (int i = n; i > 0; i--) {
            // Simulate "recurse" with "push"
            stack[1 + top++] = i;
        }
        // Return: return result
        while (top >= 0) {
            // Simulate "return" with "pop"
            res += stack[top--];
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Simulate recursion using iteration */
    fun forLoopRecur(n: Int): Int {
        // Use an explicit stack to simulate the system call stack
        val stack = Stack<Int>()
        var res = 0
        // Descend: recursive call
        for (i in n downTo 0) {
            // Simulate "recurse" with "push"
            stack.push(i)
        }
        // Return: return result
        while (stack.isNotEmpty()) {
            // Simulate "return" with "pop"
            res += stack.pop()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Use iteration to simulate recursion ###
    def for_loop_recur(n)
      # Use an explicit stack to simulate the system call stack
      stack = []
      res = 0

      # Recurse: recursive call
      for i in n.downto(0)
        # Simulate "recurse" with "push"
        stack << i
      end
      # Return: return result
      while !stack.empty?
        res += stack.pop
      end

      # res = 1+2+3+...+n
      res
    end
    ```

Observing the above code, when recursion is transformed into iteration, the code becomes more complex. Although iteration and recursion can be converted into each other in many cases, it may not be worthwhile to do so for the following two reasons.

- The transformed code may be more difficult to understand and less readable.
- For some complex problems, simulating the behavior of the system call stack can be very difficult.

In summary, **choosing between iteration and recursion depends on the nature of the specific problem**. In programming practice, it is crucial to weigh the pros and cons of both and choose the appropriate method based on the context.
