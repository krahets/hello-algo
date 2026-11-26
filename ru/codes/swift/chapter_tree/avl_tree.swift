/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* АВЛ-дерево */
class AVLTree {
    fileprivate var root: TreeNode? // Корень

    init() {}

    /* Получить высоту узла */
    func height(node: TreeNode?) -> Int {
        // Высота пустого узла равна -1, высота листа равна 0
        node?.height ?? -1
    }

    /* Обновить высоту узла */
    private func updateHeight(node: TreeNode?) {
        // Высота узла на 1 больше высоты самого высокого поддерева
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* Получить коэффициент баланса */
    func balanceFactor(node: TreeNode?) -> Int {
        // Коэффициент баланса пустого узла равен 0
        guard let node = node else { return 0 }
        // Коэффициент баланса узла равен высоте левого поддерева минус высота правого
        return height(node: node.left) - height(node: node.right)
    }

    /* Правый поворот */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Повернуть node вправо вокруг child
        child?.right = node
        node?.left = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корень поддерева после поворота
        return child
    }

    /* Левый поворот */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Повернуть node влево вокруг child
        child?.left = node
        node?.right = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корень поддерева после поворота
        return child
    }

    /* Выполнить поворот, чтобы восстановить баланс поддерева */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // Получить коэффициент баланса узла node
        let balanceFactor = balanceFactor(node: node)
        // Перевес влево
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Поворот вправо
                return rightRotate(node: node)
            } else {
                // Сначала поворот влево, затем вправо
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Перевес вправо
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Поворот влево
                return leftRotate(node: node)
            } else {
                // Сначала поворот вправо, затем влево
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // Дерево сбалансировано: завершить вызов без поворота
        return node
    }

    /* Вставка узла */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. Найти место вставки и вставить узел */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // Такой узел уже есть: завершить вызов без вставки
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = rotate(node: node)
        // Вернуть корень поддерева
        return node
    }

    /* Удаление узла */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. Найти и удалить узел */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // Нет потомков: удалить node и завершить вызов
                if child == nil {
                    return nil
                }
                // Один потомок: удалить node
                else {
                    node = child
                }
            } else {
                // Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = rotate(node: node)
        // Вернуть корень поддерева
        return node
    }

    /* Поиск узла */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // Искомый узел в правом поддереве cur
            if cur!.val < val {
                cur = cur?.right
            }
            // Искомый узел в левом поддереве cur
            else if cur!.val > val {
                cur = cur?.left
            }
            // Узел найден: выйти из цикла
            else {
                break
            }
        }
        // Вернуть искомый узел
        return cur
    }
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\nАВЛ-дерево после вставки узла \(val):")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\nАВЛ-дерево после удаления узла \(val):")
        PrintUtil.printTree(root: tree.root)
    }

    /* Основная программа */
    static func main() {
        /* Инициализация пустого АВЛ-дерева */
        let avlTree = AVLTree()

        /* Вставка узла */
        // Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
        testInsert(tree: avlTree, val: 1)
        testInsert(tree: avlTree, val: 2)
        testInsert(tree: avlTree, val: 3)
        testInsert(tree: avlTree, val: 4)
        testInsert(tree: avlTree, val: 5)
        testInsert(tree: avlTree, val: 8)
        testInsert(tree: avlTree, val: 7)
        testInsert(tree: avlTree, val: 9)
        testInsert(tree: avlTree, val: 10)
        testInsert(tree: avlTree, val: 6)

        /* Вставка повторяющегося узла */
        testInsert(tree: avlTree, val: 7)

        /* Удаление узла */
        // Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
        testRemove(tree: avlTree, val: 8) // Удаление узла без потомков
        testRemove(tree: avlTree, val: 5) // Удаление узла с одним потомком
        testRemove(tree: avlTree, val: 4) // Удаление узла с двумя потомками

        /* Поиск узла */
        let node = avlTree.search(val: 7)
        print("\nНайденный узел: \(node!), значение узла = \(node!.val)")
    }
}
