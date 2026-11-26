"""
File: array_binary_tree.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


class ArrayBinaryTree:
    """Класс двоичного дерева на основе массива"""

    def __init__(self, arr: list[int | None]):
        """Конструктор"""
        self._tree = list(arr)

    def size(self):
        """Ёмкость списка"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """Получить значение узла с индексом i"""
        # Если индекс выходит за границы массива, вернуть None — признак пустой позиции
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """Получить индекс левого потомка узла с индексом i"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """Получить индекс правого потомка узла с индексом i"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """Получить индекс родителя узла с индексом i"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """Обход по уровням"""
        self.res = []
        # Пройти непосредственно по массиву
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """Обход в глубину"""
        if self.val(i) is None:
            return
        # Прямой обход
        if order == "pre":
            self.res.append(self.val(i))
        self.dfs(self.left(i), order)
        # Симметричный обход
        if order == "in":
            self.res.append(self.val(i))
        self.dfs(self.right(i), order)
        # Обратный обход
        if order == "post":
            self.res.append(self.val(i))

    def pre_order(self) -> list[int]:
        """Прямой обход"""
        self.res = []
        self.dfs(0, order="pre")
        return self.res

    def in_order(self) -> list[int]:
        """Симметричный обход"""
        self.res = []
        self.dfs(0, order="in")
        return self.res

    def post_order(self) -> list[int]:
        """Обратный обход"""
        self.res = []
        self.dfs(0, order="post")
        return self.res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двоичного дерева
    # Используем функцию, которая строит двоичное дерево непосредственно из массива
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\nИнициализация двоичного дерева\n")
    print("Двоичное дерево в виде массива:")
    print(arr)
    print("Связное представление двоичного дерева:")
    print_tree(root)

    # Класс двоичного дерева на основе массива
    abt = ArrayBinaryTree(arr)

    # Доступ к узлу
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\nИндекс текущего узла: {i}, значение: {abt.val(i)}")
    print(f"Индекс левого потомка: {l}, значение: {abt.val(l)}")
    print(f"Индекс правого потомка: {r}, значение: {abt.val(r)}")
    print(f"Индекс родителя: {p}, значение: {abt.val(p)}")

    # Обход дерева
    res = abt.level_order()
    print("\nОбход по уровням:", res)
    res = abt.pre_order()
    print("Прямой обход:", res)
    res = abt.in_order()
    print("Симметричный обход:", res)
    res = abt.post_order()
    print("Обратный обход:", res)
