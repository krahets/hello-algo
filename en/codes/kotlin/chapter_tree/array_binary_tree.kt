/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Array-based binary tree class */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* List capacity */
    fun size(): Int {
        return tree.size
    }

    /* Get the value of the node at index i */
    fun _val(i: Int): Int? {
        // If the index is out of bounds, return null, representing an empty spot
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* Get the index of the left child of the node at index i */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Get the index of the right child of the node at index i */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Get the index of the parent of the node at index i */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* Level-order traversal */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // Traverse array
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* Depth-first traversal */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // If it is an empty spot, return
        if (_val(i) == null)
            return
        // Pre-order traversal
        if ("pre" == order)
            res.add(_val(i))
        dfs(left(i), order, res)
        // In-order traversal
        if ("in" == order)
            res.add(_val(i))
        dfs(right(i), order, res)
        // Post-order traversal
        if ("post" == order)
            res.add(_val(i))
    }

    /* Pre-order traversal */
    fun preOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "pre", res)
        return res
    }

    /* In-order traversal */
    fun inOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "in", res)
        return res
    }

    /* Post-order traversal */
    fun postOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "post", res)
        return res
    }
}

/* Driver Code */
fun main() {
    // Initialize binary tree
    // This is aided by a function that generates a binary tree from a list
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\nInitialize binary tree\n")
    println("Binary tree's array representation:")
    println(arr)
    println("Binary tree's linked list representation:")
    printTree(root)

    // Array-based binary tree class
    val abt = ArrayBinaryTree(arr)

    // Access node
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("Current node's index = $i, value = ${abt._val(i)}")
    println("Its left child's index = $l, value = ${abt._val(l)}")
    println("Its right child's index = $r, value = ${abt._val(r)}")
    println("Its parent's index = $p, value = ${abt._val(p)}")

    // Traverse tree
    var res = abt.levelOrder()
    println("\nLevel-order traversal = $res")
    res = abt.preOrder()
    println("Pre-order traversal result = $res")
    res = abt.inOrder()
    println("In-order traversal result = $res")
    res = abt.postOrder()
    println("Post-order traversal result = $res")
}