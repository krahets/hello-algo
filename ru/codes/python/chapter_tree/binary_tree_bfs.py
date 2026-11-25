"""
File: binary_tree_bfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree
from collections import deque


def level_order(root: TreeNode | None) -> list[int]:
    """Обход по уровням"""
    # Создать очередь и добавить корень
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # Создать список для последовательности обхода
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # Извлечь узел из очереди
        res.append(node.val)  # Сохранить значение узла
        if node.left is not None:
            queue.append(node.left)  # Добавить левого потомка в очередь
        if node.right is not None:
            queue.append(node.right)  # Добавить правого потомка в очередь
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двоичного дерева
    # Используем функцию, которая строит двоичное дерево непосредственно из массива
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nИнициализация двоичного дерева\n")
    print_tree(root)

    # Обход по уровням
    res: list[int] = level_order(root)
    print("\nУзлы в порядке обхода по уровням = ", res)
