/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 二分木を配列で表すクラス */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* コンストラクタ */
    init(arr: [Int?]) {
        tree = arr
    }

    /* リストの容量 */
    func size() -> Int {
        tree.count
    }

    /* インデックス i のノードの値を取得する */
    func val(i: Int) -> Int? {
        // 範囲外なら空きを示す null を返す
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* インデックス i のノードの左の子のインデックスを取得する */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* インデックス i のノードの右の子のインデックスを取得する */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* インデックス i のノードの親のインデックスを取得する */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* レベル順走査 */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // 配列を順に走査する
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* 深さ優先走査 */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // 空きなら戻る
        guard let val = val(i: i) else {
            return
        }
        // 行きがけ順走査
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // 通りがけ順走査
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // 帰りがけ順走査
        if order == "post" {
            res.append(val)
        }
    }

    /* 行きがけ順走査 */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* 通りがけ順走査 */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* 帰りがけ順走査 */
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

@main
enum _ArrayBinaryTree {
    /* 実行例 */
    static func main() {
        // 二分木を初期化する
        // ここでは配列から直接二分木を作る関数を使う
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\n二分木を初期化\n")
        print("二分木の配列表現：")
        print(arr)
        print("二分木の連結表現：")
        PrintUtil.printTree(root: root)

        // 二分木を配列で表すクラス
        let abt = ArrayBinaryTree(arr: arr)

        // ノードへのアクセス
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\n現在のノードのインデックスは \(i)、値は \(abt.val(i: i) as Any)")
        print("左の子のインデックスは \(l)、値は \(abt.val(i: l) as Any)")
        print("右の子のインデックスは \(r)、値は \(abt.val(i: r) as Any)")
        print("親のインデックスは \(p)、値は \(abt.val(i: p) as Any)")

        // 木を走査する
        var res = abt.levelOrder()
        print("\nレベル順：\(res)")
        res = abt.preOrder()
        print("行きがけ順：\(res)")
        res = abt.inOrder()
        print("通りがけ順：\(res)")
        res = abt.postOrder()
        print("帰りがけ順：\(res)")
    }
}
