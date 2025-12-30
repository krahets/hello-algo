/**
 * File: binary_tree_bfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_bfs {
    /* Level-order traversal */
    static List<Integer> levelOrder(TreeNode root) {
        // Initialize queue, add root node
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // Initialize a list to save the traversal sequence
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // Dequeue
            list.add(node.val);           // Save node value
            if (node.left != null)
                queue.offer(node.left);   // Left child node enqueue
            if (node.right != null)
                queue.offer(node.right);  // Right child node enqueue
        }
        return list;
    }

    public static void main(String[] args) {
        /* Initialize binary tree */
        // Here we use a function to generate a binary tree directly from an array
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\nInitialize binary tree\n");
        PrintUtil.printTree(root);

        /* Level-order traversal */
        List<Integer> list = levelOrder(root);
        System.out.println("\nLevel-order traversal node print sequence = " + list);
    }
}
