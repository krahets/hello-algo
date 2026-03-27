/**
 * File: space_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.space_complexity

import utils.ListNode
import utils.TreeNode
import utils.printTree

/* Функция */
fun function(): Int {
    // Выполнить некоторые операции
    return 0
}

/* Постоянная сложность */
fun constant(n: Int) {
    // Константы, переменные и объекты занимают O(1) памяти
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // Переменные в цикле занимают O(1) памяти
    for (i in 0..<n) {
        val c = 0
    }
    // Функции в цикле занимают O(1) памяти
    for (i in 0..<n) {
        function()
    }
}

/* Линейная сложность */
fun linear(n: Int) {
    // Массив длины n занимает O(n) памяти
    val nums = Array(n) { 0 }
    // Список длины n занимает O(n) памяти
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // Хеш-таблица длины n занимает O(n) памяти
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* Линейная сложность (рекурсивная реализация) */
fun linearRecur(n: Int) {
    println("Рекурсия n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* Квадратичная сложность */
fun quadratic(n: Int) {
    // Матрица занимает O(n^2) памяти
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // Двумерный список занимает O(n^2) памяти
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* Квадратичная сложность (рекурсивная реализация) */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // Длина массива nums равна n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("В рекурсии n = $n длина nums = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
fun buildTree(n: Int): TreeNode? {
    if (n == 0)
        return null
    val root = TreeNode(0)
    root.left = buildTree(n - 1)
    root.right = buildTree(n - 1)
    return root
}

/* Driver Code */
fun main() {
    val n = 5
    // Постоянная сложность
    constant(n)
    // Линейная сложность
    linear(n)
    linearRecur(n)
    // Квадратичная сложность
    quadratic(n)
    quadraticRecur(n)
    // Экспоненциальная сложность
    val root = buildTree(n)
    printTree(root)
}