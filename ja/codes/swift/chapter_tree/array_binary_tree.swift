/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 配列表現による二分木クラス */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* コンストラクタ */
    init(arr: [Int?]) {
        tree = arr
    }

    /* リスト容量 */
    func size() -> Int {
        tree.count
    }

    /* インデックス i のノードの値を取得 */
    func val(i: Int) -> Int? {
        // インデックスが範囲外なら、空きを表す null を返す
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* インデックス i のノードの左子ノードのインデックスを取得 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* インデックス i のノードの右子ノードのインデックスを取得 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* インデックス i のノードの親ノードのインデックスを取得 */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* レベル順走査 */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // 配列を直接走査する
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* 深さ優先探索 */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // 空きスロットなら返す
        guard let val = val(i: i) else {
            return
        }
        // 先行順走査
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // 中順走査
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // 後順走査
        if order == "post" {
            res.append(val)
        }
    }

    /* 先行順走査 */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* 中順走査 */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* 後順走査 */
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
        // 二分木を初期化
        // ここでは、配列から直接二分木を生成する関数を利用する
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\n二分木を初期化\n")
        print("二分木の配列表現：")
        print(arr)
        print("二分木の連結リスト表現：")
        PrintUtil.printTree(root: root)

        // 配列表現による二分木クラス
        let abt = ArrayBinaryTree(arr: arr)

        // ノードにアクセス
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\n現在のノードのインデックスは \(i) 、値は \(abt.val(i: i) as Any)")
        print("左の子ノードのインデックスは \(l) 、値は \(abt.val(i: l) as Any)")
        print("右の子ノードのインデックスは \(r) 、値は \(abt.val(i: r) as Any)")
        print("親ノードのインデックスは \(p) 、値は \(abt.val(i: p) as Any)")

        // 木を走査
        var res = abt.levelOrder()
        print("\nレベル順走査：\(res)")
        res = abt.preOrder()
        print("先行順走査：\(res)")
        res = abt.inOrder()
        print("中間順走査：\(res)")
        res = abt.postOrder()
        print("後順走査は：\(res)")
    }
}
