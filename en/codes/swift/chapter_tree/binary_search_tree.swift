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

    /* Find a node */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Search in a loop, stopping if cur becomes nil
        while cur != nil {
            // If present, the target node lies in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // If present, the target node lies in the left subtree of cur
            else if cur!.val > num {
                cur = cur?.left
            }
            // The target node was found; exit the loop
            else {
                break
            }
        }
        // Return the target node, or nil if it was not found
        return cur
    }

    /* Insert a node */
    func insert(num: Int) {
        // If the tree is empty, initialize the root node
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Search in a loop, stopping if cur becomes nil
        while cur != nil {
            // Return immediately if a duplicate node is found
            if cur!.val == num {
                return
            }
            pre = cur
            // The insertion position lies in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // The insertion position lies in the left subtree of cur
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

    /* Remove a node */
    func remove(num: Int) {
        // Return immediately if the tree is empty
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Search in a loop, stopping if cur becomes nil
        while cur != nil {
            // The node to remove was found; exit the loop
            if cur!.val == num {
                break
            }
            pre = cur
            // If present, the node to remove lies in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // If present, the node to remove lies in the left subtree of cur
            else {
                cur = cur?.left
            }
        }
        // Return immediately if the node to remove does not exist
        if cur == nil {
            return
        }
        // Number of children = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // With 0 / 1 children, child is nil / the child node, respectively
            let child = cur?.left ?? cur?.right
            // Remove node cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // If the removed node is the root, assign the new root
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
            // Recursively remove node tmp
            remove(num: tmp!.val)
            // Replace the value of cur with the value of tmp
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
        // Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\nThe initialized binary tree is:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Find a node */
        let node = bst.search(num: 7)
        print("\nFound node object: \(node!), node value = \(node!.val)")

        /* Insert a node */
        bst.insert(num: 16)
        print("\nBinary tree after inserting node 16:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Remove a node */
        bst.remove(num: 1)
        print("\nBinary tree after removing node 1:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nBinary tree after removing node 2:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nBinary tree after removing node 4:\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
