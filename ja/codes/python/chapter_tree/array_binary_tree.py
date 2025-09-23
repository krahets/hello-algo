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
    """配列ベースの二分木クラス"""

    def __init__(self, arr: list[int | None]):
        """コンストラクタ"""
        self._tree = list(arr)

    def size(self):
        """リストの容量"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """インデックスiのノードの値を取得"""
        # インデックスが範囲外の場合、Noneを返し、空席を表す
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """インデックスiのノードの左の子のインデックスを取得"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """インデックスiのノードの右の子のインデックスを取得"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """インデックスiのノードの親のインデックスを取得"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """レベル順走査"""
        self.res = []
        # 配列を走査
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """深さ優先走査"""
        if self.val(i) is None:
            return
        # 前順走査
        if order == "pre":
            self.res.append(self.val(i))
        self.dfs(self.left(i), order)
        # 中順走査
        if order == "in":
            self.res.append(self.val(i))
        self.dfs(self.right(i), order)
        # 後順走査
        if order == "post":
            self.res.append(self.val(i))

    def pre_order(self) -> list[int]:
        """前順走査"""
        self.res = []
        self.dfs(0, order="pre")
        return self.res

    def in_order(self) -> list[int]:
        """中順走査"""
        self.res = []
        self.dfs(0, order="in")
        return self.res

    def post_order(self) -> list[int]:
        """後順走査"""
        self.res = []
        self.dfs(0, order="post")
        return self.res


"""ドライバコード"""
if __name__ == "__main__":
    # 二分木を初期化
    # 特定の関数を使用して配列を二分木に変換
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\n二分木を初期化\n")
    print("二分木の配列表現:")
    print(arr)
    print("二分木の連結リスト表現:")
    print_tree(root)

    # 配列ベースの二分木クラス
    abt = ArrayBinaryTree(arr)

    # ノードにアクセス
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\n現在のノードのインデックスは {i}、値は {abt.val(i)}")
    print(f"その左の子ノードのインデックスは {l}、値は {abt.val(l)}")
    print(f"その右の子ノードのインデックスは {r}、値は {abt.val(r)}")
    print(f"その親ノードのインデックスは {p}、値は {abt.val(p)}")

    # 木を走査
    res = abt.level_order()
    print("\nレベル順走査:", res)
    res = abt.pre_order()
    print("前順走査:", res)
    res = abt.in_order()
    print("中順走査:", res)
    res = abt.post_order()
    print("後順走査:", res)