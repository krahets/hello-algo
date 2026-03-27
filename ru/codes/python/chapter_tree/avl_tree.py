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
    """AVL-дерево"""

    def __init__(self):
        """Конструктор"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """Получить корневой узел двоичного дерева"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """Получить высоту узла"""
        # Высота пустого узла равна -1, высота листового узла равна 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """Обновить высоту узла"""
        # Высота узла равна высоте более высокого поддерева + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """Получить коэффициент баланса"""
        # Коэффициент баланса пустого узла равен 0
        if node is None:
            return 0
        # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Операция правого вращения"""
        child = node.left
        grand_child = child.right
        # Выполнить правое вращение узла node вокруг child
        child.right = node
        node.left = grand_child
        # Обновить высоту узла
        self.update_height(node)
        self.update_height(child)
        # Вернуть корневой узел поддерева после вращения
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Операция левого вращения"""
        child = node.right
        grand_child = child.left
        # Выполнить левое вращение узла node вокруг child
        child.left = node
        node.right = grand_child
        # Обновить высоту узла
        self.update_height(node)
        self.update_height(child)
        # Вернуть корневой узел поддерева после вращения
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Выполнить вращение, чтобы снова сбалансировать поддерево"""
        # Получить коэффициент баланса узла node
        balance_factor = self.balance_factor(node)
        # Левосторонне перекошенное дерево
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # Правое вращение
                return self.right_rotate(node)
            else:
                # Сначала левое вращение, затем правое
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # Правосторонне перекошенное дерево
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # Левое вращение
                return self.left_rotate(node)
            else:
                # Сначала правое вращение, затем левое
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node

    def insert(self, val):
        """Вставка узла"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """Рекурсивная вставка узла (вспомогательный метод)"""
        if node is None:
            return TreeNode(val)
        # 1. Найти позицию вставки и вставить узел
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # Повторяющийся узел не вставлять, сразу вернуть
            return node
        # Обновить высоту узла
        self.update_height(node)
        # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
        return self.rotate(node)

    def remove(self, val: int):
        """Удаление узла"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """Рекурсивное удаление узла (вспомогательный метод)"""
        if node is None:
            return None
        # 1. Найти узел и удалить его
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # Число дочерних узлов = 0, удалить node и сразу вернуть
                if child is None:
                    return None
                # Число дочерних узлов = 1, удалить node напрямую
                else:
                    node = child
            else:
                # Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # Обновить высоту узла
        self.update_height(node)
        # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """Поиск узла"""
        cur = self._root
        # Искать в цикле и выйти после прохода за листовой узел
        while cur is not None:
            # Целевой узел находится в правом поддереве cur
            if cur.val < val:
                cur = cur.right
            # Целевой узел находится в левом поддереве cur
            elif cur.val > val:
                cur = cur.left
            # Найти целевой узел и выйти из цикла
            else:
                break
        # Вернуть целевой узел
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\nПосле вставки узла {} AVL-дерево имеет вид".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\nПосле удаления узла {} AVL-дерево имеет вид".format(val))
        print_tree(tree.get_root())

    # Инициализация пустого AVL-дерева
    avl_tree = AVLTree()

    # Вставка узла
    # Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # Вставка повторяющегося узла
    test_insert(avl_tree, 7)

    # Удаление узла
    # Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
    test_remove(avl_tree, 8)  # Удаление узла степени 0
    test_remove(avl_tree, 5)  # Удаление узла степени 1
    test_remove(avl_tree, 4)  # Удаление узла степени 2

    result_node = avl_tree.search(7)
    print("\nНайденный объект узла = {}, значение узла = {}".format(result_node, result_node.val))
