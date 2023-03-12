"""
File: avl_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

class AVLTree:
    """ AVL 树 """
    def __init__(self, root: Optional[TreeNode] = None):
        """ 构造方法 """
        self.__root = root

    @property
    def root(self) -> Optional[TreeNode]:
        return self.__root

    def height(self, node: Optional[TreeNode]) -> int:
        """ 获取结点高度 """
        # 空结点高度为 -1 ，叶结点高度为 0
        if node is not None:
            return node.height
        return -1

    def __update_height(self, node: Optional[TreeNode]):
        """ 更新结点高度 """
        # 结点高度等于最高子树高度 + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: Optional[TreeNode]) -> int:
        """ 获取平衡因子 """
        # 空结点平衡因子为 0
        if node is None:
            return 0
        # 结点平衡因子 = 左子树高度 - 右子树高度
        return self.height(node.left) - self.height(node.right)

    def __right_rotate(self, node: Optional[TreeNode]) -> Optional[TreeNode]:
        """ 右旋操作 """
        child = node.left
        grand_child = child.right
        # 以 child 为原点，将 node 向右旋转
        child.right = node
        node.left = grand_child
        # 更新结点高度
        self.__update_height(node)
        self.__update_height(child)
        # 返回旋转后子树的根结点
        return child

    def __left_rotate(self, node: Optional[TreeNode]) -> Optional[TreeNode]:
        """ 左旋操作 """
        child = node.right
        grand_child = child.left
        # 以 child 为原点，将 node 向左旋转
        child.left = node
        node.right = grand_child
        # 更新结点高度
        self.__update_height(node)
        self.__update_height(child)
        # 返回旋转后子树的根结点
        return child

    def __rotate(self, node: Optional[TreeNode]) -> Optional[TreeNode]:
        """ 执行旋转操作，使该子树重新恢复平衡 """
        # 获取结点 node 的平衡因子
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
        # 平衡树，无需旋转，直接返回
        return node

    def insert(self, val) -> TreeNode:
        """ 插入结点 """
        self.__root = self.__insert_helper(self.__root, val)
        return self.__root

    def __insert_helper(self, node: Optional[TreeNode], val: int) -> TreeNode:
        """ 递归插入结点（辅助方法）"""
        if node is None:
            return TreeNode(val)
        # 1. 查找插入位置，并插入结点
        if val < node.val:
            node.left = self.__insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.__insert_helper(node.right, val)
        else:
            # 重复结点不插入，直接返回
            return node
        # 更新结点高度
        self.__update_height(node)
        # 2. 执行旋转操作，使该子树重新恢复平衡
        return self.__rotate(node)

    def remove(self, val: int) -> Optional[TreeNode]:
        """ 删除结点 """
        self.__root = self.__remove_helper(self.__root, val)
        return self.__root 

    def __remove_helper(self, node: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        """ 递归删除结点（辅助方法） """
        if node is None:
            return None
        # 1. 查找结点，并删除之
        if val < node.val:
            node.left = self.__remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.__remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子结点数量 = 0 ，直接删除 node 并返回
                if child is None:
                    return None
                # 子结点数量 = 1 ，直接删除 node
                else:
                    node = child
            else:  # 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
                temp = self.__get_inorder_next(node.right)
                node.right = self.__remove_helper(node.right, temp.val)
                node.val = temp.val
        # 更新结点高度
        self.__update_height(node)
        # 2. 执行旋转操作，使该子树重新恢复平衡
        return self.__rotate(node)

    def __get_inorder_next(self, node: Optional[TreeNode]) -> Optional[TreeNode]:
        """ 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） """
        if node is None:
            return None
        # 循环访问左子结点，直到叶结点时为最小结点，跳出
        while node.left is not None:
            node = node.left
        return node

    def search(self, val: int) -> Optional[TreeNode]:
        """ 查找结点 """
        cur = self.__root
        # 循环查找，越过叶结点后跳出
        while cur is not None:
            # 目标结点在 cur 的右子树中
            if cur.val < val:
                cur = cur.right
            # 目标结点在 cur 的左子树中
            elif cur.val > val:
                cur = cur.left
            # 找到目标结点，跳出循环
            else:
                break
        # 返回目标结点
        return cur


""" Driver Code """
if __name__ == "__main__":
    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\n插入结点 {} 后，AVL 树为".format(val))
        print_tree(tree.root)

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\n删除结点 {} 后，AVL 树为".format(val))
        print_tree(tree.root)

    # 初始化空 AVL 树
    avl_tree = AVLTree()

    # 插入结点
    # 请关注插入结点后，AVL 树是如何保持平衡的
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

    # 插入重复结点
    test_insert(avl_tree, 7)

    # 删除结点
    # 请关注删除结点后，AVL 树是如何保持平衡的
    test_remove(avl_tree, 8)  # 删除度为 0 的结点
    test_remove(avl_tree, 5)  # 删除度为 1 的结点
    test_remove(avl_tree, 4)  # 删除度为 2 的结点

    result_node = avl_tree.search(7)
    print("\n查找到的结点对象为 {}，结点值 = {}".format(result_node, result_node.val))
