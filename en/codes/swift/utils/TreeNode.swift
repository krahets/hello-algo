/**
 * File: TreeNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary tree node class */
public class TreeNode {
    public var val: Int // Node value
    public var height: Int // Node height
    public var left: TreeNode? // Reference to left child node
    public var right: TreeNode? // Reference to right child node

    /* Constructor */
    public init(x: Int) {
        val = x
        height = 0
    }

    // For the serialization encoding rules, please refer to:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // Array representation of binary tree:
    // [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    // Linked list representation of binary tree:
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8

    /* Deserialize a list into a binary tree: recursion */
    private static func listToTreeDFS(arr: [Int?], i: Int) -> TreeNode? {
        if i < 0 || i >= arr.count || arr[i] == nil {
            return nil
        }
        let root = TreeNode(x: arr[i]!)
        root.left = listToTreeDFS(arr: arr, i: 2 * i + 1)
        root.right = listToTreeDFS(arr: arr, i: 2 * i + 2)
        return root
    }

    /* Deserialize a list into a binary tree */
    public static func listToTree(arr: [Int?]) -> TreeNode? {
        listToTreeDFS(arr: arr, i: 0)
    }

    /* Serialize a binary tree into a list: recursion */
    private static func treeToListDFS(root: TreeNode?, i: Int, res: inout [Int?]) {
        if root == nil {
            return
        }
        while i >= res.count {
            res.append(nil)
        }
        res[i] = root?.val
        treeToListDFS(root: root?.left, i: 2 * i + 1, res: &res)
        treeToListDFS(root: root?.right, i: 2 * i + 2, res: &res)
    }

    /* Serialize a binary tree into a list */
    public static func treeToList(root: TreeNode?) -> [Int?] {
        var res: [Int?] = []
        treeToListDFS(root: root, i: 0, res: &res)
        return res
    }
}
