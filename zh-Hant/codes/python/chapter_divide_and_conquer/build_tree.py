"""
File: build_tree.py
Created Time: 2023-07-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


def dfs(
    preorder: list[int],
    inorder_map: dict[int, int],
    i: int,
    l: int,
    r: int,
) -> TreeNode | None:
    """構建二元樹：分治"""
    # 子樹區間為空時終止
    if r - l < 0:
        return None
    # 初始化根節點
    root = TreeNode(preorder[i])
    # 查詢 m ，從而劃分左右子樹
    m = inorder_map[preorder[i]]
    # 子問題：構建左子樹
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # 子問題：構建右子樹
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # 返回根節點
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """構建二元樹"""
    # 初始化雜湊表，儲存 inorder 元素到索引的對映
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"前序走訪 = {preorder}")
    print(f"中序走訪 = {inorder}")

    root = build_tree(preorder, inorder)
    print("構建的二元樹為：")
    print_tree(root)
