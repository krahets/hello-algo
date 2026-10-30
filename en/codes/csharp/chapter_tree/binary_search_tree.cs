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

    /* Find a node */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Search in a loop, stopping if a null reference is reached
        while (cur != null) {
            // The target node lies in the right subtree of cur
            if (cur.val < num) cur =
                cur.right;
            // The target node lies in the left subtree of cur
            else if (cur.val > num)
                cur = cur.left;
            // The target node was found; exit the loop
            else
                break;
        }
        // Return the target node
        return cur;
    }

    /* Insert a node */
    public void Insert(int num) {
        // If the tree is empty, initialize the root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur != null) {
            // Return immediately if a duplicate node is found
            if (cur.val == num)
                return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The insertion position lies in the left subtree of cur
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


    /* Remove a node */
    public void Remove(int num) {
        // Return immediately if the tree is empty
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur != null) {
            // The node to remove was found; exit the loop
            if (cur.val == num)
                break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The node to remove lies in the left subtree of cur
            else
                cur = cur.left;
        }
        // Return immediately if the node to remove does not exist
        if (cur == null)
            return;
        // Number of children = 0 or 1
        if (cur.left == null || cur.right == null) {
            // With 0 / 1 children, child is null / the child node, respectively
            TreeNode? child = cur.left ?? cur.right;
            // Remove node cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If the removed node is the root, assign the new root
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
            // Recursively remove node tmp
            Remove(tmp.val!.Value);
            // Replace the value of cur with the value of tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* Initialize the binary search tree */
        BinarySearchTree bst = new();
        // Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\nThe initialized binary tree is:\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Find a node */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\nFound node object: " + node + ", node value = " + node?.val);

        /* Insert a node */
        bst.Insert(16);
        Console.WriteLine("\nBinary tree after inserting node 16:\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Remove a node */
        bst.Remove(1);
        Console.WriteLine("\nBinary tree after removing node 1:\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nBinary tree after removing node 2:\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nBinary tree after removing node 4:\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
