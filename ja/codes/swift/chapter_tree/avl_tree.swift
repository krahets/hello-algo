/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL 木 */
class AVLTree {
    fileprivate var root: TreeNode? // 根ノード

    init() {}

    /* ノードの高さを取得する */
    func height(node: TreeNode?) -> Int {
        // 空ノードの高さは -1 、葉ノードの高さは 0
        node?.height ?? -1
    }

    /* ノードの高さを更新する */
    private func updateHeight(node: TreeNode?) {
        // ノードの高さは、最も高い部分木の高さ + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* 平衡係数を取得する */
    func balanceFactor(node: TreeNode?) -> Int {
        // 空ノードの平衡係数は 0
        guard let node = node else { return 0 }
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node: node.left) - height(node: node.right)
    }

    /* 右回転操作 */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // child を中心に node を右回転する
        child?.right = node
        node?.left = grandChild
        // ノードの高さを更新する
        updateHeight(node: node)
        updateHeight(node: child)
        // 回転後の部分木の根ノードを返す
        return child
    }

    /* 左回転操作 */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // child を中心に node を左回転する
        child?.left = node
        node?.right = grandChild
        // ノードの高さを更新する
        updateHeight(node: node)
        updateHeight(node: child)
        // 回転後の部分木の根ノードを返す
        return child
    }

    /* 回転操作によって、この部分木の平衡を回復する */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // ノード node の平衡係数を取得する
        let balanceFactor = balanceFactor(node: node)
        // 左に偏った木
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // 右回転
                return rightRotate(node: node)
            } else {
                // 左回転してから右回転する
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // 右に偏った木
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // 左回転
                return leftRotate(node: node)
            } else {
                // 右回転してから左回転する
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // 平衡な木なので、回転せずにそのまま返す
        return node
    }

    /* ノードを挿入する */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. 挿入位置を探してノードを挿入する */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // 重複したノードは挿入せず、そのまま戻る
        }
        updateHeight(node: node) // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node: node)
        // 部分木の根ノードを返す
        return node
    }

    /* ノードを削除する */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. ノードを探して削除する */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // 子ノード数 = 0 の場合、node を削除して戻る
                if child == nil {
                    return nil
                }
                // 子ノード数 = 1 の場合、node を削除する
                else {
                    node = child
                }
            } else {
                // 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node: node)
        // 部分木の根ノードを返す
        return node
    }

    /* ノードを探索する */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // 目的のノードは cur の右部分木にある
            if cur!.val < val {
                cur = cur?.right
            }
            // 目的のノードは cur の左部分木にある
            else if cur!.val > val {
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
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\nノード \(val) を挿入した後の AVL 木")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\nノード \(val) を削除した後の AVL 木")
        PrintUtil.printTree(root: tree.root)
    }

    /* 実行用コード */
    static func main() {
        /* 空の AVL 木を初期化する */
        let avlTree = AVLTree()

        /* ノードを挿入する */
        // ノード挿入後、AVL 木がどのように平衡を保つかに注目する
        testInsert(tree: avlTree, val: 1)
        testInsert(tree: avlTree, val: 2)
        testInsert(tree: avlTree, val: 3)
        testInsert(tree: avlTree, val: 4)
        testInsert(tree: avlTree, val: 5)
        testInsert(tree: avlTree, val: 8)
        testInsert(tree: avlTree, val: 7)
        testInsert(tree: avlTree, val: 9)
        testInsert(tree: avlTree, val: 10)
        testInsert(tree: avlTree, val: 6)

        /* 重複したノードを挿入する */
        testInsert(tree: avlTree, val: 7)

        /* ノードを削除する */
        // ノード削除後、AVL 木がどのように平衡を保つかに注目する
        testRemove(tree: avlTree, val: 8) // 次数 0 のノードを削除する
        testRemove(tree: avlTree, val: 5) // 次数 1 のノードを削除する
        testRemove(tree: avlTree, val: 4) // 次数 2 のノードを削除する

        /* ノードを探索する */
        let node = avlTree.search(val: 7)
        print("\n見つかったノードオブジェクトは \(node!)、ノードの値 = \(node!.val)")
    }
}
