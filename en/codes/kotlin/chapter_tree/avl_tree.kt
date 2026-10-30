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

    /* Get the node height */
    fun height(node: TreeNode?): Int {
        // A null node has height -1; a leaf has height 0
        return node?.height ?: -1
    }

    /* Update the node height */
    private fun updateHeight(node: TreeNode?) {
        // The node height equals the height of its taller subtree + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* Get the balance factor */
    fun balanceFactor(node: TreeNode?): Int {
        // A null node has balance factor 0
        if (node == null) return 0
        // Node balance factor = left subtree height - right subtree height
        return height(node.left) - height(node.right)
    }

    /* Right rotation */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Rotate node to the right around child
        child.right = node
        node.left = grandChild
        // Update the node height
        updateHeight(node)
        updateHeight(child)
        // Return the root of the rotated subtree
        return child
    }

    /* Left rotation */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Rotate node to the left around child
        child.left = node
        node.right = grandChild
        // Update the node height
        updateHeight(node)
        updateHeight(child)
        // Return the root of the rotated subtree
        return child
    }

    /* Perform rotations to restore balance in this subtree */
    private fun rotate(node: TreeNode): TreeNode {
        // Get the balance factor of node
        val balanceFactor = balanceFactor(node)
        // Left-heavy tree
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Rotate right
                return rightRotate(node)
            } else {
                // Rotate left, then right
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Right-heavy tree
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Rotate left
                return leftRotate(node)
            } else {
                // Rotate right, then left
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // The tree is balanced; return without rotating
        return node
    }

    /* Insert a node */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* Insert a node recursively (helper method) */
    private fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. Find the insertion position and insert the node */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // Return without inserting a duplicate node
        updateHeight(node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node)
        // Return the subtree root
        return node
    }

    /* Remove a node */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Remove a node recursively (helper method) */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Find and remove the node */
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
                // Number of children = 0: remove node and return
                if (child == null)
                    return null
                // Number of children = 1: remove node directly
                else
                    node = child
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node)
        // Return the subtree root
        return node
    }

    /* Find a node */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // Search while cur is not null; stop when the target is found
        while (cur != null) {
            // The target node lies in the right subtree of cur
            cur = if (cur._val < _val)
                cur.right!!
            // The target node lies in the left subtree of cur
            else if (cur._val > _val)
                cur.left
            // The target node was found; exit the loop
            else
                break
        }
        // Return the target node
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nAVL tree after inserting node $_val:")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nAVL tree after removing node $_val:")
    printTree(tree.root)
}

/* Driver code */
fun main() {
    /* Initialize an empty AVL tree */
    val avlTree = AVLTree()

    /* Insert a node */
    // Observe how the AVL tree maintains balance after a node is inserted
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

    /* Insert a duplicate node */
    testInsert(avlTree, 7)

    /* Remove a node */
    // Observe how the AVL tree maintains balance after a node is removed
    testRemove(avlTree, 8) // Remove a node with 0 children
    testRemove(avlTree, 5) // Remove a node with 1 child
    testRemove(avlTree, 4) // Remove a node with 2 children

    /* Look up a node */
    val node = avlTree.search(7)
    println("\nFound node object: $node; node value = ${node?._val}")
}