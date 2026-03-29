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
    """先行順走査"""
    if root is None:
        return
    # 訪問順序：根ノード -> 左部分木 -> 右部分木
    res.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


def in_order(root: TreeNode | None):
    """中順走査"""
    if root is None:
        return
    # 訪問優先順: 左部分木 -> 根ノード -> 右部分木
    in_order(root=root.left)
    res.append(root.val)
    in_order(root=root.right)


def post_order(root: TreeNode | None):
    """後順走査"""
    if root is None:
        return
    # 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
    post_order(root=root.left)
    post_order(root=root.right)
    res.append(root.val)


"""Driver Code"""
if __name__ == "__main__":
    # 二分木を初期化
    # ここでは、配列から直接二分木を生成する関数を利用する
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n二分木を初期化\n")
    print_tree(root)

    # 先行順走査
    res = []
    pre_order(root)
    print("\n先行順走査のノード出力シーケンス = ", res)

    # 中順走査
    res.clear()
    in_order(root)
    print("\n中間順走査のノード出力シーケンス = ", res)

    # 後順走査
    res.clear()
    post_order(root)
    print("\n後行順走査のノード出力シーケンス = ", res)
