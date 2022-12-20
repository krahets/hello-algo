"""
File: binary_tree_dfs.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


result = []


def preOrder(root):
    """
    前序遍历二叉树
    """
    if root is None:
        return

    # 访问优先级：根结点 -> 左子树 -> 右子树
    result.append(root.val)
    preOrder(root=root.left)
    preOrder(root=root.right)


def inOrder(root):
    """
    中序遍历二叉树
    """
    if root is None:
        return

    # 访问优先级：左子树 -> 根结点 -> 右子树
    inOrder(root=root.left)
    result.append(root.val)
    inOrder(root=root.right)


def postOrder(root):
    """
    后序遍历二叉树
    """
    if root is None:
        return

    # 访问优先级：左子树 -> 右子树 -> 根结点
    postOrder(root=root.left)
    postOrder(root=root.right)
    result.append(root.val)


""" Driver Code """
if __name__ == "__main__":
    # 初始化二叉树
    # 这里借助了一个从数组直接生成二叉树的函数
    root = list_to_tree(
        arr=[1, 2, 3, 4, 5, 6, 7, None, None, None, None, None, None, None, None]
    )
    print("\n初始化二叉树\n")
    print_tree(root)

    # 前序遍历
    result = []
    preOrder(root)
    print("\n前序遍历的结点打印序列 = ", result)
    assert result == [1, 2, 4, 5, 3, 6, 7]

    # 中序遍历
    result = []
    inOrder(root)
    print("\n中序遍历的结点打印序列 = ", result)
    assert result == [4, 2, 5, 1, 6, 3, 7]

    # 后序遍历
    result = []
    postOrder(root)
    print("\n后序遍历的结点打印序列 = ", result)
    assert result == [4, 5, 2, 6, 7, 3, 1]