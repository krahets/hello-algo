/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL 树 */
class AVLTree {
    fileprivate var root: TreeNode? // 根结点

    /* 获取结点高度 */
    func height(node: TreeNode?) -> Int {
        // 空结点高度为 -1 ，叶结点高度为 0
        node == nil ? -1 : node!.height
    }

    /* 更新结点高度 */
    private func updateHeight(node: TreeNode?) {
        // 结点高度等于最高子树高度 + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* 获取平衡因子 */
    func balanceFactor(node: TreeNode?) -> Int {
        // 空结点平衡因子为 0
        guard let node = node else { return 0 }
        // 结点平衡因子 = 左子树高度 - 右子树高度
        return height(node: node.left) - height(node: node.right)
    }

    /* 右旋操作 */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // 以 child 为原点，将 node 向右旋转
        child?.right = node
        node?.left = grandChild
        // 更新结点高度
        updateHeight(node: node)
        updateHeight(node: child)
        // 返回旋转后子树的根结点
        return child
    }

    /* 左旋操作 */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // 以 child 为原点，将 node 向左旋转
        child?.left = node
        node?.right = grandChild
        // 更新结点高度
        updateHeight(node: node)
        updateHeight(node: child)
        // 返回旋转后子树的根结点
        return child
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // 获取结点 node 的平衡因子
        let balanceFactor = balanceFactor(node: node)
        // 左偏树
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // 右旋
                return rightRotate(node: node)
            } else {
                // 先左旋后右旋
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // 右偏树
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // 左旋
                return leftRotate(node: node)
            } else {
                // 先右旋后左旋
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // 平衡树，无需旋转，直接返回
        return node
    }

    /* 插入结点 */
    @discardableResult
    func insert(val: Int) -> TreeNode? {
        root = insertHelper(node: root, val: val)
        return root
    }

    /* 递归插入结点（辅助方法） */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. 查找插入位置，并插入结点 */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // 重复结点不插入，直接返回
        }
        updateHeight(node: node) // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node: node)
        // 返回子树的根结点
        return node
    }

    /* 删除结点 */
    @discardableResult
    func remove(val: Int) -> TreeNode? {
        root = removeHelper(node: root, val: val)
        return root
    }

    /* 递归删除结点（辅助方法） */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. 查找结点，并删除之 */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left != nil ? node?.left : node?.right
                // 子结点数量 = 0 ，直接删除 node 并返回
                if child == nil {
                    return nil
                }
                // 子结点数量 = 1 ，直接删除 node
                else {
                    node = child
                }
            } else {
                // 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
                let temp = getInOrderNext(node: node?.right)
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node: node)
        // 返回子树的根结点
        return node
    }

    /* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
    private func getInOrderNext(node: TreeNode?) -> TreeNode? {
        var node = node
        if node == nil {
            return node
        }
        // 循环访问左子结点，直到叶结点时为最小结点，跳出
        while node?.left != nil {
            node = node?.left
        }
        return node
    }

    /* 查找结点 */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // 目标结点在 cur 的右子树中
            if cur!.val < val {
                cur = cur?.right
            }
            // 目标结点在 cur 的左子树中
            else if cur!.val > val {
                cur = cur?.left
            }
            // 找到目标结点，跳出循环
            else {
                break
            }
        }
        // 返回目标结点
        return cur
    }
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\n插入结点 \(val) 后，AVL 树为")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\n删除结点 \(val) 后，AVL 树为")
        PrintUtil.printTree(root: tree.root)
    }

    /* Driver Code */
    static func main() {
        /* 初始化空 AVL 树 */
        let avlTree = AVLTree()

        /* 插入结点 */
        // 请关注插入结点后，AVL 树是如何保持平衡的
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

        /* 插入重复结点 */
        testInsert(tree: avlTree, val: 7)

        /* 删除结点 */
        // 请关注删除结点后，AVL 树是如何保持平衡的
        testRemove(tree: avlTree, val: 8) // 删除度为 0 的结点
        testRemove(tree: avlTree, val: 5) // 删除度为 1 的结点
        testRemove(tree: avlTree, val: 4) // 删除度为 2 的结点

        /* 查询结点 */
        let node = avlTree.search(val: 7)
        print("\n查找到的结点对象为 \(node!)，结点值 = \(node!.val)")
    }
}
