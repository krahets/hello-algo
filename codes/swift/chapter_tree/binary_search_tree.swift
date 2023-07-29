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

    /* 获取二叉树根节点 */
    func getRoot() -> TreeNode? {
        root
    }

    /* 构建二叉搜索树 */
    func buildTree(nums: [Int], i: Int, j: Int) -> TreeNode? {
        if i > j {
            return nil
        }
        // 将数组中间节点作为根节点
        let mid = (i + j) / 2
        let root = TreeNode(x: nums[mid])
        // 递归建立左子树和右子树
        root.left = buildTree(nums: nums, i: i, j: mid - 1)
        root.right = buildTree(nums: nums, i: mid + 1, j: j)
        return root
    }

    /* 查找节点 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 目标节点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 目标节点在 cur 的左子树中
            else if cur!.val > num {
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

    /* 插入节点 */
    func insert(num: Int) {
        // 若树为空，直接提前返回
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 找到重复节点，直接返回
            if cur!.val == num {
                return
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
        // 插入节点
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* 删除节点 */
    func remove(num: Int) {
        // 若树为空，直接提前返回
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 找到待删除节点，跳出循环
            if cur!.val == num {
                break
            }
            pre = cur
            // 待删除节点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 待删除节点在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        // 若无待删除节点，则直接返回
        if cur == nil {
            return
        }
        // 子节点数量 = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            let child = cur?.left != nil ? cur?.left : cur?.right
            // 删除节点 cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // 递归删除节点 tmp
            remove(num: tmp!.val)
            // 用 tmp 覆盖 cur
            cur?.val = tmp!.val
        }
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

        /* 查找节点 */
        let node = bst.search(num: 7)
        print("\n查找到的节点对象为 \(node!)，节点值 = \(node!.val)")

        /* 插入节点 */
        bst.insert(num: 16)
        print("\n插入节点 16 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* 删除节点 */
        bst.remove(num: 1)
        print("\n删除节点 1 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\n删除节点 2 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\n删除节点 4 后，二叉树为\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
