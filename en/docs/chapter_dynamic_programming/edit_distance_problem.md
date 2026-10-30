# Edit distance problem

Edit distance, also called Levenshtein distance, is the minimum number of edits needed to transform one string into another. It is commonly used in information retrieval and natural language processing to measure similarity between sequences.

!!! question

    Given two strings $s$ and $t$, return the minimum number of edits needed to transform $s$ into $t$.
    
    Three edits are allowed: insert a character, delete a character, or replace a character with any other character.

As shown in the figure below, transforming `kitten` into `sitting` takes 3 edits: 2 replacements and 1 insertion. Transforming `hello` into `algo` also takes 3 edits: 2 replacements and 1 deletion.

![Examples of edit distance](edit_distance_problem.assets/edit_distance_example.png)

**Edit distance fits naturally into a decision tree model**. Strings are nodes, and each decision (an edit) is an edge.

As shown in the figure below, without restrictions on the edits, each node can have many outgoing edges, one for each possible operation. Thus, many paths can transform `hello` into `algo`.

From the decision tree perspective, the goal is to find the shortest path between nodes `hello` and `algo`.

![Edit distance as a decision tree](edit_distance_problem.assets/edit_distance_decision_tree.png)

### Dynamic programming approach

**Step 1: Identify each decision, define the state, and establish the $dp$ table**

Each decision applies one edit to string $s$.

We want each edit to reduce the problem's size so that we can form subproblems. Let the lengths of $s$ and $t$ be $n$ and $m$. First consider their last characters, $s[n-1]$ and $t[m-1]$.

- If $s[n-1]$ and $t[m-1]$ match, skip them and consider $s[n-2]$ and $t[m-2]$.
- If $s[n-1]$ and $t[m-1]$ differ, apply an edit to $s$ (insertion, deletion, or replacement) to match the endings, allowing us to move on to a smaller problem.

Each decision (edit) in $s$ changes the characters still to be matched in $s$ and $t$. The state therefore specifies the $i$-th and $j$-th characters currently under consideration in $s$ and $t$, denoted by $[i, j]$.

State $[i, j]$ represents the subproblem of finding **the minimum number of edits needed to transform the first $i$ characters of $s$ into the first $j$ characters of $t$**.

This gives a two-dimensional $dp$ table of size $(n+1) \times (m+1)$.

**Step 2: Identify optimal substructure and derive the state transition equation**

For subproblem $dp[i, j]$, the final characters are $s[i-1]$ and $t[j-1]$. The three possible edits give the cases shown in the figure below.

1. Insert $t[j-1]$ after $s[i-1]$, leaving subproblem $dp[i, j-1]$.
2. Delete $s[i-1]$, leaving subproblem $dp[i-1, j]$.
3. Replace $s[i-1]$ with $t[j-1]$, leaving subproblem $dp[i-1, j-1]$.

![State transitions for edit distance](edit_distance_problem.assets/edit_distance_state_transfer.png)

The optimal substructure follows: the minimum edit count $dp[i, j]$ is the smallest of $dp[i, j-1]$, $dp[i-1, j]$, and $dp[i-1, j-1]$, plus $1$ for the current edit. The state transition equation is:

$$
dp[i, j] = \min(dp[i, j-1], dp[i-1, j], dp[i-1, j-1]) + 1
$$

When **$s[i-1]$ and $t[j-1]$ match, no edit is needed for the current characters**, and the state transition equation becomes:

$$
dp[i, j] = dp[i-1, j-1]
$$

**Step 3: Determine the boundary conditions and evaluation order**

If both strings are empty, $0$ edits are needed, so $dp[0, 0] = 0$. If $s$ is empty but $t$ is not, the minimum edit count is the length of $t$, giving the first row $dp[0, j] = j$. If $s$ is nonempty but $t$ is empty, the count is the length of $s$, giving the first column $dp[i, 0] = i$.

The solution $dp[i, j]$ depends on entries to its left, above, and upper left, so two nested loops can traverse the $dp$ table in increasing index order.

### Code implementation

```src
[file]{edit_distance}-[class]{}-[func]{edit_distance_dp}
```

As shown in the figure below, the state transition process resembles that of the knapsack problem: both fill a two-dimensional grid.

=== "<1>"
    ![Dynamic programming for edit distance](edit_distance_problem.assets/edit_distance_dp_step1.png)

=== "<2>"
    ![edit_distance_dp_step2](edit_distance_problem.assets/edit_distance_dp_step2.png)

=== "<3>"
    ![edit_distance_dp_step3](edit_distance_problem.assets/edit_distance_dp_step3.png)

=== "<4>"
    ![edit_distance_dp_step4](edit_distance_problem.assets/edit_distance_dp_step4.png)

=== "<5>"
    ![edit_distance_dp_step5](edit_distance_problem.assets/edit_distance_dp_step5.png)

=== "<6>"
    ![edit_distance_dp_step6](edit_distance_problem.assets/edit_distance_dp_step6.png)

=== "<7>"
    ![edit_distance_dp_step7](edit_distance_problem.assets/edit_distance_dp_step7.png)

=== "<8>"
    ![edit_distance_dp_step8](edit_distance_problem.assets/edit_distance_dp_step8.png)

=== "<9>"
    ![edit_distance_dp_step9](edit_distance_problem.assets/edit_distance_dp_step9.png)

=== "<10>"
    ![edit_distance_dp_step10](edit_distance_problem.assets/edit_distance_dp_step10.png)

=== "<11>"
    ![edit_distance_dp_step11](edit_distance_problem.assets/edit_distance_dp_step11.png)

=== "<12>"
    ![edit_distance_dp_step12](edit_distance_problem.assets/edit_distance_dp_step12.png)

=== "<13>"
    ![edit_distance_dp_step13](edit_distance_problem.assets/edit_distance_dp_step13.png)

=== "<14>"
    ![edit_distance_dp_step14](edit_distance_problem.assets/edit_distance_dp_step14.png)

=== "<15>"
    ![edit_distance_dp_step15](edit_distance_problem.assets/edit_distance_dp_step15.png)

### Space optimization

The state $dp[i,j]$ depends on $dp[i-1, j]$ above, $dp[i, j-1]$ to the left, and $dp[i-1, j-1]$ at the upper left. Forward iteration loses $dp[i-1, j-1]$, while backward iteration cannot compute $dp[i, j-1]$ in advance. Neither order alone is sufficient.

We can use a variable `leftup` to preserve the upper-left solution $dp[i-1, j-1]$, leaving only the left and upper entries to consider. The situation then matches unbounded knapsack, and forward iteration works. The code is as follows:

```src
[file]{edit_distance}-[class]{}-[func]{edit_distance_dp_comp}
```
