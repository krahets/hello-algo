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
        # Если индекс выходит за границы, вернуть None, обозначающий пустую клетку
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
        """Обход по уровням"""
        self.res = []
        # Непосредственно обойти массив
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
    # Инициализировать двоичное дерево
    # Здесь используется функция, которая напрямую строит двоичное дерево из массива
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\nИнициализируем двоичное дерево\n")
    print("Массивное представление двоичного дерева:")
    print(arr)
    print("Связное представление двоичного дерева:")
    print_tree(root)

    # Класс двоичного дерева в массивном представлении
    abt = ArrayBinaryTree(arr)

    # Получить доступ к узлу
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\nИндекс текущего узла равен {i}, значение равно {abt.val(i)}")
    print(f"Индекс его левого дочернего узла равен {l}, значение равно {abt.val(l)}")
    print(f"Индекс его правого дочернего узла равен {r}, значение равно {abt.val(r)}")
    print(f"Индекс его родительского узла равен {p}, значение равно {abt.val(p)}")

    # Обойти дерево
    res = abt.level_order()
    print("\nРезультат обхода по уровням: ", res)
    res = abt.pre_order()
    print("прямой обходравно:", res)
    res = abt.in_order()
    print("Симметричный обход: ", res)
    res = abt.post_order()
    print("обратный обходравно:", res)
