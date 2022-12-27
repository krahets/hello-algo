"""
File: binary_tree_dfs.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

# 定义一个list数组用来存储遍历的结果


# 前序遍历
def preorder(root):
    if root == None:
        return []
    
    # 访问顺序：根结点 -> 左子树 -> 右子树

    list.append(root.val)
    preorder(root.left)
    preorder(root.right)


# 中序遍历
def inorder(root):
    if root == None:
        return []

    # 访问顺序：左子树 -> 根结点 -> 右子树
    
    inorder(root.left)
    list.append(root.val)
    inorder(root.right)

# 后序遍历
def postorder(root):
    if root == None:
        return []

    # 访问顺序：左子树 -> 右子树 -> 根结点

    postorder(root.left)
    postorder(root.right)
    list.append(root.val)
