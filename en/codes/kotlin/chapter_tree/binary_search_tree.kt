/**
 * File: binary_search_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Binary search tree */
class BinarySearchTree {
    // Initialize an empty tree
    private var root: TreeNode? = null

    /* Get the root of the binary tree */
    fun getRoot(): TreeNode? {
        return root
    }

    /* Search for a node */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Stop the search after passing a leaf
        while (cur != null) {
            // The target is in the right subtree of cur
            cur = if (cur._val < num)
                cur.right
            // The target is in the left subtree of cur
            else if (cur._val > num)
                cur.left
            // The target was found, so exit the loop
            else
                break
        }
        // Return the target node
        return cur
    }

    /* Insert a node */
    fun insert(num: Int) {
        // If the tree is empty, initialize the root
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Stop the search after passing a leaf
        while (cur != null) {
            // Return if a duplicate is found
            if (cur._val == num)
                return
            pre = cur
            // The insertion position is in the right subtree of cur
            cur = if (cur._val < num)
                cur.right
            // The insertion position is in the left subtree of cur
            else
                cur.left
        }
        // Insert a node
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* Delete a node */
    fun remove(num: Int) {
        // Return immediately if the tree is empty
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Stop the search after passing a leaf
        while (cur != null) {
            // The node to delete was found, so exit the loop
            if (cur._val == num)
                break
            pre = cur
            // The node to delete is in the right subtree of cur
            cur = if (cur._val < num)
                cur.right
            // The node to delete is in the left subtree of cur
            else
                cur.left
        }
        // Return if the node to delete does not exist
        if (cur == null)
            return
        // Number of children = 0 or 1
        if (cur.left == null || cur.right == null) {
            // With no children, child = null. With one child, child is that child.
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // Delete node cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // If deleting the root, assign a new root
                root = child
            }
            // Number of children = 2
        } else {
            // Get the inorder successor of cur
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // Recursively delete node tmp
            remove(tmp._val)
            // Replace the value of cur with that of tmp
            cur._val = tmp._val
        }
    }
}

/* Driver code */
fun main() {
    /* Initialize the binary search tree */
    val bst = BinarySearchTree()
    // Different insertion orders produce different tree shapes. This sequence produces a perfect binary tree.
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\nInitial binary tree:\n")
    printTree(bst.getRoot())

    /* Search for a node */
    val node = bst.search(7)
    println("Node found: $node, node value = ${node?._val}")

    /* Insert a node */
    bst.insert(16)
    println("\nBinary tree after inserting node 16:\n")
    printTree(bst.getRoot())

    /* Delete a node */
    bst.remove(1)
    println("\nBinary tree after deleting node 1:\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\nBinary tree after deleting node 2:\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\nBinary tree after deleting node 4:\n")
    printTree(bst.getRoot())
}