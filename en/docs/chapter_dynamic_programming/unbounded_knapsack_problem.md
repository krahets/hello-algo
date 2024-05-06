---
comments: true
---

# 14.5 &nbsp; Unbounded knapsack problem

In this section, we first solve another common knapsack problem: the unbounded knapsack, and then explore a special case of it: the coin change problem.

## 14.5.1 &nbsp; Unbounded knapsack problem

!!! question

    Given $n$ items, where the weight of the $i^{th}$ item is $wgt[i-1]$ and its value is $val[i-1]$, and a backpack with a capacity of $cap$. **Each item can be selected multiple times**. What is the maximum value of the items that can be put into the backpack without exceeding its capacity? See the example below.

![Example data for the unbounded knapsack problem](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png){ class="animation-figure" }

<p align="center"> Figure 14-22 &nbsp; Example data for the unbounded knapsack problem </p>

### 1. &nbsp; Dynamic programming approach

The unbounded knapsack problem is very similar to the 0-1 knapsack problem, **the only difference being that there is no limit on the number of times an item can be chosen**.

- In the 0-1 knapsack problem, there is only one of each item, so after placing item $i$ into the backpack, you can only choose from the previous $i-1$ items.
- In the unbounded knapsack problem, the quantity of each item is unlimited, so after placing item $i$ in the backpack, **you can still choose from the previous $i$ items**.

Under the rules of the unbounded knapsack problem, the state $[i, c]$ can change in two ways.

- **Not putting item $i$ in**: As with the 0-1 knapsack problem, transition to $[i-1, c]$.
- **Putting item $i$ in**: Unlike the 0-1 knapsack problem, transition to $[i, c-wgt[i-1]]$.

The state transition equation thus becomes:

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 2. &nbsp; Code implementation

Comparing the code for the two problems, the state transition changes from $i-1$ to $i$, the rest is completely identical:

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """Complete knapsack: Dynamic programming"""
        n = len(wgt)
        # Initialize dp table
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # State transition
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # If exceeding the knapsack capacity, do not choose item i
                    dp[i][c] = dp[i - 1][c]
                else:
                    # The greater value between not choosing and choosing item i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* Complete knapsack: Dynamic programming */
    int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Initialize dp table
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* Complete knapsack: Dynamic programming */
    int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize dp table
        int[][] dp = new int[n + 1][cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    [class]{unbounded_knapsack}-[func]{UnboundedKnapsackDP}
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    [class]{}-[func]{unbounded_knapsack_dp}
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    [class]{}-[func]{unbounded_knapsack_dp}
    ```

=== "Zig"

    ```zig title="unbounded_knapsack.zig"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

### 3. &nbsp; Space optimization

Since the current state comes from the state to the left and above, **the space-optimized solution should perform a forward traversal for each row in the $dp$ table**.

This traversal order is the opposite of that for the 0-1 knapsack. Please refer to Figure 14-23 to understand the difference.

=== "<1>"
    ![Dynamic programming process for the unbounded knapsack problem after space optimization](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> Figure 14-23 &nbsp; Dynamic programming process for the unbounded knapsack problem after space optimization </p>

The code implementation is quite simple, just remove the first dimension of the array `dp`:

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """Complete knapsack: Space-optimized dynamic programming"""
        n = len(wgt)
        # Initialize dp table
        dp = [0] * (cap + 1)
        # State transition
        for i in range(1, n + 1):
            # Traverse in order
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # If exceeding the knapsack capacity, do not choose item i
                    dp[c] = dp[c]
                else:
                    # The greater value between not choosing and choosing item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* Complete knapsack: Space-optimized dynamic programming */
    int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Initialize dp table
        vector<int> dp(cap + 1, 0);
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[c] = dp[c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* Complete knapsack: Space-optimized dynamic programming */
    int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize dp table
        int[] dp = new int[cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[c] = dp[c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    [class]{unbounded_knapsack}-[func]{UnboundedKnapsackDPComp}
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    [class]{}-[func]{unbounded_knapsack_dp_comp}
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    [class]{}-[func]{unbounded_knapsack_dp_comp}
    ```

=== "Zig"

    ```zig title="unbounded_knapsack.zig"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

## 14.5.2 &nbsp; Coin change problem

The knapsack problem is a representative of a large class of dynamic programming problems and has many variants, such as the coin change problem.

!!! question

    Given $n$ types of coins, the denomination of the $i^{th}$ type of coin is $coins[i - 1]$, and the target amount is $amt$. **Each type of coin can be selected multiple times**. What is the minimum number of coins needed to make up the target amount? If it is impossible to make up the target amount, return $-1$. See the example below.

![Example data for the coin change problem](unbounded_knapsack_problem.assets/coin_change_example.png){ class="animation-figure" }

<p align="center"> Figure 14-24 &nbsp; Example data for the coin change problem </p>

### 1. &nbsp; Dynamic programming approach

**The coin change can be seen as a special case of the unbounded knapsack problem**, sharing the following similarities and differences.

- The two problems can be converted into each other: "item" corresponds to "coin", "item weight" corresponds to "coin denomination", and "backpack capacity" corresponds to "target amount".
- The optimization goals are opposite: the unbounded knapsack problem aims to maximize the value of items, while the coin change problem aims to minimize the number of coins.
- The unbounded knapsack problem seeks solutions "not exceeding" the backpack capacity, while the coin change seeks solutions that "exactly" make up the target amount.

**First step: Think through each round's decision-making, define the state, and thus derive the $dp$ table**

The state $[i, a]$ corresponds to the sub-problem: **the minimum number of coins that can make up the amount $a$ using the first $i$ types of coins**, denoted as $dp[i, a]$.

The two-dimensional $dp$ table is of size $(n+1) \times (amt+1)$.

**Second step: Identify the optimal substructure and derive the state transition equation**

This problem differs from the unbounded knapsack problem in two aspects of the state transition equation.

- This problem seeks the minimum, so the operator $\max()$ needs to be changed to $\min()$.
- The optimization is focused on the number of coins, so simply add $+1$ when a coin is chosen.

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**Third step: Define boundary conditions and state transition order**

When the target amount is $0$, the minimum number of coins needed to make it up is $0$, so all $dp[i, 0]$ in the first column are $0$.

When there are no coins, **it is impossible to make up any amount >0**, which is an invalid solution. To allow the $\min()$ function in the state transition equation to recognize and filter out invalid solutions, consider using $+\infty$ to represent them, i.e., set all $dp[0, a]$ in the first row to $+\infty$.

### 2. &nbsp; Code implementation

Most programming languages do not provide a $+\infty$ variable, only the maximum value of an integer `int` can be used as a substitute. This can lead to overflow: the $+1$ operation in the state transition equation may overflow.

For this reason, we use the number $amt + 1$ to represent an invalid solution, because the maximum number of coins needed to make up $amt$ is at most $amt$. Before returning the result, check if $dp[n, amt]$ equals $amt + 1$, and if so, return $-1$, indicating that the target amount cannot be made up. The code is as follows:

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp(coins: list[int], amt: int) -> int:
        """Coin change: Dynamic programming"""
        n = len(coins)
        MAX = amt + 1
        # Initialize dp table
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # State transition: first row and first column
        for a in range(1, amt + 1):
            dp[0][a] = MAX
        # State transition: the rest of the rows and columns
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If exceeding the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                else:
                    # The smaller value between not choosing and choosing coin i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
        return dp[n][amt] if dp[n][amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* Coin change: Dynamic programming */
    int coinChangeDP(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // Initialize dp table
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // State transition: first row and first column
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transition: the rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // The smaller value between not choosing and choosing coin i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* Coin change: Dynamic programming */
    int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Initialize dp table
        int[][] dp = new int[n + 1][amt + 1];
        // State transition: first row and first column
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transition: the rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // The smaller value between not choosing and choosing coin i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    [class]{coin_change}-[func]{CoinChangeDP}
    ```

=== "Go"

    ```go title="coin_change.go"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    [class]{}-[func]{coinChangeDP}
    ```

=== "JS"

    ```javascript title="coin_change.js"
    [class]{}-[func]{coinChangeDP}
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    [class]{}-[func]{coin_change_dp}
    ```

=== "C"

    ```c title="coin_change.c"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    [class]{}-[func]{coin_change_dp}
    ```

=== "Zig"

    ```zig title="coin_change.zig"
    [class]{}-[func]{coinChangeDP}
    ```

Figure 14-25 show the dynamic programming process for the coin change problem, which is very similar to the unbounded knapsack problem.

=== "<1>"
    ![Dynamic programming process for the coin change problem](unbounded_knapsack_problem.assets/coin_change_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.png){ class="animation-figure" }

<p align="center"> Figure 14-25 &nbsp; Dynamic programming process for the coin change problem </p>

### 3. &nbsp; Space optimization

The space optimization for the coin change problem is handled in the same way as for the unbounded knapsack problem:

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp_comp(coins: list[int], amt: int) -> int:
        """Coin change: Space-optimized dynamic programming"""
        n = len(coins)
        MAX = amt + 1
        # Initialize dp table
        dp = [MAX] * (amt + 1)
        dp[0] = 0
        # State transition
        for i in range(1, n + 1):
            # Traverse in order
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If exceeding the target amount, do not choose coin i
                    dp[a] = dp[a]
                else:
                    # The smaller value between not choosing and choosing coin i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
        return dp[amt] if dp[amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* Coin change: Space-optimized dynamic programming */
    int coinChangeDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // Initialize dp table
        vector<int> dp(amt + 1, MAX);
        dp[0] = 0;
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // The smaller value between not choosing and choosing coin i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* Coin change: Space-optimized dynamic programming */
    int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Initialize dp table
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // The smaller value between not choosing and choosing coin i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    [class]{coin_change}-[func]{CoinChangeDPComp}
    ```

=== "Go"

    ```go title="coin_change.go"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "JS"

    ```javascript title="coin_change.js"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    [class]{}-[func]{coin_change_dp_comp}
    ```

=== "C"

    ```c title="coin_change.c"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    [class]{}-[func]{coin_change_dp_comp}
    ```

=== "Zig"

    ```zig title="coin_change.zig"
    [class]{}-[func]{coinChangeDPComp}
    ```

## 14.5.3 &nbsp; Coin change problem II

!!! question

    Given $n$ types of coins, where the denomination of the $i^{th}$ type of coin is $coins[i - 1]$, and the target amount is $amt$. Each type of coin can be selected multiple times, **ask how many combinations of coins can make up the target amount**. See the example below.

![Example data for Coin Change Problem II](unbounded_knapsack_problem.assets/coin_change_ii_example.png){ class="animation-figure" }

<p align="center"> Figure 14-26 &nbsp; Example data for Coin Change Problem II </p>

### 1. &nbsp; Dynamic programming approach

Compared to the previous problem, the goal of this problem is to determine the number of combinations, so the sub-problem becomes: **the number of combinations that can make up amount $a$ using the first $i$ types of coins**. The $dp$ table remains a two-dimensional matrix of size $(n+1) \times (amt + 1)$.

The number of combinations for the current state is the sum of the combinations from not selecting the current coin and selecting the current coin. The state transition equation is:

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

When the target amount is $0$, no coins are needed to make up the target amount, so all $dp[i, 0]$ in the first column should be initialized to $1$. When there are no coins, it is impossible to make up any amount >0, so all $dp[0, a]$ in the first row should be set to $0$.

### 2. &nbsp; Code implementation

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp(coins: list[int], amt: int) -> int:
        """Coin change II: Dynamic programming"""
        n = len(coins)
        # Initialize dp table
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # Initialize first column
        for i in range(n + 1):
            dp[i][0] = 1
        # State transition
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If exceeding the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                else:
                    # The sum of the two options of not choosing and choosing coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
        return dp[n][amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* Coin change II: Dynamic programming */
    int coinChangeIIDP(vector<int> &coins, int amt) {
        int n = coins.size();
        // Initialize dp table
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // Initialize first column
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // The sum of the two options of not choosing and choosing coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* Coin change II: Dynamic programming */
    int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // Initialize dp table
        int[][] dp = new int[n + 1][amt + 1];
        // Initialize first column
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // The sum of the two options of not choosing and choosing coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    [class]{coin_change_ii}-[func]{CoinChangeIIDP}
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    [class]{}-[func]{coin_change_ii_dp}
    ```

=== "C"

    ```c title="coin_change_ii.c"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    [class]{}-[func]{coin_change_ii_dp}
    ```

=== "Zig"

    ```zig title="coin_change_ii.zig"
    [class]{}-[func]{coinChangeIIDP}
    ```

### 3. &nbsp; Space optimization

The space optimization approach is the same, just remove the coin dimension:

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
        """Coin change II: Space-optimized dynamic programming"""
        n = len(coins)
        # Initialize dp table
        dp = [0] * (amt + 1)
        dp[0] = 1
        # State transition
        for i in range(1, n + 1):
            # Traverse in order
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If exceeding the target amount, do not choose coin i
                    dp[a] = dp[a]
                else:
                    # The sum of the two options of not choosing and choosing coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
        return dp[amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* Coin change II: Space-optimized dynamic programming */
    int coinChangeIIDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        // Initialize dp table
        vector<int> dp(amt + 1, 0);
        dp[0] = 1;
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // The sum of the two options of not choosing and choosing coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* Coin change II: Space-optimized dynamic programming */
    int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // Initialize dp table
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // The sum of the two options of not choosing and choosing coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    [class]{coin_change_ii}-[func]{CoinChangeIIDPComp}
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    [class]{}-[func]{coin_change_ii_dp_comp}
    ```

=== "C"

    ```c title="coin_change_ii.c"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    [class]{}-[func]{coin_change_ii_dp_comp}
    ```

=== "Zig"

    ```zig title="coin_change_ii.zig"
    [class]{}-[func]{coinChangeIIDPComp}
    ```
