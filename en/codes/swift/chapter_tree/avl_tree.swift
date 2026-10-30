/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL tree */
class AVLTree {
    fileprivate var root: TreeNode? // Root node

    init() {}

    /* Get the node height */
    func height(node: TreeNode?) -> Int {
        // A nil node has height -1; a leaf has height 0
        node?.height ?? -1
    }

    /* Update the node height */
    private func updateHeight(node: TreeNode?) {
        // The node height equals the height of its taller subtree + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* Get the balance factor */
    func balanceFactor(node: TreeNode?) -> Int {
        // A nil node has balance factor 0
        guard let node = node else { return 0 }
        // Node balance factor = left subtree height - right subtree height
        return height(node: node.left) - height(node: node.right)
    }

    /* Right rotation */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Rotate node to the right around child
        child?.right = node
        node?.left = grandChild
        // Update the node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return the root of the rotated subtree
        return child
    }

    /* Left rotation */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Rotate node to the left around child
        child?.left = node
        node?.right = grandChild
        // Update the node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return the root of the rotated subtree
        return child
    }

    /* Perform rotations to restore balance in this subtree */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // Get the balance factor of node
        let balanceFactor = balanceFactor(node: node)
        // Left-heavy tree
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Rotate right
                return rightRotate(node: node)
            } else {
                // Rotate left, then right
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Right-heavy tree
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Rotate left
                return leftRotate(node: node)
            } else {
                // Rotate right, then left
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // The tree is balanced; return without rotating
        return node
    }

    /* Insert a node */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* Insert a node recursively (helper method) */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. Find the insertion position and insert the node */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // Return without inserting a duplicate node
        }
        updateHeight(node: node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node: node)
        // Return the subtree root
        return node
    }

    /* Remove a node */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* Remove a node recursively (helper method) */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. Find and remove the node */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // Number of children = 0: remove node and return
                if child == nil {
                    return nil
                }
                // Number of children = 1: remove node directly
                else {
                    node = child
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node: node)
        // Return the subtree root
        return node
    }

    /* Find a node */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // If present, the target node lies in the right subtree of cur
            if cur!.val < val {
                cur = cur?.right
            }
            // If present, the target node lies in the left subtree of cur
            else if cur!.val > val {
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
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\nAVL tree after inserting node \(val):")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\nAVL tree after removing node \(val):")
        PrintUtil.printTree(root: tree.root)
    }

    /* Driver code */
    static func main() {
        /* Initialize an empty AVL tree */
        let avlTree = AVLTree()

        /* Insert a node */
        // Observe how the AVL tree maintains balance after a node is inserted
        testInsert(tree: avlTree, val: 1)
        testInsert(tree: avlTree, val: 2)
        testInsert(tree: avlTree, val: 3)
        testInsert(tree: avlTree, val: 4)
        testInsert(tree: avlTree, val: 5)
        testInsert(tree: avlTree, val: 8)
        testInsert(tree: avlTree, val: 7)
        testInsert(tree: avlTree, val: 9)
        testInsert(tree: avlTree, val: 10)
        testInsert(tree: avlTree, val: 6)

        /* Insert a duplicate node */
        testInsert(tree: avlTree, val: 7)

        /* Remove a node */
        // Observe how the AVL tree maintains balance after a node is removed
        testRemove(tree: avlTree, val: 8) // Remove a node with 0 children
        testRemove(tree: avlTree, val: 5) // Remove a node with 1 child
        testRemove(tree: avlTree, val: 4) // Remove a node with 2 children

        /* Look up a node */
        let node = avlTree.search(val: 7)
        print("\nFound node object: \(node!), node value = \(node!.val)")
    }
}
