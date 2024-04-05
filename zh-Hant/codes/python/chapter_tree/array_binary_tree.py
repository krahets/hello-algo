"""
File: array_binary_tree.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


class ArrayBinaryTree:
    """陣列表示下的二元樹類別"""

    def __init__(self, arr: list[int | None]):
        """建構子"""
        self._tree = list(arr)

    def size(self):
        """串列容量"""
        return len(self._tree)

    def val(self, i: int) -> int:
        """獲取索引為 i 節點的值"""
        # 若索引越界，則返回 None ，代表空位
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """獲取索引為 i 節點的左子節點的索引"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """獲取索引為 i 節點的右子節點的索引"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """獲取索引為 i 節點的父節點的索引"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """層序走訪"""
        self.res = []
        # 直接走訪陣列
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """深度優先走訪"""
        if self.val(i) is None:
            return
        # 前序走訪
        if order == "pre":
            self.res.append(self.val(i))
        self.dfs(self.left(i), order)
        # 中序走訪
        if order == "in":
            self.res.append(self.val(i))
        self.dfs(self.right(i), order)
        # 後序走訪
        if order == "post":
            self.res.append(self.val(i))

    def pre_order(self) -> list[int]:
        """前序走訪"""
        self.res = []
        self.dfs(0, order="pre")
        return self.res

    def in_order(self) -> list[int]:
        """中序走訪"""
        self.res = []
        self.dfs(0, order="in")
        return self.res

    def post_order(self) -> list[int]:
        """後序走訪"""
        self.res = []
        self.dfs(0, order="post")
        return self.res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化二元樹
    # 這裡藉助了一個從陣列直接生成二元樹的函式
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\n初始化二元樹\n")
    print("二元樹的陣列表示：")
    print(arr)
    print("二元樹的鏈結串列表示：")
    print_tree(root)

    # 陣列表示下的二元樹類別
    abt = ArrayBinaryTree(arr)

    # 訪問節點
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\n當前節點的索引為 {i} ，值為 {abt.val(i)}")
    print(f"其左子節點的索引為 {l} ，值為 {abt.val(l)}")
    print(f"其右子節點的索引為 {r} ，值為 {abt.val(r)}")
    print(f"其父節點的索引為 {p} ，值為 {abt.val(p)}")

    # 走訪樹
    res = abt.level_order()
    print("\n層序走訪為：", res)
    res = abt.pre_order()
    print("前序走訪為：", res)
    res = abt.in_order()
    print("中序走訪為：", res)
    res = abt.post_order()
    print("後序走訪為：", res)
