"""
File: preorder_traversal_i_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """前順走査：例一"""
    if root is None:
        return
    if root.val == 7:
        # 解を記録
        res.append(root)
    pre_order(root.left)
    pre_order(root.right)


"""ドライバーコード"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n二分木を初期化")
    print_tree(root)

    # 前順走査
    res = list[TreeNode]()
    pre_order(root)

    print("\n値が 7 のすべてのノードを出力")
    print([node.val for node in res])