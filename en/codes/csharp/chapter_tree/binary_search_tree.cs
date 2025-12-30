/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

class BinarySearchTree {
    TreeNode? root;

    public BinarySearchTree() {
        // Initialize empty tree
        root = null;
    }

    /* Get binary tree root node */
    public TreeNode? GetRoot() {
        return root;
    }

    /* Search node */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Target node is in cur's right subtree
            if (cur.val < num) cur =
                cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num)
                cur = cur.left;
            // Found target node, exit loop
            else
                break;
        }
        // Return target node
        return cur;
    }

    /* Insert node */
    public void Insert(int num) {
        // If tree is empty, initialize root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found duplicate node, return directly
            if (cur.val == num)
                return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Insertion position is in cur's left subtree
            else
                cur = cur.left;
        }

        // Insert node
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* Remove node */
    public void Remove(int num) {
        // If tree is empty, return directly
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found node to delete, exit loop
            if (cur.val == num)
                break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Node to delete is in cur's left subtree
            else
                cur = cur.left;
        }
        // If no node to delete, return directly
        if (cur == null)
            return;
        // Number of child nodes = 0 or 1
        if (cur.left == null || cur.right == null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            TreeNode? child = cur.left ?? cur.right;
            // Delete node cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If deleted node is root node, reassign root node
                root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively delete node tmp
            Remove(tmp.val!.Value);
            // Replace cur with tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* Initialize binary search tree */
        BinarySearchTree bst = new();
        // Please note that different insertion orders will generate different binary trees, this sequence can generate a perfect binary tree
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\nInitialized binary tree is\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Search node */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\nFound node object is " + node + ", node value = " + node?.val);

        /* Insert node */
        bst.Insert(16);
        Console.WriteLine("\nAfter inserting node 16, binary tree is\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Remove node */
        bst.Remove(1);
        Console.WriteLine("\nAfter removing node 1, binary tree is\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nAfter removing node 2, binary tree is\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nAfter removing node 4, binary tree is\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
