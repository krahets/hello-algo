import sys, os.path as osp
import typing

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


class AVLTreeNode:
    def __init__(
        self,
        val=None,
        height: int = 0,
        left: typing.Optional["AVLTreeNode"] = None,
        right: typing.Optional["AVLTreeNode"] = None,
    ):
        self.val = val
        self.height = height
        self.left = left
        self.right = right

    def __str__(self):
        val = self.val
        left_val = self.left.val if self.left else None
        right_val = self.right.val if self.right else None
        return "<AVLTreeNode: {}, leftAVLTreeNode: {}, rightAVLTreeNode: {}>".format(
            val, left_val, right_val
        )


class AVLTree:
    def __init__(self, root: typing.Optional[AVLTreeNode] = None):
        self.root = root

    @staticmethod
    def height(node: typing.Optional[AVLTreeNode]) -> int:
        """
        获取结点高度
        Args:
            node:起始结点

        Returns: 高度 or -1

        """
        # 空结点高度为 -1 ，叶结点高度为 0
        if node is not None:
            return node.height
        return -1

    def __update_height(self, node: AVLTreeNode):
        """
        更新结点高度
        Args:
            node: 要更新高度的结点

        Returns: None

        """
        # 结点高度等于最高子树高度 + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: AVLTreeNode) -> int:
        """
        获取结点平衡因子
        Args:
            node: 要获取平衡因子的结点

        Returns: 平衡因子

        """
        # 空结点平衡因子为 0
        if node is None:
            return 0
        # 结点平衡因子 = 左子树高度 - 右子树高度
        return self.height(node.left) - self.height(node.right)

    def __right_rotate(self, node: AVLTreeNode) -> AVLTreeNode:
        child = node.left
        grand_child = child.right
        # 以 child 为原点，将 node 向右旋转
        child.right = node
        node.left = grand_child
        # 更新结点高度
        self.__update_height(node)
        self.__update_height(child)
        # 返回旋转后子树的根节点
        return child

    def __left_rotate(self, node: AVLTreeNode) -> AVLTreeNode:
        child = node.right
        grand_child = child.left
        # 以 child 为原点，将 node 向左旋转
        child.left = node
        node.right = grand_child
        # 更新结点高度
        self.__update_height(node)
        self.__update_height(child)
        # 返回旋转后子树的根节点
        return child

    def rotate(self, node: AVLTreeNode):
        """
        执行旋转操作，使该子树重新恢复平衡
        Args:
            node: 要旋转的根结点

        Returns: 旋转后的根结点

        """
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

    def insert(self, val) -> AVLTreeNode:
        """
        插入结点
        Args:
            val: 结点的值

        Returns:
            node: 插入结点后的根结点
        """
        self.root = self.insert_helper(self.root, val)
        return self.root

    def insert_helper(
        self, node: typing.Optional[AVLTreeNode], val: int
    ) -> AVLTreeNode:
        """
        递归插入结点（辅助函数）
        Args:
            node: 要插入的根结点
            val: 要插入的结点的值

        Returns: 插入结点后的根结点

        """
        if node is None:
            return AVLTreeNode(val)
        # 1. 查找插入位置，并插入结点
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 重复结点不插入，直接返回
            return node
        # 更新结点高度
        self.__update_height(node)
        # 2. 执行旋转操作，使该子树重新恢复平衡
        return self.rotate(node)

    def remove(self, val: int):
        """
        删除结点
        Args:
            val: 要删除的结点的值

        Returns:

        """
        root = self.remove_helper(self.root, val)
        return root

    def remove_helper(
        self, node: typing.Optional[AVLTreeNode], val: int
    ) -> typing.Optional[AVLTreeNode]:
        """
        递归删除结点（辅助函数）
        Args:
            node:  删除的起始结点
            val: 要删除的结点的值

        Returns: 删除目标结点后的起始结点

        """
        if node is None:
            return None
        # 1. 查找结点，并删除之
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
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
                temp = self.min_node(node.right)
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # 更新结点高度
        self.__update_height(node)
        # 2. 执行旋转操作，使该子树重新恢复平衡
        return self.rotate(node)

    def min_node(
        self, node: typing.Optional[AVLTreeNode]
    ) -> typing.Optional[AVLTreeNode]:
        # 获取最小结点
        if node is None:
            return None
        # 循环访问左子结点，直到叶结点时为最小结点，跳出
        while node.left is not None:
            node = node.left
        return node

    def search(self, val: int):
        cur = self.root
        while cur is not None:
            if cur.val < val:
                cur = cur.right
            elif cur.val > val:
                cur = cur.left
            else:
                break
        return cur


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
