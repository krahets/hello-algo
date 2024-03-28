"""
File: space_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, TreeNode, print_tree


def function() -> int:
    """函式"""
    # 執行某些操作
    return 0


def constant(n: int):
    """常數階"""
    # 常數、變數、物件佔用 O(1) 空間
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # 迴圈中的變數佔用 O(1) 空間
    for _ in range(n):
        c = 0
    # 迴圈中的函式佔用 O(1) 空間
    for _ in range(n):
        function()


def linear(n: int):
    """線性階"""
    # 長度為 n 的串列佔用 O(n) 空間
    nums = [0] * n
    # 長度為 n 的雜湊表佔用 O(n) 空間
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)


def linear_recur(n: int):
    """線性階（遞迴實現）"""
    print("遞迴 n =", n)
    if n == 1:
        return
    linear_recur(n - 1)


def quadratic(n: int):
    """平方階"""
    # 二維串列佔用 O(n^2) 空間
    num_matrix = [[0] * n for _ in range(n)]


def quadratic_recur(n: int) -> int:
    """平方階（遞迴實現）"""
    if n <= 0:
        return 0
    # 陣列 nums 長度為 n, n-1, ..., 2, 1
    nums = [0] * n
    return quadratic_recur(n - 1)


def build_tree(n: int) -> TreeNode | None:
    """指數階（建立滿二元樹）"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    # 常數階
    constant(n)
    # 線性階
    linear(n)
    linear_recur(n)
    # 平方階
    quadratic(n)
    quadratic_recur(n)
    # 指數階
    root = build_tree(n)
    print_tree(root)
