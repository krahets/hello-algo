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
    """Предварительный обход"""
    if root is None:
        return
    # Порядок обхода: корень -> левое поддерево -> правое поддерево
    res.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


def in_order(root: TreeNode | None):
    """Симметричный обход"""
    if root is None:
        return
    # Порядок обхода: левое поддерево -> корень -> правое поддерево
    in_order(root=root.left)
    res.append(root.val)
    in_order(root=root.right)


def post_order(root: TreeNode | None):
    """Обратный обход"""
    if root is None:
        return
    # Порядок обхода: левое поддерево -> правое поддерево -> корень
    post_order(root=root.left)
    post_order(root=root.right)
    res.append(root.val)


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать двоичное дерево
    # Здесь используется функция, напрямую строящая двоичное дерево из массива
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nИнициализация двоичного дерева\n")
    print_tree(root)

    # Предварительный обход
    res = []
    pre_order(root)
    print("\nПоследовательность печати узлов при предварительном обходе = ", res)

    # Симметричный обход
    res.clear()
    in_order(root)
    print("\nПоследовательность печати узлов при симметричном обходе = ", res)

    # Обратный обход
    res.clear()
    post_order(root)
    print("\nПоследовательность печати узлов при обратном обходе = ", res)
