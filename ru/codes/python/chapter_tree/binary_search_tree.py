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
        # Инициализировать пустое дерево
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Получить корневой узел двоичного дерева"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """Поиск узла"""
        cur = self._root
        # Искать в цикле и выйти после прохода за листовой узел
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
        """Вставка узла"""
        # Если дерево пусто, инициализировать корневой узел
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Искать в цикле и выйти после прохода за листовой узел
        cur, pre = self._root, None
        while cur is not None:
            # Найти повторяющийся узел и сразу вернуть
            if cur.val == num:
                return
            pre = cur
            # Позиция вставки находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Позиция вставки находится в левом поддереве cur
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
        # Если дерево пусто, сразу вернуть
        if self._root is None:
            return
        # Искать в цикле и выйти после прохода за листовой узел
        cur, pre = self._root, None
        while cur is not None:
            # Найти узел для удаления и выйти из цикла
            if cur.val == num:
                break
            pre = cur
            # Узел для удаления находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Узел для удаления находится в левом поддереве cur
            else:
                cur = cur.left
        # Если узел для удаления отсутствует, сразу вернуть
        if cur is None:
            return

        # Число дочерних узлов = 0 или 1
        if cur.left is None or cur.right is None:
            # Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            child = cur.left or cur.right
            # Удалить узел cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # Если удаляемый узел является корнем, заново назначить корневой узел
                self._root = child
        # Число дочерних узлов = 2
        else:
            # Получить следующий узел после cur в симметричном обходе
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Рекурсивно удалить узел tmp
            self.remove(tmp.val)
            # Перезаписать cur значением tmp
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двоичного дерева поиска
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
    for num in nums:
        bst.insert(num)
    print("\nИсходное двоичное дерево\n")
    print_tree(bst.get_root())

    # Поиск узла
    node = bst.search(7)
    print("\nНайденный объект узла = {}, значение узла = {}".format(node, node.val))

    # Вставка узла
    bst.insert(16)
    print("\nПосле вставки узла 16 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())

    # Удаление узла
    bst.remove(1)
    print("\nПосле удаления узла 1 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nПосле удаления узла 2 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nПосле удаления узла 4 двоичное дерево имеет вид\n")
    print_tree(bst.get_root())
