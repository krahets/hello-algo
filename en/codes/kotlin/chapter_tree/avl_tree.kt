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
        // A null node has height -1, and a leaf has height 0
        return node?.height ?: -1
    }

    /* Update the node height */
    private fun updateHeight(node: TreeNode?) {
        // Node height is the height of the taller subtree plus 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* Get the balance factor */
    fun balanceFactor(node: TreeNode?): Int {
        // A null node has a balance factor of 0
        if (node == null) return 0
        // Balance factor = left subtree height - right subtree height
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

    /* Rebalance the subtree by rotating it */
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
        // The tree is balanced, so return without rotating
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
            return node // Return without inserting a duplicate
        updateHeight(node) // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = rotate(node)
        // Return the root of the subtree
        return node
    }

    /* Delete a node */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Delete a node recursively (helper method) */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Find the node and delete it */
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
                // No children: delete node and return
                if (child == null)
                    return null
                // One child: delete node
                else
                    node = child
            } else {
                // Two children: delete the inorder successor and use it to replace the current node
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = rotate(node)
        // Return the root of the subtree
        return node
    }

    /* Search for a node */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // Stop the search after passing a leaf
        while (cur != null) {
            // The target is in the right subtree of cur
            cur = if (cur._val < _val)
                cur.right!!
            // The target is in the left subtree of cur
            else if (cur._val > _val)
                cur.left
            // The target was found, so exit the loop
            else
                break
        }
        // Return the target node
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nAVL tree after inserting $_val:")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nAVL tree after deleting $_val:")
    printTree(tree.root)
}

/* Driver code */
fun main() {
    /* Initialize an empty AVL tree */
    val avlTree = AVLTree()

    /* Insert a node */
    // Watch how the AVL tree stays balanced after an insertion
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

    /* Delete a node */
    // Watch how the AVL tree stays balanced after a deletion
    testRemove(avlTree, 8) // Delete a node with no children
    testRemove(avlTree, 5) // Delete a node with one child
    testRemove(avlTree, 4) // Delete a node with two children

    /* Look up a node */
    val node = avlTree.search(7)
    println("\nNode found: $node, node value = ${node?._val}")
}