"""
File: tree_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """二叉树节点类"""

    def __init__(self, val: int = 0):
        self.val: int = val  # 节点值
        self.height: int = 0  # 节点高度
        self.left: TreeNode | None = None  # 左子节点引用
        self.right: TreeNode | None = None  # 右子节点引用

    # 序列化编码规则请参考：
    # https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    # 二叉树的数组表示：
    # [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    # 二叉树的链表表示：
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
    """将列表反序列化为二叉树：递归"""
    # 如果索引超出数组长度，或者对应的元素为 None ，则返回 None
    if i < 0 or i >= len(arr) or arr[i] is None:
        return None
    # 构建当前节点
    root = TreeNode(arr[i])
    # 递归构建左右子树
    root.left = list_to_tree_dfs(arr, 2 * i + 1)
    root.right = list_to_tree_dfs(arr, 2 * i + 2)
    return root


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """将列表反序列化为二叉树"""
    return list_to_tree_dfs(arr, 0)


def tree_to_list_dfs(root: TreeNode, i: int, res: list[int]) -> list[int]:
    """将二叉树序列化为列表：递归"""
    if root is None:
        return
    if i >= len(res):
        res += [None] * (i - len(res) + 1)
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i + 1, res)
    tree_to_list_dfs(root.right, 2 * i + 2, res)


def tree_to_list(root: TreeNode | None) -> list[int]:
    """将二叉树序列化为列表"""
    res = []
    tree_to_list_dfs(root, 0, res)
    return res
