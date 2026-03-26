/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL-дерево */
class AVLTree {
    fileprivate var root: TreeNode? // корневой узел

    init() {}

    /* Получить высоту узла */
    func height(node: TreeNode?) -> Int {
        // Высота пустого узла равна -1, а высота листа равна 0
        node?.height ?? -1
    }

    /* Обновить высоту узла */
    private func updateHeight(node: TreeNode?) {
        // Высота узла равна высоте более высокого поддерева + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* Получить коэффициент баланса */
    func balanceFactor(node: TreeNode?) -> Int {
        // Баланс-фактор пустого узла равен 0
        guard let node = node else { return 0 }
        // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
        return height(node: node.left) - height(node: node.right)
    }

    /* Операция правого поворота */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Используя child как опорную точку, выполнить правый поворот node
        child?.right = node
        node?.left = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Операция левого поворота */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Используя child как опорную точку, выполнить левый поворот node
        child?.left = node
        node?.right = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Выполнить поворот, чтобы восстановить баланс этого поддерева */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // Получить коэффициент баланса узла node
        let balanceFactor = balanceFactor(node: node)
        // Левосторонне перекошенное дерево
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Правый поворот
                return rightRotate(node: node)
            } else {
                // Сначала выполнить левый поворот, затем правый
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Правосторонне перекошенное дерево
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Левый поворот
                return leftRotate(node: node)
            } else {
                // Сначала выполнить правый поворот, затем левый
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
        return node
    }

    /* Вставить узел */
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
            return node // Дублирующийся узел не вставлять, сразу вернуть результат
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = rotate(node: node)
        // Вернуть корневой узел поддерева
        return node
    }

    /* Удалить узел */
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
                // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
                if child == nil {
                    return nil
                }
                // Если число дочерних узлов равно 1, сразу удалить node
                else {
                    node = child
                }
            } else {
                // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = rotate(node: node)
        // Вернуть корневой узел поддерева
        return node
    }

    /* Найти узел */
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
        /* Инициализировать пустое AVL-дерево */
        let avlTree = AVLTree()

        /* Вставить узел */
        // Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
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

        /* Вставить повторяющийся узел */
        testInsert(tree: avlTree, val: 7)

        /* Удалить узел */
        // Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
        testRemove(tree: avlTree, val: 8) // Удалить узел степени 0
        testRemove(tree: avlTree, val: 5) // Удалить узел степени 1
        testRemove(tree: avlTree, val: 4) // Удалить узел степени 2

        /* Найти узел */
        let node = avlTree.search(val: 7)
        print("\nНайденный объект узла равен \(node!), значение узла = \(node!.val)")
    }
}
