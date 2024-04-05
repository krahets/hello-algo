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
    """前序走訪：例題二"""
    if root is None:
        return
    # 嘗試
    path.append(root)
    if root.val == 7:
        # 記錄解
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # 回退
    path.pop()


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\n初始化二元樹")
    print_tree(root)

    # 前序走訪
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\n輸出所有根節點到節點 7 的路徑")
    for path in res:
        print([node.val for node in path])
