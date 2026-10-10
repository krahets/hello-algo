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
    # 二分木を初期化する
    # ノードを初期化する
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # ノード間の参照（ポインタ）を構築する
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    print("\n二分木を初期化\n")
    print_tree(n1)

    # ノードの挿入と削除
    P = TreeNode(0)
    # n1 -> n2 の間にノード P を挿入
    n1.left = P
    P.left = n2
    print("\nノード P を挿入した後\n")
    print_tree(n1)
    # ノードを削除
    n1.left = n2
    print("\nノード P を削除した後\n")
    print_tree(n1)
