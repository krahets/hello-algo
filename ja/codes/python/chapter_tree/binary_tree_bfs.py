"""
File: binary_tree_bfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree
from collections import deque


def level_order(root: TreeNode | None) -> list[int]:
    """レベル順走査"""
    # キューを初期化し、ルートノードを追加
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # 走査シーケンスを格納するリストを初期化
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # キューからデキュー
        res.append(node.val)  # ノードの値を保存
        if node.left is not None:
            queue.append(node.left)  # 左の子ノードをエンキュー
        if node.right is not None:
            queue.append(node.right)  # 右の子ノードをエンキュー
    return res


"""ドライバコード"""
if __name__ == "__main__":
    # 二分木を初期化
    # 特定の関数を使用して配列を二分木に変換
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n二分木を初期化\n")
    print_tree(root)

    # レベル順走査
    res: list[int] = level_order(root)
    print("\nレベル順走査のノードシーケンスを出力 = ", res)