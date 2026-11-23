/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Level-order traversal */
func levelOrder(root: TreeNode) -> [Int] {
    // Initialize a queue and enqueue the root
    var queue: [TreeNode] = [root]
    // Initialize a list to store the traversal sequence
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // Dequeue from the queue
        list.append(node.val) // Store the node value
        if let left = node.left {
            queue.append(left) // Enqueue the left child
        }
        if let right = node.right {
            queue.append(right) // Enqueue the right child
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* Driver code */
    static func main() {
        /* Initialize the binary tree */
        // Use a helper function that builds a binary tree directly from an array
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nInitialize the binary tree\n")
        PrintUtil.printTree(root: node)

        /* Level-order traversal */
        let list = levelOrder(root: node)
        print("\nNode values in level order = \(list)")
    }
}
