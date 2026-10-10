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
    """関数"""
    # 何らかの処理を行う
    return 0


def constant(n: int):
    """定数階"""
    # 定数、変数、オブジェクトは O(1) の空間を占める
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # ループ内の変数は O(1) の空間を占める
    for _ in range(n):
        c = 0
    # ループ内の関数は O(1) の空間を占める
    for _ in range(n):
        function()


def linear(n: int):
    """線形階"""
    # 長さ n のリストは O(n) の空間を使用
    nums = [0] * n
    # 長さ n のハッシュテーブルは O(n) の空間を使用
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)


def linear_recur(n: int):
    """線形時間（再帰実装）"""
    print("再帰 n =", n)
    if n == 1:
        return
    linear_recur(n - 1)


def quadratic(n: int):
    """二乗階"""
    # 二次元リストは O(n^2) の空間を使用
    num_matrix = [[0] * n for _ in range(n)]


def quadratic_recur(n: int) -> int:
    """二次時間（再帰実装）"""
    if n <= 0:
        return 0
    # 配列 nums の長さは n, n-1, ..., 2, 1
    nums = [0] * n
    return quadratic_recur(n - 1)


def build_tree(n: int) -> TreeNode | None:
    """指数時間（完全二分木の構築）"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    # 定数階
    constant(n)
    # 線形階
    linear(n)
    linear_recur(n)
    # 二乗階
    quadratic(n)
    quadratic_recur(n)
    # 指数オーダー
    root = build_tree(n)
    print_tree(root)
