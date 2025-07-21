/**
 * File: binary_search_tree.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_tree

import cangjie.utils.TreeNode

/* 二叉搜索树 */
class BinarySearchTree {
    private var root: ?TreeNode

    /* 构造方法 */
    public init() {
        // 初始化空树
        root = None
    }

    /* 获取二叉树根节点 */
    public func getRoot(): ?TreeNode {
        return root
    }

    /* 查找节点 */
    public func search(num: Int64): ?TreeNode {
        var cur = root
        // 循环查找，越过叶节点后跳出
        while (let Some(cur_let) <- cur) {
            // 目标节点在 cur 的右子树中
            if (cur_let.val.getOrThrow() < num) {
                cur = cur?.right ?? None
            } else if (cur_let.val.getOrThrow() > num) { // 目标节点在 cur 的左子树中
                cur = cur?.left ?? None
            } else { // 找到目标节点，跳出循环
                break
            }
        }
        // 返回目标节点
        return cur
    }

    /* 插入节点 */
    public func insert(num: Int64): Unit {
        // 若树为空，则初始化根节点
        if (root.isNone()) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: ?TreeNode = None
        // 循环查找，越过叶节点后跳出
        while (let Some(cur_let) <- cur) {
            // 找到重复节点，直接返回
            if (cur_let.val == num) {
                return
            }
            pre = cur_let
            // 插入位置在 cur 的右子树中
            if (cur_let.val.getOrThrow() < num) {
                cur = cur_let.right
            } else { // 插入位置在 cur 的左子树中
                cur = cur_let.left
            }
        }
        // 插入节点
        let node = TreeNode(num)
        if (let Some(pre_let) <- pre) {
            if (pre_let.val.getOrThrow() < num) {
                pre_let.right = node
            } else {
                pre_let.left = node
            }
        }
    }
    /* 删除节点 */
    public func remove(num: Int64): Unit {
        // 若树为空，直接提前返回
        if (root.isNone()) {
            return
        }
        var cur: ?TreeNode = root
        var pre: ?TreeNode = None

        // 循环查找，越过叶节点后跳出
        while (let Some(_cur) <- cur) {
            var var_cur = _cur
            // 找到待删除节点，跳出循环
            if (var_cur.val.getOrThrow() == num) {
                break
            }
            pre = var_cur
            // 待删除节点在 cur 的右子树中
            if (var_cur.val.getOrThrow() < num) {
                cur = var_cur.right
            } else {
                // 待删除节点在 cur 的左子树中
                cur = var_cur.left
            }
        }

        // 若无待删除节点，则直接返回
        if (cur.isNone()) {
            return
        }

        // 子节点数量 = 0 or 1
        if ((cur?.left.isNone() ?? false) || (cur?.right.isNone() ?? false)) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            let child = if (cur?.left.isSome() ?? false) {
                cur?.left ?? None
            } else {
                cur?.right ?? None
            }
            // 删除节点 cur
            if (cur?.val == root?.val) {
                // 若删除节点为根节点，则重新指定根节点
                root = child
            } else {
                if (pre?.left?.val == cur?.val) {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            }
        } else { // 子节点数量 = 2
            // 获取中序遍历中 cur 的下一个节点
            var tmp = cur?.right ?? None
            while (let Some(temp) <- tmp?.left) {
                tmp = temp?.left ?? None
            }
            // 递归删除节点 tmp
            if (let Some(temp) <- tmp) {
                remove(temp.val.getOrThrow())
                // 用 tmp 覆盖 cur
                cur?.val = temp.val
            }
        }
    }
}
