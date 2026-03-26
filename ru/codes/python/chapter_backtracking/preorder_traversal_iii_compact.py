"""
File: preorder_traversal_iii_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """Прямой обход: пример 3"""
    # Отсечение
    if root is None or root.val == 3:
        return
    # Попытаться
    path.append(root)
    if root.val == 7:
        # Записать решение
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # Откат
    path.pop()


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nИнициализируем двоичное дерево")
    print_tree(root)

    # Прямой обход
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\nВывести все пути от корня до узла 7, в которых нет узлов со значением 3")
    for path in res:
        print([node.val for node in path])
