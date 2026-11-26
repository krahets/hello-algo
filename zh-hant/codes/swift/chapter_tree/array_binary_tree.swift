/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 以陣列表示二元樹的類別 */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* 建構方法 */
    init(arr: [Int?]) {
        tree = arr
    }

    /* 串列長度 */
    func size() -> Int {
        tree.count
    }

    /* 取得索引 i 處的節點值 */
    func val(i: Int) -> Int? {
        // 若索引超出範圍，回傳 null 表示空位
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* 取得索引 i 處節點的左子節點索引 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 取得索引 i 處節點的右子節點索引 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 取得索引 i 處節點的父節點索引 */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* 層序走訪 */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // 直接走訪陣列
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* 深度優先走訪 */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // 若為空位，直接返回
        guard let val = val(i: i) else {
            return
        }
        // 前序走訪
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // 中序走訪
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // 後序走訪
        if order == "post" {
            res.append(val)
        }
    }

    /* 前序走訪 */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* 中序走訪 */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* 後序走訪 */
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

@main
enum _ArrayBinaryTree {
    /* 主程式 */
    static func main() {
        // 初始化二元樹
        // 這裡使用能從陣列直接建立二元樹的函式
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\n初始化二元樹\n")
        print("二元樹的陣列表示法：")
        print(arr)
        print("二元樹的鏈結串列表示法：")
        PrintUtil.printTree(root: root)

        // 以陣列表示二元樹的類別
        let abt = ArrayBinaryTree(arr: arr)

        // 存取節點
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\n目前節點的索引為 \(i)，值為 \(abt.val(i: i) as Any)")
        print("其左子節點的索引為 \(l)，值為 \(abt.val(i: l) as Any)")
        print("其右子節點的索引為 \(r)，值為 \(abt.val(i: r) as Any)")
        print("其父節點的索引為 \(p)，值為 \(abt.val(i: p) as Any)")

        // 走訪樹
        var res = abt.levelOrder()
        print("\n層序走訪的結果：\(res)")
        res = abt.preOrder()
        print("前序走訪的結果：\(res)")
        res = abt.inOrder()
        print("中序走訪的結果：\(res)")
        res = abt.postOrder()
        print("後序走訪的結果：\(res)")
    }
}
