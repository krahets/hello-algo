/**
 * File: TreeNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二元樹節點類別 */
public class TreeNode {
    public var val: Int // 節點值
    public var height: Int // 節點高度
    public var left: TreeNode? // 指向左子節點的參照
    public var right: TreeNode? // 指向右子節點的參照

    /* 建構方法 */
    public init(x: Int) {
        val = x
        height = 0
    }

    // 序列化的編碼規則請參閱：
    // https://www.hello-algo.com/zh-hant/chapter_tree/array_representation_of_tree/
    // 二元樹的陣列表示法：
    // [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    // 二元樹的鏈結串列表示法：
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

    /* 以遞迴方式將陣列反序列化為二元樹 */
    private static func listToTreeDFS(arr: [Int?], i: Int) -> TreeNode? {
        if i < 0 || i >= arr.count || arr[i] == nil {
            return nil
        }
        let root = TreeNode(x: arr[i]!)
        root.left = listToTreeDFS(arr: arr, i: 2 * i + 1)
        root.right = listToTreeDFS(arr: arr, i: 2 * i + 2)
        return root
    }

    /* 將陣列反序列化為二元樹 */
    public static func listToTree(arr: [Int?]) -> TreeNode? {
        listToTreeDFS(arr: arr, i: 0)
    }

    /* 以遞迴方式將二元樹序列化為陣列 */
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

    /* 將二元樹序列化為陣列 */
    public static func treeToList(root: TreeNode?) -> [Int?] {
        var res: [Int?] = []
        treeToListDFS(root: root, i: 0, res: &res)
        return res
    }
}
