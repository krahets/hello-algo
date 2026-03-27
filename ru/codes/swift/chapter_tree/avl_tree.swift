/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL-дерево */
class AVLTree {
    fileprivate var root: TreeNode? // Корневой узел

    init() {}

    /* Получить высоту узла */
    func height(node: TreeNode?) -> Int {
        // Высота пустого узла равна -1, высота листового узла равна 0
        node?.height ?? -1
    }

    /* Обновить высоту узла */
    private func updateHeight(node: TreeNode?) {
        // Высота узла равна высоте более высокого поддерева + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* Получить коэффициент баланса */
    func balanceFactor(node: TreeNode?) -> Int {
        // Коэффициент баланса пустого узла равен 0
        guard let node = node else { return 0 }
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node: node.left) - height(node: node.right)
    }

    /* Операция правого вращения */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Выполнить правое вращение узла node вокруг child
        child?.right = node
        node?.left = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Операция левого вращения */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Выполнить левое вращение узла node вокруг child
        child?.left = node
        node?.right = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // Получить коэффициент баланса узла node
        let balanceFactor = balanceFactor(node: node)
        // Левосторонне перекошенное дерево
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Правое вращение
                return rightRotate(node: node)
            } else {
                // Сначала левое вращение, затем правое
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Правосторонне перекошенное дерево
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Левое вращение
                return leftRotate(node: node)
            } else {
                // Сначала правое вращение, затем левое
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
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
        /* 1. Найти позицию вставки и вставить узел */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // Повторяющийся узел не вставлять, сразу вернуть
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node: node)
        // Вернуть корневой узел поддерева
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
        /* 1. Найти узел и удалить его */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if child == nil {
                    return nil
                }
                // Число дочерних узлов = 1, удалить node напрямую
                else {
                    node = child
                }
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node: node)
        // Вернуть корневой узел поддерева
        return node
    }

    /* Поиск узла */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // Целевой узел находится в правом поддереве cur
            if cur!.val < val {
                cur = cur?.right
            }
            // Целевой узел находится в левом поддереве cur
            else if cur!.val > val {
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
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\nПосле вставки узла \(val) AVL-дерево имеет вид")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\nПосле удаления узла \(val) AVL-дерево имеет вид")
        PrintUtil.printTree(root: tree.root)
    }

    /* Driver Code */
    static func main() {
        /* Инициализация пустого AVL-дерева */
        let avlTree = AVLTree()

        /* Вставка узла */
        // Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
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
        // Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
        testRemove(tree: avlTree, val: 8) // Удаление узла степени 0
        testRemove(tree: avlTree, val: 5) // Удаление узла степени 1
        testRemove(tree: avlTree, val: 4) // Удаление узла степени 2

        /* Поиск узла */
        let node = avlTree.search(val: 7)
        print("\nНайденный объект узла = \(node!), значение узла = \(node!.val)")
    }
}
