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
    """Constant complexity"""
    # Constants, variables, objects occupy O(1) space
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # Variables in a loop occupy O(1) space
    for _ in range(n):
        c = 0
    # Functions in a loop occupy O(1) space
    for _ in range(n):
        function()


def linear(n: int):
    """Linear complexity"""
    # A list of length n occupies O(n) space
    nums = [0] * n
    # A hash table of length n occupies O(n) space
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)


def linear_recur(n: int):
    """Linear complexity (recursive implementation)"""
    print("Recursive n =", n)
    if n == 1:
        return
    linear_recur(n - 1)


def quadratic(n: int):
    """Quadratic complexity"""
    # A two-dimensional list occupies O(n^2) space
    num_matrix = [[0] * n for _ in range(n)]


def quadratic_recur(n: int) -> int:
    """Quadratic complexity (recursive implementation)"""
    if n <= 0:
        return 0
    # Array nums length = n, n-1, ..., 2, 1
    nums = [0] * n
    return quadratic_recur(n - 1)


def build_tree(n: int) -> TreeNode | None:
    """Exponential complexity (building a full binary tree)"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    # Constant complexity
    constant(n)
    # Linear complexity
    linear(n)
    linear_recur(n)
    # Quadratic complexity
    quadratic(n)
    quadratic_recur(n)
    # Exponential complexity
    root = build_tree(n)
    print_tree(root)
