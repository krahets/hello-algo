/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Класс двоичного дерева в массивном представлении */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* Конструктор */
    init(arr: [Int?]) {
        tree = arr
    }

    /* Вместимость списка */
    func size() -> Int {
        tree.count
    }

    /* Получить значение узла с индексом i */
    func val(i: Int) -> Int? {
        // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* Получить индекс левого дочернего узла узла с индексом i */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Получить индекс правого дочернего узла узла с индексом i */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Получить индекс родительского узла узла с индексом i */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* Обход в ширину */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // Непосредственно обходить массив
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* Обход в глубину */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // Если это пустая позиция, вернуть
        guard let val = val(i: i) else {
            return
        }
        // Предварительный обход
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // Симметричный обход
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // Обратный обход
        if order == "post" {
            res.append(val)
        }
    }

    /* Предварительный обход */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* Симметричный обход */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* Обратный обход */
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

@main
enum _ArrayBinaryTree {
    /* Driver Code */
    static func main() {
        // Инициализировать двоичное дерево
        // Здесь используется функция, напрямую строящая двоичное дерево из массива
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\nИнициализация двоичного дерева\n")
        print("Массивное представление двоичного дерева:")
        print(arr)
        print("Связное представление двоичного дерева:")
        PrintUtil.printTree(root: root)

        // Класс двоичного дерева в массивном представлении
        let abt = ArrayBinaryTree(arr: arr)

        // Доступ к узлу
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\nТекущий узел: индекс = \(i), значение = \(abt.val(i: i) as Any)")
        print("Индекс левого дочернего узла = \(l), значение = \(abt.val(i: l) as Any)")
        print("Индекс правого дочернего узла = \(r), значение = \(abt.val(i: r) as Any)")
        print("Индекс родительского узла = \(p), значение = \(abt.val(i: p) as Any)")

        // Обходить дерево
        var res = abt.levelOrder()
        print("\nОбход в ширину: \(res)")
        res = abt.preOrder()
        print("Предварительный обход: \(res)")
        res = abt.inOrder()
        print("Симметричный обход: \(res)")
        res = abt.postOrder()
        print("Обратный обход: \(res)")
    }
}
