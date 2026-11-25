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
    """Построение двоичного дерева методом «разделяй и властвуй»"""
    # Если интервал поддерева пуст, завершаем рекурсию
    if r - l < 0:
        return None
    # Создаём корень
    root = TreeNode(preorder[i])
    # Находим m и разделяем левое и правое поддеревья
    m = inorder_map[preorder[i]]
    # Подзадача: строим левое поддерево
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # Подзадача: строим правое поддерево
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # Возвращаем корень
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """Построение двоичного дерева"""
    # Создаём хеш-таблицу индексов элементов inorder
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"Прямой обход = {preorder}")
    print(f"Симметричный обход = {inorder}")

    root = build_tree(preorder, inorder)
    print("Построенное двоичное дерево:")
    print_tree(root)
