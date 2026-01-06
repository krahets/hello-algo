"""
File: tree_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """二分木のノードクラス"""

    def __init__(self, val: int = 0):
        self.val: int = val  # ノードの値
        self.height: int = 0  # ノードの高さ
        self.left: TreeNode | None = None  # 左の子ノードへの参照
        self.right: TreeNode | None = None  # 右の子ノードへの参照

    # シリアライゼーションのエンコーディングルールについては、以下を参照:
    # https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    # 二分木の配列表現:
    # [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    # 二分木の連結リスト表現:
    #             /——— 15
    #         /——— 7
    #     /——— 3
    #    |    \——— 6
    #    |        \——— 12
    # ——— 1
    #     \——— 2
    #        |    /——— 9
    #         \——— 4
    #             \——— 8


def list_to_tree_dfs(arr: list[int], i: int) -> TreeNode | None:
    """リストを二分木にデシリアライズ: 再帰的"""
    # インデックスが配列の境界外、または対応する要素がNoneの場合、Noneを返す
    if i < 0 or i >= len(arr) or arr[i] is None:
        return None
    # 現在のノードを構築
    root = TreeNode(arr[i])
    # 左右の部分木を再帰的に構築
    root.left = list_to_tree_dfs(arr, 2 * i + 1)
    root.right = list_to_tree_dfs(arr, 2 * i + 2)
    return root


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """リストを二分木にデシリアライズ"""
    return list_to_tree_dfs(arr, 0)


def tree_to_list_dfs(root: TreeNode, i: int, res: list[int]) -> list[int]:
    """二分木をリストにシリアライズ: 再帰的"""
    if root is None:
        return
    if i >= len(res):
        res += [None] * (i - len(res) + 1)
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i + 1, res)
    tree_to_list_dfs(root.right, 2 * i + 2, res)


def tree_to_list(root: TreeNode | None) -> list[int]:
    """二分木をリストにシリアライズ"""
    res = []
    tree_to_list_dfs(root, 0, res)
    return res