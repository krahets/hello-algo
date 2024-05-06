---
comments: true
---

# 14.6 &nbsp; Edit distance problem

Edit distance, also known as Levenshtein distance, refers to the minimum number of modifications required to transform one string into another, commonly used in information retrieval and natural language processing to measure the similarity between two sequences.

!!! question

    Given two strings $s$ and $t$, return the minimum number of edits required to transform $s$ into $t$.

    You can perform three types of edits on a string: insert a character, delete a character, or replace a character with any other character.

As shown in Figure 14-27, transforming `kitten` into `sitting` requires 3 edits, including 2 replacements and 1 insertion; transforming `hello` into `algo` requires 3 steps, including 2 replacements and 1 deletion.

![Example data of edit distance](edit_distance_problem.assets/edit_distance_example.png){ class="animation-figure" }

<p align="center"> Figure 14-27 &nbsp; Example data of edit distance </p>

**The edit distance problem can naturally be explained with a decision tree model**. Strings correspond to tree nodes, and a round of decision (an edit operation) corresponds to an edge of the tree.

As shown in Figure 14-28, with unrestricted operations, each node can derive many edges, each corresponding to one operation, meaning there are many possible paths to transform `hello` into `algo`.

From the perspective of the decision tree, the goal of this problem is to find the shortest path between the node `hello` and the node `algo`.

![Edit distance problem represented based on decision tree model](edit_distance_problem.assets/edit_distance_decision_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-28 &nbsp; Edit distance problem represented based on decision tree model </p>

### 1. &nbsp; Dynamic programming approach

**Step one: Think about each round of decision, define the state, thus obtaining the $dp$ table**

Each round of decision involves performing one edit operation on string $s$.

We aim to gradually reduce the problem size during the edit process, which enables us to construct subproblems. Let the lengths of strings $s$ and $t$ be $n$ and $m$, respectively. We first consider the tail characters of both strings $s[n-1]$ and $t[m-1]$.

- If $s[n-1]$ and $t[m-1]$ are the same, we can skip them and directly consider $s[n-2]$ and $t[m-2]$.
- If $s[n-1]$ and $t[m-1]$ are different, we need to perform one edit on $s$ (insert, delete, replace) so that the tail characters of the two strings match, allowing us to skip them and consider a smaller-scale problem.

Thus, each round of decision (edit operation) in string $s$ changes the remaining characters in $s$ and $t$ to be matched. Therefore, the state is the $i$-th and $j$-th characters currently considered in $s$ and $t$, denoted as $[i, j]$.

State $[i, j]$ corresponds to the subproblem: **The minimum number of edits required to change the first $i$ characters of $s$ into the first $j$ characters of $t$**.

From this, we obtain a two-dimensional $dp$ table of size $(i+1) \times (j+1)$.

**Step two: Identify the optimal substructure and then derive the state transition equation**

Consider the subproblem $dp[i, j]$, whose corresponding tail characters of the two strings are $s[i-1]$ and $t[j-1]$, which can be divided into three scenarios as shown in Figure 14-29.

1. Add $t[j-1]$ after $s[i-1]$, then the remaining subproblem is $dp[i, j-1]$.
2. Delete $s[i-1]$, then the remaining subproblem is $dp[i-1, j]$.
3. Replace $s[i-1]$ with $t[j-1]$, then the remaining subproblem is $dp[i-1, j-1]$.

![State transition of edit distance](edit_distance_problem.assets/edit_distance_state_transfer.png){ class="animation-figure" }

<p align="center"> Figure 14-29 &nbsp; State transition of edit distance </p>

Based on the analysis above, we can determine the optimal substructure: The minimum number of edits for $dp[i, j]$ is the minimum among $dp[i, j-1]$, $dp[i-1, j]$, and $dp[i-1, j-1]$, plus the edit step $1$. The corresponding state transition equation is:

$$
dp[i, j] = \min(dp[i, j-1], dp[i-1, j], dp[i-1, j-1]) + 1
$$

Please note, **when $s[i-1]$ and $t[j-1]$ are the same, no edit is required for the current character**, in which case the state transition equation is:

$$
dp[i, j] = dp[i-1, j-1]
$$

**Step three: Determine the boundary conditions and the order of state transitions**

When both strings are empty, the number of edits is $0$, i.e., $dp[0, 0] = 0$. When $s$ is empty but $t$ is not, the minimum number of edits equals the length of $t$, that is, the first row $dp[0, j] = j$. When $s$ is not empty but $t$ is, the minimum number of edits equals the length of $s$, that is, the first column $dp[i, 0] = i$.

Observing the state transition equation, solving $dp[i, j]$ depends on the solutions to the left, above, and upper left, so a double loop can be used to traverse the entire $dp$ table in the correct order.

### 2. &nbsp; Code implementation

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
        # State transition: the rest of the rows and columns
        for i in range(1, n + 1):
            for j in range(1, m + 1):
                if s[i - 1] == t[j - 1]:
                    # If the two characters are equal, skip these two characters
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    # The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
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
        // State transition: the rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // If the two characters are equal, skip these two characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
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
        // State transition: the rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If the two characters are equal, skip these two characters
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    [class]{edit_distance}-[func]{EditDistanceDP}
    ```

=== "Go"

    ```go title="edit_distance.go"
    [class]{}-[func]{editDistanceDP}
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    [class]{}-[func]{editDistanceDP}
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    [class]{}-[func]{editDistanceDP}
    ```

=== "TS"

    ```typescript title="edit_distance.ts"
    [class]{}-[func]{editDistanceDP}
    ```

=== "Dart"

    ```dart title="edit_distance.dart"
    [class]{}-[func]{editDistanceDP}
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    [class]{}-[func]{edit_distance_dp}
    ```

=== "C"

    ```c title="edit_distance.c"
    [class]{}-[func]{editDistanceDP}
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    [class]{}-[func]{editDistanceDP}
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    [class]{}-[func]{edit_distance_dp}
    ```

=== "Zig"

    ```zig title="edit_distance.zig"
    [class]{}-[func]{editDistanceDP}
    ```

As shown in Figure 14-30, the process of state transition in the edit distance problem is very similar to that in the knapsack problem, which can be seen as filling a two-dimensional grid.

=== "<1>"
    ![Dynamic programming process of edit distance](edit_distance_problem.assets/edit_distance_dp_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 14-30 &nbsp; Dynamic programming process of edit distance </p>

### 3. &nbsp; Space optimization

Since $dp[i, j]$ is derived from the solutions above $dp[i-1, j]$, to the left $dp[i, j-1]$, and to the upper left $dp[i-1, j-1]$, and direct traversal will lose the upper left solution $dp[i-1, j-1]$, and reverse traversal cannot build $dp[i, j-1]$ in advance, therefore, both traversal orders are not feasible.

For this reason, we can use a variable `leftup` to temporarily store the solution from the upper left $dp[i-1, j-1]$, thus only needing to consider the solutions to the left and above. This situation is similar to the unbounded knapsack problem, allowing for direct traversal. The code is as follows:

=== "Python"

    ```python title="edit_distance.py"
    def edit_distance_dp_comp(s: str, t: str) -> int:
        """Edit distance: Space-optimized dynamic programming"""
        n, m = len(s), len(t)
        dp = [0] * (m + 1)
        # State transition: first row
        for j in range(1, m + 1):
            dp[j] = j
        # State transition: the rest of the rows
        for i in range(1, n + 1):
            # State transition: first column
            leftup = dp[0]  # Temporarily store dp[i-1, j-1]
            dp[0] += 1
            # State transition: the rest of the columns
            for j in range(1, m + 1):
                temp = dp[j]
                if s[i - 1] == t[j - 1]:
                    # If the two characters are equal, skip these two characters
                    dp[j] = leftup
                else:
                    # The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[j] = min(dp[j - 1], dp[j], leftup) + 1
                leftup = temp  # Update for the next round of dp[i-1, j-1]
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
        // State transition: the rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: the rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // If the two characters are equal, skip these two characters
                    dp[j] = leftup;
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for the next round of dp[i-1, j-1]
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
        // State transition: the rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: the rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // If the two characters are equal, skip these two characters
                    dp[j] = leftup;
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for the next round of dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    [class]{edit_distance}-[func]{EditDistanceDPComp}
    ```

=== "Go"

    ```go title="edit_distance.go"
    [class]{}-[func]{editDistanceDPComp}
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    [class]{}-[func]{editDistanceDPComp}
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    [class]{}-[func]{editDistanceDPComp}
    ```

=== "TS"

    ```typescript title="edit_distance.ts"
    [class]{}-[func]{editDistanceDPComp}
    ```

=== "Dart"

    ```dart title="edit_distance.dart"
    [class]{}-[func]{editDistanceDPComp}
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    [class]{}-[func]{edit_distance_dp_comp}
    ```

=== "C"

    ```c title="edit_distance.c"
    [class]{}-[func]{editDistanceDPComp}
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    [class]{}-[func]{editDistanceDPComp}
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    [class]{}-[func]{edit_distance_dp_comp}
    ```

=== "Zig"

    ```zig title="edit_distance.zig"
    [class]{}-[func]{editDistanceDPComp}
    ```
