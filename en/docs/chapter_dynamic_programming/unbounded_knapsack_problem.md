---
comments: true
---

# 14.5 &nbsp; Unbounded knapsack problem

We will now solve another common knapsack variant, unbounded knapsack, and then examine a special case: coin change.

## 14.5.1 &nbsp; Unbounded knapsack

!!! question

    Given $n$ items, where item $i$ has weight $wgt[i-1]$ and value $val[i-1]$, and a knapsack of capacity $cap$, **each item may be chosen repeatedly**. What is the maximum value that fits within the capacity? An example is shown in Figure 14-22.

![Example input for unbounded knapsack](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png){ class="animation-figure" }

<p align="center"> Figure 14-22 &nbsp; Example input for unbounded knapsack </p>

### 1. &nbsp; Dynamic programming approach

Unbounded knapsack is very similar to 0-1 knapsack. **The only difference is that there is no limit on how many times an item may be chosen**.

- In 0-1 knapsack, there is only one of each item, so after including item $i$, we can choose only from the first $i-1$ items.
- In unbounded knapsack, each item has an unlimited supply, so after including item $i$, **we can still choose from the first $i$ items**.

For unbounded knapsack, state $[i, c]$ has two cases.

- **Leave item $i$ out**: As in 0-1 knapsack, the remaining state is $[i-1, c]$.
- **Put item $i$ in**: Unlike 0-1 knapsack, the remaining state is $[i, c-wgt[i-1]]$.

The state transition equation becomes:

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 2. &nbsp; Code implementation

Compared with 0-1 knapsack, only one $i-1$ in the transition changes to $i$; the rest of the code is identical:

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """Unbounded knapsack: dynamic programming"""
        n = len(wgt)
        # Initialize the dp table
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # State transitions
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c]
                else:
                    # Take the larger value obtained by excluding and including item i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* Unbounded knapsack: dynamic programming */
    int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Initialize the dp table
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* Unbounded knapsack: dynamic programming */
    int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize the dp table
        int[][] dp = new int[n + 1][cap + 1];
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* Unbounded knapsack: dynamic programming */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // Initialize the dp table
        int[,] dp = new int[n + 1, cap + 1];
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* Unbounded knapsack: dynamic programming */
    func unboundedKnapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // Initialize the dp table
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // State transitions
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i-1][c]
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* Unbounded knapsack: dynamic programming */
    func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // Initialize the dp table
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // State transitions
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* Unbounded knapsack: dynamic programming */
    function unboundedKnapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // Initialize the dp table
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* Unbounded knapsack: dynamic programming */
    function unboundedKnapsackDP(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // Initialize the dp table
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* Unbounded knapsack: dynamic programming */
    int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // Initialize the dp table
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // State transitions
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // If item i exceeds the remaining capacity, do not choose it
            dp[i][c] = dp[i - 1][c];
          } else {
            // Take the larger value obtained by excluding and including item i
            dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* Unbounded knapsack: dynamic programming */
    fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // Initialize the dp table
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // State transitions
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* Unbounded knapsack: dynamic programming */
    int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // Initialize the dp table
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // Free memory
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* Unbounded knapsack: dynamic programming */
    fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // Initialize the dp table
        val dp = Array(n + 1) { IntArray(cap + 1) }
        // State transitions
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### Unbounded knapsack: dynamic programming ###
    def unbounded_knapsack_dp(wgt, val, cap)
      n = wgt.length
      # Initialize the dp table
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # State transitions
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # If item i exceeds the remaining capacity, do not choose it
            dp[i][c] = dp[i - 1][c]
          else
            # Take the larger value obtained by excluding and including item i
            dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Unbounded%20knapsack%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Unbounded%20knapsack%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 3. &nbsp; Space optimization

The current state depends on states to its left and above, **so after space optimization, each row of the $dp$ table must be processed in forward order**.

This is the opposite of 0-1 knapsack. Use Figure 14-23 to understand the difference.

=== "<1>"
    ![Space-optimized dynamic programming for unbounded knapsack](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 14-23 &nbsp; Space-optimized dynamic programming for unbounded knapsack </p>

The implementation simply removes the first dimension of `dp`:

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """Unbounded knapsack: space-optimized dynamic programming"""
        n = len(wgt)
        # Initialize the dp table
        dp = [0] * (cap + 1)
        # State transitions
        for i in range(1, n + 1):
            # Traverse in increasing order
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c]
                else:
                    # Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* Unbounded knapsack: space-optimized dynamic programming */
    int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Initialize the dp table
        vector<int> dp(cap + 1, 0);
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* Unbounded knapsack: space-optimized dynamic programming */
    int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize the dp table
        int[] dp = new int[cap + 1];
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* Unbounded knapsack: space-optimized dynamic programming */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // Initialize the dp table
        int[] dp = new int[cap + 1];
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* Unbounded knapsack: space-optimized dynamic programming */
    func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // Initialize the dp table
        dp := make([]int, cap+1)
        // State transitions
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c]
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* Unbounded knapsack: space-optimized dynamic programming */
    func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // Initialize the dp table
        var dp = Array(repeating: 0, count: cap + 1)
        // State transitions
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c]
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* Unbounded knapsack: space-optimized dynamic programming */
    function unboundedKnapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // Initialize the dp table
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* Unbounded knapsack: space-optimized dynamic programming */
    function unboundedKnapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // Initialize the dp table
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* Unbounded knapsack: space-optimized dynamic programming */
    int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // Initialize the dp table
      List<int> dp = List.filled(cap + 1, 0);
      // State transitions
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // If item i exceeds the remaining capacity, do not choose it
            dp[c] = dp[c];
          } else {
            // Take the larger value obtained by excluding and including item i
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* Unbounded knapsack: space-optimized dynamic programming */
    fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // Initialize the dp table
        let mut dp = vec![0; cap + 1];
        // State transitions
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* Unbounded knapsack: space-optimized dynamic programming */
    int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // Initialize the dp table
        int *dp = calloc(cap + 1, sizeof(int));
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // Free memory
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* Unbounded knapsack: space-optimized dynamic programming */
    fun unboundedKnapsackDPComp(
        wgt: IntArray,
        _val: IntArray,
        cap: Int
    ): Int {
        val n = wgt.size
        // Initialize the dp table
        val dp = IntArray(cap + 1)
        // State transitions
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c]
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### Unbounded knapsack: space-optimized dynamic programming ###
    def unbounded_knapsack_dp_comp(wgt, val, cap)
      n = wgt.length
      # Initialize the dp table
      dp = Array.new(cap + 1, 0)
      # State transitions
      for i in 1...(n + 1)
        # Traverse in increasing order
        for c in 1...(cap + 1)
          if wgt[i -1] > c
            # If item i exceeds the remaining capacity, do not choose it
            dp[c] = dp[c]
          else
            # Take the larger value obtained by excluding and including item i
            dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[cap]
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Unbounded%20knapsack%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20increasing%20order%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Unbounded%20knapsack%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20increasing%20order%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 14.5.2 &nbsp; Coin change problem

Knapsack represents a broad family of dynamic programming problems, with many variants such as coin change.

!!! question

    Given $n$ coin denominations, where denomination $i$ has value $coins[i - 1]$, and a target amount $amt$, **each denomination may be used repeatedly**. What is the minimum number of coins needed to make the target? Return $-1$ if it cannot be made. An example is shown in Figure 14-24.

![Example input for coin change](unbounded_knapsack_problem.assets/coin_change_example.png){ class="animation-figure" }

<p align="center"> Figure 14-24 &nbsp; Example input for coin change </p>

### 1. &nbsp; Dynamic programming approach

**Coin change can be viewed as a special case of unbounded knapsack**, with the following connections and differences.

- The two problems can be translated into one another: items correspond to coins, item weights to coin denominations, and knapsack capacity to the target amount.
- The optimization objectives are opposite: unbounded knapsack maximizes item value, while coin change minimizes the number of coins.
- Unbounded knapsack must stay within a capacity limit, whereas coin change must reach the target amount exactly.

**Step 1: Identify each decision, define the state, and establish the $dp$ table**

State $[i, a]$ represents the subproblem of finding **the minimum number of coins needed to make amount $a$ using the first $i$ denominations**, denoted by $dp[i, a]$.

The two-dimensional $dp$ table has size $(n+1) \times (amt+1)$.

**Step 2: Identify optimal substructure and derive the state transition equation**

The state transition differs from unbounded knapsack in two ways.

- We want a minimum, so replace $\max()$ with $\min()$.
- We optimize the coin count rather than item value, so choosing a coin adds $+1$.

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**Step 3: Determine the boundary conditions and evaluation order**

A target amount of $0$ requires $0$ coins, so every entry $dp[i, 0]$ in the first column is $0$.

With no coins, **any target amount $> 0$ is impossible**. To let $\min()$ recognize and discard these infeasible solutions, represent them by $+ \infty$: set the first-row entries $dp[0, a]$ to $+ \infty$.

### 2. &nbsp; Code implementation

Most programming languages do not provide an integer value for $+ \infty$, so the maximum `int` value is used instead. However, the $+ 1$ in the transition may then overflow.

Instead, use $amt + 1$ to represent an infeasible solution, since making $amt$ requires at most $amt$ coins. Before returning, check whether $dp[n, amt]$ equals $amt + 1$. If so, return $-1$ to indicate that the target cannot be made. The code is as follows:

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp(coins: list[int], amt: int) -> int:
        """Coin change: dynamic programming"""
        n = len(coins)
        MAX = amt + 1
        # Initialize the dp table
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # State transitions: first row and first column
        for a in range(1, amt + 1):
            dp[0][a] = MAX
        # State transitions: remaining rows and columns
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If the coin value exceeds the current amount a, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                else:
                    # Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
        return dp[n][amt] if dp[n][amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* Coin change: dynamic programming */
    int coinChangeDP(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // Initialize the dp table
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // State transitions: first row and first column
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transitions: remaining rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* Coin change: dynamic programming */
    int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Initialize the dp table
        int[][] dp = new int[n + 1][amt + 1];
        // State transitions: first row and first column
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transitions: remaining rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* Coin change: dynamic programming */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Initialize the dp table
        int[,] dp = new int[n + 1, amt + 1];
        // State transitions: first row and first column
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // State transitions: remaining rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* Coin change: dynamic programming */
    func coinChangeDP(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // Initialize the dp table
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // State transitions: first row and first column
        for a := 1; a <= amt; a++ {
            dp[0][a] = max
        }
        // State transitions: remaining rows and columns
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[i][a] = dp[i-1][a]
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
                }
            }
        }
        if dp[n][amt] != max {
            return dp[n][amt]
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    /* Coin change: dynamic programming */
    func coinChangeDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // Initialize the dp table
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // State transitions: first row and first column
        for a in 1 ... amt {
            dp[0][a] = MAX
        }
        // State transitions: remaining rows and columns
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* Coin change: dynamic programming */
    function coinChangeDP(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // Initialize the dp table
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // State transitions: first row and first column
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transitions: remaining rows and columns
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* Coin change: dynamic programming */
    function coinChangeDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // Initialize the dp table
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // State transitions: first row and first column
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transitions: remaining rows and columns
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* Coin change: dynamic programming */
    int coinChangeDP(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // Initialize the dp table
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // State transitions: first row and first column
      for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
      }
      // State transitions: remaining rows and columns
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // If the coin exceeds the current amount a, do not choose coin i
            dp[i][a] = dp[i - 1][a];
          } else {
            // Take the smaller result of not choosing and choosing coin i
            dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* Coin change: dynamic programming */
    fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // Initialize the dp table
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // State transitions: first row and first column
        for a in 1..=amt {
            dp[0][a] = max;
        }
        // State transitions: remaining rows and columns
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = std::cmp::min(dp[i - 1][a], dp[i][a - coins[i - 1] as usize] + 1);
                }
            }
        }
        if dp[n][amt] != max {
            return dp[n][amt] as i32;
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change.c"
    /* Coin change: dynamic programming */
    int coinChangeDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // Initialize the dp table
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // State transitions: first row and first column
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transitions: remaining rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
        // Free memory
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* Coin change: dynamic programming */
    fun coinChangeDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // Initialize the dp table
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // State transitions: first row and first column
        for (a in 1..amt) {
            dp[0][a] = MAX
        }
        // State transitions: remaining rows and columns
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // If the coin value exceeds the current amount a, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[n][amt] != MAX) dp[n][amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### Coin change: dynamic programming ###
    def coin_change_dp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # Initialize the dp table
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # State transitions: first row and first column
      (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
      # State transitions: remaining rows and columns
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # If the coin exceeds the current amount a, do not choose coin i
            dp[i][a] = dp[i - 1][a]
          else
            # Take the smaller result of not choosing and choosing coin i
            dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[n][amt] != _MAX ? dp[n][amt] : -1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20State%20transitions%3A%20first%20row%20and%20first%20column%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20State%20transitions%3A%20remaining%20rows%20and%20columns%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20smaller%20result%20of%20not%20choosing%20and%20choosing%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Minimum%20number%20of%20coins%20needed%20to%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20State%20transitions%3A%20first%20row%20and%20first%20column%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20State%20transitions%3A%20remaining%20rows%20and%20columns%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20smaller%20result%20of%20not%20choosing%20and%20choosing%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Minimum%20number%20of%20coins%20needed%20to%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 14-25 shows dynamic programming for coin change, which closely resembles unbounded knapsack.

=== "<1>"
    ![Dynamic programming for coin change](unbounded_knapsack_problem.assets/coin_change_dp_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 14-25 &nbsp; Dynamic programming for coin change </p>

### 3. &nbsp; Space optimization

Space optimization is the same as for unbounded knapsack:

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp_comp(coins: list[int], amt: int) -> int:
        """Coin change: space-optimized dynamic programming"""
        n = len(coins)
        MAX = amt + 1
        # Initialize the dp table
        dp = [MAX] * (amt + 1)
        dp[0] = 0
        # State transitions
        for i in range(1, n + 1):
            # Traverse in increasing order
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If the coin value exceeds the current amount a, do not choose coin i
                    dp[a] = dp[a]
                else:
                    # Take the smaller result of not choosing and choosing coin i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
        return dp[amt] if dp[amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* Coin change: space-optimized dynamic programming */
    int coinChangeDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // Initialize the dp table
        vector<int> dp(amt + 1, MAX);
        dp[0] = 0;
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* Coin change: space-optimized dynamic programming */
    int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Initialize the dp table
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* Coin change: space-optimized dynamic programming */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Initialize the dp table
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* Coin change: dynamic programming */
    func coinChangeDPComp(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // Initialize the dp table
        dp := make([]int, amt+1)
        for i := 1; i <= amt; i++ {
            dp[i] = max
        }
        // State transitions
        for i := 1; i <= n; i++ {
            // Traverse in increasing order
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[a] = dp[a]
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
                }
            }
        }
        if dp[amt] != max {
            return dp[amt]
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    /* Coin change: space-optimized dynamic programming */
    func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // Initialize the dp table
        var dp = Array(repeating: MAX, count: amt + 1)
        dp[0] = 0
        // State transitions
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[a] = dp[a]
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* Coin change: space-optimized dynamic programming */
    function coinChangeDPComp(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // Initialize the dp table
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* Coin change: space-optimized dynamic programming */
    function coinChangeDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // Initialize the dp table
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* Coin change: space-optimized dynamic programming */
    int coinChangeDPComp(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // Initialize the dp table
      List<int> dp = List.filled(amt + 1, MAX);
      dp[0] = 0;
      // State transitions
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // If the coin exceeds the current amount a, do not choose coin i
            dp[a] = dp[a];
          } else {
            // Take the smaller result of not choosing and choosing coin i
            dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* Coin change: space-optimized dynamic programming */
    fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // Initialize the dp table
        let mut dp = vec![0; amt + 1];
        dp.fill(max);
        dp[0] = 0;
        // State transitions
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = std::cmp::min(dp[a], dp[a - coins[i - 1] as usize] + 1);
                }
            }
        }
        if dp[amt] != max {
            return dp[amt] as i32;
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change.c"
    /* Coin change: space-optimized dynamic programming */
    int coinChangeDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // Initialize the dp table
        int *dp = malloc((amt + 1) * sizeof(int));
        for (int j = 1; j <= amt; j++) {
            dp[j] = MAX;
        } 
        dp[0] = 0;

        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[amt] != MAX ? dp[amt] : -1;
        // Free memory
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* Coin change: space-optimized dynamic programming */
    fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // Initialize the dp table
        val dp = IntArray(amt + 1)
        dp.fill(MAX)
        dp[0] = 0
        // State transitions
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // If the coin value exceeds the current amount a, do not choose coin i
                    dp[a] = dp[a]
                } else {
                    // Take the smaller result of not choosing and choosing coin i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[amt] != MAX) dp[amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### Coin change: space-optimized dynamic programming ###
    def coin_change_dp_comp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # Initialize the dp table
      dp = Array.new(amt + 1, _MAX)
      dp[0] = 0
      # State transitions
      for i in 1...(n + 1)
        # Traverse in increasing order
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # If the coin exceeds the current amount a, do not choose coin i
            dp[a] = dp[a]
          else
            # Take the smaller result of not choosing and choosing coin i
            dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[amt] != _MAX ? dp[amt] : -1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20increasing%20order%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20smaller%20result%20of%20not%20choosing%20and%20choosing%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Minimum%20number%20of%20coins%20needed%20to%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20increasing%20order%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20smaller%20result%20of%20not%20choosing%20and%20choosing%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Minimum%20number%20of%20coins%20needed%20to%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 14.5.3 &nbsp; Coin change problem II

!!! question

    Given $n$ coin denominations, where denomination $i$ has value $coins[i - 1]$, and a target amount $amt$, each denomination may be used repeatedly. **How many combinations of coins make the target amount**? An example is shown in Figure 14-26.

![Example input for coin change II](unbounded_knapsack_problem.assets/coin_change_ii_example.png){ class="animation-figure" }

<p align="center"> Figure 14-26 &nbsp; Example input for coin change II </p>

### 1. &nbsp; Dynamic programming approach

This time, we count combinations, so the subproblem becomes **the number of combinations that make amount $a$ using the first $i$ denominations**. The $dp$ table remains a two-dimensional matrix of size $(n+1) \times (amt + 1)$.

The number of combinations for the current state is the sum of those that exclude the current coin and those that include it. The state transition equation is:

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

A target of $0$ can be made by choosing no coins, so initialize every first-column entry $dp[i, 0]$ to $1$. With no coins, any target $>0$ is impossible, so the first-row entries $dp[0, a]$ are $0$.

### 2. &nbsp; Code implementation

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp(coins: list[int], amt: int) -> int:
        """Coin change II: dynamic programming"""
        n = len(coins)
        # Initialize the dp table
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # Initialize the first column
        for i in range(n + 1):
            dp[i][0] = 1
        # State transitions
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If the coin value exceeds the current amount a, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                else:
                    # Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
        return dp[n][amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* Coin change II: dynamic programming */
    int coinChangeIIDP(vector<int> &coins, int amt) {
        int n = coins.size();
        // Initialize the dp table
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // Initialize the first column
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* Coin change II: dynamic programming */
    int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // Initialize the dp table
        int[][] dp = new int[n + 1][amt + 1];
        // Initialize the first column
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* Coin change II: dynamic programming */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // Initialize the dp table
        int[,] dp = new int[n + 1, amt + 1];
        // Initialize the first column
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* Coin change II: dynamic programming */
    func coinChangeIIDP(coins []int, amt int) int {
        n := len(coins)
        // Initialize the dp table
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // Initialize the first column
        for i := 0; i <= n; i++ {
            dp[i][0] = 1
        }
        // State transitions: remaining rows and columns
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[i][a] = dp[i-1][a]
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* Coin change II: dynamic programming */
    func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // Initialize the dp table
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // Initialize the first column
        for i in 0 ... n {
            dp[i][0] = 1
        }
        // State transitions
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* Coin change II: dynamic programming */
    function coinChangeIIDP(coins, amt) {
        const n = coins.length;
        // Initialize the dp table
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // Initialize the first column
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* Coin change II: dynamic programming */
    function coinChangeIIDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // Initialize the dp table
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // Initialize the first column
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* Coin change II: dynamic programming */
    int coinChangeIIDP(List<int> coins, int amt) {
      int n = coins.length;
      // Initialize the dp table
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // Initialize the first column
      for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
      }
      // State transitions
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // If the coin exceeds the current amount a, do not choose coin i
            dp[i][a] = dp[i - 1][a];
          } else {
            // Add the numbers of ways without and with coin i
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
          }
        }
      }
      return dp[n][amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* Coin change II: dynamic programming */
    fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // Initialize the dp table
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // Initialize the first column
        for i in 0..=n {
            dp[i][0] = 1;
        }
        // State transitions
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
                }
            }
        }
        dp[n][amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* Coin change II: dynamic programming */
    int coinChangeIIDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // Initialize the dp table
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // Initialize the first column
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        int res = dp[n][amt];
        // Free memory
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* Coin change II: dynamic programming */
    fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // Initialize the dp table
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // Initialize the first column
        for (i in 0..n) {
            dp[i][0] = 1
        }
        // State transitions
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // If the coin value exceeds the current amount a, do not choose coin i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### Coin change II: dynamic programming ###
    def coin_change_ii_dp(coins, amt)
      n = coins.length
      # Initialize the dp table
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # Initialize the first column
      (0...(n + 1)).each { |i| dp[i][0] = 1 }
      # State transitions
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # If the coin exceeds the current amount a, do not choose coin i
            dp[i][a] = dp[i - 1][a]
          else
            # Add the numbers of ways without and with coin i
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
          end
        end
      end
      dp[n][amt]
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%20II%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20Initialize%20the%20first%20column%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Add%20the%20numbers%20of%20ways%20without%20and%20with%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Number%20of%20coin%20combinations%20that%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%20II%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20Initialize%20the%20first%20column%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Add%20the%20numbers%20of%20ways%20without%20and%20with%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Number%20of%20coin%20combinations%20that%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 3. &nbsp; Space optimization

The space optimization is the same: remove the coin dimension:

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
        """Coin change II: space-optimized dynamic programming"""
        n = len(coins)
        # Initialize the dp table
        dp = [0] * (amt + 1)
        dp[0] = 1
        # State transitions
        for i in range(1, n + 1):
            # Traverse in increasing order
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # If the coin value exceeds the current amount a, do not choose coin i
                    dp[a] = dp[a]
                else:
                    # Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
        return dp[amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* Coin change II: space-optimized dynamic programming */
    int coinChangeIIDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        // Initialize the dp table
        vector<int> dp(amt + 1, 0);
        dp[0] = 1;
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* Coin change II: space-optimized dynamic programming */
    int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // Initialize the dp table
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* Coin change II: space-optimized dynamic programming */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // Initialize the dp table
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* Coin change II: space-optimized dynamic programming */
    func coinChangeIIDPComp(coins []int, amt int) int {
        n := len(coins)
        // Initialize the dp table
        dp := make([]int, amt+1)
        dp[0] = 1
        // State transitions
        for i := 1; i <= n; i++ {
            // Traverse in increasing order
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[a] = dp[a]
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a-coins[i-1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* Coin change II: space-optimized dynamic programming */
    func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // Initialize the dp table
        var dp = Array(repeating: 0, count: amt + 1)
        dp[0] = 1
        // State transitions
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // If the coin exceeds the current target amount a, do not choose coin i
                    dp[a] = dp[a]
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* Coin change II: space-optimized dynamic programming */
    function coinChangeIIDPComp(coins, amt) {
        const n = coins.length;
        // Initialize the dp table
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* Coin change II: space-optimized dynamic programming */
    function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // Initialize the dp table
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // State transitions
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* Coin change II: space-optimized dynamic programming */
    int coinChangeIIDPComp(List<int> coins, int amt) {
      int n = coins.length;
      // Initialize the dp table
      List<int> dp = List.filled(amt + 1, 0);
      dp[0] = 1;
      // State transitions
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // If the coin exceeds the current amount a, do not choose coin i
            dp[a] = dp[a];
          } else {
            // Add the numbers of ways without and with coin i
            dp[a] = dp[a] + dp[a - coins[i - 1]];
          }
        }
      }
      return dp[amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* Coin change II: space-optimized dynamic programming */
    fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // Initialize the dp table
        let mut dp = vec![0; amt + 1];
        dp[0] = 1;
        // State transitions
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
                }
            }
        }
        dp[amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* Coin change II: space-optimized dynamic programming */
    int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // Initialize the dp table
        int *dp = calloc(amt + 1, sizeof(int));
        dp[0] = 1;
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If the coin exceeds the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        int res = dp[amt];
        // Free memory
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* Coin change II: space-optimized dynamic programming */
    fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // Initialize the dp table
        val dp = IntArray(amt + 1)
        dp[0] = 1
        // State transitions
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // If the coin value exceeds the current amount a, do not choose coin i
                    dp[a] = dp[a]
                } else {
                    // Add the numbers of ways without and with coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### Coin change II: space-optimized dynamic programming ###
    def coin_change_ii_dp_comp(coins, amt)
      n = coins.length
      # Initialize the dp table
      dp = Array.new(amt + 1, 0)
      dp[0] = 1
      # State transitions
      for i in 1...(n + 1)
        # Traverse in increasing order
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # If the coin exceeds the current amount a, do not choose coin i
            dp[a] = dp[a]
          else
            # Add the numbers of ways without and with coin i
            dp[a] = dp[a] + dp[a - coins[i - 1]]
          end
        end
      end
      dp[amt]
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%20II%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20increasing%20order%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Add%20the%20numbers%20of%20ways%20without%20and%20with%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Number%20of%20coin%20combinations%20that%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%20II%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20increasing%20order%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20coin%20value%20exceeds%20the%20current%20amount%20a,%20do%20not%20choose%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Add%20the%20numbers%20of%20ways%20without%20and%20with%20coin%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22Number%20of%20coin%20combinations%20that%20make%20the%20target%20amount%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>
