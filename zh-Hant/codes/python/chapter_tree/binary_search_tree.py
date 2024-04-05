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
        """建構子"""
        # 初始化空樹
        self._root = None

    def get_root(self) -> TreeNode | None:
        """獲取二元樹根節點"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """查詢節點"""
        cur = self._root
        # 迴圈查詢，越過葉節點後跳出
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
        # 迴圈查詢，越過葉節點後跳出
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
        # 若樹為空，直接提前返回
        if self._root is None:
            return
        # 迴圈查詢，越過葉節點後跳出
        cur, pre = self._root, None
        while cur is not None:
            # 找到待刪除節點，跳出迴圈
            if cur.val == num:
                break
            pre = cur
            # 待刪除節點在 cur 的右子樹中
            if cur.val < num:
                cur = cur.right
            # 待刪除節點在 cur 的左子樹中
            else:
                cur = cur.left
        # 若無待刪除節點，則直接返回
        if cur is None:
            return

        # 子節點數量 = 0 or 1
        if cur.left is None or cur.right is None:
            # 當子節點數量 = 0 / 1 時， child = null / 該子節點
            child = cur.left or cur.right
            # 刪除節點 cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 若刪除節點為根節點，則重新指定根節點
                self._root = child
        # 子節點數量 = 2
        else:
            # 獲取中序走訪中 cur 的下一個節點
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # 遞迴刪除節點 tmp
            self.remove(tmp.val)
            # 用 tmp 覆蓋 cur
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # 初始化二元搜尋樹
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # 請注意，不同的插入順序會生成不同的二元樹，該序列可以生成一個完美二元樹
    for num in nums:
        bst.insert(num)
    print("\n初始化的二元樹為\n")
    print_tree(bst.get_root())

    # 查詢節點
    node = bst.search(7)
    print("\n查詢到的節點物件為: {}，節點值 = {}".format(node, node.val))

    # 插入節點
    bst.insert(16)
    print("\n插入節點 16 後，二元樹為\n")
    print_tree(bst.get_root())

    # 刪除節點
    bst.remove(1)
    print("\n刪除節點 1 後，二元樹為\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\n刪除節點 2 後，二元樹為\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\n刪除節點 4 後，二元樹為\n")
    print_tree(bst.get_root())
