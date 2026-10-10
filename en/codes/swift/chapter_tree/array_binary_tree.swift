/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Binary tree class represented by array */
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

    /* Get value of node at index i */
    func val(i: Int) -> Int? {
        // If index out of bounds, return null to represent empty position
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* Get index of left child node of node at index i */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Get index of right child node of node at index i */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Get index of parent node of node at index i */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* Level-order traversal */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // Traverse array directly
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* Depth-first traversal */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // If empty position, return
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
    /* Driver Code */
    static func main() {
        // Initialize binary tree
        // Here we use a function to generate a binary tree directly from an array
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\nInitialize binary tree\n")
        print("Array representation of binary tree:")
        print(arr)
        print("Linked list representation of binary tree:")
        PrintUtil.printTree(root: root)

        // Binary tree class represented by array
        let abt = ArrayBinaryTree(arr: arr)

        // Access node
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\nCurrent node index is \(i), value is \(abt.val(i: i) as Any)")
        print("Its left child index is \(l), value is \(abt.val(i: l) as Any)")
        print("Its right child index is \(r), value is \(abt.val(i: r) as Any)")
        print("Its parent node index is \(p), value is \(abt.val(i: p) as Any)")

        // Traverse tree
        var res = abt.levelOrder()
        print("\nLevel-order traversal is: \(res)")
        res = abt.preOrder()
        print("Pre-order traversal is: \(res)")
        res = abt.inOrder()
        print("In-order traversal is: \(res)")
        res = abt.postOrder()
        print("Post-order traversal is: \(res)")
    }
}
