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
    """二分木を構築：分割統治"""
    # 部分木区間が空なら終了する
    if r - l < 0:
        return None
    # ルートノードを初期化する
    root = TreeNode(preorder[i])
    # m を求めて左右部分木を分割する
    m = inorder_map[preorder[i]]
    # 部分問題：左部分木を構築する
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # 部分問題：右部分木を構築する
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # 根ノードを返す
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """二分木を構築"""
    # inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"前順走査 = {preorder}")
    print(f"中順走査 = {inorder}")

    root = build_tree(preorder, inorder)
    print("構築した二分木:")
    print_tree(root)
