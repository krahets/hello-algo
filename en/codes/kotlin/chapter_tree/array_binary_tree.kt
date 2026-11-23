/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Binary tree class using an array representation */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* List size */
    fun size(): Int {
        return tree.size
    }

    /* Get the value of the node at index i */
    fun _val(i: Int): Int? {
        // If the index is out of bounds, return null to represent an empty position
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* Get the left child index of the node at index i */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Get the right child index of the node at index i */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Get the parent index of the node at index i */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* Level-order traversal */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // Traverse the array directly
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* Depth-first traversal */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // Return if this position is empty
        if (_val(i) == null)
            return
        // Preorder traversal
        if ("pre" == order)
            res.add(_val(i))
        dfs(left(i), order, res)
        // Inorder traversal
        if ("in" == order)
            res.add(_val(i))
        dfs(right(i), order, res)
        // Postorder traversal
        if ("post" == order)
            res.add(_val(i))
    }

    /* Preorder traversal */
    fun preOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "pre", res)
        return res
    }

    /* Inorder traversal */
    fun inOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "in", res)
        return res
    }

    /* Postorder traversal */
    fun postOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "post", res)
        return res
    }
}

/* Driver code */
fun main() {
    // Initialize the binary tree
    // Use a helper function that builds a binary tree directly from a list
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\nInitialize the binary tree\n")
    println("Array representation of the binary tree:")
    println(arr)
    println("Linked representation of the binary tree:")
    printTree(root)

    // Binary tree class using an array representation
    val abt = ArrayBinaryTree(arr)

    // Access a node
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("Current node: index = $i, value = ${abt._val(i)}")
    println("Its left child: index = $l, value = ${abt._val(l)}")
    println("Its right child: index = $r, value = ${abt._val(r)}")
    println("Its parent: index = $p, value = ${abt._val(p)}")

    // Traverse the tree
    var res = abt.levelOrder()
    println("\nLevel-order traversal: $res")
    res = abt.preOrder()
    println("Preorder traversal: $res")
    res = abt.inOrder()
    println("Inorder traversal: $res")
    res = abt.postOrder()
    println("Postorder traversal: $res")
}