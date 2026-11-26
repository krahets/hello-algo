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
        """建構方法"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """取得二元樹的根節點"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """取得節點高度"""
        # 空節點的高度為 -1，葉節點的高度為 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """更新節點高度"""
        # 節點高度等於最高子樹的高度加 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """取得平衡因子"""
        # 空節點的平衡因子為 0
        if node is None:
            return 0
        # 節點的平衡因子 = 左子樹高度 - 右子樹高度
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右旋操作"""
        child = node.left
        grand_child = child.right
        # 以 child 為支點，將 node 向右旋轉
        child.right = node
        node.left = grand_child
        # 更新節點高度
        self.update_height(node)
        self.update_height(child)
        # 回傳旋轉後的子樹根節點
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左旋操作"""
        child = node.right
        grand_child = child.left
        # 以 child 為支點，將 node 向左旋轉
        child.left = node
        node.right = grand_child
        # 更新節點高度
        self.update_height(node)
        self.update_height(child)
        # 回傳旋轉後的子樹根節點
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """透過旋轉讓這棵子樹恢復平衡"""
        # 取得節點 node 的平衡因子
        balance_factor = self.balance_factor(node)
        # 左偏樹
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右旋
                return self.right_rotate(node)
            else:
                # 先左旋再右旋
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 右偏樹
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左旋
                return self.left_rotate(node)
            else:
                # 先右旋再左旋
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # 樹已平衡，無須旋轉，直接返回
        return node

    def insert(self, val):
        """插入節點"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """以遞迴插入節點（輔助方法）"""
        if node is None:
            return TreeNode(val)
        # 1. 找出插入位置並插入節點
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 若節點重複，直接返回，略過插入操作
            return node
        # 更新節點高度
        self.update_height(node)
        # 2. 透過旋轉讓這棵子樹恢復平衡
        return self.rotate(node)

    def remove(self, val: int):
        """刪除節點"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """以遞迴刪除節點（輔助方法）"""
        if node is None:
            return None
        # 1. 找出並刪除節點
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 若有 0 個子節點，直接刪除 node 並返回
                if child is None:
                    return None
                # 若只有 1 個子節點，直接刪除 node
                else:
                    node = child
            else:
                # 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # 更新節點高度
        self.update_height(node)
        # 2. 透過旋轉讓這棵子樹恢復平衡
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """搜尋節點"""
        cur = self._root
        # 用迴圈搜尋，越過葉節點後跳出迴圈
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
        # 回傳目標節點
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\n插入節點 {} 後的 AVL 樹為".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\n刪除節點 {} 後的 AVL 樹為".format(val))
        print_tree(tree.get_root())

    # 初始化一棵空的 AVL 樹
    avl_tree = AVLTree()

    # 插入節點
    # 請觀察插入節點後 AVL 樹如何維持平衡
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # 插入重複節點
    test_insert(avl_tree, 7)

    # 刪除節點
    # 請觀察刪除節點後 AVL 樹如何維持平衡
    test_remove(avl_tree, 8)  # 刪除分支度為 0 的節點
    test_remove(avl_tree, 5)  # 刪除分支度為 1 的節點
    test_remove(avl_tree, 4)  # 刪除分支度為 2 的節點

    result_node = avl_tree.search(7)
    print("\n找到的節點物件為 {}，節點值 = {}".format(result_node, result_node.val))
