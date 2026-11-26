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
        // A null node has height -1, and a leaf has height 0
        node?.height ?? -1
    }

    /* Update the node height */
    private func updateHeight(node: TreeNode?) {
        // Node height is the height of the taller subtree plus 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* Get the balance factor */
    func balanceFactor(node: TreeNode?) -> Int {
        // A null node has a balance factor of 0
        guard let node = node else { return 0 }
        // Balance factor = left subtree height - right subtree height
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

    /* Rebalance the subtree by rotating it */
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
        // The tree is balanced, so return without rotating
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
            return node // Return without inserting a duplicate
        }
        updateHeight(node: node) // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = rotate(node: node)
        // Return the root of the subtree
        return node
    }

    /* Delete a node */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* Delete a node recursively (helper method) */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. Find the node and delete it */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // No children: delete node and return
                if child == nil {
                    return nil
                }
                // One child: delete node
                else {
                    node = child
                }
            } else {
                // Two children: delete the inorder successor and use it to replace the current node
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = rotate(node: node)
        // Return the root of the subtree
        return node
    }

    /* Search for a node */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // The target is in the right subtree of cur
            if cur!.val < val {
                cur = cur?.right
            }
            // The target is in the left subtree of cur
            else if cur!.val > val {
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
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\nAVL tree after inserting \(val):")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\nAVL tree after deleting \(val):")
        PrintUtil.printTree(root: tree.root)
    }

    /* Driver code */
    static func main() {
        /* Initialize an empty AVL tree */
        let avlTree = AVLTree()

        /* Insert a node */
        // Watch how the AVL tree stays balanced after an insertion
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

        /* Delete a node */
        // Watch how the AVL tree stays balanced after a deletion
        testRemove(tree: avlTree, val: 8) // Delete a node with no children
        testRemove(tree: avlTree, val: 5) // Delete a node with one child
        testRemove(tree: avlTree, val: 4) // Delete a node with two children

        /* Look up a node */
        let node = avlTree.search(val: 7)
        print("\nNode found: \(node!), node value = \(node!.val)")
    }
}
