/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 二分探索木 */
class BinarySearchTree {
    private var root: TreeNode?

    /* コンストラクタ */
    init() {
        // 空の木を初期化する
        root = nil
    }

    /* 二分木の根ノードを取得 */
    func getRoot() -> TreeNode? {
        root
    }

    /* ノードを探索 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // ループで探索し、葉ノードを越えたら抜ける
        while cur != nil {
            // 目標ノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 目標ノードは cur の左部分木にある
            else if cur!.val > num {
                cur = cur?.left
            }
            // 目標ノードが見つかったらループを抜ける
            else {
                break
            }
        }
        // 目標ノードを返す
        return cur
    }

    /* ノードを挿入 */
    func insert(num: Int) {
        // 木が空なら、根ノードを初期化する
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // ループで探索し、葉ノードを越えたら抜ける
        while cur != nil {
            // 重複ノードが見つかったら、直ちに返す
            if cur!.val == num {
                return
            }
            pre = cur
            // 挿入位置は cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 挿入位置は cur の左部分木にある
            else {
                cur = cur?.left
            }
        }
        // ノードを挿入
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* ノードを削除 */
    func remove(num: Int) {
        // 木が空なら、そのまま早期リターンする
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // ループで探索し、葉ノードを越えたら抜ける
        while cur != nil {
            // 削除対象のノードが見つかったら、ループを抜ける
            if cur!.val == num {
                break
            }
            pre = cur
            // 削除対象ノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 削除対象ノードは cur の左部分木にある
            else {
                cur = cur?.left
            }
        }
        // 削除対象ノードがなければそのまま返す
        if cur == nil {
            return
        }
        // 子ノード数 = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            let child = cur?.left ?? cur?.right
            // ノード cur を削除する
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // ノード tmp を再帰的に削除
            remove(num: tmp!.val)
            // tmp で cur を上書きする
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* Driver Code */
    static func main() {
        /* 二分探索木を初期化 */
        let bst = BinarySearchTree()
        // 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\n初期化された二分木は\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* ノードを探索 */
        let node = bst.search(num: 7)
        print("\n見つかったノードオブジェクトは \(node!)、ノード値 = \(node!.val)")

        /* ノードを挿入 */
        bst.insert(num: 16)
        print("\nノード 16 を挿入後、二分木は\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* ノードを削除 */
        bst.remove(num: 1)
        print("\nノード 1 を削除後、二分木は\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nノード 2 を削除後、二分木は\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nノード 4 を削除後、二分木は\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
