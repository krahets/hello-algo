"""
File: binary_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двоичного дерева
    # Инициализация узлов
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # Построить связи между узлами (указатели)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    print("\nИнициализация двоичного дерева\n")
    print_tree(n1)

    # Вставка и удаление узлов
    P = TreeNode(0)
    # Вставить узел P между n1 -> n2
    n1.left = P
    P.left = n2
    print("\nПосле вставки узла P\n")
    print_tree(n1)
    # Удаление узла
    n1.left = n2
    print("\nПосле удаления узла P\n")
    print_tree(n1)
