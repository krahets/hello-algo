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
    """Класс двоичного дерева в массивном представлении"""

    def __init__(self, arr: list[int | None]):
        """Конструктор"""
        self._tree = list(arr)

    def size(self):
        """Вместимость списка"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """Получить значение узла с индексом i"""
        # Если индекс выходит за границы, вернуть None, обозначающий пустую позицию
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """Получить индекс левого дочернего узла узла с индексом i"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """Получить индекс правого дочернего узла узла с индексом i"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """Получить индекс родительского узла узла с индексом i"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """Обход в ширину"""
        self.res = []
        # Непосредственно обходить массив
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """Обход в глубину"""
        if self.val(i) is None:
            return
        # Предварительный обход
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
        """Предварительный обход"""
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
    # Инициализировать двоичное дерево
    # Здесь используется функция, напрямую строящая двоичное дерево из массива
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\nИнициализация двоичного дерева\n")
    print("Массивное представление двоичного дерева:")
    print(arr)
    print("Связное представление двоичного дерева:")
    print_tree(root)

    # Класс двоичного дерева в массивном представлении
    abt = ArrayBinaryTree(arr)

    # Доступ к узлу
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\nТекущий узел: индекс = {i}, значение = {abt.val(i)}")
    print(f"Индекс левого дочернего узла = {l}, значение = {abt.val(l)}")
    print(f"Индекс правого дочернего узла = {r}, значение = {abt.val(r)}")
    print(f"Индекс родительского узла = {p}, значение = {abt.val(p)}")

    # Обходить дерево
    res = abt.level_order()
    print("\nОбход в ширину:", res)
    res = abt.pre_order()
    print("Предварительный обход:", res)
    res = abt.in_order()
    print("Симметричный обход:", res)
    res = abt.post_order()
    print("Обратный обход:", res)
