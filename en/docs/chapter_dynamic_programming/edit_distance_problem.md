---
comments: true
---

# 14.6 &nbsp; Edit Distance Problem

Edit distance, also known as Levenshtein distance, refers to the minimum number of edits required to transform one string into another, commonly used in information retrieval and natural language processing to measure the similarity between two sequences.

!!! question

    Given two strings $s$ and $t$, return the minimum number of edits required to transform $s$ into $t$.

    You can perform three types of edit operations on a string: insert a character, delete a character, or replace a character with any other character.

As shown in Figure 14-27, transforming `kitten` into `sitting` requires 3 edits, including 2 replacements and 1 insertion; transforming `hello` into `algo` requires 3 steps, including 2 replacements and 1 deletion.

![Example data for edit distance](edit_distance_problem.assets/edit_distance_example.png){ class="animation-figure" }

<p align="center"> Figure 14-27 &nbsp; Example data for edit distance </p>

**The edit distance problem can be naturally explained using the decision tree model**. Strings correspond to tree nodes, and a round of decision (one edit operation) corresponds to an edge of the tree.

As shown in Figure 14-28, without restricting operations, each node can branch into many edges, with each edge corresponding to one operation, meaning there are many possible paths to transform `hello` into `algo`.

From the perspective of the decision tree, the goal of this problem is to find the shortest path between node `hello` and node `algo`.

![Representing edit distance problem based on decision tree model](edit_distance_problem.assets/edit_distance_decision_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-28 &nbsp; Representing edit distance problem based on decision tree model </p>

### 1. &nbsp; Dynamic Programming Approach

**Step 1: Think about the decisions in each round, define the state, and thus obtain the $dp$ table**

Each round of decision involves performing one edit operation on string $s$.

We want the problem scale to gradually decrease during the editing process, which allows us to construct subproblems. Let the lengths of strings $s$ and $t$ be $n$ and $m$ respectively. We first consider the tail characters of the two strings, $s[n-1]$ and $t[m-1]$.

- If $s[n-1]$ and $t[m-1]$ are the same, we can skip them and directly consider $s[n-2]$ and $t[m-2]$.
- If $s[n-1]$ and $t[m-1]$ are different, we need to perform one edit on $s$ (insert, delete, or replace) to make the tail characters of the two strings the same, allowing us to skip them and consider a smaller-scale problem.

In other words, each round of decision (edit operation) we make on string $s$ will change the remaining characters to be matched in $s$ and $t$. Therefore, the state is the $i$-th and $j$-th characters currently being considered in $s$ and $t$, denoted as $[i, j]$.

State $[i, j]$ corresponds to the subproblem: **the minimum number of edits required to change the first $i$ characters of $s$ into the first $j$ characters of $t$**.

From this, we obtain a two-dimensional $dp$ table of size $(i+1) \times (j+1)$.

**Step 2: Identify the optimal substructure, and then derive the state transition equation**

Consider subproblem $dp[i, j]$, where the tail characters of the corresponding two strings are $s[i-1]$ and $t[j-1]$, which can be divided into the three cases shown in Figure 14-29 based on different edit operations.

1. Insert $t[j-1]$ after $s[i-1]$, then the remaining subproblem is $dp[i, j-1]$.
2. Delete $s[i-1]$, then the remaining subproblem is $dp[i-1, j]$.
3. Replace $s[i-1]$ with $t[j-1]$, then the remaining subproblem is $dp[i-1, j-1]$.

![State transition for edit distance](edit_distance_problem.assets/edit_distance_state_transfer.png){ class="animation-figure" }

<p align="center"> Figure 14-29 &nbsp; State transition for edit distance </p>

Based on the above analysis, the optimal substructure can be obtained: the minimum number of edits for $dp[i, j]$ equals the minimum among the minimum edit steps of $dp[i, j-1]$, $dp[i-1, j]$, and $dp[i-1, j-1]$, plus the edit step $1$ for this time. The corresponding state transition equation is:

$$
dp[i, j] = \min(dp[i, j-1], dp[i-1, j], dp[i-1, j-1]) + 1
$$

Please note that **when $s[i-1]$ and $t[j-1]$ are the same, no edit is required for the current character**, in which case the state transition equation is:

$$
dp[i, j] = dp[i-1, j-1]
$$

**Step 3: Determine boundary conditions and state transition order**

When both strings are empty, the number of edit steps is $0$, i.e., $dp[0, 0] = 0$. When $s$ is empty but $t$ is not, the minimum number of edit steps equals the length of $t$, i.e., the first row $dp[0, j] = j$. When $s$ is not empty but $t$ is empty, the minimum number of edit steps equals the length of $s$, i.e., the first column $dp[i, 0] = i$.

Observing the state transition equation, the solution $dp[i, j]$ depends on solutions to the left, above, and upper-left, so the entire $dp$ table can be traversed in order through two nested loops.

### 2. &nbsp; Code Implementation

=== "Python"

    ```python title="edit_distance.py"
    def edit_distance_dp(s: str, t: str) -> int:
        """Edit distance: Dynamic programming"""
        n, m = len(s), len(t)
        dp = [[0] * (m + 1) for _ in range(n + 1)]
        # State transition: first row and first column
        for i in range(1, n + 1):
            dp[i][0] = i
        for j in range(1, m + 1):
            dp[0][j] = j
        # State transition: rest of the rows and columns
        for i in range(1, n + 1):
            for j in range(1, m + 1):
                if s[i - 1] == t[j - 1]:
                    # If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
        return dp[n][m]
    ```

=== "C++"

    ```cpp title="edit_distance.cpp"
    /* Edit distance: Dynamic programming */
    int editDistanceDP(string s, string t) {
        int n = s.length(), m = t.length();
        vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
        // State transition: first row and first column
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // State transition: rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "Java"

    ```java title="edit_distance.java"
    /* Edit distance: Dynamic programming */
    int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // State transition: first row and first column
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // State transition: rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    /* Edit distance: Dynamic programming */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // State transition: first row and first column
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // State transition: rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }
    ```

=== "Go"

    ```go title="edit_distance.go"
    /* Edit distance: Dynamic programming */
    func editDistanceDP(s string, t string) int {
        n := len(s)
        m := len(t)
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, m+1)
        }
        // State transition: first row and first column
        for i := 1; i <= n; i++ {
            dp[i][0] = i
        }
        for j := 1; j <= m; j++ {
            dp[0][j] = j
        }
        // State transition: rest of the rows and columns
        for i := 1; i <= n; i++ {
            for j := 1; j <= m; j++ {
                if s[i-1] == t[j-1] {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    /* Edit distance: Dynamic programming */
    func editDistanceDP(s: String, t: String) -> Int {
        let n = s.utf8CString.count
        let m = t.utf8CString.count
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        // State transition: first row and first column
        for i in 1 ... n {
            dp[i][0] = i
        }
        for j in 1 ... m {
            dp[0][j] = j
        }
        // State transition: rest of the rows and columns
        for i in 1 ... n {
            for j in 1 ... m {
                if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    /* Edit distance: Dynamic programming */
    function editDistanceDP(s, t) {
        const n = s.length,
            m = t.length;
        const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
        // State transition: first row and first column
        for (let i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (let j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // State transition: rest of the rows and columns
        for (let i = 1; i <= n; i++) {
            for (let j = 1; j <= m; j++) {
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] =
                        Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "TS"

    ```typescript title="edit_distance.ts"
    /* Edit distance: Dynamic programming */
    function editDistanceDP(s: string, t: string): number {
        const n = s.length,
            m = t.length;
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: m + 1 }, () => 0)
        );
        // State transition: first row and first column
        for (let i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (let j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // State transition: rest of the rows and columns
        for (let i = 1; i <= n; i++) {
            for (let j = 1; j <= m; j++) {
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] =
                        Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "Dart"

    ```dart title="edit_distance.dart"
    /* Edit distance: Dynamic programming */
    int editDistanceDP(String s, String t) {
      int n = s.length, m = t.length;
      List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
      // State transition: first row and first column
      for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
      }
      for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
      }
      // State transition: rest of the rows and columns
      for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
          if (s[i - 1] == t[j - 1]) {
            // If two characters are equal, skip both characters
            dp[i][j] = dp[i - 1][j - 1];
          } else {
            // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
            dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
          }
        }
      }
      return dp[n][m];
    }
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    /* Edit distance: Dynamic programming */
    fn edit_distance_dp(s: &str, t: &str) -> i32 {
        let (n, m) = (s.len(), t.len());
        let mut dp = vec![vec![0; m + 1]; n + 1];
        // State transition: first row and first column
        for i in 1..=n {
            dp[i][0] = i as i32;
        }
        for j in 1..m {
            dp[0][j] = j as i32;
        }
        // State transition: rest of the rows and columns
        for i in 1..=n {
            for j in 1..=m {
                if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] =
                        std::cmp::min(std::cmp::min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        dp[n][m]
    }
    ```

=== "C"

    ```c title="edit_distance.c"
    /* Edit distance: Dynamic programming */
    int editDistanceDP(char *s, char *t, int n, int m) {
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(m + 1, sizeof(int));
        }
        // State transition: first row and first column
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // State transition: rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        int res = dp[n][m];
        // Free memory
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    /* Edit distance: Dynamic programming */
    fun editDistanceDP(s: String, t: String): Int {
        val n = s.length
        val m = t.length
        val dp = Array(n + 1) { IntArray(m + 1) }
        // State transition: first row and first column
        for (i in 1..n) {
            dp[i][0] = i
        }
        for (j in 1..m) {
            dp[0][j] = j
        }
        // State transition: rest of the rows and columns
        for (i in 1..n) {
            for (j in 1..m) {
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    ### Edit distance: dynamic programming ###
    def edit_distance_dp(s, t)
      n, m = s.length, t.length
      dp = Array.new(n + 1) { Array.new(m + 1, 0) }
      # State transition: first row and first column
      (1...(n + 1)).each { |i| dp[i][0] = i }
      (1...(m + 1)).each { |j| dp[0][j] = j }
      # State transition: rest of the rows and columns
      for i in 1...(n + 1)
        for j in 1...(m +1)
          if s[i - 1] == t[j - 1]
            # If two characters are equal, skip both characters
            dp[i][j] = dp[i - 1][j - 1]
          else
            # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
            dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
          end
        end
      end
      dp[n][m]
    end
    ```

As shown in Figure 14-30, the state transition process for the edit distance problem is very similar to the knapsack problem and can both be viewed as the process of filling a two-dimensional grid.

=== "<1>"
    ![Dynamic programming process for edit distance](edit_distance_problem.assets/edit_distance_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![edit_distance_dp_step2](edit_distance_problem.assets/edit_distance_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![edit_distance_dp_step3](edit_distance_problem.assets/edit_distance_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![edit_distance_dp_step4](edit_distance_problem.assets/edit_distance_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![edit_distance_dp_step5](edit_distance_problem.assets/edit_distance_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![edit_distance_dp_step6](edit_distance_problem.assets/edit_distance_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![edit_distance_dp_step7](edit_distance_problem.assets/edit_distance_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![edit_distance_dp_step8](edit_distance_problem.assets/edit_distance_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![edit_distance_dp_step9](edit_distance_problem.assets/edit_distance_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![edit_distance_dp_step10](edit_distance_problem.assets/edit_distance_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![edit_distance_dp_step11](edit_distance_problem.assets/edit_distance_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![edit_distance_dp_step12](edit_distance_problem.assets/edit_distance_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![edit_distance_dp_step13](edit_distance_problem.assets/edit_distance_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![edit_distance_dp_step14](edit_distance_problem.assets/edit_distance_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![edit_distance_dp_step15](edit_distance_problem.assets/edit_distance_dp_step15.png){ class="animation-figure" }

<p align="center"> Figure 14-30 &nbsp; Dynamic programming process for edit distance </p>

### 3. &nbsp; Space Optimization

Since $dp[i, j]$ is transferred from the solutions above $dp[i-1, j]$, to the left $dp[i, j-1]$, and to the upper-left $dp[i-1, j-1]$, forward traversal will lose the upper-left solution $dp[i-1, j-1]$, and reverse traversal cannot build $dp[i, j-1]$ in advance, so neither traversal order is feasible.

For this reason, we can use a variable `leftup` to temporarily store the upper-left solution $dp[i-1, j-1]$, so we only need to consider the solutions to the left and above. This situation is the same as the unbounded knapsack problem, allowing for forward traversal. The code is as follows:

=== "Python"

    ```python title="edit_distance.py"
    def edit_distance_dp_comp(s: str, t: str) -> int:
        """Edit distance: Space-optimized dynamic programming"""
        n, m = len(s), len(t)
        dp = [0] * (m + 1)
        # State transition: first row
        for j in range(1, m + 1):
            dp[j] = j
        # State transition: rest of the rows
        for i in range(1, n + 1):
            # State transition: first column
            leftup = dp[0]  # Temporarily store dp[i-1, j-1]
            dp[0] += 1
            # State transition: rest of the columns
            for j in range(1, m + 1):
                temp = dp[j]
                if s[i - 1] == t[j - 1]:
                    # If two characters are equal, skip both characters
                    dp[j] = leftup
                else:
                    # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = min(dp[j - 1], dp[j], leftup) + 1
                leftup = temp  # Update for next round's dp[i-1, j-1]
        return dp[m]
    ```

=== "C++"

    ```cpp title="edit_distance.cpp"
    /* Edit distance: Space-optimized dynamic programming */
    int editDistanceDPComp(string s, string t) {
        int n = s.length(), m = t.length();
        vector<int> dp(m + 1, 0);
        // State transition: first row
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup;
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "Java"

    ```java title="edit_distance.java"
    /* Edit distance: Space-optimized dynamic programming */
    int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // State transition: first row
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup;
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    /* Edit distance: Space-optimized dynamic programming */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // State transition: first row
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup;
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "Go"

    ```go title="edit_distance.go"
    /* Edit distance: Space-optimized dynamic programming */
    func editDistanceDPComp(s string, t string) int {
        n := len(s)
        m := len(t)
        dp := make([]int, m+1)
        // State transition: first row
        for j := 1; j <= m; j++ {
            dp[j] = j
        }
        // State transition: rest of the rows
        for i := 1; i <= n; i++ {
            // State transition: first column
            leftUp := dp[0] // Temporarily store dp[i-1, j-1]
            dp[0] = i
            // State transition: rest of the columns
            for j := 1; j <= m; j++ {
                temp := dp[j]
                if s[i-1] == t[j-1] {
                    // If two characters are equal, skip both characters
                    dp[j] = leftUp
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
                }
                leftUp = temp // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m]
    }
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    /* Edit distance: Space-optimized dynamic programming */
    func editDistanceDPComp(s: String, t: String) -> Int {
        let n = s.utf8CString.count
        let m = t.utf8CString.count
        var dp = Array(repeating: 0, count: m + 1)
        // State transition: first row
        for j in 1 ... m {
            dp[j] = j
        }
        // State transition: rest of the rows
        for i in 1 ... n {
            // State transition: first column
            var leftup = dp[0] // Temporarily store dp[i-1, j-1]
            dp[0] = i
            // State transition: rest of the columns
            for j in 1 ... m {
                let temp = dp[j]
                if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
                }
                leftup = temp // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m]
    }
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    /* Edit distance: Space-optimized dynamic programming */
    function editDistanceDPComp(s, t) {
        const n = s.length,
            m = t.length;
        const dp = new Array(m + 1).fill(0);
        // State transition: first row
        for (let j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: rest of the rows
        for (let i = 1; i <= n; i++) {
            // State transition: first column
            let leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: rest of the columns
            for (let j = 1; j <= m; j++) {
                const temp = dp[j];
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup;
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
                }
                leftup = temp; // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "TS"

    ```typescript title="edit_distance.ts"
    /* Edit distance: Space-optimized dynamic programming */
    function editDistanceDPComp(s: string, t: string): number {
        const n = s.length,
            m = t.length;
        const dp = new Array(m + 1).fill(0);
        // State transition: first row
        for (let j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: rest of the rows
        for (let i = 1; i <= n; i++) {
            // State transition: first column
            let leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: rest of the columns
            for (let j = 1; j <= m; j++) {
                const temp = dp[j];
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup;
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
                }
                leftup = temp; // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "Dart"

    ```dart title="edit_distance.dart"
    /* Edit distance: Space-optimized dynamic programming */
    int editDistanceDPComp(String s, String t) {
      int n = s.length, m = t.length;
      List<int> dp = List.filled(m + 1, 0);
      // State transition: first row
      for (int j = 1; j <= m; j++) {
        dp[j] = j;
      }
      // State transition: rest of the rows
      for (int i = 1; i <= n; i++) {
        // State transition: first column
        int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
        dp[0] = i;
        // State transition: rest of the columns
        for (int j = 1; j <= m; j++) {
          int temp = dp[j];
          if (s[i - 1] == t[j - 1]) {
            // If two characters are equal, skip both characters
            dp[j] = leftup;
          } else {
            // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
            dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
          }
          leftup = temp; // Update for next round's dp[i-1, j-1]
        }
      }
      return dp[m];
    }
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    /* Edit distance: Space-optimized dynamic programming */
    fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
        let (n, m) = (s.len(), t.len());
        let mut dp = vec![0; m + 1];
        // State transition: first row
        for j in 1..m {
            dp[j] = j as i32;
        }
        // State transition: rest of the rows
        for i in 1..=n {
            // State transition: first column
            let mut leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i as i32;
            // State transition: rest of the columns
            for j in 1..=m {
                let temp = dp[j];
                if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup;
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for next round's dp[i-1, j-1]
            }
        }
        dp[m]
    }
    ```

=== "C"

    ```c title="edit_distance.c"
    /* Edit distance: Space-optimized dynamic programming */
    int editDistanceDPComp(char *s, char *t, int n, int m) {
        int *dp = calloc(m + 1, sizeof(int));
        // State transition: first row
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup;
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for next round's dp[i-1, j-1]
            }
        }
        int res = dp[m];
        // Free memory
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    /* Edit distance: Space-optimized dynamic programming */
    fun editDistanceDPComp(s: String, t: String): Int {
        val n = s.length
        val m = t.length
        val dp = IntArray(m + 1)
        // State transition: first row
        for (j in 1..m) {
            dp[j] = j
        }
        // State transition: rest of the rows
        for (i in 1..n) {
            // State transition: first column
            var leftup = dp[0] // Temporarily store dp[i-1, j-1]
            dp[0] = i
            // State transition: rest of the columns
            for (j in 1..m) {
                val temp = dp[j]
                if (s[i - 1] == t[j - 1]) {
                    // If two characters are equal, skip both characters
                    dp[j] = leftup
                } else {
                    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
                }
                leftup = temp // Update for next round's dp[i-1, j-1]
            }
        }
        return dp[m]
    }
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    ### Edit distance: space-optimized DP ###
    def edit_distance_dp_comp(s, t)
      n, m = s.length, t.length
      dp = Array.new(m + 1, 0)
      # State transition: first row
      (1...(m + 1)).each { |j| dp[j] = j }
      # State transition: rest of the rows
      for i in 1...(n + 1)
        # State transition: first column
        leftup = dp.first # Temporarily store dp[i-1, j-1]
        dp[0] += 1
        # State transition: rest of the columns
        for j in 1...(m + 1)
          temp = dp[j]
          if s[i - 1] == t[j - 1]
            # If two characters are equal, skip both characters
            dp[j] = leftup
          else
            # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
            dp[j] = [dp[j - 1], dp[j], leftup].min + 1
          end
          leftup = temp # Update for next round's dp[i-1, j-1]
        end
      end
      dp[m]
    end
    ```
