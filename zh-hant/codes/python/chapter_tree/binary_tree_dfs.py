"""
File: binary_tree_dfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


def pre_order(root: TreeNode | None):
    """前序走訪"""
    if root is None:
        return
    # 走訪順序：根節點 -> 左子樹 -> 右子樹
    res.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


def in_order(root: TreeNode | None):
    """中序走訪"""
    if root is None:
        return
    # 走訪順序：左子樹 -> 根節點 -> 右子樹
    in_order(root=root.left)
    res.append(root.val)
    in_order(root=root.right)


def post_order(root: TreeNode | None):
    """後序走訪"""
    if root is None:
        return
    # 走訪順序：左子樹 -> 右子樹 -> 根節點
    post_order(root=root.left)
    post_order(root=root.right)
    res.append(root.val)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化二元樹
    # 這裡使用能從陣列直接建立二元樹的函式
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n初始化二元樹\n")
    print_tree(root)

    # 前序走訪
    res = []
    pre_order(root)
    print("\n依前序走訪印出的節點序列 = ", res)

    # 中序走訪
    res.clear()
    in_order(root)
    print("\n依中序走訪印出的節點序列 = ", res)

    # 後序走訪
    res.clear()
    post_order(root)
    print("\n依後序走訪印出的節點序列 = ", res)
