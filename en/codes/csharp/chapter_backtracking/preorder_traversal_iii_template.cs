/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* Check whether the current state is a solution */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* Record the solution */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* Check whether this choice is valid in the current state */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Update the state */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* Restore the state */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* Backtracking: example 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Check for a solution
        if (IsSolution(state)) {
            // Record the solution
            RecordSolution(state, res);
        }
        // Try each choice
        foreach (TreeNode choice in choices) {
            // Prune: check whether the choice is valid
            if (IsValid(state, choice)) {
                // Make a choice and update the state
                MakeChoice(state, choice);
                // Make the next choice
                Backtrack(state, [choice.left!, choice.right!], res);
                // Backtrack: undo the choice to restore the previous state
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize the binary tree");
        PrintUtil.PrintTree(root);

        // Backtracking
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\nPrint all paths from the root to a node with value 7 that avoid nodes with value 3");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
