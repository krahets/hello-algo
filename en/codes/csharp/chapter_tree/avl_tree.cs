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
        // A null node has height -1, and a leaf has height 0
        return node == null ? -1 : node.height;
    }

    /* Update the node height */
    void UpdateHeight(TreeNode node) {
        // Node height is the height of the taller subtree plus 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* Get the balance factor */
    public int BalanceFactor(TreeNode? node) {
        // A null node has a balance factor of 0
        if (node == null) return 0;
        // Balance factor = left subtree height - right subtree height
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

    /* Rebalance the subtree by rotating it */
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
        // The tree is balanced, so return without rotating
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
            return node;     // Return without inserting a duplicate
        UpdateHeight(node);  // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = Rotate(node);
        // Return the root of the subtree
        return node;
    }

    /* Delete a node */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Delete a node recursively (helper method) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. Find the node and delete it */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // No children: delete node and return
                if (child == null)
                    return null;
                // One child: delete node
                else
                    node = child;
            } else {
                // Two children: delete the inorder successor and use it to replace the current node
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = Rotate(node);
        // Return the root of the subtree
        return node;
    }

    /* Search for a node */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
        // Stop the search after passing a leaf
        while (cur != null) {
            // The target is in the right subtree of cur
            if (cur.val < val)
                cur = cur.right;
            // The target is in the left subtree of cur
            else if (cur.val > val)
                cur = cur.left;
            // The target was found, so exit the loop
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
        Console.WriteLine("\nInsert node " + val + " to obtain this AVL tree:");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\nDelete node " + val + " to obtain this AVL tree:");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* Initialize an empty AVL tree */
        AVLTree avlTree = new();

        /* Insert a node */
        // Watch how the AVL tree stays balanced after an insertion
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

        /* Delete a node */
        // Watch how the AVL tree stays balanced after a deletion
        TestRemove(avlTree, 8); // Delete a node with no children
        TestRemove(avlTree, 5); // Delete a node with one child
        TestRemove(avlTree, 4); // Delete a node with two children

        /* Look up a node */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\nNode found: " + node + ", node value = " + node?.val);
    }
}
