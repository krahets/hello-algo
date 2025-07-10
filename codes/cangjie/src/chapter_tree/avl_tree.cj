/**
 * File: avl_tree.cj
 * Created Time: 2025-06-27
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_tree

import std.math.*
import cangjie.utils.TreeNode

/* AVL 树 */
class AVLTree {
    var root: ?TreeNode = None // 根节点

    /* 获取节点高度 */
    public func height(node: ?TreeNode): Int64 {
        // 空节点高度为 -1 ，叶节点高度为 0
        return if (let Some(node) <- node) {
            node.height
        } else {
            -1
        }
    }

    /* 更新节点高度 */
    public func updateHeight(node: ?TreeNode): Unit {
        // 节点高度等于最高子树高度 + 1
        if (let Some(node) <- node) {
            var lh = height(node.left)
            var rh = height(node.right)
            node.height = max(lh, rh) + 1
        }
    }

    /* 获取平衡因子 */
    public func balanceFactor(node: ?TreeNode): Int64 {
        return if (let Some(node) <- node) {
            // 节点平衡因子 = 左子树高度 - 右子树高度
            height(node.left) - height(node.right)
        } else {
            0
        }
    }

    /* 右旋操作 */
    public func rightRotate(node: ?TreeNode): ?TreeNode {
        if (node.isNone() || (node?.left.isNone() ?? false)) {
            return None
        }
        var child = node?.left ?? None
        var grandChild = child?.right ?? None
        // 执行右旋
        child?.right = node
        node?.left = grandChild
        // 更新高度：先更新下层节点，再更新上层节点
        updateHeight(node)
        updateHeight(child)
        return child
    }

    /* 左旋操作 */
    public func leftRotate(node: ?TreeNode): ?TreeNode {
        if (node.isNone() || (node?.right.isNone() ?? false)) {
            return None
        }
        var child = node?.right ?? None
        var grandChild = child?.left ?? None
        // 执行左旋
        child?.left = node
        node?.right = grandChild
        // 更新高度：先更新下层节点，再更新上层节点
        updateHeight(node)
        updateHeight(child)
        return child
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    public func rotate(node: ?TreeNode): ?TreeNode {
        if (node.isNone()) {
            return None
        }
        // 获取节点 node 的平衡因子
        var bFactor = balanceFactor(node)
        // 左偏树
        if (bFactor > 1) {
            if (balanceFactor(node?.left ?? None) >= 0) {
                // LL 型：右旋
                return rightRotate(node)
            } else {
                // LR 型：先左旋再右旋
                node?.left = leftRotate(node?.left ?? None)
                return rightRotate(node)
            }
        }
        // 右偏树
        if (bFactor < -1) {
            if (balanceFactor(node?.right ?? None) <= 0) {
                // RR 型：左旋
                return leftRotate(node)
            } else {
                // RL 型：先右旋再左旋
                node?.right = rightRotate(node?.right ?? None)
                return leftRotate(node)
            }
        }
        // 平衡，无需旋转
        return node
    }

    /* 插入节点 */
    public func insert(val: Int64) {
        root = insertHelper(root, val)
    }

    /* 递归插入节点（辅助方法） */
    public func insertHelper(node: ?TreeNode, val: Int64): ?TreeNode {
        /* 1. 查找插入位置并插入节点 */
        if (let Some(node) <- node) {
            if (val < node.val.getOrThrow()) {
                node.left = insertHelper(node.left, val)
            } else if (val > node.val.getOrThrow()) {
                node.right = insertHelper(node.right, val)
            } else {
                // 重复节点不插入，直接返回
                return node
            }
            // 2. 插入后更新高度
            updateHeight(node)
            // 3. 进行 AVL 旋转平衡
            return rotate(node)
        } else {
            return TreeNode(val)
        }
    }

    /* 删除节点 */
    public func remove(val: Int64) {
        root = removeHelper(root, val)
    }

    /* 递归删除节点（辅助方法） */
    public func removeHelper(node: ?TreeNode, val: Int64): ?TreeNode {
        // 1. 查找节点并删除
        if (let Some(node) <- node) {
            if (val < node.val.getOrThrow()) {
                node.left = removeHelper(node.left, val)
            } else if (val > node.val.getOrThrow()) {
                node.right = removeHelper(node.right, val)
            } else {
                // 节点值匹配，执行删除
                if (node.left.isNone() || node.right.isNone()) {
                    var child = if (node.left.isSome()) {
                        node.left
                    } else {
                        node.right
                    }
                    return child
                } else {
                    // 两个子节点：找到中序后继
                    if (let Some(right) <- node.right) {
                        var successor = right
                        while (let Some(successorLeft) <- successor.left) {
                            successor = successorLeft
                        }
                        // 用后继值替换当前节点值
                        node.val = successor.val
                        // 删除后继节点
                        node.right = removeHelper(node.right, successor.val.getOrThrow())
                    }
                }
            }

            // 2. 更新高度并旋转
            updateHeight(node)
            return rotate(node)
        } else {
            return None
        }
    }

    /* 查找节点 */
    public func search(val: Int64): ?TreeNode {
        var cur = root
        // 循环查找，越过叶节点后跳出
        while (let Some(_cur) <- cur) {
            // 目标节点在 cur 的右子树中
            if (_cur.val.getOrThrow() < val) {
                cur = _cur.right
            } else if (_cur.val.getOrThrow() > val) { // 目标节点在 cur 的左子树中
                cur = _cur.left
            } else { // 找到目标节点，跳出循环
                break
            }
        }
        // 返回目标节点
        return cur
    }
}
