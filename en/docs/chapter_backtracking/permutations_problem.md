# Permutations Problem

The permutations problem is a classic application of backtracking algorithms. It is defined as finding all possible arrangements of elements in a given collection (such as an array or string).

The table below shows several example datasets, including input arrays and their corresponding permutations.

<p align="center"> Table <id> &nbsp; Permutations Examples </p>

| Input Array | All Permutations                                                   |
| :---------- | :----------------------------------------------------------------- |
| $[1]$       | $[1]$                                                              |
| $[1, 2]$    | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$ | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

## Case with Distinct Elements

!!! question

    Given an integer array with no duplicate elements, return all possible permutations.

From the perspective of backtracking algorithms, **we can imagine the process of generating permutations as the result of a series of choices**. Suppose the input array is $[1, 2, 3]$. If we first choose $1$, then choose $3$, and finally choose $2$, we obtain the permutation $[1, 3, 2]$. Backtracking means undoing a choice and then trying other choices.

From the perspective of backtracking code, the candidate set `choices` consists of all elements in the input array, and the state `state` is the elements that have been chosen so far. Note that each element can only be chosen once, **therefore all elements in `state` should be unique**.

As shown in the figure below, we can unfold the search process into a recursion tree, where each node in the tree represents the current state `state`. Starting from the root node, after three rounds of choices, we reach a leaf node, and each leaf node corresponds to a permutation.

![Recursion tree of permutations](permutations_problem.assets/permutations_i.png)

### Pruning Duplicate Choices

To ensure that each element is chosen only once, we consider introducing a boolean array `selected`, where `selected[i]` indicates whether `choices[i]` has been chosen. We implement the following pruning operation based on it.

- After making a choice `choice[i]`, we set `selected[i]` to $\text{True}$, indicating that it has been chosen.
- When traversing the candidate list `choices`, we skip all nodes that have been chosen, which is pruning.

As shown in the figure below, suppose we choose $1$ in the first round, $3$ in the second round, and $2$ in the third round. Then we need to prune the branch of element $1$ in the second round and prune the branches of elements $1$ and $3$ in the third round.

![Pruning example of permutations](permutations_problem.assets/permutations_i_pruning.png)

Observing the above figure, we find that this pruning operation reduces the search space size from $O(n^n)$ to $O(n!)$.

### Code Implementation

After understanding the above information, we can fill in the blanks in the template code. To shorten the overall code, we do not implement each function in the template separately, but instead unfold them in the `backtrack()` function:

```src
[file]{permutations_i}-[class]{}-[func]{permutations_i}
```

## Case with Duplicate Elements

!!! question

    Given an integer array that **may contain duplicate elements**, return all unique permutations.

Suppose the input array is $[1, 1, 2]$. To distinguish the two duplicate elements $1$, we denote the second $1$ as $\hat{1}$.

As shown in the figure below, the method described above generates permutations where half are duplicates.

![Duplicate permutations](permutations_problem.assets/permutations_ii.png)

So how do we remove duplicate permutations? The most direct approach is to use a hash set to directly deduplicate the permutation results. However, this is not elegant because **the search branches that generate duplicate permutations are unnecessary and should be identified and pruned early**, which can further improve algorithm efficiency.

### Pruning Duplicate Elements

Observe the figure below. In the first round, choosing $1$ or choosing $\hat{1}$ is equivalent. All permutations generated under these two choices are duplicates. Therefore, we should prune $\hat{1}$.

Similarly, after choosing $2$ in the first round, the $1$ and $\hat{1}$ in the second round also produce duplicate branches, so the second round's $\hat{1}$ should also be pruned.

Essentially, **our goal is to ensure that multiple equal elements are chosen only once in a certain round of choices**.

![Pruning duplicate permutations](permutations_problem.assets/permutations_ii_pruning.png)

### Code Implementation

Building on the code from the previous problem, we consider opening a hash set `duplicated` in each round of choices to record which elements have been tried in this round, and prune duplicate elements:

```src
[file]{permutations_ii}-[class]{}-[func]{permutations_ii}
```

Assuming elements are pairwise distinct, there are $n!$ (factorial) permutations of $n$ elements. When recording results, we need to copy a list of length $n$, using $O(n)$ time. **Therefore, the time complexity is $O(n! \cdot n)$**.

The maximum recursion depth is $n$, using $O(n)$ stack frame space. `selected` uses $O(n)$ space. At most $n$ `duplicated` sets exist simultaneously, using $O(n^2)$ space. **Therefore, the space complexity is $O(n^2)$**.

### Comparison of Two Pruning Methods

Note that although both `selected` and `duplicated` are used for pruning, they have different objectives.

- **Pruning duplicate choices**: There is only one `selected` throughout the entire search process. It records which elements are included in the current state, and its purpose is to prevent an element from appearing repeatedly in `state`.
- **Pruning duplicate elements**: Each round of choices (each `backtrack` function call) contains a `duplicated` set. It records which elements have been chosen in this round's iteration (the `for` loop), and its purpose is to ensure that equal elements are chosen only once.

The figure below shows the effective scope of the two pruning conditions. Note that each node in the tree represents a choice, and the nodes on the path from the root to a leaf node form a permutation.

![Effective scope of two pruning conditions](permutations_problem.assets/permutations_ii_pruning_summary.png)
