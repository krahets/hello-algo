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

    /* Get node height */
    func height(node: TreeNode?) -> Int {
        // Empty node height is -1, leaf node height is 0
        node?.height ?? -1
    }

    /* Update node height */
    private func updateHeight(node: TreeNode?) {
        // Node height equals the height of the tallest subtree + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* Get balance factor */
    func balanceFactor(node: TreeNode?) -> Int {
        // Empty node balance factor is 0
        guard let node = node else { return 0 }
        // Node balance factor = left subtree height - right subtree height
        return height(node: node.left) - height(node: node.right)
    }

    /* Right rotation operation */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Using child as pivot, rotate node to the right
        child?.right = node
        node?.left = grandChild
        // Update node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return root node of subtree after rotation
        return child
    }

    /* Left rotation operation */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Using child as pivot, rotate node to the left
        child?.left = node
        node?.right = grandChild
        // Update node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return root node of subtree after rotation
        return child
    }

    /* Perform rotation operation to restore balance to this subtree */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // Get balance factor of node
        let balanceFactor = balanceFactor(node: node)
        // Left-leaning tree
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Right rotation
                return rightRotate(node: node)
            } else {
                // First left rotation then right rotation
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Right-leaning tree
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Left rotation
                return leftRotate(node: node)
            } else {
                // First right rotation then left rotation
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node
    }

    /* Insert node */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* Recursively insert node (helper method) */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. Find insertion position and insert node */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // Duplicate node not inserted, return directly
        }
        updateHeight(node: node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node: node)
        // Return root node of subtree
        return node
    }

    /* Remove node */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* Recursively delete node (helper method) */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. Find node and delete */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // Number of child nodes = 0, delete node directly and return
                if child == nil {
                    return nil
                }
                // Number of child nodes = 1, delete node directly
                else {
                    node = child
                }
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node: node)
        // Return root node of subtree
        return node
    }

    /* Search node */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // Target node is in cur's right subtree
            if cur!.val < val {
                cur = cur?.right
            }
            // Target node is in cur's left subtree
            else if cur!.val > val {
                cur = cur?.left
            }
            // Found target node, exit loop
            else {
                break
            }
        }
        // Return target node
        return cur
    }
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\nAfter inserting node \(val), AVL tree is")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\nAfter deleting node \(val), AVL tree is")
        PrintUtil.printTree(root: tree.root)
    }

    /* Driver Code */
    static func main() {
        /* Please pay attention to how the AVL tree maintains balance after inserting nodes */
        let avlTree = AVLTree()

        /* Insert node */
        // Delete nodes
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

        /* Please pay attention to how the AVL tree maintains balance after deleting nodes */
        testInsert(tree: avlTree, val: 7)

        /* Remove node */
        // Delete node with degree 1
        testRemove(tree: avlTree, val: 8) // Delete node with degree 2
        testRemove(tree: avlTree, val: 5) // Remove node with degree 1
        testRemove(tree: avlTree, val: 4) // Remove node with degree 2

        /* Search node */
        let node = avlTree.search(val: 7)
        print("\nFound node object is \(node!), node value = \(node!.val)")
    }
}
