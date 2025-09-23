"""
File: binary_tree_dfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


def pre_order(root: TreeNode | None):
    """前順走査"""
    if root is None:
        return
    # 訪問順序: ルートノード -> 左部分木 -> 右部分木
    res.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


def in_order(root: TreeNode | None):
    """中順走査"""
    if root is None:
        return
    # 訪問順序: 左部分木 -> ルートノード -> 右部分木
    in_order(root=root.left)
    res.append(root.val)
    in_order(root=root.right)


def post_order(root: TreeNode | None):
    """後順走査"""
    if root is None:
        return
    # 訪問順序: 左部分木 -> 右部分木 -> ルートノード
    post_order(root=root.left)
    post_order(root=root.right)
    res.append(root.val)


"""ドライバコード"""
if __name__ == "__main__":
    # 二分木を初期化
    # 特定の関数を使用して配列を二分木に変換
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n二分木を初期化\n")
    print_tree(root)

    # 前順走査
    res = []
    pre_order(root)
    print("\n前順走査のノードシーケンスを出力 = ", res)

    # 中順走査
    res.clear()
    in_order(root)
    print("\n中順走査のノードシーケンスを出力 = ", res)

    # 後順走査
    res.clear()
    post_order(root)
    print("\n後順走査のノードシーケンスを出力 = ", res)