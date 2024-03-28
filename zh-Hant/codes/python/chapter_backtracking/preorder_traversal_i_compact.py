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
    """前序走訪：例題一"""
    if root is None:
        return
    if root.val == 7:
        # 記錄解
        res.append(root)
    pre_order(root.left)
    pre_order(root.right)


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n初始化二元樹")
    print_tree(root)

    # 前序走訪
    res = list[TreeNode]()
    pre_order(root)

    print("\n輸出所有值為 7 的節點")
    print([node.val for node in res])
