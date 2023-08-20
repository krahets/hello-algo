"""
File: avl_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *


class AVLTree:
    """AVL 树"""

    def __init__(self, root: TreeNode | None = None):
        """构造方法"""
        self.root = root

    def height(self, node: TreeNode | None) -> int:
        """获取节点高度"""
        # 空节点高度为 -1 ，叶节点高度为 0
        if node is not None:
            return node.height
        return -1

    def __update_height(self, node: TreeNode | None):
        """更新节点高度"""
        # 节点高度等于最高子树高度 + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """获取平衡因子"""
        # 空节点平衡因子为 0
        if node is None:
            return 0
        # 节点平衡因子 = 左子树高度 - 右子树高度
        return self.height(node.left) - self.height(node.right)

    def __right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右旋操作"""
        child = node.left
        grand_child = child.right
        # 以 child 为原点，将 node 向右旋转
        child.right = node
        node.left = grand_child
        # 更新节点高度
        self.__update_height(node)
        self.__update_height(child)
        # 返回旋转后子树的根节点
        return child

    def __left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左旋操作"""
        child = node.right
        grand_child = child.left
        # 以 child 为原点，将 node 向左旋转
        child.left = node
        node.right = grand_child
        # 更新节点高度
        self.__update_height(node)
        self.__update_height(child)
        # 返回旋转后子树的根节点
        return child

    def __rotate(self, node: TreeNode | None) -> TreeNode | None:
        """执行旋转操作，使该子树重新恢复平衡"""
        # 获取节点 node 的平衡因子
        balance_factor = self.balance_factor(node)
        # 左偏树
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右旋
                return self.__right_rotate(node)
            else:
                # 先左旋后右旋
                node.left = self.__left_rotate(node.left)
                return self.__right_rotate(node)
        # 右偏树
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左旋
                return self.__left_rotate(node)
            else:
                # 先右旋后左旋
                node.right = self.__right_rotate(node.right)
                return self.__left_rotate(node)
        # 平衡树，无须旋转，直接返回
        return node

    def insert(self, val):
        """插入节点"""
        self.root = self.__insert_helper(self.root, val)

    def __insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """递归插入节点（辅助方法）"""
        if node is None:
            return TreeNode(val)
        # 1. 查找插入位置，并插入节点
        if val < node.val:
            node.left = self.__insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.__insert_helper(node.right, val)
        else:
            # 重复节点不插入，直接返回
            return node
        # 更新节点高度
        self.__update_height(node)
        # 2. 执行旋转操作，使该子树重新恢复平衡
        return self.__rotate(node)

    def remove(self, val: int):
        """删除节点"""
        self.root = self.__remove_helper(self.root, val)

    def __remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """递归删除节点（辅助方法）"""
        if node is None:
            return None
        # 1. 查找节点，并删除之
        if val < node.val:
            node.left = self.__remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.__remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子节点数量 = 0 ，直接删除 node 并返回
                if child is None:
                    return None
                # 子节点数量 = 1 ，直接删除 node
                else:
                    node = child
            else:
                # 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.__remove_helper(node.right, temp.val)
                node.val = temp.val
        # 更新节点高度
        self.__update_height(node)
        # 2. 执行旋转操作，使该子树重新恢复平衡
        return self.__rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """查找节点"""
        cur = self.root
        # 循环查找，越过叶节点后跳出
        while cur is not None:
            # 目标节点在 cur 的右子树中
            if cur.val < val:
                cur = cur.right
            # 目标节点在 cur 的左子树中
            elif cur.val > val:
                cur = cur.left
            # 找到目标节点，跳出循环
            else:
                break
        # 返回目标节点
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\n插入节点 {} 后，AVL 树为".format(val))
        print_tree(tree.root)

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\n删除节点 {} 后，AVL 树为".format(val))
        print_tree(tree.root)

    # 初始化空 AVL 树
    avl_tree = AVLTree()

    # 插入节点
    # 请关注插入节点后，AVL 树是如何保持平衡的
    test_insert(avl_tree, 1)
    test_insert(avl_tree, 2)
    test_insert(avl_tree, 3)
    test_insert(avl_tree, 4)
    test_insert(avl_tree, 5)
    test_insert(avl_tree, 8)
    test_insert(avl_tree, 7)
    test_insert(avl_tree, 9)
    test_insert(avl_tree, 10)
    test_insert(avl_tree, 6)

    # 插入重复节点
    test_insert(avl_tree, 7)

    # 删除节点
    # 请关注删除节点后，AVL 树是如何保持平衡的
    test_remove(avl_tree, 8)  # 删除度为 0 的节点
    test_remove(avl_tree, 5)  # 删除度为 1 的节点
    test_remove(avl_tree, 4)  # 删除度为 2 的节点

    result_node = avl_tree.search(7)
    print("\n查找到的节点对象为 {}，节点值 = {}".format(result_node, result_node.val))
