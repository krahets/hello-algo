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
    """함수"""
    # 어떤 연산을 수행한다
    return 0


def constant(n: int):
    """상수 차수"""
    # 상수, 변수, 객체가 O(1)의 공간을 차지한다
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # 반복문 안의 변수가 O(1)의 공간을 차지한다
    for _ in range(n):
        c = 0
    # 반복문 안의 함수가 O(1)의 공간을 차지한다
    for _ in range(n):
        function()


def linear(n: int):
    """선형 차수"""
    # 길이 n인 리스트가 O(n)의 공간을 차지한다
    nums = [0] * n
    # 길이 n인 해시 테이블이 O(n)의 공간을 차지한다
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)


def linear_recur(n: int):
    """선형 차수(재귀 구현)"""
    print("재귀 호출 n =", n)
    if n == 1:
        return
    linear_recur(n - 1)


def quadratic(n: int):
    """이차 차수"""
    # 2차원 리스트가 O(n^2)의 공간을 차지한다
    num_matrix = [[0] * n for _ in range(n)]


def quadratic_recur(n: int) -> int:
    """이차 차수(재귀 구현)"""
    if n <= 0:
        return 0
    # 배열 nums의 길이는 차례로 n, n-1, ..., 2, 1이다
    nums = [0] * n
    return quadratic_recur(n - 1)


def build_tree(n: int) -> TreeNode | None:
    """지수 차수(포화 이진 트리 생성)"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    # 상수 차수
    constant(n)
    # 선형 차수
    linear(n)
    linear_recur(n)
    # 이차 차수
    quadratic(n)
    quadratic_recur(n)
    # 지수 차수
    root = build_tree(n)
    print_tree(root)
