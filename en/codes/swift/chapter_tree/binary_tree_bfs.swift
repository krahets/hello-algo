/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Level-order traversal */
func levelOrder(root: TreeNode) -> [Int] {
    // Initialize queue, add root node
    var queue: [TreeNode] = [root]
    // Initialize a list to store the traversal sequence
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // Queue dequeues
        list.append(node.val) // Save node value
        if let left = node.left {
            queue.append(left) // Left child node enqueues
        }
        if let right = node.right {
            queue.append(right) // Right child node enqueues
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* Driver Code */
    static func main() {
        /* Initialize binary tree */
        // Use a specific function to convert an array into a binary tree
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nInitialize binary tree\n")
        PrintUtil.printTree(root: node)

        /* Level-order traversal */
        let list = levelOrder(root: node)
        print("\nSequence of nodes in level-order traversal = \(list)")
    }
}
