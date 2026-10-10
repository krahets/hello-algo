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
    """Предварительный обход: пример 3"""
    # Отсечение
    if root is None or root.val == 3:
        return
    # Попытка
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
    print("\nИнициализация двоичного дерева")
    print_tree(root)

    # Предварительный обход
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\nВсе пути от корня к узлу 7, не содержащие узлов со значением 3")
    for path in res:
        print([node.val for node in path])
