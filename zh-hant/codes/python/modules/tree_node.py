"""
File: tree_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """二元樹節點類別"""

    def __init__(self, val: int = 0):
        self.val: int = val  # 節點值
        self.height: int = 0  # 節點高度
        self.left: TreeNode | None = None  # 指向左子節點的參照
        self.right: TreeNode | None = None  # 指向右子節點的參照

    # 序列化的編碼規則請參閱：
    # https://www.hello-algo.com/zh-hant/chapter_tree/array_representation_of_tree/
    # 二元樹的陣列表示法：
    # [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    # 二元樹的鏈結串列表示法：
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
    """以遞迴方式將串列反序列化為二元樹"""
    # 若索引超出陣列範圍，或對應的元素為 None，就回傳 None
    if i < 0 or i >= len(arr) or arr[i] is None:
        return None
    # 建立目前的節點
    root = TreeNode(arr[i])
    # 以遞迴方式建立左右子樹
    root.left = list_to_tree_dfs(arr, 2 * i + 1)
    root.right = list_to_tree_dfs(arr, 2 * i + 2)
    return root


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """將串列反序列化為二元樹"""
    return list_to_tree_dfs(arr, 0)


def tree_to_list_dfs(root: TreeNode, i: int, res: list[int]) -> list[int]:
    """以遞迴方式將二元樹序列化為串列"""
    if root is None:
        return
    if i >= len(res):
        res += [None] * (i - len(res) + 1)
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i + 1, res)
    tree_to_list_dfs(root.right, 2 * i + 2, res)


def tree_to_list(root: TreeNode | None) -> list[int]:
    """將二元樹序列化為串列"""
    res = []
    tree_to_list_dfs(root, 0, res)
    return res
