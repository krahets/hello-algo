"""
File: binary_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *


"""Driver Code"""
if __name__ == "__main__":
    # 初始化二叉树
    # 初始化节点
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # 构建引用指向（即指针）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    print("\n初始化二叉树\n")
    print_tree(n1)

    # 插入与删除节点
    P = TreeNode(0)
    # 在 n1 -> n2 中间插入节点 P
    n1.left = P
    P.left = n2
    print("\n插入节点 P 后\n")
    print_tree(n1)
    # 删除节点
    n1.left = n2
    print("\n删除节点 P 后\n")
    print_tree(n1)
