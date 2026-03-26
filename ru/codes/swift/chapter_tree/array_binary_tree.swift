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
        // Если индекс выходит за границы, вернуть null, обозначающий пустую клетку
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

    /* Обход по уровням */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // Непосредственно обойти массив
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* Обход в глубину */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // Если это пустая клетка, вернуть результат
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
    /* Driver Code */
    static func main() {
        // Инициализировать двоичное дерево
        // Здесь используется функция, которая напрямую строит двоичное дерево из массива
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\nИнициализировать двоичное дерево\n")
        print("Массивное представление двоичного дерева:")
        print(arr)
        print("Связное представление двоичного дерева:")
        PrintUtil.printTree(root: root)

        // Класс двоичного дерева в массивном представлении
        let abt = ArrayBinaryTree(arr: arr)

        // Получить доступ к узлу
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\nИндекс текущего узла равен \(i), значение равно \(abt.val(i: i) as Any)")
        print("Индекс его левого дочернего узла равен \(l), значение равно \(abt.val(i: l) as Any)")
        print("Индекс его правого дочернего узла равен \(r), значение равно \(abt.val(i: r) as Any)")
        print("Индекс его родительского узла равен \(p), значение равно \(abt.val(i: p) as Any)")

        // Обойти дерево
        var res = abt.levelOrder()
        print("\nобход по уровнямравно: \(res)")
        res = abt.preOrder()
        print("прямой обходравно: \(res)")
        res = abt.inOrder()
        print("симметричный обходравно: \(res)")
        res = abt.postOrder()
        print("обратный обходравно: \(res)")
    }
}
