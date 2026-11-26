"""
File: avl_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class AVLTree:
    """АВЛ-дерево"""

    def __init__(self):
        """Конструктор"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Получить корень двоичного дерева"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """Получить высоту узла"""
        # Высота пустого узла равна -1, высота листа равна 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """Обновить высоту узла"""
        # Высота узла на 1 больше высоты самого высокого поддерева
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """Получить коэффициент баланса"""
        # Коэффициент баланса пустого узла равен 0
        if node is None:
            return 0
        # Коэффициент баланса узла равен высоте левого поддерева минус высота правого
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Правый поворот"""
        child = node.left
        grand_child = child.right
        # Повернуть node вправо вокруг child
        child.right = node
        node.left = grand_child
        # Обновить высоту узла
        self.update_height(node)
        self.update_height(child)
        # Вернуть корень поддерева после поворота
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Левый поворот"""
        child = node.right
        grand_child = child.left
        # Повернуть node влево вокруг child
        child.left = node
        node.right = grand_child
        # Обновить высоту узла
        self.update_height(node)
        self.update_height(child)
        # Вернуть корень поддерева после поворота
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Выполнить поворот, чтобы восстановить баланс поддерева"""
        # Получить коэффициент баланса узла node
        balance_factor = self.balance_factor(node)
        # Перевес влево
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # Поворот вправо
                return self.right_rotate(node)
            else:
                # Сначала поворот влево, затем вправо
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # Перевес вправо
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # Поворот влево
                return self.left_rotate(node)
            else:
                # Сначала поворот вправо, затем влево
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # Дерево сбалансировано: завершить вызов без поворота
        return node

    def insert(self, val):
        """Вставка узла"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """Рекурсивная вставка узла (вспомогательный метод)"""
        if node is None:
            return TreeNode(val)
        # 1. Найти место вставки и вставить узел
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # Такой узел уже есть: завершить вызов без вставки
            return node
        # Обновить высоту узла
        self.update_height(node)
        # 2. Восстановить баланс поддерева с помощью поворота
        return self.rotate(node)

    def remove(self, val: int):
        """Удаление узла"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """Рекурсивное удаление узла (вспомогательный метод)"""
        if node is None:
            return None
        # 1. Найти и удалить узел
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # Нет потомков: удалить node и завершить вызов
                if child is None:
                    return None
                # Один потомок: удалить node
                else:
                    node = child
            else:
                # Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # Обновить высоту узла
        self.update_height(node)
        # 2. Восстановить баланс поддерева с помощью поворота
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """Поиск узла"""
        cur = self._root
        # Искать в цикле до выхода за пределы листа
        while cur is not None:
            # Искомый узел в правом поддереве cur
            if cur.val < val:
                cur = cur.right
            # Искомый узел в левом поддереве cur
            elif cur.val > val:
                cur = cur.left
            # Узел найден: выйти из цикла
            else:
                break
        # Вернуть искомый узел
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\nАВЛ-дерево после вставки узла {}:".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\nАВЛ-дерево после удаления узла {}:".format(val))
        print_tree(tree.get_root())

    # Инициализация пустого АВЛ-дерева
    avl_tree = AVLTree()

    # Вставка узла
    # Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # Вставка повторяющегося узла
    test_insert(avl_tree, 7)

    # Удаление узла
    # Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
    test_remove(avl_tree, 8)  # Удаление узла без потомков
    test_remove(avl_tree, 5)  # Удаление узла с одним потомком
    test_remove(avl_tree, 4)  # Удаление узла с двумя потомками

    result_node = avl_tree.search(7)
    print("\nНайденный узел: {}, значение узла = {}".format(result_node, result_node.val))
