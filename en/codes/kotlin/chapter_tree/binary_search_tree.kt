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
    // Initialize empty tree
    private var root: TreeNode? = null

    /* Get binary tree root node */
    fun getRoot(): TreeNode? {
        return root
    }

    /* Search node */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Loop find, break after passing leaf nodes
        while (cur != null) {
            // Target node is in cur's right subtree
            cur = if (cur._val < num)
                cur.right
            // Target node is in cur's left subtree
            else if (cur._val > num)
                cur.left
            // Found target node, break loop
            else
                break
        }
        // Return target node
        return cur
    }

    /* Insert node */
    fun insert(num: Int) {
        // If tree is empty, initialize root node
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Loop find, break after passing leaf nodes
        while (cur != null) {
            // Found duplicate node, thus return
            if (cur._val == num)
                return
            pre = cur
            // Insertion position is in cur's right subtree
            cur = if (cur._val < num)
                cur.right
            // Insertion position is in cur's left subtree
            else
                cur.left
        }
        // Insert node
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* Remove node */
    fun remove(num: Int) {
        // If tree is empty, return
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Loop find, break after passing leaf nodes
        while (cur != null) {
            // Found node to be removed, break loop
            if (cur._val == num)
                break
            pre = cur
            // Node to be removed is in cur's right subtree
            cur = if (cur._val < num)
                cur.right
            // Node to be removed is in cur's left subtree
            else
                cur.left
        }
        // If no node to be removed, return
        if (cur == null)
            return
        // Number of child nodes = 0 or 1
        if (cur.left == null || cur.right == null) {
            // When the number of child nodes = 0/1, child = null/that child node
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // Remove node cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // If the removed node is the root, reassign the root
                root = child
            }
            // Number of child nodes = 2
        } else {
            // Get the next node in in-order traversal of cur
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // Recursively remove node tmp
            remove(tmp._val)
            // Replace cur with tmp
            cur._val = tmp._val
        }
    }
}

/* Driver Code */
fun main() {
    /* Initialize binary search tree */
    val bst = BinarySearchTree()
    // Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\nInitialized binary tree is\n")
    printTree(bst.getRoot())

    /* Search node */
    val node = bst.search(7)
    println("Found node object $node, node value = ${node?._val}")

    /* Insert node */
    bst.insert(16)
    println("\nAfter inserting node 16, the binary tree is\n")
    printTree(bst.getRoot())

    /* Remove node */
    bst.remove(1)
    println("\nAfter removing node 1, the binary tree is\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\nAfter removing node 2, the binary tree is\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\nAfter removing node 4, the binary tree is\n")
    printTree(bst.getRoot())
}