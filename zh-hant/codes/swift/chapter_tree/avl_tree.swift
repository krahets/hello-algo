/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL 樹 */
class AVLTree {
    fileprivate var root: TreeNode? // 根節點

    init() {}

    /* 取得節點高度 */
    func height(node: TreeNode?) -> Int {
        // 空節點的高度為 -1，葉節點的高度為 0
        node?.height ?? -1
    }

    /* 更新節點高度 */
    private func updateHeight(node: TreeNode?) {
        // 節點高度等於最高子樹的高度加 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* 取得平衡因子 */
    func balanceFactor(node: TreeNode?) -> Int {
        // 空節點的平衡因子為 0
        guard let node = node else { return 0 }
        // 節點的平衡因子 = 左子樹高度 - 右子樹高度
        return height(node: node.left) - height(node: node.right)
    }

    /* 右旋操作 */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // 以 child 為支點，將 node 向右旋轉
        child?.right = node
        node?.left = grandChild
        // 更新節點高度
        updateHeight(node: node)
        updateHeight(node: child)
        // 回傳旋轉後的子樹根節點
        return child
    }

    /* 左旋操作 */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // 以 child 為支點，將 node 向左旋轉
        child?.left = node
        node?.right = grandChild
        // 更新節點高度
        updateHeight(node: node)
        updateHeight(node: child)
        // 回傳旋轉後的子樹根節點
        return child
    }

    /* 透過旋轉讓這棵子樹恢復平衡 */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // 取得節點 node 的平衡因子
        let balanceFactor = balanceFactor(node: node)
        // 左偏樹
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // 右旋
                return rightRotate(node: node)
            } else {
                // 先左旋再右旋
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // 右偏樹
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // 左旋
                return leftRotate(node: node)
            } else {
                // 先右旋再左旋
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // 樹已平衡，無須旋轉，直接返回
        return node
    }

    /* 插入節點 */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* 以遞迴插入節點（輔助方法） */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. 找出插入位置並插入節點 */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // 若節點重複，直接返回，略過插入操作
        }
        updateHeight(node: node) // 更新節點高度
        /* 2. 透過旋轉讓這棵子樹恢復平衡 */
        node = rotate(node: node)
        // 回傳子樹的根節點
        return node
    }

    /* 刪除節點 */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* 以遞迴刪除節點（輔助方法） */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. 找出並刪除節點 */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // 若有 0 個子節點，直接刪除 node 並返回
                if child == nil {
                    return nil
                }
                // 若只有 1 個子節點，直接刪除 node
                else {
                    node = child
                }
            } else {
                // 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // 更新節點高度
        /* 2. 透過旋轉讓這棵子樹恢復平衡 */
        node = rotate(node: node)
        // 回傳子樹的根節點
        return node
    }

    /* 搜尋節點 */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // 目標節點在 cur 的右子樹中
            if cur!.val < val {
                cur = cur?.right
            }
            // 目標節點在 cur 的左子樹中
            else if cur!.val > val {
                cur = cur?.left
            }
            // 找到目標節點，跳出迴圈
            else {
                break
            }
        }
        // 回傳目標節點
        return cur
    }
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\n插入節點 \(val) 後的 AVL 樹為")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\n刪除節點 \(val) 後的 AVL 樹為")
        PrintUtil.printTree(root: tree.root)
    }

    /* 主程式 */
    static func main() {
        /* 初始化一棵空的 AVL 樹 */
        let avlTree = AVLTree()

        /* 插入節點 */
        // 請觀察插入節點後 AVL 樹如何維持平衡
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

        /* 插入重複節點 */
        testInsert(tree: avlTree, val: 7)

        /* 刪除節點 */
        // 請觀察刪除節點後 AVL 樹如何維持平衡
        testRemove(tree: avlTree, val: 8) // 刪除分支度為 0 的節點
        testRemove(tree: avlTree, val: 5) // 刪除分支度為 1 的節點
        testRemove(tree: avlTree, val: 4) // 刪除分支度為 2 的節點

        /* 查詢節點 */
        let node = avlTree.search(val: 7)
        print("\n找到的節點物件為 \(node!)，節點值 = \(node!.val)")
    }
}
