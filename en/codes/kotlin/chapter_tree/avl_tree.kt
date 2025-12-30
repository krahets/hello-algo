/**
 * File: avl_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import kotlin.math.max

/* AVL tree */
class AVLTree {
    var root: TreeNode? = null // Root node

    /* Get node height */
    fun height(node: TreeNode?): Int {
        // Empty node height is -1, leaf node height is 0
        return node?.height ?: -1
    }

    /* Update node height */
    private fun updateHeight(node: TreeNode?) {
        // Node height equals the height of the tallest subtree + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* Get balance factor */
    fun balanceFactor(node: TreeNode?): Int {
        // Empty node balance factor is 0
        if (node == null) return 0
        // Node balance factor = left subtree height - right subtree height
        return height(node.left) - height(node.right)
    }

    /* Right rotation operation */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Using child as pivot, rotate node to the right
        child.right = node
        node.left = grandChild
        // Update node height
        updateHeight(node)
        updateHeight(child)
        // Return root node of subtree after rotation
        return child
    }

    /* Left rotation operation */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Using child as pivot, rotate node to the left
        child.left = node
        node.right = grandChild
        // Update node height
        updateHeight(node)
        updateHeight(child)
        // Return root node of subtree after rotation
        return child
    }

    /* Perform rotation operation to restore balance to this subtree */
    private fun rotate(node: TreeNode): TreeNode {
        // Get balance factor of node
        val balanceFactor = balanceFactor(node)
        // Left-leaning tree
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Right rotation
                return rightRotate(node)
            } else {
                // First left rotation then right rotation
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Right-leaning tree
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Left rotation
                return leftRotate(node)
            } else {
                // First right rotation then left rotation
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node
    }

    /* Insert node */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* Recursively insert node (helper method) */
    private fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. Find insertion position and insert node */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // Duplicate node not inserted, return directly
        updateHeight(node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node)
        // Return root node of subtree
        return node
    }

    /* Remove node */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Recursively delete node (helper method) */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Find node and delete */
        if (_val < node._val)
            node.left = removeHelper(node.left, _val)
        else if (_val > node._val)
            node.right = removeHelper(node.right, _val)
        else {
            if (node.left == null || node.right == null) {
                val child = if (node.left != null)
                    node.left
                else
                    node.right
                // Number of child nodes = 0, delete node directly and return
                if (child == null)
                    return null
                // Number of child nodes = 1, delete node directly
                else
                    node = child
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node)
        // Return root node of subtree
        return node
    }

    /* Search node */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Target node is in cur's right subtree
            cur = if (cur._val < _val)
                cur.right!!
            // Target node is in cur's left subtree
            else if (cur._val > _val)
                cur.left
            // Found target node, exit loop
            else
                break
        }
        // Return target node
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nAfter inserting node $_val, AVL tree is")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nAfter deleting node $_val, AVL tree is")
    printTree(tree.root)
}

/* Driver Code */
fun main() {
    /* Please pay attention to how the AVL tree maintains balance after inserting nodes */
    val avlTree = AVLTree()

    /* Insert node */
    // Delete nodes
    testInsert(avlTree, 1)
    testInsert(avlTree, 2)
    testInsert(avlTree, 3)
    testInsert(avlTree, 4)
    testInsert(avlTree, 5)
    testInsert(avlTree, 8)
    testInsert(avlTree, 7)
    testInsert(avlTree, 9)
    testInsert(avlTree, 10)
    testInsert(avlTree, 6)

    /* Please pay attention to how the AVL tree maintains balance after deleting nodes */
    testInsert(avlTree, 7)

    /* Remove node */
    // Delete node with degree 1
    testRemove(avlTree, 8) // Delete node with degree 2
    testRemove(avlTree, 5) // Remove node with degree 1
    testRemove(avlTree, 4) // Remove node with degree 2

    /* Search node */
    val node = avlTree.search(7)
    println("\n Found node object is $node, node value = ${node?._val}")
}