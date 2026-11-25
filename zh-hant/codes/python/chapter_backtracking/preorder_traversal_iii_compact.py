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
    """前序走訪：例題三"""
    # 剪枝
    if root is None or root.val == 3:
        return
    # 嘗試
    path.append(root)
    if root.val == 7:
        # 記錄此解
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # 回溯
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

    print("\n輸出從根節點到值為 7 的節點的所有路徑，且路徑中不含值為 3 的節點")
    for path in res:
        print([node.val for node in path])
