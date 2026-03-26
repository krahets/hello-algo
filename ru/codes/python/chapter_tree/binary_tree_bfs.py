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
    # Инициализировать очередь и добавить корневой узел
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # Инициализировать список для хранения последовательности обхода
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # Извлечение из очереди
        res.append(node.val)  # Сохранить значение узла
        if node.left is not None:
            queue.append(node.left)  # Поместить левого потомка в очередь
        if node.right is not None:
            queue.append(node.right)  # Поместить правого потомка в очередь
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать двоичное дерево
    # Здесь используется функция, которая напрямую строит двоичное дерево из массива
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nИнициализируем двоичное дерево\n")
    print_tree(root)

    # Обход по уровням
    res: list[int] = level_order(root)
    print("\nПоследовательность узлов при обходе по уровням = ", res)
