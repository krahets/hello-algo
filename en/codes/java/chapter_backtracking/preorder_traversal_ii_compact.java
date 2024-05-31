/**
 * File: preorder_traversal_ii_compact.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_ii_compact {
    static List<TreeNode> path;
    static List<List<TreeNode>> res;

    /* Pre-order traversal: Example two */
    static void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // Attempt
        path.add(root);
        if (root.val == 7) {
            // Record solution
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // Retract
        path.remove(path.size() - 1);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nInitialize binary tree");
        PrintUtil.printTree(root);

        // Pre-order traversal
        path = new ArrayList<>();
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\nOutput all root-to-node 7 paths");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
