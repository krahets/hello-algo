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
    # 初始化二元樹
    # 初始化節點
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # 構建節點之間的引用（指標）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    print("\n初始化二元樹\n")
    print_tree(n1)

    # 插入與刪除節點
    P = TreeNode(0)
    # 在 n1 -> n2 中間插入節點 P
    n1.left = P
    P.left = n2
    print("\n插入節點 P 後\n")
    print_tree(n1)
    # 刪除節點
    n1.left = n2
    print("\n刪除節點 P 後\n")
    print_tree(n1)
