---
comments: true
---

# 15.1 &nbsp; Greedy algorithms

A <u>greedy algorithm</u> is a common approach to optimization problems. At each decision point, it chooses the option that looks best at that moment: it makes a locally optimal choice in the hope of reaching a globally optimal solution. Greedy algorithms are simple and efficient, with many practical applications.

Both greedy algorithms and dynamic programming are commonly used for optimization. They share some features, such as relying on optimal substructure, but work differently.

- Dynamic programming considers the current decision in light of all decisions from earlier stages, using solutions to earlier subproblems to build the solution to the current subproblem.
- A greedy algorithm does not reconsider past decisions. It keeps moving forward, making greedy choices and shrinking the problem until it is solved.

Let's explore how greedy algorithms work through the coin change problem, which you have already encountered in the section on the unbounded knapsack problem.

!!! question

    Given $n$ coin denominations, where denomination $i$ has value $coins[i - 1]$, and a target amount $amt$, you may use each denomination any number of times. What is the minimum number of coins needed to make the target amount? Return $-1$ if it cannot be made.

The greedy strategy is shown in Figure 15-1. Given the remaining target amount, **we greedily choose the largest coin that does not exceed it**, repeating this step until we have made the target amount.

![Greedy strategy for coin change](greedy_algorithm.assets/coin_change_greedy_strategy.png){ class="animation-figure" }

<p align="center"> Figure 15-1 &nbsp; Greedy strategy for coin change </p>

The implementation is as follows:

=== "Python"

    ```python title="coin_change_greedy.py"
    def coin_change_greedy(coins: list[int], amt: int) -> int:
        """Coin change: greedy algorithm"""
        # Assume the coins list is sorted
        i = len(coins) - 1
        count = 0
        # Repeatedly make greedy choices until no amount remains
        while amt > 0:
            # Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    int coinChangeGreedy(vector<int> &coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.size() - 1;
        int count = 0;
        // Repeatedly make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest coin that does not exceed the remaining amount
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
    /* Coin change: greedy algorithm */
    int coinChangeGreedy(int[] coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.length - 1;
        int count = 0;
        // Repeatedly make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    int CoinChangeGreedy(int[] coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.Length - 1;
        int count = 0;
        // Repeatedly make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    func coinChangeGreedy(coins []int, amt int) int {
        // Assume the coins list is sorted in ascending order
        i := len(coins) - 1
        count := 0
        // Repeatedly make greedy choices until no amount remains
        for amt > 0 {
            // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
        // Assume the coins list is sorted in ascending order
        var i = coins.count - 1
        var count = 0
        var amt = amt
        // Repeatedly make greedy choices until no amount remains
        while amt > 0 {
            // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    function coinChangeGreedy(coins, amt) {
        // Assume coins is sorted in ascending order
        let i = coins.length - 1;
        let count = 0;
        // Repeatedly make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    function coinChangeGreedy(coins: number[], amt: number): number {
        // Assume coins is sorted in ascending order
        let i = coins.length - 1;
        let count = 0;
        // Repeatedly make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    int coinChangeGreedy(List<int> coins, int amt) {
      // Assume the coins list is sorted in ascending order
      int i = coins.length - 1;
      int count = 0;
      // Repeatedly make greedy choices until no amount remains
      while (amt > 0) {
        // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
        // Assume the coins list is sorted
        let mut i = coins.len() - 1;
        let mut count = 0;
        // Repeatedly make greedy choices until no amount remains
        while amt > 0 {
            // Find the largest coin that does not exceed the remaining amount
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
    /* Coin change: greedy algorithm */
    int coinChangeGreedy(int *coins, int size, int amt) {
        // Assume the coins list is sorted
        int i = size - 1;
        int count = 0;
        // Repeatedly make greedy choices until no amount remains
        while (amt > 0) {
            // Find the largest coin no greater than the remaining amount
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
    /* Coin change: greedy algorithm */
    fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
        // Assume coins is sorted in ascending order
        var am = amt
        var i = coins.size - 1
        var count = 0
        // Repeatedly make greedy choices until no amount remains
        while (am > 0) {
            // Find the largest coin no greater than the remaining amount
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
    ### Coin change: greedy algorithm ###
    def coin_change_greedy(coins, amt)
      # Assume the coins list is sorted in ascending order
      i = coins.length - 1
      count = 0
      # Repeatedly make greedy choices until no amount remains
      while amt > 0
        # Find the largest coin no greater than the remaining amount
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

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_greedy%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%3A%20greedy%20algorithm%22%22%22%0A%20%20%20%20%23%20Assume%20the%20coins%20list%20is%20sorted%0A%20%20%20%20i%20%3D%20len%28coins%29%20-%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Repeatedly%20make%20greedy%20choices%20until%20no%20amount%20remains%0A%20%20%20%20while%20amt%20%3E%200%3A%0A%20%20%20%20%20%20%20%20%23%20Find%20the%20largest%20coin%20no%20greater%20than%20the%20remaining%20amount%0A%20%20%20%20%20%20%20%20while%20i%20%3E%200%20and%20coins%5Bi%5D%20%3E%20amt%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20-%3D%201%0A%20%20%20%20%20%20%20%20%23%20Choose%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20amt%20-%3D%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%23%20Return%20-1%20if%20no%20feasible%20solution%20was%20found%0A%20%20%20%20return%20count%20if%20amt%20%3D%3D%200%20else%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Greedy%20algorithm%3A%20guaranteed%20to%20find%20a%20globally%20optimal%20solution%0A%20%20%20%20coins%20%3D%20%5B1,%205,%2010,%2020,%2050,%20100%5D%0A%20%20%20%20amt%20%3D%20186%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22Number%20of%20coins%20chosen%20by%20the%20greedy%20algorithm%20for%20amount%20%7Bamt%7D%3A%20%7Bres%7D%22%29%0A%0A%20%20%20%20%23%20Greedy%20algorithm%3A%20not%20guaranteed%20to%20find%20a%20globally%20optimal%20solution%0A%20%20%20%20coins%20%3D%20%5B1,%2020,%2050%5D%0A%20%20%20%20amt%20%3D%2060%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22Number%20of%20coins%20chosen%20by%20the%20greedy%20algorithm%20for%20amount%20%7Bamt%7D%3A%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22The%20actual%20minimum%20is%203%20coins%3A%2020%20%2B%2020%20%2B%2020%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_greedy%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Coin%20change%3A%20greedy%20algorithm%22%22%22%0A%20%20%20%20%23%20Assume%20the%20coins%20list%20is%20sorted%0A%20%20%20%20i%20%3D%20len%28coins%29%20-%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Repeatedly%20make%20greedy%20choices%20until%20no%20amount%20remains%0A%20%20%20%20while%20amt%20%3E%200%3A%0A%20%20%20%20%20%20%20%20%23%20Find%20the%20largest%20coin%20no%20greater%20than%20the%20remaining%20amount%0A%20%20%20%20%20%20%20%20while%20i%20%3E%200%20and%20coins%5Bi%5D%20%3E%20amt%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20-%3D%201%0A%20%20%20%20%20%20%20%20%23%20Choose%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20amt%20-%3D%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%23%20Return%20-1%20if%20no%20feasible%20solution%20was%20found%0A%20%20%20%20return%20count%20if%20amt%20%3D%3D%200%20else%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Greedy%20algorithm%3A%20guaranteed%20to%20find%20a%20globally%20optimal%20solution%0A%20%20%20%20coins%20%3D%20%5B1,%205,%2010,%2020,%2050,%20100%5D%0A%20%20%20%20amt%20%3D%20186%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22Number%20of%20coins%20chosen%20by%20the%20greedy%20algorithm%20for%20amount%20%7Bamt%7D%3A%20%7Bres%7D%22%29%0A%0A%20%20%20%20%23%20Greedy%20algorithm%3A%20not%20guaranteed%20to%20find%20a%20globally%20optimal%20solution%0A%20%20%20%20coins%20%3D%20%5B1,%2020,%2050%5D%0A%20%20%20%20amt%20%3D%2060%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22Number%20of%20coins%20chosen%20by%20the%20greedy%20algorithm%20for%20amount%20%7Bamt%7D%3A%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22The%20actual%20minimum%20is%203%20coins%3A%2020%20%2B%2020%20%2B%2020%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

You might find yourself thinking, "So clean!" The greedy algorithm solves coin change in only about ten lines of code.

## 15.1.1 &nbsp; Strengths and limitations of greedy algorithms

**Greedy algorithms are straightforward, easy to implement, and usually efficient**. In the code above, let $\min(coins)$ be the smallest coin denomination. At most $amt / \min(coins)$ greedy choices are made, giving a time complexity of $O(amt / \min(coins))$. This is an order of magnitude lower than the dynamic programming solution's $O(n \times amt)$ time complexity.

However, **for some sets of coin denominations, a greedy algorithm cannot find the optimal solution**. Figure 15-2 illustrates two examples.

- **Successful case: $coins = [1, 5, 10, 20, 50, 100]$**. For these denominations, the greedy algorithm finds an optimal solution for any $amt$.
- **Counterexample: $coins = [1, 20, 50]$**. For $amt = 60$, the greedy algorithm produces $50 + 1 \times 10$, using $11$ coins. Dynamic programming finds the optimal solution $20 + 20 + 20$, using only $3$ coins.
- **Counterexample: $coins = [1, 49, 50]$**. For $amt = 98$, the greedy algorithm produces $50 + 1 \times 48$, using $49$ coins. Dynamic programming finds the optimal solution $49 + 49$, using only $2$ coins.

![Examples where the greedy algorithm fails to find the optimal solution](greedy_algorithm.assets/coin_change_greedy_vs_dp.png){ class="animation-figure" }

<p align="center"> Figure 15-2 &nbsp; Examples where the greedy algorithm fails to find the optimal solution </p>

In other words, a greedy algorithm cannot guarantee a globally optimal solution to coin change and may produce a very poor solution. Dynamic programming is better suited to this problem.

In general, greedy algorithms are useful in two situations.

1. **An optimal solution is guaranteed**: A greedy algorithm is often the best choice because it is usually more efficient than backtracking or dynamic programming.
2. **A near-optimal solution can be found**: A greedy algorithm can still be useful. For many complex problems, finding a globally optimal solution is very difficult, so finding a good suboptimal solution efficiently is valuable.

## 15.1.2 &nbsp; Properties required by greedy algorithms

What kinds of problems are suitable for greedy algorithms? More specifically, when can a greedy algorithm guarantee an optimal solution?

Greedy algorithms have stricter requirements than dynamic programming. Two properties are particularly important.

- **Greedy-choice property**: A greedy algorithm can guarantee an optimal solution only when locally optimal choices always lead to a globally optimal solution.
- **Optimal substructure**: An optimal solution to the original problem contains optimal solutions to its subproblems.

Optimal substructure was covered in the dynamic programming chapter, so we will not repeat that discussion here. Some problems have optimal substructure that is not immediately apparent, yet can still be solved greedily.

We will focus on how to determine whether the greedy-choice property holds. Its description may sound simple, **but proving it is difficult for many problems**.

For coin change, for example, it is easy to give counterexamples that disprove the greedy-choice property, but proving it is harder. If asked **which conditions on the coin denominations allow a greedy solution**, we may be able to give only a vague answer based on intuition or examples, rather than a rigorous mathematical proof.

!!! quote

    One paper gives an $O(n^3)$-time algorithm for determining whether a set of coin denominations allows a greedy algorithm to find an optimal solution for every amount.

    Pearson, D. A polynomial-time algorithm for the change-making problem[J]. Operations Research Letters, 2005, 33(3): 231-234.

## 15.1.3 &nbsp; Steps for solving a problem greedily

Solving a greedy problem generally involves three steps.

1. **Analyze the problem**: Understand its properties, including the state definition, optimization objective, and constraints. This step also appears in backtracking and dynamic programming.
2. **Choose a greedy strategy**: Decide how to make a greedy choice at each step. Each choice should reduce the problem's size, eventually solving the whole problem.
3. **Prove correctness**: Usually, we must establish the greedy-choice property and optimal substructure. This may require a mathematical proof, such as induction or proof by contradiction.

Choosing the greedy strategy is the central step, but it can be difficult for the following reasons.

- **Greedy strategies vary greatly from problem to problem**. For many problems, the strategy is straightforward and can be found with a little thought and experimentation. For more complex problems, it may be well hidden, testing our problem-solving experience and algorithmic skills.
- **Some greedy strategies are misleading**. We may confidently devise a strategy, implement it, and submit the code, only to find that it fails some test cases. The strategy is only partially correct; the coin change problem above is a typical example.

To ensure correctness, we should give the greedy strategy a rigorous mathematical proof, **usually using contradiction or mathematical induction**.

However, such a proof can itself be difficult. When we do not know where to start, we often debug against test cases, gradually refining and checking the greedy strategy.

## 15.1.4 &nbsp; Typical greedy problems

Greedy algorithms often solve optimization problems with the greedy-choice property and optimal substructure. Some typical examples follow.

- **Coin change**: For certain sets of coin denominations, a greedy algorithm always finds an optimal solution.
- **Interval scheduling**: Given tasks that each occupy a time interval, the goal is to complete as many tasks as possible. Always choosing the available task that finishes earliest yields an optimal solution.
- **Fractional knapsack**: Given items and a weight limit, choose items to maximize total value without exceeding the limit. Choosing the item with the highest value-to-weight ratio at each step can yield an optimal solution in some settings.
- **Stock trading**: Given historical stock prices, you may buy and sell multiple times, but cannot buy again while holding stock until you sell it. The goal is to maximize profit.
- **Huffman coding**: This greedy algorithm is used for lossless data compression. It builds a Huffman tree by repeatedly merging the two nodes with the lowest frequencies. The resulting tree has the minimum weighted path length (encoding length).
- **Dijkstra's algorithm**: This greedy algorithm finds shortest paths from a given source vertex to every other vertex in a graph whose edge weights are all nonnegative.
