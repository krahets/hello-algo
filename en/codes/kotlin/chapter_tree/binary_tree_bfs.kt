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
    // Initialize the queue with the root
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // Initialize a list to store the traversal sequence
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // Dequeue a node
        list.add(node?._val!!)       // Save the node value
        if (node.left != null)
            queue.offer(node.left)   // Enqueue the left child
        if (node.right != null)
            queue.offer(node.right)  // Enqueue the right child
    }
    return list
}

/* Driver code */
fun main() {
    /* Initialize the binary tree */
    // Use a function that builds a binary tree directly from a list
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nInitialize the binary tree\n")
    printTree(root)

    /* Level-order traversal */
    val list = levelOrder(root)
    println("\nNodes in level order = $list")
}