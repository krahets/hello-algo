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
        // Initialize a queue and enqueue the root
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // Initialize a list to store the traversal sequence
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // Dequeue from the queue
            list.add(node.val);           // Store the node value
            if (node.left != null)
                queue.offer(node.left);   // Enqueue the left child
            if (node.right != null)
                queue.offer(node.right);  // Enqueue the right child
        }
        return list;
    }

    public static void main(String[] args) {
        /* Initialize the binary tree */
        // Use a helper function that builds a binary tree directly from an array
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\nInitialize the binary tree\n");
        PrintUtil.printTree(root);

        /* Level-order traversal */
        List<Integer> list = levelOrder(root);
        System.out.println("\nNode sequence from level-order traversal = " + list);
    }
}
