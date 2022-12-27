"""
File: binary_tree_bfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys, os.path as osp
import typing

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


""" 层序遍历 """


def hier_order(root: TreeNode):
    # 初始化队列，加入根结点
    queue: typing.Deque[TreeNode] = collections.deque()
    queue.append(root)
    # 初始化一个列表，用于保存遍历序列
    result = []
    while queue:
        # 队列出队
        node = queue.popleft()
        # 保存节点值
        result.append(node.val)
        if node.left is not None:
            # 左子结点入队
            queue.append(node.left)
        if node.right is not None:
            # 右子结点入队
            queue.append(node.right)
    return result


""" Driver Code """
if __name__ == "__main__":
    # 初始化二叉树
    # 这里借助了一个从数组直接生成二叉树的函数
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7, None, None, None, None, None, None, None, None])
    print("\n初始化二叉树\n")
    print_tree(root)

    # 层序遍历
    result = hier_order(root)
    print("\n层序遍历的结点打印序列 = ", result)
    assert result == [1, 2, 3, 4, 5, 6, 7]
