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
    """配列表現による二分木クラス"""

    def __init__(self, arr: list[int | None]):
        """コンストラクタ"""
        self._tree = list(arr)

    def size(self):
        """リスト容量"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """インデックス i のノードの値を取得"""
        # インデックスが範囲外なら、空きを表す None を返す
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """インデックス i のノードの左子ノードのインデックスを取得"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """インデックス i のノードの右子ノードのインデックスを取得"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """インデックス i のノードの親ノードのインデックスを取得"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """レベル順走査"""
        self.res = []
        # 配列を直接走査する
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """深さ優先探索"""
        if self.val(i) is None:
            return
        # 先行順走査
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
        """先行順走査"""
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


"""Driver Code"""
if __name__ == "__main__":
    # 二分木を初期化
    # ここでは、配列から直接二分木を生成する関数を利用する
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\n二分木を初期化\n")
    print("二分木の配列表現：")
    print(arr)
    print("二分木の連結リスト表現：")
    print_tree(root)

    # 配列表現による二分木クラス
    abt = ArrayBinaryTree(arr)

    # ノードにアクセス
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\n現在のノードのインデックスは {i}、値は {abt.val(i)}")
    print(f"その左子ノードのインデックスは {l}、値は {abt.val(l)}")
    print(f"その右子ノードのインデックスは {r}、値は {abt.val(r)}")
    print(f"その親ノードのインデックスは {p}、値は {abt.val(p)}")

    # 木を走査
    res = abt.level_order()
    print("\nレベル順走査：", res)
    res = abt.pre_order()
    print("先行順走査：", res)
    res = abt.in_order()
    print("中間順走査：", res)
    res = abt.post_order()
    print("後行順走査：", res)
