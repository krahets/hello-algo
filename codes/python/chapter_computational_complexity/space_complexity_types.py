'''
File: space_complexity_types.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
'''

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 函数 """
def function():
    # do something
    return 0

""" 常数阶 """
def constant(n):
    # 常量、变量、对象占用 O(1) 空间
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # 循环中的变量占用 O(1) 空间
    for _ in range(n):
         c = 0
    # 循环中的函数占用 O(1) 空间
    for _ in range(n):
        function()

""" 线性阶 """
def linear(n):
    # 长度为 n 的列表占用 O(n) 空间
    nums = [0] * n
    # 长度为 n 的哈希表占用 O(n) 空间
    mapp = {}
    for i in range(n):
        mapp[i] = str(i)

""" 线性阶（递归实现） """
def linearRecur(n):
    print("递归 n =", n)
    if n == 1: return
    linearRecur(n - 1)

""" 平方阶 """
def quadratic(n):
    # 二维列表占用 O(n^2) 空间
    num_matrix = [[0] * n for _ in range(n)]

""" 平方阶（递归实现） """
def quadratic_recur(n):
    if n <= 0: return 0
    nums = [0] * n
    print("递归 n =", n, "中的 nums 长度 =", len(nums))
    return quadratic_recur(n - 1)

""" 指数阶（建立满二叉树） """
def build_tree(n):
    if n == 0: return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


""" Driver Code """
if __name__ == "__main__":
    n = 5
    # 常数阶
    constant(n)
    # 线性阶
    linear(n)
    linearRecur(n)
    # 平方阶
    quadratic(n)
    quadratic_recur(n)
    # 指数阶
    root = build_tree(n)
    print_tree(root)
