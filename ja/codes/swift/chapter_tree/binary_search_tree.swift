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

    /* 二分木の根を取得する */
    func getRoot() -> TreeNode? {
        root
    }

    /* ノードを探索する */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // ループで探索し、葉を越えたら終了する
        while cur != nil {
            // 目的のノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 目的のノードは cur の左部分木にある
            else if cur!.val > num {
                cur = cur?.left
            }
            // 目的のノードが見つかったのでループを抜ける
            else {
                break
            }
        }
        // 目的のノードを返す
        return cur
    }

    /* ノードを挿入する */
    func insert(num: Int) {
        // 木が空なら根を初期化する
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // ループで探索し、葉を越えたら終了する
        while cur != nil {
            // 値が重複するノードが見つかったらそのまま戻る
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
        // ノードを挿入する
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* ノードを削除する */
    func remove(num: Int) {
        // 木が空ならすぐに戻る
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // ループで探索し、葉を越えたら終了する
        while cur != nil {
            // 削除対象のノードが見つかったのでループを抜ける
            if cur!.val == num {
                break
            }
            pre = cur
            // 削除対象は cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 削除対象は cur の左部分木にある
            else {
                cur = cur?.left
            }
        }
        // 削除対象が見つからなければそのまま戻る
        if cur == nil {
            return
        }
        // 子が 0 個または 1 個
        if cur?.left == nil || cur?.right == nil {
            // 子が 0 個なら child = null、1 個なら child はその子
            let child = cur?.left ?? cur?.right
            // ノード cur を削除する
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 削除対象が根なら根を設定し直す
                root = child
            }
        }
        // 子が 2 個
        else {
            // 通りがけ順で cur の次に来るノードを取得する
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // ノード tmp を再帰的に削除する
            remove(num: tmp!.val)
            // tmp の値で cur の値を上書きする
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* 実行例 */
    static func main() {
        /* 二分探索木を初期化する */
        let bst = BinarySearchTree()
        // 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\n初期化した二分木：\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* ノードを探索する */
        let node = bst.search(num: 7)
        print("\n見つかったノードのオブジェクト：\(node!)、値 = \(node!.val)")

        /* ノードを挿入する */
        bst.insert(num: 16)
        print("\nノード 16 を挿入した後の二分木：\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* ノードを削除する */
        bst.remove(num: 1)
        print("\nノード 1 を削除した後の二分木：\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nノード 2 を削除した後の二分木：\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nノード 4 を削除した後の二分木：\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
