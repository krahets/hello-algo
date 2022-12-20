"""
File: binary_search_tree.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


class BinarySearchTree:
    """
    二叉搜索树
    """

    def __init__(self, nums) -> None:
        nums.sort()
        self.__root = self.buildTree(nums, 0, len(nums) - 1)

    def buildTree(self, nums, start_index, end_index):
        if start_index > end_index:
            return None
        mid = (start_index + end_index) // 2
        root = TreeNode(nums[mid])
        root.left = self.buildTree(
            nums=nums, start_index=start_index, end_index=mid - 1
        )
        root.right = self.buildTree(nums=nums, start_index=mid + 1, end_index=end_index)
        return root

    def get_root(self):
        return self.__root

    def search(self, num):
        """
        查找结点
        """
        cur = self.get_root()
        # 循环查找，越过叶结点后跳出
        while cur is not None:
            # 目标结点在 root 的右子树中
            if cur.val < num:
                cur = cur.right
            # 目标结点在 root 的左子树中
            elif cur.val > num:
                cur = cur.left
            # 找到目标结点，跳出循环
            else:
                break
        return cur

    def insert(self, num):
        """
        插入结点
        """
        root = self.get_root()
        # 若树为空，直接提前返回
        if root is None:
            return None

        cur = root
        pre = None

        # 循环查找，越过叶结点后跳出
        while cur is not None:
            # 找到重复结点，直接返回
            if cur.val == num:
                return None
            pre = cur

            if cur.val < num:  # 插入位置在 root 的右子树中
                cur = cur.right
            else:  # 插入位置在 root 的左子树中
                cur = cur.left

        # 插入结点 val
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
        return node

    def remove(self, num):
        """
        删除结点
        """
        root = self.get_root()
        # 若树为空，直接提前返回
        if root is None:
            return None

        cur = root
        pre = None

        # 循环查找，越过叶结点后跳出
        while cur is not None:
            # 找到待删除结点，跳出循环
            if cur.val == num:
                break
            pre = cur
            if cur.val < num:  # 待删除结点在 root 的右子树中
                cur = cur.right
            else:  # 待删除结点在 root 的左子树中
                cur = cur.left

        # 若无待删除结点，则直接返回
        if cur is None:
            return None

        # 子结点数量 = 0 or 1
        if cur.left is None or cur.right is None:
            # 当子结点数量 = 0 / 1 时， child = null / 该子结点
            child = cur.left or cur.right
            # 删除结点 cur
            if pre.left == cur:
                pre.left = child
            else:
                pre.right = child
        # 子结点数量 = 2
        else:
            # 获取中序遍历中 cur 的下一个结点
            nex = self.min(cur.right)
            tmp = nex.val
            # 递归删除结点 nex
            self.remove(nex.val)
            # 将 nex 的值复制给 cur
            cur.val = tmp
        return cur

    def min(self, root):
        """
        获取最小结点
        """
        if root is None:
            return root

        # 循环访问左子结点，直到叶结点时为最小结点，跳出
        while root.left is not None:
            root = root.left
        return root


if __name__ == "__main__":
    # 初始化二叉搜索树
    nums = list(range(1, 16))
    bst = BinarySearchTree(nums=nums)
    print("\n初始化的二叉树为\n")
    print_tree(bst.get_root())

    # 查找结点
    node = bst.search(5)
    print("\n查找到的结点对象为: {}，结点值 = {}".format(node, node.val))

    # 插入结点
    ndoe = bst.insert(16)
    print("\n插入结点 16 后，二叉树为\n")
    print_tree(bst.get_root())

    # 删除结点
    bst.remove(1)
    print("\n删除结点 1 后，二叉树为\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\n删除结点 2 后，二叉树为\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\n删除结点 4 后，二叉树为\n")
    print_tree(bst.get_root())
