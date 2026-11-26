"""
File: binary_search_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class BinarySearchTree:
    """二元搜尋樹"""

    def __init__(self):
        """建構方法"""
        # 初始化空樹
        self._root = None

    def get_root(self) -> TreeNode | None:
        """取得二元樹的根節點"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """搜尋節點"""
        cur = self._root
        # 用迴圈搜尋，越過葉節點後跳出迴圈
        while cur is not None:
            # 目標節點在 cur 的右子樹中
            if cur.val < num:
                cur = cur.right
            # 目標節點在 cur 的左子樹中
            elif cur.val > num:
                cur = cur.left
            # 找到目標節點，跳出迴圈
            else:
                break
        return cur

    def insert(self, num: int):
        """插入節點"""
        # 若樹為空，則初始化根節點
        if self._root is None:
            self._root = TreeNode(num)
            return
        # 用迴圈搜尋，越過葉節點後跳出迴圈
        cur, pre = self._root, None
        while cur is not None:
            # 找到重複節點，直接返回
            if cur.val == num:
                return
            pre = cur
            # 插入位置在 cur 的右子樹中
            if cur.val < num:
                cur = cur.right
            # 插入位置在 cur 的左子樹中
            else:
                cur = cur.left
        # 插入節點
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """刪除節點"""
        # 若樹為空，直接返回
        if self._root is None:
            return
        # 用迴圈搜尋，越過葉節點後跳出迴圈
        cur, pre = self._root, None
        while cur is not None:
            # 找到要刪除的節點，跳出迴圈
            if cur.val == num:
                break
            pre = cur
            # 要刪除的節點在 cur 的右子樹中
            if cur.val < num:
                cur = cur.right
            # 要刪除的節點在 cur 的左子樹中
            else:
                cur = cur.left
        # 若找不到要刪除的節點，直接返回
        if cur is None:
            return

        # 子節點數為 0 或 1
        if cur.left is None or cur.right is None:
            # 有 0 個子節點時，child = null；只有 1 個時，child 指向該子節點
            child = cur.left or cur.right
            # 刪除節點 cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 若刪除的是根節點，則重新指定根節點
                self._root = child
        # 子節點數為 2
        else:
            # 取得中序走訪中 cur 的下一個節點
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # 以遞迴刪除節點 tmp
            self.remove(tmp.val)
            # 用 tmp 的值覆寫 cur 的值
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # 初始化二元搜尋樹
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # 請留意，插入順序不同，建成的二元樹也可能不同。這組序列會建成一棵完美二元樹
    for num in nums:
        bst.insert(num)
    print("\n初始化後的二元樹為\n")
    print_tree(bst.get_root())

    # 搜尋節點
    node = bst.search(7)
    print("\n找到的節點物件為 {}，節點值 = {}".format(node, node.val))

    # 插入節點
    bst.insert(16)
    print("\n插入節點 16 後的二元樹為\n")
    print_tree(bst.get_root())

    # 刪除節點
    bst.remove(1)
    print("\n刪除節點 1 後的二元樹為\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\n刪除節點 2 後的二元樹為\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\n刪除節點 4 後的二元樹為\n")
    print_tree(bst.get_root())
