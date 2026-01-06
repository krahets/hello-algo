# Backtracking Algorithm

<u>The backtracking algorithm</u> is a method for solving problems through exhaustive search. Its core idea is to start from an initial state and exhaustively search all possible solutions. When a correct solution is found, it is recorded. This process continues until a solution is found or all possible choices have been tried without finding a solution.

The backtracking algorithm typically employs "depth-first search" to traverse the solution space. In the "Binary Tree" chapter, we mentioned that preorder, inorder, and postorder traversals all belong to depth-first search. Next, we will construct a backtracking problem using preorder traversal to progressively understand how the backtracking algorithm works.

!!! question "Example 1"

    Given a binary tree, search and record all nodes with value $7$, and return a list of these nodes.

For this problem, we perform a preorder traversal of the tree and check whether the current node's value is $7$. If it is, we add the node to the result list `res`. The relevant implementation is shown in the following figure and code:

```src
[file]{preorder_traversal_i_compact}-[class]{}-[func]{pre_order}
```

![Search for nodes in preorder traversal](backtracking_algorithm.assets/preorder_find_nodes.png)

## Attempt and Backtrack

**The reason it is called a backtracking algorithm is that it employs "attempt" and "backtrack" strategies when searching the solution space**. When the algorithm encounters a state where it cannot continue forward or cannot find a solution that satisfies the constraints, it will undo the previous choice, return to a previous state, and try other possible choices.

For Example 1, visiting each node represents an "attempt", while skipping over a leaf node or a function `return` from the parent node represents a "backtrack".

It is worth noting that **backtracking is not limited to function returns alone**. To illustrate this, let's extend Example 1 slightly.

!!! question "Example 2"

    In a binary tree, search all nodes with value $7$, **and return the paths from the root node to these nodes**.

Based on the code from Example 1, we need to use a list `path` to record the visited node path. When we reach a node with value $7$, we copy `path` and add it to the result list `res`. After traversal is complete, `res` contains all the solutions. The code is as follows:

```src
[file]{preorder_traversal_ii_compact}-[class]{}-[func]{pre_order}
```

In each "attempt", we record the path by adding the current node to `path`; before "backtracking", we need to remove the node from `path`, **to restore the state before this attempt**.

Observing the process shown in the following figure, **we can understand attempt and backtrack as "advance" and "undo"**, two operations that are the reverse of each other.

=== "<1>"
    ![Attempt and backtrack](backtracking_algorithm.assets/preorder_find_paths_step1.png)

=== "<2>"
    ![preorder_find_paths_step2](backtracking_algorithm.assets/preorder_find_paths_step2.png)

=== "<3>"
    ![preorder_find_paths_step3](backtracking_algorithm.assets/preorder_find_paths_step3.png)

=== "<4>"
    ![preorder_find_paths_step4](backtracking_algorithm.assets/preorder_find_paths_step4.png)

=== "<5>"
    ![preorder_find_paths_step5](backtracking_algorithm.assets/preorder_find_paths_step5.png)

=== "<6>"
    ![preorder_find_paths_step6](backtracking_algorithm.assets/preorder_find_paths_step6.png)

=== "<7>"
    ![preorder_find_paths_step7](backtracking_algorithm.assets/preorder_find_paths_step7.png)

=== "<8>"
    ![preorder_find_paths_step8](backtracking_algorithm.assets/preorder_find_paths_step8.png)

=== "<9>"
    ![preorder_find_paths_step9](backtracking_algorithm.assets/preorder_find_paths_step9.png)

=== "<10>"
    ![preorder_find_paths_step10](backtracking_algorithm.assets/preorder_find_paths_step10.png)

=== "<11>"
    ![preorder_find_paths_step11](backtracking_algorithm.assets/preorder_find_paths_step11.png)

## Pruning

Complex backtracking problems usually contain one or more constraints. **Constraints can typically be used for "pruning"**.

!!! question "Example 3"

    In a binary tree, search all nodes with value $7$ and return the paths from the root node to these nodes, **but require that the paths do not contain nodes with value $3$**.

To satisfy the above constraints, **we need to add pruning operations**: during the search process, if we encounter a node with value $3$, we return early and do not continue searching. The code is as follows:

```src
[file]{preorder_traversal_iii_compact}-[class]{}-[func]{pre_order}
```

"Pruning" is a vivid term. As shown in the following figure, during the search process, **we "prune" search branches that do not satisfy the constraints**, avoiding many meaningless attempts and thus improving search efficiency.

![Pruning according to constraints](backtracking_algorithm.assets/preorder_find_constrained_paths.png)

## Framework Code

Next, we attempt to extract the main framework of backtracking's "attempt, backtrack, and pruning", to improve code generality.

In the following framework code, `state` represents the current state of the problem, and `choices` represents the choices available in the current state:

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """Backtracking algorithm framework"""
        # Check if it is a solution
        if is_solution(state):
            # Record the solution
            record_solution(state, res)
            # Stop searching
            return
        # Traverse all choices
        for choice in choices:
            # Pruning: check if the choice is valid
            if is_valid(state, choice):
                # Attempt: make a choice and update the state
                make_choice(state, choice)
                backtrack(state, choices, res)
                # Backtrack: undo the choice and restore to the previous state
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title=""
    /* Backtracking algorithm framework */
    void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (Choice choice : choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    /* Backtracking algorithm framework */
    void backtrack(State state, List<Choice> choices, List<State> res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (Choice choice : choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    /* Backtracking algorithm framework */
    void Backtrack(State state, List<Choice> choices, List<State> res) {
        // Check if it is a solution
        if (IsSolution(state)) {
            // Record the solution
            RecordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        foreach (Choice choice in choices) {
            // Pruning: check if the choice is valid
            if (IsValid(state, choice)) {
                // Attempt: make a choice and update the state
                MakeChoice(state, choice);
                Backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    /* Backtracking algorithm framework */
    func backtrack(state *State, choices []Choice, res *[]State) {
        // Check if it is a solution
        if isSolution(state) {
            // Record the solution
            recordSolution(state, res)
            // Stop searching
            return
        }
        // Traverse all choices
        for _, choice := range choices {
            // Pruning: check if the choice is valid
            if isValid(state, choice) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Backtracking algorithm framework */
    func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
        // Check if it is a solution
        if isSolution(state: state) {
            // Record the solution
            recordSolution(state: state, res: &res)
            // Stop searching
            return
        }
        // Traverse all choices
        for choice in choices {
            // Pruning: check if the choice is valid
            if isValid(state: state, choice: choice) {
                // Attempt: make a choice and update the state
                makeChoice(state: &state, choice: choice)
                backtrack(state: &state, choices: choices, res: &res)
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Backtracking algorithm framework */
    function backtrack(state, choices, res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (let choice of choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Backtracking algorithm framework */
    function backtrack(state: State, choices: Choice[], res: State[]): void {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (let choice of choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Backtracking algorithm framework */
    void backtrack(State state, List<Choice>, List<State> res) {
      // Check if it is a solution
      if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching
        return;
      }
      // Traverse all choices
      for (Choice choice in choices) {
        // Pruning: check if the choice is valid
        if (isValid(state, choice)) {
          // Attempt: make a choice and update the state
          makeChoice(state, choice);
          backtrack(state, choices, res);
          // Backtrack: undo the choice and restore to the previous state
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    /* Backtracking algorithm framework */
    fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
        // Check if it is a solution
        if is_solution(state) {
            // Record the solution
            record_solution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for choice in choices {
            // Pruning: check if the choice is valid
            if is_valid(state, choice) {
                // Attempt: make a choice and update the state
                make_choice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undo_choice(state, choice);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* Backtracking algorithm framework */
    void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res, numRes);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (int i = 0; i < numChoices; i++) {
            // Pruning: check if the choice is valid
            if (isValid(state, &choices[i])) {
                // Attempt: make a choice and update the state
                makeChoice(state, &choices[i]);
                backtrack(state, choices, numChoices, res, numRes);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, &choices[i]);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Backtracking algorithm framework */
    fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res)
            // Stop searching
            return
        }
        // Traverse all choices
        for (choice in choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Backtracking algorithm framework ###
    def backtrack(state, choices, res)
        # Check if it is a solution
        if is_solution?(state)
            # Record the solution
            record_solution(state, res)
            return
        end

        # Traverse all choices
        for choice in choices
            # Pruning: check if the choice is valid
            if is_valid?(state, choice)
                # Attempt: make a choice and update the state
                make_choice(state, choice)
                backtrack(state, choices, res)
                # Backtrack: undo the choice and restore to the previous state
                undo_choice(state, choice)
            end
        end
    end
    ```

Next, we solve Example 3 based on the framework code. The state `state` is the node traversal path, the choices `choices` are the left and right child nodes of the current node, and the result `res` is a list of paths:

```src
[file]{preorder_traversal_iii_template}-[class]{}-[func]{backtrack}
```

As per the problem statement, we should continue searching after finding a node with value $7$. **Therefore, we need to remove the `return` statement after recording the solution**. The following figure compares the search process with and without the `return` statement.

![Comparison of search process with and without return statement](backtracking_algorithm.assets/backtrack_remove_return_or_not.png)

Compared to code based on preorder traversal, code based on the backtracking algorithm framework appears more verbose, but has better generality. In fact, **many backtracking problems can be solved within this framework**. We only need to define `state` and `choices` for the specific problem and implement each method in the framework.

## Common Terminology

To analyze algorithmic problems more clearly, we summarize the meanings of common terminology used in backtracking algorithms and provide corresponding examples from Example 3, as shown in the following table.

<p align="center"> Table <id> &nbsp; Common Backtracking Algorithm Terminology </p>

| Term                      | Definition                                                                                                                   | Example 3                                                                          |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Solution (solution)       | A solution is an answer that satisfies the specific conditions of a problem; there may be one or more solutions             | All paths from root to nodes with value $7$ that satisfy the constraint            |
| Constraint (constraint)   | A constraint is a condition in the problem that limits the feasibility of solutions, typically used for pruning              | Paths do not contain nodes with value $3$                                          |
| State (state)             | State represents the situation of a problem at a certain moment, including the choices already made                           | The currently visited node path, i.e., the `path` list of nodes                    |
| Attempt (attempt)         | An attempt is the process of exploring the solution space according to available choices, including making choices, updating state, and checking if it is a solution | Recursively visit left (right) child nodes, add nodes to `path`, check if node value is $7$ |
| Backtrack (backtracking)  | Backtracking refers to undoing previous choices and returning to a previous state when encountering a state that does not satisfy constraints | Stop searching when passing over leaf nodes, ending node visits, or encountering nodes with value $3$; function returns |
| Pruning (pruning)         | Pruning is a method of avoiding meaningless search paths according to problem characteristics and constraints, which can improve search efficiency | When encountering a node with value $3$, do not continue searching                 |

!!! tip

    The concepts of problem, solution, state, etc. are universal and are involved in divide-and-conquer, backtracking, dynamic programming, greedy and other algorithms.

## Advantages and Limitations

The backtracking algorithm is essentially a depth-first search algorithm that tries all possible solutions until it finds one that satisfies the conditions. The advantage of this approach is that it can find all possible solutions, and with reasonable pruning operations, it achieves high efficiency.

However, when dealing with large-scale or complex problems, **the running efficiency of the backtracking algorithm may be unacceptable**.

- **Time**: The backtracking algorithm usually needs to traverse all possibilities in the solution space, and the time complexity can reach exponential or factorial order.
- **Space**: During recursive calls, the current state needs to be saved (such as paths, auxiliary variables used for pruning, etc.), and when the depth is large, the space requirement can become very large.

Nevertheless, **the backtracking algorithm is still the best solution for certain search problems and constraint satisfaction problems**. For these problems, since we cannot predict which choices will generate valid solutions, we must traverse all possible choices. In this case, **the key is how to optimize efficiency**. There are two common efficiency optimization methods.

- **Pruning**: Avoid searching paths that are guaranteed not to produce solutions, thereby saving time and space.
- **Heuristic search**: Introduce certain strategies or estimation values during the search process to prioritize searching paths that are most likely to produce valid solutions.

## Typical Backtracking Examples

The backtracking algorithm can be used to solve many search problems, constraint satisfaction problems, and combinatorial optimization problems.

**Search problems**: The goal of these problems is to find solutions that satisfy specific conditions.

- Permutation problem: Given a set, find all possible permutations and combinations.
- Subset sum problem: Given a set and a target sum, find all subsets in the set whose elements sum to the target.
- Tower of Hanoi: Given three pegs and a series of disks of different sizes, move all disks from one peg to another, moving only one disk at a time, and never placing a larger disk on a smaller disk.

**Constraint satisfaction problems**: The goal of these problems is to find solutions that satisfy all constraints.

- N-Queens: Place $n$ queens on an $n \times n$ chessboard such that they do not attack each other.
- Sudoku: Fill numbers $1$ to $9$ in a $9 \times 9$ grid such that each row, column, and $3 \times 3$ subgrid contains no repeated digits.
- Graph coloring: Given an undirected graph, color each vertex with the minimum number of colors such that adjacent vertices have different colors.

**Combinatorial optimization problems**: The goal of these problems is to find an optimal solution that satisfies certain conditions in a combinatorial space.

- 0-1 Knapsack: Given a set of items and a knapsack, each item has a value and weight. Under the knapsack capacity constraint, select items to maximize total value.
- Traveling Salesman Problem: Starting from a point in a graph, visit all other points exactly once and return to the starting point, finding the shortest path.
- Maximum Clique: Given an undirected graph, find the largest complete subgraph, i.e., a subgraph where any two vertices are connected by an edge.

Note that for many combinatorial optimization problems, backtracking is not the optimal solution.

- The 0-1 Knapsack problem is usually solved using dynamic programming to achieve higher time efficiency.
- The Traveling Salesman Problem is a famous NP-Hard problem; common solutions include genetic algorithms and ant colony algorithms.
- The Maximum Clique problem is a classical problem in graph theory and can be solved using heuristic algorithms such as greedy algorithms.
