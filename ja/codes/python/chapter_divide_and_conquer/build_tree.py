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
    """二分木の構築：分割統治法"""
    # 部分木の区間が空の場合、終了する
    if r - l < 0:
        return None
    # 根ノードを初期化する
    root = TreeNode(preorder[i])
    # m を調べ、左右の部分木に分割する
    m = inorder_map[preorder[i]]
    # 部分問題：左部分木の構築
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # 部分問題：右部分木の構築
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # 根ノードを返す
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """二分木を構築する"""
    # inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""実行用コード"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"行きがけ順走査 = {preorder}")
    print(f"通りがけ順走査 = {inorder}")

    root = build_tree(preorder, inorder)
    print("構築した二分木：")
    print_tree(root)
