/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL tree */
class AVLTree {
    public TreeNode? root; // Root node

    /* Get node height */
    int Height(TreeNode? node) {
        // Empty node height is -1, leaf node height is 0
        return node == null ? -1 : node.height;
    }

    /* Update node height */
    void UpdateHeight(TreeNode node) {
        // Node height equals the height of the tallest subtree + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* Get balance factor */
    public int BalanceFactor(TreeNode? node) {
        // Empty node balance factor is 0
        if (node == null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return Height(node.left) - Height(node.right);
    }

    /* Right rotation operation */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return the root of the subtree after rotation
        return child;
    }

    /* Left rotation operation */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return the root of the subtree after rotation
        return child;
    }

    /* Perform rotation operation to restore balance to the subtree */
    TreeNode? Rotate(TreeNode? node) {
        // Get the balance factor of node
        int balanceFactorInt = BalanceFactor(node);
        // Left-leaning tree
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Right rotation
                return RightRotate(node);
            } else {
                // First left rotation then right rotation
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Right-leaning tree
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Left rotation
                return LeftRotate(node);
            } else {
                // First right rotation then left rotation
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return
        return node;
    }

    /* Insert node */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* Recursively insert node (helper method) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // Do not insert duplicate nodes, return
        UpdateHeight(node);  // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = Rotate(node);
        // Return the root node of the subtree
        return node;
    }

    /* Remove node */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Recursively remove node (helper method) */
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
                // Number of child nodes = 0, remove node and return
                if (child == null)
                    return null;
                // Number of child nodes = 1, remove node
                else
                    node = child;
            } else {
                // Number of child nodes = 2, remove the next node in in-order traversal and replace the current node with it
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = Rotate(node);
        // Return the root node of the subtree
        return node;
    }

    /* Search node */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
        // Loop find, break after passing leaf nodes
        while (cur != null) {
            // Target node is in cur's right subtree
            if (cur.val < val)
                cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > val)
                cur = cur.left;
            // Found target node, break loop
            else
                break;
        }
        // Return target node
        return cur;
    }
}

public class avl_tree {
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\nAfter inserting node " + val + ", the AVL tree is");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\nAfter removing node " + val + ", the AVL tree is");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* Initialize empty AVL tree */
        AVLTree avlTree = new();

        /* Insert node */
        // Notice how the AVL tree maintains balance after inserting nodes
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

        /* Insert duplicate node */
        TestInsert(avlTree, 7);

        /* Remove node */
        // Notice how the AVL tree maintains balance after removing nodes
        TestRemove(avlTree, 8); // Remove node with degree 0
        TestRemove(avlTree, 5); // Remove node with degree 1
        TestRemove(avlTree, 4); // Remove node with degree 2

        /* Search node */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\nThe found node object is " + node + ", node value =" + node?.val);
    }
}
