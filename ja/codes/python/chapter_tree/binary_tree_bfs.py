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
    # キューを初期化し、根ノードを追加する
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # 走査順序を保存するリストを初期化する
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # キューからデキューする
        res.append(node.val)  # ノードの値を保存する
        if node.left is not None:
            queue.append(node.left)  # 左の子ノードをエンキューする
        if node.right is not None:
            queue.append(node.right)  # 右の子ノードをエンキューする
    return res


"""実行用コード"""
if __name__ == "__main__":
    # 二分木を初期化する
    # ここでは配列から二分木を直接生成する関数を使う
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n二分木を初期化する\n")
    print_tree(root)

    # レベル順走査
    res: list[int] = level_order(root)
    print("\nレベル順走査で表示するノードの順序 = ", res)
