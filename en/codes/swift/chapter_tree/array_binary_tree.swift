/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Array-based binary tree class */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* Constructor */
    init(arr: [Int?]) {
        tree = arr
    }

    /* List capacity */
    func size() -> Int {
        tree.count
    }

    /* Get the value of the node at index i */
    func val(i: Int) -> Int? {
        // If the index is out of bounds, return null, representing an empty spot
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* Get the index of the left child of the node at index i */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Get the index of the right child of the node at index i */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Get the index of the parent of the node at index i */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* Level-order traversal */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // Traverse array
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* Depth-first traversal */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // If it is an empty spot, return
        guard let val = val(i: i) else {
            return
        }
        // Pre-order traversal
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // In-order traversal
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // Post-order traversal
        if order == "post" {
            res.append(val)
        }
    }

    /* Pre-order traversal */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* In-order traversal */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* Post-order traversal */
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

@main
enum _ArrayBinaryTree {
    /* Driver Code */
    static func main() {
        // Initialize binary tree
        // Use a specific function to convert an array into a binary tree
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\nInitialize binary tree\n")
        print("Binary tree's array representation:")
        print(arr)
        print("Binary tree's linked list representation:")
        PrintUtil.printTree(root: root)

        // Array-based binary tree class
        let abt = ArrayBinaryTree(arr: arr)

        // Access node
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\nCurrent node index = \(i), value = \(abt.val(i: i) as Any)")
        print("Its left child node index = \(l), value = \(abt.val(i: l) as Any)")
        print("Its right child node index = \(r), value = \(abt.val(i: r) as Any)")
        print("Its parent node index = \(p), value = \(abt.val(i: p) as Any)")

        // Traverse tree
        var res = abt.levelOrder()
        print("\nLevel-order traversal = \(res)")
        res = abt.preOrder()
        print("Pre-order traversal = \(res)")
        res = abt.inOrder()
        print("In-order traversal = \(res)")
        res = abt.postOrder()
        print("Post-order traversal = \(res)")
    }
}
