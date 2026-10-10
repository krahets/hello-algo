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
        // Инициализировать пустое дерево
        root = nil
    }

    /* Получить корневой узел двоичного дерева */
    func getRoot() -> TreeNode? {
        root
    }

    /* Поиск узла */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Искать в цикле и выйти после прохода за листовой узел
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

    /* Вставка узла */
    func insert(num: Int) {
        // Если дерево пусто, инициализировать корневой узел
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Искать в цикле и выйти после прохода за листовой узел
        while cur != nil {
            // Найти повторяющийся узел и сразу вернуть
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
        // Если дерево пусто, сразу вернуть
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Искать в цикле и выйти после прохода за листовой узел
        while cur != nil {
            // Найти узел для удаления и выйти из цикла
            if cur!.val == num {
                break
            }
            pre = cur
            // Узел для удаления находится в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Узел для удаления находится в левом поддереве cur
            else {
                cur = cur?.left
            }
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if cur == nil {
            return
        }
        // Число дочерних узлов = 0 или 1
        if cur?.left == nil || cur?.right == nil {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            let child = cur?.left ?? cur?.right
            // Удалить узел cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
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
            // Перезаписать cur значением tmp
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* Driver Code */
    static func main() {
        /* Инициализация двоичного дерева поиска */
        let bst = BinarySearchTree()
        // Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\nИсходное двоичное дерево\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Поиск узла */
        let node = bst.search(num: 7)
        print("\nНайденный объект узла = \(node!), значение узла = \(node!.val)")

        /* Вставка узла */
        bst.insert(num: 16)
        print("\nПосле вставки узла 16 двоичное дерево имеет вид\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Удаление узла */
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
