"""
File: binary_search_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *


class BinarySearchTree:
    """ 二叉搜索树 """
    def __init__(self, nums: List[int]) -> None:
        """ 构造方法 """
        nums.sort()
        self.__root = self.build_tree(nums, 0, len(nums) - 1)

    def build_tree(self, nums: List[int], start_index: int, end_index: int) -> Optional[TreeNode]:
        """ 构建二叉搜索树 """
        if start_index > end_index:
            return None

        # 将数组中间结点作为根结点
        mid: int = (start_index + end_index) // 2
        root = TreeNode(nums[mid])
        # 递归建立左子树和右子树
        root.left = self.build_tree(nums=nums, start_index=start_index, end_index=mid - 1)
        root.right = self.build_tree(nums=nums, start_index=mid + 1, end_index=end_index)
        return root

    @property
    def root(self) -> Optional[TreeNode]:
        return self.__root

    def search(self, num: int) -> Optional[TreeNode]:
        """ 查找结点 """
        cur: Optional[TreeNode] = self.__root
        # 循环查找，越过叶结点后跳出
        while cur is not None:
            # 目标结点在 cur 的右子树中
            if cur.val < num:
                cur = cur.right
            # 目标结点在 cur 的左子树中
            elif cur.val > num:
                cur = cur.left
            # 找到目标结点，跳出循环
            else:
                break
        return cur

    def insert(self, num: int) -> Optional[TreeNode]:
        """ 插入结点 """
        # 若树为空，直接提前返回
        if self.__root is None:
            return None
        
        # 循环查找，越过叶结点后跳出
        cur, pre = self.__root, None
        while cur is not None:
            # 找到重复结点，直接返回
            if cur.val == num:
                return None
            pre = cur
            # 插入位置在 cur 的右子树中
            if cur.val < num:
                cur = cur.right
            # 插入位置在 cur 的左子树中
            else:
                cur = cur.left

        # 插入结点 val
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
        return node

    def remove(self, num: int) -> Optional[TreeNode]:
        """ 删除结点 """
        # 若树为空，直接提前返回
        if self.__root is None:
            return None

        # 循环查找，越过叶结点后跳出
        cur, pre = self.__root, None
        while cur is not None:
            # 找到待删除结点，跳出循环
            if cur.val == num:
                break
            pre = cur
            if cur.val < num:  # 待删除结点在 cur 的右子树中
                cur = cur.right
            else:  # 待删除结点在 cur 的左子树中
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
            nex: TreeNode = self.get_inorder_next(cur.right)
            tmp: int = nex.val
            # 递归删除结点 nex
            self.remove(nex.val)
            # 将 nex 的值复制给 cur
            cur.val = tmp
        return cur

    def get_inorder_next(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        """ 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） """
        if root is None:
            return root
        # 循环访问左子结点，直到叶结点时为最小结点，跳出
        while root.left is not None:
            root = root.left
        return root


""" Driver Code """
if __name__ == "__main__":
    # 初始化二叉搜索树
    nums = list(range(1, 16)) # [1, 2, ..., 15]
    bst = BinarySearchTree(nums=nums)
    print("\n初始化的二叉树为\n")
    print_tree(bst.root)

    # 查找结点
    node = bst.search(7)
    print("\n查找到的结点对象为: {}，结点值 = {}".format(node, node.val))

    # 插入结点
    node = bst.insert(16)
    print("\n插入结点 16 后，二叉树为\n")
    print_tree(bst.root)

    # 删除结点
    bst.remove(1)
    print("\n删除结点 1 后，二叉树为\n")
    print_tree(bst.root)

    bst.remove(2)
    print("\n删除结点 2 后，二叉树为\n")
    print_tree(bst.root)

    bst.remove(4)
    print("\n删除结点 4 后，二叉树为\n")
    print_tree(bst.root)
