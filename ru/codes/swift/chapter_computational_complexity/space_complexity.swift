/**
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Функция */
@discardableResult
func function() -> Int {
    // Выполнить некоторые операции
    return 0
}

/* Константная сложность */
func constant(n: Int) {
    // Константы, переменные и объекты занимают O(1) памяти
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // Переменные в цикле занимают O(1) памяти
    for _ in 0 ..< n {
        let c = 0
    }
    // Функция в цикле занимает O(1) памяти
    for _ in 0 ..< n {
        function()
    }
}

/* Линейная сложность */
func linear(n: Int) {
    // Массив длины n занимает пространство O(n)
    let nums = Array(repeating: 0, count: n)
    // Список длины n занимает пространство O(n)
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // Хеш-таблица длины n занимает пространство O(n)
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* Линейная сложность (рекурсивная реализация) */
func linearRecur(n: Int) {
    print("рекурсия n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* Квадратичная сложность */
func quadratic(n: Int) {
    // Двумерный список занимает пространство O(n^2)
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* Квадратичная сложность (рекурсивная реализация) */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // массив nums длинаравно n, n-1,..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("рекурсия n = \(n) в nums длина = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
func buildTree(n: Int) -> TreeNode? {
    if n == 0 {
        return nil
    }
    let root = TreeNode(x: 0)
    root.left = buildTree(n: n - 1)
    root.right = buildTree(n: n - 1)
    return root
}

@main
enum SpaceComplexity {
    /* Driver Code */
    static func main() {
        let n = 5
        // Константная сложность
        constant(n: n)
        // Линейная сложность
        linear(n: n)
        linearRecur(n: n)
        // Квадратичная сложность
        quadratic(n: n)
        quadraticRecur(n: n)
        // Экспоненциальная сложность
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
