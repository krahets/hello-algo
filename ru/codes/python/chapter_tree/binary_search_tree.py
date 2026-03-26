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
    """двоичное дерево поиска"""

    def __init__(self):
        """Конструктор"""
        # Инициализировать пустое дерево
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Получить корневой узел двоичного дерева"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """Найти узел"""
        cur = self._root
        # Выполнять поиск в цикле и выйти после прохождения листового узла
        while cur is not None:
            # Целевой узел находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Целевой узел находится в левом поддереве cur
            elif cur.val > num:
                cur = cur.left
            # Найти целевой узел и выйти из цикла
            else:
                break
        return cur

    def insert(self, num: int):
        """Вставить узел"""
        # Если дерево пусто, инициализировать корневой узел
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Выполнять поиск в цикле и выйти после прохождения листового узла
        cur, pre = self._root, None
        while cur is not None:
            # Найти дублирующийся узел и сразу вернуть результат
            if cur.val == num:
                return
            pre = cur
            # Позиция вставки находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Позиция вставки находится в левом поддереве cur
            else:
                cur = cur.left
        # Вставить узел
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """Удалить узел"""
        # Если дерево пусто, сразу вернуть результат
        if self._root is None:
            return
        # Выполнять поиск в цикле и выйти после прохождения листового узла
        cur, pre = self._root, None
        while cur is not None:
            # Найти узел для удаления и выйти из цикла
            if cur.val == num:
                break
            pre = cur
            # Удаляемый узел находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Удаляемый узел находится в левом поддереве cur
            else:
                cur = cur.left
        # Если узла для удаления нет, сразу вернуть результат
        if cur is None:
            return

        # Число дочерних узлов = 0 или 1
        if cur.left is None or cur.right is None:
            # Когда число дочерних узлов равно 0 / 1, child = null / этот дочерний узел
            child = cur.left or cur.right
            # Удалить узел cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # Если удаляемый узел является корневым, заново назначить корневой узел
                self._root = child
        # Число дочерних узлов = 2
        else:
            # Получить следующий узел после cur в симметричном обходе
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Рекурсивно удалить узел tmp
            self.remove(tmp.val)
            # Заменить cur значением tmp
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать двоичное дерево поиска
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
    for num in nums:
        bst.insert(num)
    print("\nИнициализированное двоичное дерево имеет вид\n")
    print_tree(bst.get_root())

    # Найти узел
    node = bst.search(7)
    print("\nНайденный объект узла: {}, значение узла = {}".format(node, node.val))

    # Вставить узел
    bst.insert(16)
    print("\nПосле вставки узла 16 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())

    # Удалить узел
    bst.remove(1)
    print("\nПосле удаления узла 1 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nПосле удаления узла 2 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nПосле удаления узла 4 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())
