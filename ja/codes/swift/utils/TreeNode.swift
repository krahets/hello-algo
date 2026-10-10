/**
 * File: TreeNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分木ノードクラス */
public class TreeNode {
    public var val: Int // ノード値
    public var height: Int // ノードの高さ
    public var left: TreeNode? // 左子ノードへの参照
    public var right: TreeNode? // 右子ノードへの参照

    /* コンストラクタ */
    public init(x: Int) {
        val = x
        height = 0
    }

    // シリアライズの符号化規則は次を参照してください:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // 二分木の配列表現:
    // [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    // 二分木の連結リスト表現:
    // /——— 15
    // /——— 7
    // /——— 3
    // |    \\——— 6
    // |        \\——— 12
    // ——— 1
    // \\——— 2
    // |    /——— 9
    // \\——— 4
    // \\——— 8

    /* リストを二分木にデシリアライズする: 再帰 */
    private static func listToTreeDFS(arr: [Int?], i: Int) -> TreeNode? {
        if i < 0 || i >= arr.count || arr[i] == nil {
            return nil
        }
        let root = TreeNode(x: arr[i]!)
        root.left = listToTreeDFS(arr: arr, i: 2 * i + 1)
        root.right = listToTreeDFS(arr: arr, i: 2 * i + 2)
        return root
    }

    /* リストを二分木にデシリアライズする */
    public static func listToTree(arr: [Int?]) -> TreeNode? {
        listToTreeDFS(arr: arr, i: 0)
    }

    /* 二分木をリストにシリアライズする: 再帰 */
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

    /* 二分木をリストにシリアライズする */
    public static func treeToList(root: TreeNode?) -> [Int?] {
        var res: [Int?] = []
        treeToListDFS(root: root, i: 0, res: &res)
        return res
    }
}
