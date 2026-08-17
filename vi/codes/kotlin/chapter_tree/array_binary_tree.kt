/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Binary tree class represented by array */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* List capacity */
    fun size(): Int {
        return tree.size
    }

    /* Get value of node at index i */
    fun _val(i: Int): Int? {
        // If index out of bounds, return null to represent empty position
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* Get index of left child node of node at index i */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Get index of right child node of node at index i */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Get index of parent node of node at index i */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* Level-order traversal */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // Traverse array directly
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* Depth-first traversal */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // If empty position, return
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

/* Driver Code */
fun main() {
    // Initialize binary tree
    // Here we use a function to generate binary tree directly from list
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\nInitialize binary tree\n")
    println("Array representation of binary tree:")
    println(arr)
    println("Linked list representation of binary tree:")
    printTree(root)

    // Binary tree class represented by array
    val abt = ArrayBinaryTree(arr)

    // Access node
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("Current node index is $i, value is ${abt._val(i)}")
    println("Its left child index is $l, value is ${abt._val(l)}")
    println("Its right child index is $r, value is ${abt._val(r)}")
    println("Its parent node index is $p, value is ${abt._val(p)}")

    // Traverse tree
    var res = abt.levelOrder()
    println("\nLevel-order traversal is: $res")
    res = abt.preOrder()
    println("Pre-order traversal is: $res")
    res = abt.inOrder()
    println("In-order traversal is: $res")
    res = abt.postOrder()
    println("Post-order traversal is: $res")
}