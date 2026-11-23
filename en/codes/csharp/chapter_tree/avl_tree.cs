/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL tree */
class AVLTree {
    public TreeNode? root; // Root node

    /* Get the node height */
    int Height(TreeNode? node) {
        // A null node has height -1; a leaf has height 0
        return node == null ? -1 : node.height;
    }

    /* Update the node height */
    void UpdateHeight(TreeNode node) {
        // The node height equals the height of its taller subtree + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* Get the balance factor */
    public int BalanceFactor(TreeNode? node) {
        // A null node has balance factor 0
        if (node == null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return Height(node.left) - Height(node.right);
    }

    /* Right rotation */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update the node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }

    /* Left rotation */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update the node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }

    /* Perform rotations to restore balance in this subtree */
    TreeNode? Rotate(TreeNode? node) {
        // Get the balance factor of node
        int balanceFactorInt = BalanceFactor(node);
        // Left-heavy tree
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Rotate right
                return RightRotate(node);
            } else {
                // Rotate left, then right
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Right-heavy tree
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Rotate left
                return LeftRotate(node);
            } else {
                // Rotate right, then left
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }

    /* Insert a node */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* Insert a node recursively (helper method) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // Return without inserting a duplicate node
        UpdateHeight(node);  // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = Rotate(node);
        // Return the subtree root
        return node;
    }

    /* Remove a node */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Remove a node recursively (helper method) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. Find and remove the node */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // Number of children = 0: remove node and return
                if (child == null)
                    return null;
                // Number of children = 1: remove node directly
                else
                    node = child;
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = Rotate(node);
        // Return the subtree root
        return node;
    }

    /* Find a node */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
        // Search in a loop, stopping if a null reference is reached
        while (cur != null) {
            // The target node lies in the right subtree of cur
            if (cur.val < val)
                cur = cur.right;
            // The target node lies in the left subtree of cur
            else if (cur.val > val)
                cur = cur.left;
            // The target node was found; exit the loop
            else
                break;
        }
        // Return the target node
        return cur;
    }
}

public class avl_tree {
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\nAfter inserting node " + val + " the AVL tree is:");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\nAfter removing node " + val + " the AVL tree is:");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* Initialize an empty AVL tree */
        AVLTree avlTree = new();

        /* Insert a node */
        // Observe how the AVL tree maintains balance after a node is inserted
        TestInsert(avlTree, 1);
        TestInsert(avlTree, 2);
        TestInsert(avlTree, 3);
        TestInsert(avlTree, 4);
        TestInsert(avlTree, 5);
        TestInsert(avlTree, 8);
        TestInsert(avlTree, 7);
        TestInsert(avlTree, 9);
        TestInsert(avlTree, 10);
        TestInsert(avlTree, 6);

        /* Insert a duplicate node */
        TestInsert(avlTree, 7);

        /* Remove a node */
        // Observe how the AVL tree maintains balance after a node is removed
        TestRemove(avlTree, 8); // Remove a node with 0 children
        TestRemove(avlTree, 5); // Remove a node with 1 child
        TestRemove(avlTree, 4); // Remove a node with 2 children

        /* Look up a node */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\nFound node object: " + node + ", node value = " + node?.val);
    }
}
