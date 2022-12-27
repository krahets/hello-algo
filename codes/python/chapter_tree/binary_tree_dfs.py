"""
File: binary_tree_dfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys, os.path as osp
import typing

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


result = []


""" 前序遍历二叉树 """


def pre_order(root: typing.Optional[TreeNode]):
    if root is None:
        return

    # 访问优先级：根结点 -> 左子树 -> 右子树
    result.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


""" 中序遍历二叉树 """


def in_order(root: typing.Optional[TreeNode]):
    if root is None:
        return

    # 访问优先级：左子树 -> 根结点 -> 右子树
    in_order(root=root.left)
    result.append(root.val)
    in_order(root=root.right)


""" 后序遍历二叉树 """


def post_order(root: typing.Optional[TreeNode]):
    if root is None:
        return

    # 访问优先级：左子树 -> 右子树 -> 根结点
    post_order(root=root.left)
    post_order(root=root.right)
    result.append(root.val)


""" Driver Code """
if __name__ == "__main__":
    # 初始化二叉树
    # 这里借助了一个从数组直接生成二叉树的函数
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7, None, None, None, None, None, None, None, None])
    print("\n初始化二叉树\n")
    print_tree(root)

    # 前序遍历
    result.clear()
    pre_order(root)
    print("\n前序遍历的结点打印序列 = ", result)
    assert result == [1, 2, 4, 5, 3, 6, 7]

    # 中序遍历
    result.clear()
    in_order(root)
    print("\n中序遍历的结点打印序列 = ", result)
    assert result == [4, 2, 5, 1, 6, 3, 7]

    # 后序遍历
    result.clear()
    post_order(root)
    print("\n后序遍历的结点打印序列 = ", result)
    assert result == [4, 5, 2, 6, 7, 3, 1]
