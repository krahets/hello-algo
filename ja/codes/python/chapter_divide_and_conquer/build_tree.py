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
    """二分木の構築：分割統治"""
    # 部分木の区間が空のとき終了
    if r - l < 0:
        return None
    # ルートノードを初期化
    root = TreeNode(preorder[i])
    # m をクエリして左部分木と右部分木を分割
    m = inorder_map[preorder[i]]
    # 部分問題：左部分木を構築
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # 部分問題：右部分木を構築
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # ルートノードを返す
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """二分木を構築"""
    # ハッシュテーブルを初期化、中順走査の要素からインデックスへのマッピングを保存
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""ドライバーコード"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"前順走査 = {preorder}")
    print(f"中順走査 = {inorder}")

    root = build_tree(preorder, inorder)
    print("構築された二分木は：")
    print_tree(root)