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
    """Function"""
    # Perform some operations
    return 0


def constant(n: int):
    """Constant space"""
    # Constants, variables, and objects use O(1) space
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # Variables in the loop use O(1) space
    for _ in range(n):
        c = 0
    # Function calls in the loop use O(1) space
    for _ in range(n):
        function()


def linear(n: int):
    """Linear space"""
    # A list of length n uses O(n) space
    nums = [0] * n
    # A hash table with n entries uses O(n) space
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)


def linear_recur(n: int):
    """Linear space (recursive)"""
    print("Recursive call: n =", n)
    if n == 1:
        return
    linear_recur(n - 1)


def quadratic(n: int):
    """Quadratic space"""
    # A two-dimensional list uses O(n^2) space
    num_matrix = [[0] * n for _ in range(n)]


def quadratic_recur(n: int) -> int:
    """Quadratic space (recursive)"""
    if n <= 0:
        return 0
    # The successive lengths of nums are n, n-1, ..., 2, 1
    nums = [0] * n
    return quadratic_recur(n - 1)


def build_tree(n: int) -> TreeNode | None:
    """Exponential space (build a perfect binary tree)"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    # Constant space
    constant(n)
    # Linear space
    linear(n)
    linear_recur(n)
    # Quadratic space
    quadratic(n)
    quadratic_recur(n)
    # Exponential space
    root = build_tree(n)
    print_tree(root)
