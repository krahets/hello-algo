/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

class BinarySearchTree {
    TreeNode? root;

    public BinarySearchTree() {
        // Initialize an empty tree
        root = null;
    }

    /* Get the root of the binary tree */
    public TreeNode? GetRoot() {
        return root;
    }

    /* Search for a node */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Stop the search after passing a leaf
        while (cur != null) {
            // The target is in the right subtree of cur
            if (cur.val < num) cur =
                cur.right;
            // The target is in the left subtree of cur
            else if (cur.val > num)
                cur = cur.left;
            // The target was found, so exit the loop
            else
                break;
        }
        // Return the target node
        return cur;
    }

    /* Insert a node */
    public void Insert(int num) {
        // If the tree is empty, initialize the root
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // Stop the search after passing a leaf
        while (cur != null) {
            // Return if a duplicate is found
            if (cur.val == num)
                return;
            pre = cur;
            // The insertion position is in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The insertion position is in the left subtree of cur
            else
                cur = cur.left;
        }

        // Insert a node
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* Delete a node */
    public void Remove(int num) {
        // Return immediately if the tree is empty
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // Stop the search after passing a leaf
        while (cur != null) {
            // The node to delete was found, so exit the loop
            if (cur.val == num)
                break;
            pre = cur;
            // The node to delete is in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The node to delete is in the left subtree of cur
            else
                cur = cur.left;
        }
        // Return if the node to delete does not exist
        if (cur == null)
            return;
        // Number of children = 0 or 1
        if (cur.left == null || cur.right == null) {
            // With no children, child = null. With one child, child is that child.
            TreeNode? child = cur.left ?? cur.right;
            // Delete node cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If deleting the root, assign a new root
                root = child;
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively delete node tmp
            Remove(tmp.val!.Value);
            // Replace the value of cur with that of tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* Initialize the binary search tree */
        BinarySearchTree bst = new();
        // Different insertion orders produce different tree shapes. This sequence produces a perfect binary tree.
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\nInitial binary tree:\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Search for a node */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\nNode found: " + node + ", node value = " + node?.val);

        /* Insert a node */
        bst.Insert(16);
        Console.WriteLine("\nBinary tree after inserting node 16:\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Delete a node */
        bst.Remove(1);
        Console.WriteLine("\nBinary tree after deleting node 1:\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nBinary tree after deleting node 2:\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nBinary tree after deleting node 4:\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
