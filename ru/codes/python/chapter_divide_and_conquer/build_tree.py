"""
File: build_tree.py
Created Time: 2023-07-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


def dfs(
    preorder: list[int],
    inorder_map: dict[int, int],
    i: int,
    l: int,
    r: int,
) -> TreeNode | None:
    """Построить двоичное дерево: разделяй и властвуй"""
    # Завершить при пустом диапазоне поддерева
    if r - l < 0:
        return None
    # Инициализировать корневой узел
    root = TreeNode(preorder[i])
    # Найти m, чтобы разделить левое и правое поддеревья
    m = inorder_map[preorder[i]]
    # Подзадача: построить левое поддерево
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # Подзадача: построить правое поддерево
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # Вернуть корневой узел
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """Построить двоичное дерево"""
    # Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"Предварительный обход = {preorder}")
    print(f"Симметричный обход = {inorder}")

    root = build_tree(preorder, inorder)
    print("Построенное двоичное дерево:")
    print_tree(root)
