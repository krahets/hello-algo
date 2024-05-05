/**
 * File: binary_tree_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import java.util.*

/* Level-order traversal */
fun levelOrder(root: TreeNode?): MutableList<Int> {
    // Initialize queue, add root node
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // Initialize a list to store the traversal sequence
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // Queue dequeues
        list.add(node?._val!!)       // Save node value
        if (node.left != null)
            queue.offer(node.left)   // Left child node enqueues
        if (node.right != null)
            queue.offer(node.right)  // Right child node enqueues
    }
    return list
}

/* Driver Code */
fun main() {
    /* Initialize binary tree */
    // This is aided by a function that generates a binary tree from a list
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nInitialize binary tree\n")
    printTree(root)

    /* Level-order traversal */
    val list = levelOrder(root)
    println("\nLevel-order traversal node print sequence = $list")
}