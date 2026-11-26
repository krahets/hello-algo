/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* Check whether the current state is a solution */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* Record the solution */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* Check whether this choice is valid in the current state */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Update the state */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* Restore the state */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* Backtracking: example 3 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Check for a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
        }
        // Try each choice
        for (TreeNode choice : choices) {
            // Prune: check whether the choice is valid
            if (isValid(state, choice)) {
                // Make a choice and update the state
                makeChoice(state, choice);
                // Make the next choice
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // Backtrack: undo the choice to restore the previous state
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nInitialize the binary tree");
        PrintUtil.printTree(root);

        // Backtracking
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\nPrint all paths from the root to a node with value 7 that avoid nodes with value 3");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
