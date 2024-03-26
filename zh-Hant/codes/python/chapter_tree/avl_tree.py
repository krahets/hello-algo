"""
File: avl_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class AVLTree:
    """AVL 樹"""

    def __init__(self):
        """建構子"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """獲取二元樹根節點"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """獲取節點高度"""
        # 空節點高度為 -1 ，葉節點高度為 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """更新節點高度"""
        # 節點高度等於最高子樹高度 + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """獲取平衡因子"""
        # 空節點平衡因子為 0
        if node is None:
            return 0
        # 節點平衡因子 = 左子樹高度 - 右子樹高度
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右旋操作"""
        child = node.left
        grand_child = child.right
        # 以 child 為原點，將 node 向右旋轉
        child.right = node
        node.left = grand_child
        # 更新節點高度
        self.update_height(node)
        self.update_height(child)
        # 返回旋轉後子樹的根節點
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左旋操作"""
        child = node.right
        grand_child = child.left
        # 以 child 為原點，將 node 向左旋轉
        child.left = node
        node.right = grand_child
        # 更新節點高度
        self.update_height(node)
        self.update_height(child)
        # 返回旋轉後子樹的根節點
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """執行旋轉操作，使該子樹重新恢復平衡"""
        # 獲取節點 node 的平衡因子
        balance_factor = self.balance_factor(node)
        # 左偏樹
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右旋
                return self.right_rotate(node)
            else:
                # 先左旋後右旋
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 右偏樹
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左旋
                return self.left_rotate(node)
            else:
                # 先右旋後左旋
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # 平衡樹，無須旋轉，直接返回
        return node

    def insert(self, val):
        """插入節點"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """遞迴插入節點（輔助方法）"""
        if node is None:
            return TreeNode(val)
        # 1. 查詢插入位置並插入節點
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 重複節點不插入，直接返回
            return node
        # 更新節點高度
        self.update_height(node)
        # 2. 執行旋轉操作，使該子樹重新恢復平衡
        return self.rotate(node)

    def remove(self, val: int):
        """刪除節點"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """遞迴刪除節點（輔助方法）"""
        if node is None:
            return None
        # 1. 查詢節點並刪除
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子節點數量 = 0 ，直接刪除 node 並返回
                if child is None:
                    return None
                # 子節點數量 = 1 ，直接刪除 node
                else:
                    node = child
            else:
                # 子節點數量 = 2 ，則將中序走訪的下個節點刪除，並用該節點替換當前節點
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # 更新節點高度
        self.update_height(node)
        # 2. 執行旋轉操作，使該子樹重新恢復平衡
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """查詢節點"""
        cur = self._root
        # 迴圈查詢，越過葉節點後跳出
        while cur is not None:
            # 目標節點在 cur 的右子樹中
            if cur.val < val:
                cur = cur.right
            # 目標節點在 cur 的左子樹中
            elif cur.val > val:
                cur = cur.left
            # 找到目標節點，跳出迴圈
            else:
                break
        # 返回目標節點
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\n插入節點 {} 後，AVL 樹為".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\n刪除節點 {} 後，AVL 樹為".format(val))
        print_tree(tree.get_root())

    # 初始化空 AVL 樹
    avl_tree = AVLTree()

    # 插入節點
    # 請關注插入節點後，AVL 樹是如何保持平衡的
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # 插入重複節點
    test_insert(avl_tree, 7)

    # 刪除節點
    # 請關注刪除節點後，AVL 樹是如何保持平衡的
    test_remove(avl_tree, 8)  # 刪除度為 0 的節點
    test_remove(avl_tree, 5)  # 刪除度為 1 的節點
    test_remove(avl_tree, 4)  # 刪除度為 2 的節點

    result_node = avl_tree.search(7)
    print("\n查詢到的節點物件為 {}，節點值 = {}".format(result_node, result_node.val))
