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

/* Константная сложность */
fun constant(n: Int) {
    // Константы, переменные и объекты занимают O(1) памяти
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // Переменные цикла занимают O(1) памяти
    for (i in 0..<n) {
        val c = 0
    }
    // Вызовы функции в цикле требуют O(1) памяти
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
    // Хеш-таблица из n элементов занимает O(n) памяти
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* Линейная сложность (рекурсия) */
fun linearRecur(n: Int) {
    println("Рекурсивный вызов: n = $n")
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

/* Квадратичная сложность (рекурсия) */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // Длина массива nums принимает значения n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("При n = $n длина nums = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* Экспоненциальная сложность (построение совершенного двоичного дерева) */
fun buildTree(n: Int): TreeNode? {
    if (n == 0)
        return null
    val root = TreeNode(0)
    root.left = buildTree(n - 1)
    root.right = buildTree(n - 1)
    return root
}

/* Основная программа */
fun main() {
    val n = 5
    // Константная сложность
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