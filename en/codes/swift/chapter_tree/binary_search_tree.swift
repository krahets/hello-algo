/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Binary search tree */
class BinarySearchTree {
    private var root: TreeNode?

    /* Constructor */
    init() {
        // Initialize an empty tree
        root = nil
    }

    /* Get the root of the binary tree */
    func getRoot() -> TreeNode? {
        root
    }

    /* Search for a node */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Stop the search after passing a leaf
        while cur != nil {
            // The target is in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // The target is in the left subtree of cur
            else if cur!.val > num {
                cur = cur?.left
            }
            // The target was found, so exit the loop
            else {
                break
            }
        }
        // Return the target node
        return cur
    }

    /* Insert a node */
    func insert(num: Int) {
        // If the tree is empty, initialize the root
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Stop the search after passing a leaf
        while cur != nil {
            // Return if a duplicate is found
            if cur!.val == num {
                return
            }
            pre = cur
            // The insertion position is in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // The insertion position is in the left subtree of cur
            else {
                cur = cur?.left
            }
        }
        // Insert a node
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* Delete a node */
    func remove(num: Int) {
        // Return immediately if the tree is empty
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Stop the search after passing a leaf
        while cur != nil {
            // The node to delete was found, so exit the loop
            if cur!.val == num {
                break
            }
            pre = cur
            // The node to delete is in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // The node to delete is in the left subtree of cur
            else {
                cur = cur?.left
            }
        }
        // Return if the node to delete does not exist
        if cur == nil {
            return
        }
        // Number of children = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // With no children, child = null. With one child, child is that child.
            let child = cur?.left ?? cur?.right
            // Delete node cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // If deleting the root, assign a new root
                root = child
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // Recursively delete node tmp
            remove(num: tmp!.val)
            // Replace the value of cur with that of tmp
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* Driver code */
    static func main() {
        /* Initialize the binary search tree */
        let bst = BinarySearchTree()
        // Different insertion orders produce different tree shapes. This sequence produces a perfect binary tree.
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\nInitial binary tree:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Search for a node */
        let node = bst.search(num: 7)
        print("\nNode found: \(node!), node value = \(node!.val)")

        /* Insert a node */
        bst.insert(num: 16)
        print("\nBinary tree after inserting node 16:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Delete a node */
        bst.remove(num: 1)
        print("\nBinary tree after deleting node 1:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nBinary tree after deleting node 2:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nBinary tree after deleting node 4:\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
