/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Binary tree class using an array representation */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* Constructor */
    init(arr: [Int?]) {
        tree = arr
    }

    /* Length of the backing array */
    func size() -> Int {
        tree.count
    }

    /* Get the value of the node at index i */
    func val(i: Int) -> Int? {
        // If the index is out of bounds, return nil to represent an empty position
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* Get the left child index of the node at index i */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Get the right child index of the node at index i */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Get the parent index of the node at index i */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* Level-order traversal */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // Traverse the array directly
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* Depth-first traversal */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // Return if this position is empty
        guard let val = val(i: i) else {
            return
        }
        // Preorder traversal
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // Inorder traversal
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // Postorder traversal
        if order == "post" {
            res.append(val)
        }
    }

    /* Preorder traversal */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* Inorder traversal */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* Postorder traversal */
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

@main
enum _ArrayBinaryTree {
    /* Driver code */
    static func main() {
        // Initialize the binary tree
        // Use a helper function that builds a binary tree directly from an array
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\nInitialize the binary tree\n")
        print("Array representation of the binary tree:")
        print(arr)
        print("Linked representation of the binary tree:")
        PrintUtil.printTree(root: root)

        // Binary tree class using an array representation
        let abt = ArrayBinaryTree(arr: arr)

        // Access a node
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\nCurrent node: index = \(i), value = \(abt.val(i: i) as Any)")
        print("Left child: index = \(l), value = \(abt.val(i: l) as Any)")
        print("Right child: index = \(r), value = \(abt.val(i: r) as Any)")
        print("Parent: index = \(p), value = \(abt.val(i: p) as Any)")

        // Traverse the tree
        var res = abt.levelOrder()
        print("\nLevel-order traversal: \(res)")
        res = abt.preOrder()
        print("Preorder traversal: \(res)")
        res = abt.inOrder()
        print("Inorder traversal: \(res)")
        res = abt.postOrder()
        print("Postorder traversal: \(res)")
    }
}
