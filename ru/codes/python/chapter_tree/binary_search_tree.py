"""
File: binary_search_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class BinarySearchTree:
    """Двоичное дерево поиска"""

    def __init__(self):
        """Конструктор"""
        # Инициализация пустого дерева
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Получить корень двоичного дерева"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """Поиск узла"""
        cur = self._root
        # Искать в цикле до выхода за пределы листа
        while cur is not None:
            # Искомый узел в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Искомый узел в левом поддереве cur
            elif cur.val > num:
                cur = cur.left
            # Узел найден: выйти из цикла
            else:
                break
        return cur

    def insert(self, num: int):
        """Вставка узла"""
        # Если дерево пусто, создать корень
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Искать в цикле до выхода за пределы листа
        cur, pre = self._root, None
        while cur is not None:
            # Такой узел уже есть: завершить вызов
            if cur.val == num:
                return
            pre = cur
            # Место вставки в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Место вставки в левом поддереве cur
            else:
                cur = cur.left
        # Вставка узла
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """Удаление узла"""
        # Если дерево пусто, сразу завершить вызов
        if self._root is None:
            return
        # Искать в цикле до выхода за пределы листа
        cur, pre = self._root, None
        while cur is not None:
            # Узел для удаления найден: выйти из цикла
            if cur.val == num:
                break
            pre = cur
            # Узел для удаления в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Узел для удаления в левом поддереве cur
            else:
                cur = cur.left
        # Если узел для удаления не найден, завершить вызов
        if cur is None:
            return

        # Число потомков равно 0 или 1
        if cur.left is None or cur.right is None:
            # Если потомков нет, child = null, если потомок один, child указывает на него
            child = cur.left or cur.right
            # Удалить узел cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # Если удаляется корень, назначить новый корень
                self._root = child
        # Число потомков равно 2
        else:
            # Найти следующий за cur узел в порядке симметричного обхода
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Рекурсивно удалить узел tmp
            self.remove(tmp.val)
            # Заменить значение cur значением tmp
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двоичного дерева поиска
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
    for num in nums:
        bst.insert(num)
    print("\nИсходное двоичное дерево:\n")
    print_tree(bst.get_root())

    # Поиск узла
    node = bst.search(7)
    print("\nНайденный узел: {}, значение узла = {}".format(node, node.val))

    # Вставка узла
    bst.insert(16)
    print("\nДвоичное дерево после вставки узла 16:\n")
    print_tree(bst.get_root())

    # Удаление узла
    bst.remove(1)
    print("\nДвоичное дерево после удаления узла 1:\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nДвоичное дерево после удаления узла 2:\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nДвоичное дерево после удаления узла 4:\n")
    print_tree(bst.get_root())
