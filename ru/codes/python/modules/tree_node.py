"""
File: tree_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """Класс узла двоичного дерева"""

    def __init__(self, val: int = 0):
        self.val: int = val  # Значение узла
        self.height: int = 0  # Высота узла
        self.left: TreeNode | None = None  # Ссылка на левый дочерний узел
        self.right: TreeNode | None = None  # Ссылка на правый дочерний узел

    # Правила кодирования сериализации см.:
    # https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    # Массивное представление двоичного дерева:
    # [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    # Связное представление двоичного дерева:
    # /——— 15
    # /——— 7
    # /——— 3
    # |    \——— 6
    # |        \——— 12
    # ——— 1
    # \——— 2
    # |    /——— 9
    # \——— 4
    # \——— 8


def list_to_tree_dfs(arr: list[int], i: int) -> TreeNode | None:
    """Десериализовать список в двоичное дерево: рекурсия"""
    # Если индекс выходит за длину массива или соответствующий элемент равен None, вернуть None
    if i < 0 or i >= len(arr) or arr[i] is None:
        return None
    # Построить текущий узел
    root = TreeNode(arr[i])
    # Рекурсивно построить левое и правое поддеревья
    root.left = list_to_tree_dfs(arr, 2 * i + 1)
    root.right = list_to_tree_dfs(arr, 2 * i + 2)
    return root


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """Десериализовать список в двоичное дерево"""
    return list_to_tree_dfs(arr, 0)


def tree_to_list_dfs(root: TreeNode, i: int, res: list[int]) -> list[int]:
    """Сериализовать двоичное дерево в список: рекурсия"""
    if root is None:
        return
    if i >= len(res):
        res += [None] * (i - len(res) + 1)
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i + 1, res)
    tree_to_list_dfs(root.right, 2 * i + 2, res)


def tree_to_list(root: TreeNode | None) -> list[int]:
    """Сериализовать двоичное дерево в список"""
    res = []
    tree_to_list_dfs(root, 0, res)
    return res
