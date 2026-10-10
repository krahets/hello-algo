"""
File: preorder_traversal_ii_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """前順走査：例題 2"""
    if root is None:
        return
    # 試す
    path.append(root)
    if root.val == 7:
        # 解を記録
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # バックトラック
    path.pop()


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n二分木を初期化")
    print_tree(root)

    # 先行順走査
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\n根ノードからノード 7 までの経路をすべて出力")
    for path in res:
        print([node.val for node in path])
