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
    # 몇 가지 연산을 수행한다
    return 0


def constant(n: int):
    """상수 차수"""
    # 상수, 변수, 객체는 O(1) 공간을 차지한다
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # 반복문 안의 변수는 O(1) 공간을 차지한다
    for _ in range(n):
        c = 0
    # 반복문 안의 함수는 O(1) 공간을 차지한다
    for _ in range(n):
        function()


def linear(n: int):
    """선형 차수"""
    # 길이가 n인 리스트는 O(n) 공간을 차지한다
    nums = [0] * n
    # 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)


def linear_recur(n: int):
    """선형 차수(재귀 구현)"""
    print("재귀 n =", n)
    if n == 1:
        return
    linear_recur(n - 1)


def quadratic(n: int):
    """제곱 차수"""
    # 이차원 리스트는 O(n^2) 공간을 차지한다
    num_matrix = [[0] * n for _ in range(n)]


def quadratic_recur(n: int) -> int:
    """제곱 차수(재귀 구현)"""
    if n <= 0:
        return 0
    # 배열 nums의 길이는 n, n-1, ..., 2, 1이다
    nums = [0] * n
    return quadratic_recur(n - 1)


def build_tree(n: int) -> TreeNode | None:
    """지수 차수(포화 이진 트리 구성)"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


"""실행 코드"""
if __name__ == "__main__":
    n = 5
    # 상수 차수
    constant(n)
    # 선형 차수
    linear(n)
    linear_recur(n)
    # 제곱 차수
    quadratic(n)
    quadratic_recur(n)
    # 지수 차수
    root = build_tree(n)
    print_tree(root)
