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

    /* 二分木の根ノードを取得する */
    func getRoot() -> TreeNode? {
        root
    }

    /* ノードを探索する */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 繰り返し探索し、葉ノードを越えたら終了する
        while cur != nil {
            // 目的のノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 目的のノードは cur の左部分木にある
            else if cur!.val > num {
                cur = cur?.left
            }
            // 目的のノードが見つかったので、ループを終了する
            else {
                break
            }
        }
        // 目的のノードを返す
        return cur
    }

    /* ノードを挿入する */
    func insert(num: Int) {
        // 木が空の場合、根ノードを初期化する
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // 繰り返し探索し、葉ノードを越えたら終了する
        while cur != nil {
            // 重複したノードが見つかったので、そのまま戻る
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
        // 木が空の場合、そのまま早期リターンする
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 繰り返し探索し、葉ノードを越えたら終了する
        while cur != nil {
            // 削除対象のノードが見つかったので、ループを終了する
            if cur!.val == num {
                break
            }
            pre = cur
            // 削除対象のノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 削除対象のノードは cur の左部分木にある
            else {
                cur = cur?.left
            }
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if cur == nil {
            return
        }
        // 子ノード数 = 0 または 1
        if cur?.left == nil || cur?.right == nil {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            let child = cur?.left ?? cur?.right
            // ノード cur を削除する
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // ノード tmp を再帰的に削除する
            remove(num: tmp!.val)
            // tmp で cur を上書きする
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* 実行用コード */
    static func main() {
        /* 二分探索木を初期化する */
        let bst = BinarySearchTree()
        // 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\n初期化した二分木\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* ノードを探索する */
        let node = bst.search(num: 7)
        print("\n見つかったノードオブジェクトは \(node!)、ノードの値 = \(node!.val)")

        /* ノードを挿入する */
        bst.insert(num: 16)
        print("\nノード 16 を挿入した後の二分木\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* ノードを削除する */
        bst.remove(num: 1)
        print("\nノード 1 を削除した後の二分木\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nノード 2 を削除した後の二分木\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nノード 4 を削除した後の二分木\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
