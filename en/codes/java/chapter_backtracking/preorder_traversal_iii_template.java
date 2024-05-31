/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* Determine if the current state is a solution */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* Record solution */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* Determine if the choice is legal under the current state */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Update state */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* Restore state */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* Backtracking algorithm: Example three */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Check if it's a solution
        if (isSolution(state)) {
            // Record solution
            recordSolution(state, res);
        }
        // Traverse all choices
        for (TreeNode choice : choices) {
            // Pruning: check if the choice is legal
            if (isValid(state, choice)) {
                // Attempt: make a choice, update the state
                makeChoice(state, choice);
                // Proceed to the next round of selection
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // Retract: undo the choice, restore to the previous state
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nInitialize binary tree");
        PrintUtil.printTree(root);

        // Backtracking algorithm
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\nOutput all root-to-node 7 paths, requiring paths not to include nodes with value 3");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
