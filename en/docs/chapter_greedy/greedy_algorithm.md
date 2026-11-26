---
comments: true
---

# 15.1 &nbsp; Greedy algorithms

A <u>greedy algorithm</u> is a common way to solve optimization problems. At each decision point, it takes the option that looks best at that moment. The aim is to reach a globally optimal solution through locally optimal choices. Greedy algorithms are simple and efficient and have many practical applications.

Greedy algorithms and dynamic programming are both common approaches to optimization. They share some features, such as relying on optimal substructure, but they work differently.

- Dynamic programming considers the full range of earlier decisions when making a decision at the current stage. It builds the solution to the current subproblem from solutions to earlier subproblems.
- A greedy algorithm moves forward without reconsidering earlier decisions. Each greedy choice reduces the size of the remaining problem until the problem is solved.

Let's see how a greedy algorithm works by revisiting coin change, a problem we met in the section on unbounded knapsack.

!!! question

    You are given $n$ coin denominations. Denomination $i$ is worth $coins[i - 1]$, and the target amount is $amt$. You may use each denomination repeatedly. What is the minimum number of coins needed to make the target amount? Return $-1$ if the amount cannot be made.

Figure 15-1 shows the greedy strategy. Starting with the target amount, **choose the largest coin that does not exceed the remaining amount**. Repeat until the coins add up to the target.

![Greedy strategy for coin change](greedy_algorithm.assets/coin_change_greedy_strategy.svg){ class="animation-figure" }

<p align="center"> Figure 15-1 &nbsp; Greedy strategy for coin change </p>

Here is the implementation:

=== "Python"

    ```python title="coin_change_greedy.py"
    def coin_change_greedy(coins: list[int], amt: int) -> int:
        """Greedy coin change"""
        # Assume the coins list is sorted
        i = len(coins) - 1
        count = 0
        # Make greedy choices until no amount remains
        while amt > 0:
            # Find the largest denomination that does not exceed the remaining amount
            while i > 0 and coins[i] > amt:
                i -= 1
            # Choose coins[i]
            amt -= coins[i]
            count += 1
        # Return -1 if no feasible solution was found
        return count if amt == 0 else -1
    ```

=== "C++"

    ```cpp title="coin_change_greedy.cpp"
    /* Greedy coin change */
    int coinChangeGreedy(vector<int> &coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.size() - 1;
        int count = 0;
        // Make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest denomination that does not exceed the remaining amount
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Choose coins[i]
            amt -= coins[i];
            count++;
        }
        // Return -1 if no feasible solution was found
        return amt == 0 ? count : -1;
    }
    ```

=== "Java"

    ```java title="coin_change_greedy.java"
    /* Greedy coin change */
    int coinChangeGreedy(int[] coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.length - 1;
        int count = 0;
        // Make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest denomination that does not exceed the remaining amount
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Choose coins[i]
            amt -= coins[i];
            count++;
        }
        // Return -1 if no feasible solution was found
        return amt == 0 ? count : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change_greedy.cs"
    /* Greedy coin change */
    int CoinChangeGreedy(int[] coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.Length - 1;
        int count = 0;
        // Make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest denomination that does not exceed the remaining amount
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Choose coins[i]
            amt -= coins[i];
            count++;
        }
        // Return -1 if no feasible solution was found
        return amt == 0 ? count : -1;
    }
    ```

=== "Go"

    ```go title="coin_change_greedy.go"
    /* Greedy coin change */
    func coinChangeGreedy(coins []int, amt int) int {
        // Assume the coins list is sorted
        i := len(coins) - 1
        count := 0
        // Make greedy choices until no amount remains
        for amt > 0 {
            // Find the largest denomination that does not exceed the remaining amount
            for i > 0 && coins[i] > amt {
                i--
            }
            // Choose coins[i]
            amt -= coins[i]
            count++
        }
        // Return -1 if no feasible solution was found
        if amt != 0 {
            return -1
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="coin_change_greedy.swift"
    /* Greedy coin change */
    func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
        // Assume the coins list is sorted
        var i = coins.count - 1
        var count = 0
        var amt = amt
        // Make greedy choices until no amount remains
        while amt > 0 {
            // Find the largest denomination that does not exceed the remaining amount
            while i > 0 && coins[i] > amt {
                i -= 1
            }
            // Choose coins[i]
            amt -= coins[i]
            count += 1
        }
        // Return -1 if no feasible solution was found
        return amt == 0 ? count : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change_greedy.js"
    /* Greedy coin change */
    function coinChangeGreedy(coins, amt) {
        // Assume the coins array is sorted
        let i = coins.length - 1;
        let count = 0;
        // Make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest denomination that does not exceed the remaining amount
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Choose coins[i]
            amt -= coins[i];
            count++;
        }
        // Return -1 if no feasible solution was found
        return amt === 0 ? count : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change_greedy.ts"
    /* Greedy coin change */
    function coinChangeGreedy(coins: number[], amt: number): number {
        // Assume the coins array is sorted
        let i = coins.length - 1;
        let count = 0;
        // Make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest denomination that does not exceed the remaining amount
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Choose coins[i]
            amt -= coins[i];
            count++;
        }
        // Return -1 if no feasible solution was found
        return amt === 0 ? count : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change_greedy.dart"
    /* Greedy coin change */
    int coinChangeGreedy(List<int> coins, int amt) {
      // Assume the coins list is sorted
      int i = coins.length - 1;
      int count = 0;
      // Make greedy choices until no amount remains
      while (amt > 0) {
        // Find the largest denomination that does not exceed the remaining amount
        while (i > 0 && coins[i] > amt) {
          i--;
        }
        // Choose coins[i]
        amt -= coins[i];
        count++;
      }
      // Return -1 if no feasible solution was found
      return amt == 0 ? count : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change_greedy.rs"
    /* Greedy coin change */
    fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
        // Assume the coins list is sorted
        let mut i = coins.len() - 1;
        let mut count = 0;
        // Make greedy choices until no amount remains
        while amt > 0 {
            // Find the largest denomination that does not exceed the remaining amount
            while i > 0 && coins[i] > amt {
                i -= 1;
            }
            // Choose coins[i]
            amt -= coins[i];
            count += 1;
        }
        // Return -1 if no feasible solution was found
        if amt == 0 {
            count
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change_greedy.c"
    /* Greedy coin change */
    int coinChangeGreedy(int *coins, int size, int amt) {
        // Assume the coins list is sorted
        int i = size - 1;
        int count = 0;
        // Make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest denomination that does not exceed the remaining amount
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Choose coins[i]
            amt -= coins[i];
            count++;
        }
        // Return -1 if no feasible solution was found
        return amt == 0 ? count : -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_greedy.kt"
    /* Greedy coin change */
    fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
        // Assume the coins list is sorted
        var am = amt
        var i = coins.size - 1
        var count = 0
        // Make greedy choices until no amount remains
        while (am > 0) {
            // Find the largest denomination that does not exceed the remaining amount
            while (i > 0 && coins[i] > am) {
                i--
            }
            // Choose coins[i]
            am -= coins[i]
            count++
        }
        // Return -1 if no feasible solution was found
        return if (am == 0) count else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_greedy.rb"
    ### Greedy coin change ###
    def coin_change_greedy(coins, amt)
      # Assume the coins list is sorted
      i = coins.length - 1
      count = 0
      # Make greedy choices until no amount remains
      while amt > 0
        # Find the largest denomination that does not exceed the remaining amount
        while i > 0 && coins[i] > amt
          i -= 1
        end
        # Choose coins[i]
        amt -= coins[i]
        count += 1
      end
      # Return -1 if no feasible solution was found
      amt == 0 ? count : -1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_greedy%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Greedy%20coin%20change%22%22%22%0A%20%20%20%20%23%20Assume%20the%20coins%20list%20is%20sorted%0A%20%20%20%20i%20%3D%20len%28coins%29%20-%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Make%20greedy%20choices%20until%20no%20amount%20remains%0A%20%20%20%20while%20amt%20%3E%200%3A%0A%20%20%20%20%20%20%20%20%23%20Find%20the%20largest%20denomination%20that%20does%20not%20exceed%20the%20remaining%20amount%0A%20%20%20%20%20%20%20%20while%20i%20%3E%200%20and%20coins%5Bi%5D%20%3E%20amt%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20-%3D%201%0A%20%20%20%20%20%20%20%20%23%20Choose%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20amt%20-%3D%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%23%20Return%20-1%20if%20no%20feasible%20solution%20was%20found%0A%20%20%20%20return%20count%20if%20amt%20%3D%3D%200%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Greedy%20choices%20are%20guaranteed%20to%20give%20a%20global%20optimum%20here%0A%20%20%20%20coins%20%3D%20%5B1,%205,%2010,%2020,%2050,%20100%5D%0A%20%20%20%20amt%20%3D%20186%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22The%20minimum%20number%20of%20coins%20needed%20to%20make%20%7Bamt%7D%20is%20%7Bres%7D%22%29%0A%0A%20%20%20%20%23%20Greedy%20choices%20do%20not%20guarantee%20a%20global%20optimum%20here%0A%20%20%20%20coins%20%3D%20%5B1,%2020,%2050%5D%0A%20%20%20%20amt%20%3D%2060%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22The%20minimum%20number%20of%20coins%20needed%20to%20make%20%7Bamt%7D%20is%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22The%20actual%20minimum%20is%203%20coins%3A%2020%20%2B%2020%20%2B%2020%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_greedy%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Greedy%20coin%20change%22%22%22%0A%20%20%20%20%23%20Assume%20the%20coins%20list%20is%20sorted%0A%20%20%20%20i%20%3D%20len%28coins%29%20-%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Make%20greedy%20choices%20until%20no%20amount%20remains%0A%20%20%20%20while%20amt%20%3E%200%3A%0A%20%20%20%20%20%20%20%20%23%20Find%20the%20largest%20denomination%20that%20does%20not%20exceed%20the%20remaining%20amount%0A%20%20%20%20%20%20%20%20while%20i%20%3E%200%20and%20coins%5Bi%5D%20%3E%20amt%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20-%3D%201%0A%20%20%20%20%20%20%20%20%23%20Choose%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20amt%20-%3D%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%23%20Return%20-1%20if%20no%20feasible%20solution%20was%20found%0A%20%20%20%20return%20count%20if%20amt%20%3D%3D%200%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Greedy%20choices%20are%20guaranteed%20to%20give%20a%20global%20optimum%20here%0A%20%20%20%20coins%20%3D%20%5B1,%205,%2010,%2020,%2050,%20100%5D%0A%20%20%20%20amt%20%3D%20186%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22The%20minimum%20number%20of%20coins%20needed%20to%20make%20%7Bamt%7D%20is%20%7Bres%7D%22%29%0A%0A%20%20%20%20%23%20Greedy%20choices%20do%20not%20guarantee%20a%20global%20optimum%20here%0A%20%20%20%20coins%20%3D%20%5B1,%2020,%2050%5D%0A%20%20%20%20amt%20%3D%2060%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22The%20minimum%20number%20of%20coins%20needed%20to%20make%20%7Bamt%7D%20is%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22The%20actual%20minimum%20is%203%20coins%3A%2020%20%2B%2020%20%2B%2020%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Look how little code that takes! The greedy algorithm handles coin change in about ten lines.

## 15.1.1 &nbsp; Strengths and limitations of greedy algorithms

**Greedy algorithms are straightforward to use, simple to implement, and often very efficient**. In the code above, let $\min(coins)$ be the smallest denomination. The greedy choice repeats at most $amt / \min(coins)$ times, giving a time complexity of $O(amt / \min(coins))$. This is an order of magnitude lower than the $O(n \times amt)$ time complexity of the dynamic programming solution.

However, **for some sets of denominations, the greedy algorithm fails to find an optimal solution**. Figure 15-2 shows two examples.

- **Where greedy succeeds: $coins = [1, 5, 10, 20, 50, 100]$**. With these denominations, the greedy algorithm finds an optimal solution for any $amt$.
- **Counterexample: $coins = [1, 20, 50]$**. Suppose $amt = 60$. The greedy algorithm chooses $50 + 1 \times 10$, using $11$ coins. Dynamic programming finds the optimal combination $20 + 20 + 20$, which takes only $3$ coins.
- **Counterexample: $coins = [1, 49, 50]$**. Suppose $amt = 98$. The greedy algorithm chooses $50 + 1 \times 48$, using $49$ coins. Dynamic programming finds the optimal combination $49 + 49$, which takes only $2$ coins.

![Examples where greedy coin change misses the optimum](greedy_algorithm.assets/coin_change_greedy_vs_dp.svg){ class="animation-figure" }

<p align="center"> Figure 15-2 &nbsp; Examples where greedy coin change misses the optimum </p>

For coin change in general, a greedy algorithm cannot guarantee a global optimum and may give a very poor solution. Dynamic programming is a better fit for the general problem.

Greedy algorithms are generally useful in two situations.

1. **An optimal solution is guaranteed**. A greedy algorithm is often the best choice here because it is usually more efficient than backtracking or dynamic programming.
2. **A near-optimal solution is possible**. A greedy algorithm can still be useful here. For many complex problems, finding a global optimum is difficult, and an efficient way to get a good suboptimal solution is valuable.

## 15.1.2 &nbsp; Properties of greedy algorithms

What kinds of problems are good candidates for a greedy algorithm? In particular, when can we guarantee that it will find an optimal solution?

Greedy algorithms have stricter requirements than dynamic programming. Two properties of the problem are particularly important.

- **Greedy-choice property**. A greedy algorithm can guarantee an optimal solution only if a locally optimal choice can always lead to a globally optimal solution.
- **Optimal substructure**. An optimal solution to the original problem contains optimal solutions to its subproblems.

We covered optimal substructure in the chapter on dynamic programming. One point worth keeping in mind is that some problems admit a greedy solution even when their optimal substructure is hard to see.

Let's focus on how to recognize the greedy-choice property. The property is simple to state, **but for many problems it is difficult to prove**.

Take coin change. It is easy to give a counterexample that disproves the greedy-choice property, but proving the property is harder. **What conditions must a set of denominations satisfy for greedy coin change to work**? Intuition and examples may suggest an answer, but turning it into a rigorous mathematical proof is difficult.

!!! quote

    One paper gives an $O(n^3)$-time algorithm for deciding whether greedy coin change is optimal for every amount with a given set of denominations.

    Pearson, D. A polynomial-time algorithm for the change-making problem[J]. Operations Research Letters, 2005, 33(3): 231-234.

## 15.1.3 &nbsp; Steps for solving a problem with a greedy algorithm

Solving a problem with a greedy algorithm generally involves three steps.

1. **Analyze the problem**. Identify the states, the objective to optimize, and the constraints. This step also comes up in backtracking and dynamic programming.
2. **Choose a greedy strategy**. Decide how to make the greedy choice at each step. Each choice should reduce the size of the remaining problem until the entire problem is solved.
3. **Prove correctness**. Typically, you need to show that the problem has the greedy-choice property and optimal substructure. This may require a mathematical proof, for example by induction or contradiction.

Choosing the greedy strategy is central to solving the problem, but it can be difficult for two main reasons.

- **Greedy strategies vary widely from one problem to another**. For many problems, a little thought and experimentation reveal a straightforward strategy. For more complex problems, the strategy can be hard to spot, putting your problem-solving experience and algorithm design skills to the test.
- **Some greedy strategies are deceptive**. You may feel confident in a strategy, implement it, and submit the code only to find that it fails some test cases. Such a strategy works only some of the time. Coin change is a classic example.

To establish correctness, we should give a rigorous mathematical proof of the greedy strategy, **typically by contradiction or induction**.

Finding a proof can itself be difficult. When we are stuck, we often debug the code against test cases, revising and checking the strategy one step at a time.

## 15.1.4 &nbsp; Common greedy algorithm problems

Greedy algorithms often solve optimization problems with the greedy-choice property and optimal substructure. Here are some typical examples.

- **Coin change**. For certain sets of denominations, the greedy algorithm always gives an optimal solution.
- **Interval scheduling**. Each task occupies a time interval, and you want to complete as many tasks as possible. Always choosing the available task that finishes earliest gives an optimal schedule.
- **Fractional knapsack**. Given items and a weight limit, choose items to maximize total value without exceeding that limit. In some settings, always taking the item with the greatest value-to-weight ratio (value / weight) gives an optimal solution.
- **Buying and selling stock**. Given a stock's historical prices, you may buy and sell multiple times. Once you buy, you must sell before buying again. The goal is to maximize profit.
- **Huffman coding**. This greedy algorithm performs lossless data compression. To build a Huffman tree, repeatedly merge the two nodes with the lowest frequencies. The resulting tree minimizes the weighted path length (the encoded length).
- **Dijkstra's algorithm**. In a graph with nonnegative edge weights, this greedy algorithm finds the shortest paths from a given source vertex to all other vertices.
