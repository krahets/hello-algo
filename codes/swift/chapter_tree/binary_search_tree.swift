/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 二叉搜索树 */
class BinarySearchTree {
    private var root: TreeNode?

    init(nums: [Int]) {
        let nums = nums.sorted() // 排序数组
        root = buildTree(nums: nums, i: 0, j: nums.count - 1) // 构建二叉搜索树
    }

    /* 获取二叉树根结点 */
    func getRoot() -> TreeNode? {
        root
    }

    /* 构建二叉搜索树 */
    func buildTree(nums: [Int], i: Int, j: Int) -> TreeNode? {
        if i > j {
            return nil
        }
        // 将数组中间结点作为根结点
        let mid = (i + j) / 2
        let root = TreeNode(x: nums[mid])
        // 递归建立左子树和右子树
        root.left = buildTree(nums: nums, i: i, j: mid - 1)
        root.right = buildTree(nums: nums, i: mid + 1, j: j)
        return root
    }

    /* 查找结点 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 循环查找，越过叶结点后跳出
        while cur != nil {
            // 目标结点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 目标结点在 cur 的左子树中
            else if cur!.val > num {
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

    /* 插入结点 */
    func insert(num: Int) -> TreeNode? {
        // 若树为空，直接提前返回
        if root == nil {
            return nil
        }
        var cur = root
        var pre: TreeNode?
        // 循环查找，越过叶结点后跳出
        while cur != nil {
            // 找到重复结点，直接返回
            if cur!.val == num {
                return nil
            }
            pre = cur
            // 插入位置在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 插入位置在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        // 插入结点 val
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
        return node
    }

    /* 删除结点 */
    @discardableResult
    func remove(num: Int) -> TreeNode? {
        // 若树为空，直接提前返回
        if root == nil {
            return nil
        }
        var cur = root
        var pre: TreeNode?
        // 循环查找，越过叶结点后跳出
        while cur != nil {
            // 找到待删除结点，跳出循环
            if cur!.val == num {
                break
            }
            pre = cur
            // 待删除结点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 待删除结点在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        // 若无待删除结点，则直接返回
        if cur == nil {
            return nil
        }
        // 子结点数量 = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // 当子结点数量 = 0 / 1 时， child = null / 该子结点
            let child = cur?.left != nil ? cur?.left : cur?.right
            // 删除结点 cur
            if pre?.left === cur {
                pre?.left = child
            } else {
                pre?.right = child
            }
        }
        // 子结点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个结点
            let nex = getInOrderNext(root: cur?.right)
            let tmp = nex!.val
            // 递归删除结点 nex
            remove(num: nex!.val)
            // 将 nex 的值复制给 cur
            cur?.val = tmp
        }
        return cur
    }

    /* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
    func getInOrderNext(root: TreeNode?) -> TreeNode? {
        var root = root
        if root == nil {
            return root
        }
        // 循环访问左子结点，直到叶结点时为最小结点，跳出
        while root?.left != nil {
            root = root?.left
        }
        return root
    }
}

@main
enum _BinarySearchTree {
    /* Driver Code */
    static func main() {
        /* 初始化二叉搜索树 */
        let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        let bst = BinarySearchTree(nums: nums)
        print("\n初始化的二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* 查找结点 */
        var node = bst.search(num: 7)
        print("\n查找到的结点对象为 \(node!)，结点值 = \(node!.val)")

        /* 插入结点 */
        node = bst.insert(num: 16)
        print("\n插入结点 16 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* 删除结点 */
        bst.remove(num: 1)
        print("\n删除结点 1 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\n删除结点 2 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\n删除结点 4 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
