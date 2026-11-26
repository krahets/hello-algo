/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Двоичное дерево поиска */
class BinarySearchTree {
    private var root: TreeNode?

    /* Конструктор */
    init() {
        // Инициализация пустого дерева
        root = nil
    }

    /* Получить корень двоичного дерева */
    func getRoot() -> TreeNode? {
        root
    }

    /* Поиск узла */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Искать в цикле до выхода за пределы листа
        while cur != nil {
            // Искомый узел в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Искомый узел в левом поддереве cur
            else if cur!.val > num {
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

    /* Вставка узла */
    func insert(num: Int) {
        // Если дерево пусто, создать корень
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Искать в цикле до выхода за пределы листа
        while cur != nil {
            // Такой узел уже есть: завершить вызов
            if cur!.val == num {
                return
            }
            pre = cur
            // Место вставки в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Место вставки в левом поддереве cur
            else {
                cur = cur?.left
            }
        }
        // Вставка узла
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* Удаление узла */
    func remove(num: Int) {
        // Если дерево пусто, сразу завершить вызов
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Искать в цикле до выхода за пределы листа
        while cur != nil {
            // Узел для удаления найден: выйти из цикла
            if cur!.val == num {
                break
            }
            pre = cur
            // Узел для удаления в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Узел для удаления в левом поддереве cur
            else {
                cur = cur?.left
            }
        }
        // Если узел для удаления не найден, завершить вызов
        if cur == nil {
            return
        }
        // Число потомков равно 0 или 1
        if cur?.left == nil || cur?.right == nil {
            // Если потомков нет, child = null, если потомок один, child указывает на него
            let child = cur?.left ?? cur?.right
            // Удалить узел cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // Если удаляется корень, назначить новый корень
                root = child
            }
        }
        // Число потомков равно 2
        else {
            // Найти следующий за cur узел в порядке симметричного обхода
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // Рекурсивно удалить узел tmp
            remove(num: tmp!.val)
            // Заменить значение cur значением tmp
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* Основная программа */
    static func main() {
        /* Инициализация двоичного дерева поиска */
        let bst = BinarySearchTree()
        // От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\nИсходное двоичное дерево:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Поиск узла */
        let node = bst.search(num: 7)
        print("\nНайденный узел: \(node!), значение узла = \(node!.val)")

        /* Вставка узла */
        bst.insert(num: 16)
        print("\nДвоичное дерево после вставки узла 16:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Удаление узла */
        bst.remove(num: 1)
        print("\nДвоичное дерево после удаления узла 1:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nДвоичное дерево после удаления узла 2:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nДвоичное дерево после удаления узла 4:\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
