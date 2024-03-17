/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 数组表示下的二叉树类 */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* 构造方法 */
    init(arr: [Int?]) {
        tree = arr
    }

    /* 列表容量 */
    func size() -> Int {
        tree.count
    }

    /* 获取索引为 i 节点的值 */
    func val(i: Int) -> Int? {
        // 若索引越界，则返回 null ，代表空位
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 获取索引为 i 节点的父节点的索引 */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* 层序遍历 */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // 直接遍历数组
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* 深度优先遍历 */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // 若为空位，则返回
        guard let val = val(i: i) else {
            return
        }
        // 前序遍历
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // 中序遍历
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // 后序遍历
        if order == "post" {
            res.append(val)
        }
    }

    /* 前序遍历 */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* 中序遍历 */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* 后序遍历 */
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
        // 初始化二叉树
        // 这里借助了一个从数组直接生成二叉树的函数
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\n初始化二叉树\n")
        print("二叉树的数组表示：")
        print(arr)
        print("二叉树的链表表示：")
        PrintUtil.printTree(root: root)

        // 数组表示下的二叉树类
        let abt = ArrayBinaryTree(arr: arr)

        // 访问节点
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\n当前节点的索引为 \(i) ，值为 \(abt.val(i: i) as Any)")
        print("其左子节点的索引为 \(l) ，值为 \(abt.val(i: l) as Any)")
        print("其右子节点的索引为 \(r) ，值为 \(abt.val(i: r) as Any)")
        print("其父节点的索引为 \(p) ，值为 \(abt.val(i: p) as Any)")

        // 遍历树
        var res = abt.levelOrder()
        print("\n层序遍历为：\(res)")
        res = abt.preOrder()
        print("前序遍历为：\(res)")
        res = abt.inOrder()
        print("中序遍历为：\(res)")
        res = abt.postOrder()
        print("后序遍历为：\(res)")
    }
}
