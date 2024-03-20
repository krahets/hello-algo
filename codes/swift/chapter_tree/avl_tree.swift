/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL 树 */
class AVLTree {
    fileprivate var root: TreeNode? // 根节点

    init() {}

    /* 获取节点高度 */
    func height(node: TreeNode?) -> Int {
        // 空节点高度为 -1 ，叶节点高度为 0
        node?.height ?? -1
    }

    /* 更新节点高度 */
    private func updateHeight(node: TreeNode?) {
        // 节点高度等于最高子树高度 + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* 获取平衡因子 */
    func balanceFactor(node: TreeNode?) -> Int {
        // 空节点平衡因子为 0
        guard let node = node else { return 0 }
        // 节点平衡因子 = 左子树高度 - 右子树高度
        return height(node: node.left) - height(node: node.right)
    }

    /* 右旋操作 */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // 以 child 为原点，将 node 向右旋转
        child?.right = node
        node?.left = grandChild
        // 更新节点高度
        updateHeight(node: node)
        updateHeight(node: child)
        // 返回旋转后子树的根节点
        return child
    }

    /* 左旋操作 */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // 以 child 为原点，将 node 向左旋转
        child?.left = node
        node?.right = grandChild
        // 更新节点高度
        updateHeight(node: node)
        updateHeight(node: child)
        // 返回旋转后子树的根节点
        return child
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // 获取节点 node 的平衡因子
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
        // 平衡树，无须旋转，直接返回
        return node
    }

    /* 插入节点 */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* 递归插入节点（辅助方法） */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. 查找插入位置并插入节点 */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // 重复节点不插入，直接返回
        }
        updateHeight(node: node) // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node: node)
        // 返回子树的根节点
        return node
    }

    /* 删除节点 */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* 递归删除节点（辅助方法） */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. 查找节点并删除 */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // 子节点数量 = 0 ，直接删除 node 并返回
                if child == nil {
                    return nil
                }
                // 子节点数量 = 1 ，直接删除 node
                else {
                    node = child
                }
            } else {
                // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node: node)
        // 返回子树的根节点
        return node
    }

    /* 查找节点 */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // 目标节点在 cur 的右子树中
            if cur!.val < val {
                cur = cur?.right
            }
            // 目标节点在 cur 的左子树中
            else if cur!.val > val {
                cur = cur?.left
            }
            // 找到目标节点，跳出循环
            else {
                break
            }
        }
        // 返回目标节点
        return cur
    }
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\n插入节点 \(val) 后，AVL 树为")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\n删除节点 \(val) 后，AVL 树为")
        PrintUtil.printTree(root: tree.root)
    }

    /* Driver Code */
    static func main() {
        /* 初始化空 AVL 树 */
        let avlTree = AVLTree()

        /* 插入节点 */
        // 请关注插入节点后，AVL 树是如何保持平衡的
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

        /* 插入重复节点 */
        testInsert(tree: avlTree, val: 7)

        /* 删除节点 */
        // 请关注删除节点后，AVL 树是如何保持平衡的
        testRemove(tree: avlTree, val: 8) // 删除度为 0 的节点
        testRemove(tree: avlTree, val: 5) // 删除度为 1 的节点
        testRemove(tree: avlTree, val: 4) // 删除度为 2 的节点

        /* 查询节点 */
        let node = avlTree.search(val: 7)
        print("\n查找到的节点对象为 \(node!)，节点值 = \(node!.val)")
    }
}
