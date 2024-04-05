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
    """層序走訪"""
    # 初始化佇列，加入根節點
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # 初始化一個串列，用於儲存走訪序列
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # 隊列出隊
        res.append(node.val)  # 儲存節點值
        if node.left is not None:
            queue.append(node.left)  # 左子節點入列
        if node.right is not None:
            queue.append(node.right)  # 右子節點入列
    return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化二元樹
    # 這裡藉助了一個從陣列直接生成二元樹的函式
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\n初始化二元樹\n")
    print_tree(root)

    # 層序走訪
    res: list[int] = level_order(root)
    print("\n層序走訪的節點列印序列 = ", res)
