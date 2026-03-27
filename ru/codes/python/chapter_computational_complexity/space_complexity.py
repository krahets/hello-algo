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
    """Функция"""
    # Выполнить некоторые операции
    return 0


def constant(n: int):
    """Постоянная сложность"""
    # Константы, переменные и объекты занимают O(1) памяти
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # Переменные в цикле занимают O(1) памяти
    for _ in range(n):
        c = 0
    # Функции в цикле занимают O(1) памяти
    for _ in range(n):
        function()


def linear(n: int):
    """Линейная сложность"""
    # Список длины n занимает O(n) памяти
    nums = [0] * n
    # Хеш-таблица длины n занимает O(n) памяти
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)


def linear_recur(n: int):
    """Линейная сложность (рекурсивная реализация)"""
    print("Рекурсия n =", n)
    if n == 1:
        return
    linear_recur(n - 1)


def quadratic(n: int):
    """Квадратичная сложность"""
    # Двумерный список занимает O(n^2) памяти
    num_matrix = [[0] * n for _ in range(n)]


def quadratic_recur(n: int) -> int:
    """Квадратичная сложность (рекурсивная реализация)"""
    if n <= 0:
        return 0
    # Длина массива nums равна n, n-1, ..., 2, 1
    nums = [0] * n
    return quadratic_recur(n - 1)


def build_tree(n: int) -> TreeNode | None:
    """Экспоненциальная сложность (построение полного двоичного дерева)"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    # Постоянная сложность
    constant(n)
    # Линейная сложность
    linear(n)
    linear_recur(n)
    # Квадратичная сложность
    quadratic(n)
    quadratic_recur(n)
    # Экспоненциальная сложность
    root = build_tree(n)
    print_tree(root)
