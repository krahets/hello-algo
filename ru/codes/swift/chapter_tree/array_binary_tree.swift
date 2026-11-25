/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Класс двоичного дерева на основе массива */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* Конструктор */
    init(arr: [Int?]) {
        tree = arr
    }

    /* Ёмкость списка */
    func size() -> Int {
        tree.count
    }

    /* Получить значение узла с индексом i */
    func val(i: Int) -> Int? {
        // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* Получить индекс левого потомка узла с индексом i */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Получить индекс правого потомка узла с индексом i */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Получить индекс родителя узла с индексом i */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* Обход по уровням */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // Пройти непосредственно по массиву
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* Обход в глубину */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // Если позиция пуста, завершить вызов
        guard let val = val(i: i) else {
            return
        }
        // Прямой обход
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

    /* Прямой обход */
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
    /* Основная программа */
    static func main() {
        // Инициализация двоичного дерева
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\nИнициализация двоичного дерева\n")
        print("Двоичное дерево в виде массива:")
        print(arr)
        print("Связное представление двоичного дерева:")
        PrintUtil.printTree(root: root)

        // Класс двоичного дерева на основе массива
        let abt = ArrayBinaryTree(arr: arr)

        // Доступ к узлу
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\nИндекс текущего узла: \(i), значение: \(abt.val(i: i) as Any)")
        print("Индекс левого потомка: \(l), значение: \(abt.val(i: l) as Any)")
        print("Индекс правого потомка: \(r), значение: \(abt.val(i: r) as Any)")
        print("Индекс родителя: \(p), значение: \(abt.val(i: p) as Any)")

        // Обход дерева
        var res = abt.levelOrder()
        print("\nОбход по уровням: \(res)")
        res = abt.preOrder()
        print("Прямой обход: \(res)")
        res = abt.inOrder()
        print("Симметричный обход: \(res)")
        res = abt.postOrder()
        print("Обратный обход: \(res)")
    }
}
