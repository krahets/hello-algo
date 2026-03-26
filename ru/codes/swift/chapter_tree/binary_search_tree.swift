/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* двоичное дерево поиска */
class BinarySearchTree {
    private var root: TreeNode?

    /* Конструктор */
    init() {
        // Инициализировать пустое дерево
        root = nil
    }

    /* Получить корневой узел двоичного дерева */
    func getRoot() -> TreeNode? {
        root
    }

    /* Найти узел */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while cur != nil {
            // Целевой узел находится в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Целевой узел находится в левом поддереве cur
            else if cur!.val > num {
                cur = cur?.left
            }
            // Найти целевой узел и выйти из цикла
            else {
                break
            }
        }
        // Вернуть целевой узел
        return cur
    }

    /* Вставить узел */
    func insert(num: Int) {
        // Если дерево пусто, инициализировать корневой узел
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while cur != nil {
            // Найти дублирующийся узел и сразу вернуть результат
            if cur!.val == num {
                return
            }
            pre = cur
            // Позиция вставки находится в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Позиция вставки находится в левом поддереве cur
            else {
                cur = cur?.left
            }
        }
        // Вставить узел
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* Удалить узел */
    func remove(num: Int) {
        // Если дерево пусто, сразу вернуть результат
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while cur != nil {
            // Найти узел для удаления и выйти из цикла
            if cur!.val == num {
                break
            }
            pre = cur
            // Удаляемый узел находится в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Удаляемый узел находится в левом поддереве cur
            else {
                cur = cur?.left
            }
        }
        // Если узла для удаления нет, сразу вернуть результат
        if cur == nil {
            return
        }
        // Число дочерних узлов = 0 или 1
        if cur?.left == nil || cur?.right == nil {
            // Когда число дочерних узлов равно 0 / 1, child = null / этот дочерний узел
            let child = cur?.left ?? cur?.right
            // Удалить узел cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // Если удаляемый узел является корневым, заново назначить корневой узел
                root = child
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // Рекурсивно удалить узел tmp
            remove(num: tmp!.val)
            // Заменить cur значением tmp
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* Driver Code */
    static func main() {
        /* Инициализировать двоичное дерево поиска */
        let bst = BinarySearchTree()
        // Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\nИнициализированное двоичное дерево:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Найти узел */
        let node = bst.search(num: 7)
        print("\nНайденныйузелобъектравно \(node!), значение узла = \(node!.val)")

        /* Вставить узел */
        bst.insert(num: 16)
        print("\nПосле вставки узла 16 двоичное дерево имеет вид\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Удалить узел */
        bst.remove(num: 1)
        print("\nПосле удаления узла 1 двоичное дерево имеет вид\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nПосле удаления узла 2 двоичное дерево имеет вид\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nПосле удаления узла 4 двоичное дерево имеет вид\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
