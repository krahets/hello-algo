---
comments: true
---

# 14.4 &nbsp; 0-1 knapsack problem

The knapsack problem is an excellent introduction to dynamic programming and one of its most common problem families. Variants include 0-1 knapsack, unbounded knapsack, and bounded knapsack.

We will begin with the most common variant, 0-1 knapsack.

!!! question

    Given $n$ items, where item $i$ has weight $wgt[i-1]$ and value $val[i-1]$, and a knapsack of capacity $cap$, each item may be chosen only once. What is the maximum total value that fits within the capacity?

As shown in Figure 14-17, item numbers $i$ start at $1$, while array indices start at $0$. Item $i$ therefore has weight $wgt[i-1]$ and value $val[i-1]$.

![Example input for 0-1 knapsack](knapsack_problem.assets/knapsack_example.png){ class="animation-figure" }

<p align="center"> Figure 14-17 &nbsp; Example input for 0-1 knapsack </p>

We can view 0-1 knapsack as $n$ rounds of decisions, with two choices for each item: leave it out or put it in. It therefore fits the decision tree model.

The objective is to maximize value within a capacity limit, making dynamic programming a promising approach.

**Step 1: Identify each decision, define the state, and establish the $dp$ table**

Leaving an item out keeps the available capacity unchanged; putting it in reduces the capacity. The state therefore consists of the current item number $i$ and capacity $c$, denoted by $[i, c]$.

State $[i, c]$ represents the subproblem of finding **the maximum value obtainable from the first $i$ items with capacity $c$**, denoted by $dp[i, c]$.

We seek $dp[n, cap]$, so we need a two-dimensional $dp$ table of size $(n+1) \times (cap+1)$.

**Step 2: Identify optimal substructure and derive the state transition equation**

After deciding what to do with item $i$, the remaining subproblem concerns the first $i-1$ items. There are two cases.

- **Leave item $i$ out**: Capacity stays unchanged, and the remaining state is $[i-1, c]$.
- **Put item $i$ in**: Capacity decreases by $wgt[i-1]$, value increases by $val[i-1]$, and the remaining state is $[i-1, c-wgt[i-1]]$.

This reveals the optimal substructure: **the maximum value $dp[i, c]$ is the larger value obtained by leaving item $i$ out or putting item $i$ in**. The state transition equation is:

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

If the current item's weight $wgt[i - 1]$ exceeds the remaining capacity $c$, the only option is to leave it out.

**Step 3: Determine the boundary conditions and evaluation order**

With no items or capacity $0$, the maximum value is $0$. Thus, the first column $dp[i, 0]$ and first row $dp[0, c]$ are both $0$.

The current state $[i, c]$ depends on $[i-1, c]$ above and $[i-1, c-wgt[i-1]]$ to the upper left, so two nested loops can traverse the $dp$ table in increasing index order.

We will now implement brute-force search, memoized search, and dynamic programming in that order.

### 1. &nbsp; Method 1: Brute-force search

The search has the following elements.

- **Parameters**: The state $[i, c]$.
- **Return value**: The subproblem solution $dp[i, c]$.
- **Base case**: If there are no items left, $i = 0$, or the remaining capacity is $0$, stop recursion and return value $0$.
- **Pruning**: If the current item is heavier than the remaining capacity, only the choice to leave it out is allowed.

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
        """0-1 knapsack: brute-force search"""
        # If all items have been considered or no capacity remains, return value 0
        if i == 0 or c == 0:
            return 0
        # If the item exceeds the remaining capacity, it must be excluded
        if wgt[i - 1] > c:
            return knapsack_dfs(wgt, val, i - 1, c)
        # Calculate the maximum values obtained by excluding and including item i
        no = knapsack_dfs(wgt, val, i - 1, c)
        yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
        # Return the larger value from the two choices
        return max(no, yes)
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 knapsack: brute-force search */
    int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Return the larger value from the two choices
        return max(no, yes);
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 knapsack: brute-force search */
    int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Return the larger value from the two choices
        return Math.max(no, yes);
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 knapsack: brute-force search */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // Return the larger value from the two choices
        return Math.Max(no, yes);
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 knapsack: brute-force search */
    func knapsackDFS(wgt, val []int, i, c int) int {
        // If all items have been considered or no capacity remains, return value 0
        if i == 0 || c == 0 {
            return 0
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if wgt[i-1] > c {
            return knapsackDFS(wgt, val, i-1, c)
        }
        // Calculate the maximum values obtained by excluding and including item i
        no := knapsackDFS(wgt, val, i-1, c)
        yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
        // Return the larger value from the two choices
        return int(math.Max(float64(no), float64(yes)))
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 knapsack: brute-force search */
    func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
        // If all items have been considered or no capacity remains, return value 0
        if i == 0 || c == 0 {
            return 0
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if wgt[i - 1] > c {
            return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        }
        // Calculate the maximum values obtained by excluding and including item i
        let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // Return the larger value from the two choices
        return max(no, yes)
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 knapsack: brute-force search */
    function knapsackDFS(wgt, val, i, c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Return the larger value from the two choices
        return Math.max(no, yes);
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 knapsack: brute-force search */
    function knapsackDFS(
        wgt: Array<number>,
        val: Array<number>,
        i: number,
        c: number
    ): number {
        // If all items have been considered or no capacity remains, return value 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Return the larger value from the two choices
        return Math.max(no, yes);
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 knapsack: brute-force search */
    int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
      // If all items have been considered or no capacity remains, return value 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // If the item exceeds the remaining capacity, it must be excluded
      if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
      }
      // Calculate the maximum values obtained by excluding and including item i
      int no = knapsackDFS(wgt, val, i - 1, c);
      int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
      // Return the larger value from the two choices
      return max(no, yes);
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 knapsack: brute-force search */
    fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
        // If all items have been considered or no capacity remains, return value 0
        if i == 0 || c == 0 {
            return 0;
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs(wgt, val, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        let no = knapsack_dfs(wgt, val, i - 1, c);
        let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // Return the larger value from the two choices
        std::cmp::max(no, yes)
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 knapsack: brute-force search */
    int knapsackDFS(int wgt[], int val[], int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Return the larger value from the two choices
        return myMax(no, yes);
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 knapsack: brute-force search */
    fun knapsackDFS(
        wgt: IntArray,
        _val: IntArray,
        i: Int,
        c: Int
    ): Int {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, _val, i - 1, c)
        }
        // Calculate the maximum values obtained by excluding and including item i
        val no = knapsackDFS(wgt, _val, i - 1, c)
        val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // Return the larger value from the two choices
        return max(no, yes)
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 knapsack: brute-force search ###
    def knapsack_dfs(wgt, val, i, c)
      # If all items have been considered or no capacity remains, return value 0
      return 0 if i == 0 || c == 0
      # If the item exceeds the remaining capacity, it must be excluded
      return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
      # Calculate the maximum values obtained by excluding and including item i
      no = knapsack_dfs(wgt, val, i - 1, c)
      yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Return the larger value from the two choices
      [no, yes].max
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20i%3A%20int,%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20brute-force%20search%22%22%22%0A%20%20%20%20%23%20If%20all%20items%20have%20been%20considered%20or%20no%20capacity%20remains,%20return%20value%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20If%20the%20item%20exceeds%20the%20remaining%20capacity,%20it%20must%20be%20excluded%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20Calculate%20the%20maximum%20values%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20Return%20the%20larger%20value%20from%20the%20two%20choices%0A%20%20%20%20return%20max%28no,%20yes%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Brute-force%20search%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt,%20val,%20n,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20i%3A%20int,%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20brute-force%20search%22%22%22%0A%20%20%20%20%23%20If%20all%20items%20have%20been%20considered%20or%20no%20capacity%20remains,%20return%20value%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20If%20the%20item%20exceeds%20the%20remaining%20capacity,%20it%20must%20be%20excluded%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20Calculate%20the%20maximum%20values%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20Return%20the%20larger%20value%20from%20the%20two%20choices%0A%20%20%20%20return%20max%28no,%20yes%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Brute-force%20search%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt,%20val,%20n,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

As shown in Figure 14-18, each item creates two branches, excluding it or including it, so the time complexity is $O(2^n)$.

The recursion tree contains overlapping subproblems, such as $dp[1, 10]$. Their number grows substantially with more items and larger capacity, especially when many items share the same weight.

![Brute-force recursion tree for 0-1 knapsack](knapsack_problem.assets/knapsack_dfs.png){ class="animation-figure" }

<p align="center"> Figure 14-18 &nbsp; Brute-force recursion tree for 0-1 knapsack </p>

### 2. &nbsp; Method 2: Memoized search

To solve each overlapping subproblem only once, use a memoization table `mem`, where `mem[i][c]` stores $dp[i, c]$.

With memoization, **the time complexity depends on the number of subproblems**, giving $O(n \times cap)$. The code is as follows:

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs_mem(
        wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
    ) -> int:
        """0-1 knapsack: memoized search"""
        # If all items have been considered or no capacity remains, return value 0
        if i == 0 or c == 0:
            return 0
        # If a result has already been recorded, return it directly
        if mem[i][c] != -1:
            return mem[i][c]
        # If the item exceeds the remaining capacity, it must be excluded
        if wgt[i - 1] > c:
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        # Calculate the maximum values obtained by excluding and including item i
        no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
        # Record and return the larger value from the two choices
        mem[i][c] = max(no, yes)
        return mem[i][c]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 knapsack: memoized search */
    int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If a result has already been recorded, return it directly
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Record and return the larger value from the two choices
        mem[i][c] = max(no, yes);
        return mem[i][c];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 knapsack: memoized search */
    int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If a result has already been recorded, return it directly
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Record and return the larger value from the two choices
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 knapsack: memoized search */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If a result has already been recorded, return it directly
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // Record and return the larger value from the two choices
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 knapsack: memoized search */
    func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
        // If all items have been considered or no capacity remains, return value 0
        if i == 0 || c == 0 {
            return 0
        }
        // If a result has already been recorded, return it directly
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if wgt[i-1] > c {
            return knapsackDFSMem(wgt, val, mem, i-1, c)
        }
        // Calculate the maximum values obtained by excluding and including item i
        no := knapsackDFSMem(wgt, val, mem, i-1, c)
        yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
        // Return the larger value from the two choices
        mem[i][c] = int(math.Max(float64(no), float64(yes)))
        return mem[i][c]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 knapsack: memoized search */
    func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
        // If all items have been considered or no capacity remains, return value 0
        if i == 0 || c == 0 {
            return 0
        }
        // If a result has already been recorded, return it directly
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if wgt[i - 1] > c {
            return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        }
        // Calculate the maximum values obtained by excluding and including item i
        let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // Record and return the larger value from the two choices
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 knapsack: memoized search */
    function knapsackDFSMem(wgt, val, mem, i, c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // If a result has already been recorded, return it directly
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Record and return the larger value from the two choices
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 knapsack: memoized search */
    function knapsackDFSMem(
        wgt: Array<number>,
        val: Array<number>,
        mem: Array<Array<number>>,
        i: number,
        c: number
    ): number {
        // If all items have been considered or no capacity remains, return value 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // If a result has already been recorded, return it directly
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Record and return the larger value from the two choices
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 knapsack: memoized search */
    int knapsackDFSMem(
      List<int> wgt,
      List<int> val,
      List<List<int>> mem,
      int i,
      int c,
    ) {
      // If all items have been considered or no capacity remains, return value 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // If a result has already been recorded, return it directly
      if (mem[i][c] != -1) {
        return mem[i][c];
      }
      // If the item exceeds the remaining capacity, it must be excluded
      if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
      }
      // Calculate the maximum values obtained by excluding and including item i
      int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
      int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
      // Record and return the larger value from the two choices
      mem[i][c] = max(no, yes);
      return mem[i][c];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 knapsack: memoized search */
    fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
        // If all items have been considered or no capacity remains, return value 0
        if i == 0 || c == 0 {
            return 0;
        }
        // If a result has already been recorded, return it directly
        if mem[i][c] != -1 {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // Record and return the larger value from the two choices
        mem[i][c] = std::cmp::max(no, yes);
        mem[i][c]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 knapsack: memoized search */
    int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If a result has already been recorded, return it directly
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        }
        // Calculate the maximum values obtained by excluding and including item i
        int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Record and return the larger value from the two choices
        mem[i][c] = myMax(no, yes);
        return mem[i][c];
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 knapsack: memoized search */
    fun knapsackDFSMem(
        wgt: IntArray,
        _val: IntArray,
        mem: Array<IntArray>,
        i: Int,
        c: Int
    ): Int {
        // If all items have been considered or no capacity remains, return value 0
        if (i == 0 || c == 0) {
            return 0
        }
        // If a result has already been recorded, return it directly
        if (mem[i][c] != -1) {
            return mem[i][c]
        }
        // If the item exceeds the remaining capacity, it must be excluded
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, _val, mem, i - 1, c)
        }
        // Calculate the maximum values obtained by excluding and including item i
        val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
        val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // Record and return the larger value from the two choices
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 knapsack: memoized search ###
    def knapsack_dfs_mem(wgt, val, mem, i, c)
      # If all items have been considered or no capacity remains, return value 0
      return 0 if i == 0 || c == 0
      # If a result has already been recorded, return it directly
      return mem[i][c] if mem[i][c] != -1
      # If the item exceeds the remaining capacity, it must be excluded
      return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
      # Calculate the maximum values obtained by excluding and including item i
      no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
      yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Record and return the larger value from the two choices
      mem[i][c] = [no, yes].max
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20memoized%20search%22%22%22%0A%20%20%20%20%23%20If%20all%20items%20have%20been%20considered%20or%20no%20capacity%20remains,%20return%20value%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20If%20a%20result%20has%20already%20been%20recorded,%20return%20it%20directly%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20If%20the%20item%20exceeds%20the%20remaining%20capacity,%20it%20must%20be%20excluded%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20Calculate%20the%20maximum%20values%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20Record%20and%20return%20the%20larger%20value%20from%20the%20two%20choices%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no,%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Memoized%20search%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20n,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20memoized%20search%22%22%22%0A%20%20%20%20%23%20If%20all%20items%20have%20been%20considered%20or%20no%20capacity%20remains,%20return%20value%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20If%20a%20result%20has%20already%20been%20recorded,%20return%20it%20directly%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20If%20the%20item%20exceeds%20the%20remaining%20capacity,%20it%20must%20be%20excluded%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20Calculate%20the%20maximum%20values%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20Record%20and%20return%20the%20larger%20value%20from%20the%20two%20choices%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no,%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Memoized%20search%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20n,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 14-19 shows the branches pruned by memoized search.

![Memoized recursion tree for 0-1 knapsack](knapsack_problem.assets/knapsack_dfs_mem.png){ class="animation-figure" }

<p align="center"> Figure 14-19 &nbsp; Memoized recursion tree for 0-1 knapsack </p>

### 3. &nbsp; Method 3: Dynamic programming

Dynamic programming essentially fills the $dp$ table using state transitions, as shown in the code below:

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 knapsack: dynamic programming"""
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
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 knapsack: dynamic programming */
    int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
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
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 knapsack: dynamic programming */
    int knapsackDP(int[] wgt, int[] val, int cap) {
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
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 knapsack: dynamic programming */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Initialize the dp table
        int[,] dp = new int[n + 1, cap + 1];
        // State transitions
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 knapsack: dynamic programming */
    func knapsackDP(wgt, val []int, cap int) int {
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
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 knapsack: dynamic programming */
    func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
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
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 knapsack: dynamic programming */
    function knapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // Initialize the dp table
        const dp = Array(n + 1)
            .fill(0)
            .map(() => Array(cap + 1).fill(0));
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
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 knapsack: dynamic programming */
    function knapsackDP(
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
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 knapsack: dynamic programming */
    int knapsackDP(List<int> wgt, List<int> val, int cap) {
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
            dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 knapsack: dynamic programming */
    fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
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
                    dp[i][c] = std::cmp::max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                    );
                }
            }
        }
        dp[n][cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 knapsack: dynamic programming */
    int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
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
                    dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
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

    ```kotlin title="knapsack.kt"
    /* 0-1 knapsack: dynamic programming */
    fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
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
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 knapsack: dynamic programming ###
    def knapsack_dp(wgt, val, cap)
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
            dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Dynamic%20programming%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

As shown in Figure 14-20, both time and space complexity are determined by the size of `dp`: $O(n \times cap)$.

=== "<1>"
    ![Dynamic programming for 0-1 knapsack](knapsack_problem.assets/knapsack_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.png){ class="animation-figure" }

<p align="center"> Figure 14-20 &nbsp; Dynamic programming for 0-1 knapsack </p>

### 4. &nbsp; Space optimization

Each state depends only on the previous row, so two rolling arrays reduce space complexity from $O(n \times cap)$ to $O(cap)$.

Can we go further and use just one array? Each state depends on entries directly above or to the upper left. With one array, when we begin processing row $i$, it still holds the states from row $i-1$.

- With forward iteration, by the time we reach $dp[i, j]$, the upper-left values $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ may have been overwritten, making the transition incorrect.
- With backward iteration, these values are not overwritten before they are needed, so transitions remain correct.

Figure 14-21 shows one array changing from row $i = 1$ to row $i = 2$. Consider how forward and backward iteration differ.

=== "<1>"
    ![Space-optimized dynamic programming for 0-1 knapsack](knapsack_problem.assets/knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> Figure 14-21 &nbsp; Space-optimized dynamic programming for 0-1 knapsack </p>

In the implementation, simply remove the first dimension $i$ from `dp` and reverse the inner loop:

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 knapsack: space-optimized dynamic programming"""
        n = len(wgt)
        # Initialize the dp table
        dp = [0] * (cap + 1)
        # State transitions
        for i in range(1, n + 1):
            # Traverse in decreasing order
            for c in range(cap, 0, -1):
                if wgt[i - 1] > c:
                    # If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c]
                else:
                    # Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 knapsack: space-optimized dynamic programming */
    int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Initialize the dp table
        vector<int> dp(cap + 1, 0);
        // State transitions
        for (int i = 1; i <= n; i++) {
            // Traverse in decreasing order
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 knapsack: space-optimized dynamic programming */
    int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize the dp table
        int[] dp = new int[cap + 1];
        // State transitions
        for (int i = 1; i <= n; i++) {
            // Traverse in decreasing order
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 knapsack: space-optimized dynamic programming */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Initialize the dp table
        int[] dp = new int[cap + 1];
        // State transitions
        for (int i = 1; i <= n; i++) {
            // Traverse in decreasing order
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // If item i exceeds the remaining capacity, do not choose it
                    dp[c] = dp[c];
                } else {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 knapsack: space-optimized dynamic programming */
    func knapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // Initialize the dp table
        dp := make([]int, cap+1)
        // State transitions
        for i := 1; i <= n; i++ {
            // Traverse in decreasing order
            for c := cap; c >= 1; c-- {
                if wgt[i-1] <= c {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 knapsack: space-optimized dynamic programming */
    func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // Initialize the dp table
        var dp = Array(repeating: 0, count: cap + 1)
        // State transitions
        for i in 1 ... n {
            // Traverse in decreasing order
            for c in (1 ... cap).reversed() {
                if wgt[i - 1] <= c {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 knapsack: space-optimized dynamic programming */
    function knapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // Initialize the dp table
        const dp = Array(cap + 1).fill(0);
        // State transitions
        for (let i = 1; i <= n; i++) {
            // Traverse in decreasing order
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 knapsack: space-optimized dynamic programming */
    function knapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // Initialize the dp table
        const dp = Array(cap + 1).fill(0);
        // State transitions
        for (let i = 1; i <= n; i++) {
            // Traverse in decreasing order
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 knapsack: space-optimized dynamic programming */
    int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // Initialize the dp table
      List<int> dp = List.filled(cap + 1, 0);
      // State transitions
      for (int i = 1; i <= n; i++) {
        // Traverse in decreasing order
        for (int c = cap; c >= 1; c--) {
          if (wgt[i - 1] <= c) {
            // Take the larger value obtained by excluding and including item i
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 knapsack: space-optimized dynamic programming */
    fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // Initialize the dp table
        let mut dp = vec![0; cap + 1];
        // State transitions
        for i in 1..=n {
            // Traverse in decreasing order
            for c in (1..=cap).rev() {
                if wgt[i - 1] <= c as i32 {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 knapsack: space-optimized dynamic programming */
    int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // Initialize the dp table
        int *dp = calloc(cap + 1, sizeof(int));
        // State transitions
        for (int i = 1; i <= n; i++) {
            // Traverse in decreasing order
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
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

    ```kotlin title="knapsack.kt"
    /* 0-1 knapsack: space-optimized dynamic programming */
    fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // Initialize the dp table
        val dp = IntArray(cap + 1)
        // State transitions
        for (i in 1..n) {
            // Traverse in decreasing order
            for (c in cap downTo 1) {
                if (wgt[i - 1] <= c) {
                    // Take the larger value obtained by excluding and including item i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 knapsack: space-optimized dynamic programming ###
    def knapsack_dp_comp(wgt, val, cap)
      n = wgt.length
      # Initialize the dp table
      dp = Array.new(cap + 1, 0)
      # State transitions
      for i in 1...(n + 1)
        # Traverse in decreasing order
        for c in cap.downto(1)
          if wgt[i - 1] > c
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

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20decreasing%20order%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20knapsack%3A%20space-optimized%20dynamic%20programming%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20Initialize%20the%20dp%20table%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20State%20transitions%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Traverse%20in%20decreasing%20order%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20item%20i%20exceeds%20the%20remaining%20capacity,%20do%20not%20choose%20it%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Take%20the%20larger%20value%20obtained%20by%20excluding%20and%20including%20item%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Space-optimized%20dynamic%20programming%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>
