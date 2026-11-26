/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Класс двоичного дерева на основе массива */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* Ёмкость списка */
    fun size(): Int {
        return tree.size
    }

    /* Получить значение узла с индексом i */
    fun _val(i: Int): Int? {
        // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* Получить индекс левого потомка узла с индексом i */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Получить индекс правого потомка узла с индексом i */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Получить индекс родителя узла с индексом i */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* Обход по уровням */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // Пройти непосредственно по массиву
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* Обход в глубину */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // Если позиция пуста, завершить вызов
        if (_val(i) == null)
            return
        // Прямой обход
        if ("pre" == order)
            res.add(_val(i))
        dfs(left(i), order, res)
        // Симметричный обход
        if ("in" == order)
            res.add(_val(i))
        dfs(right(i), order, res)
        // Обратный обход
        if ("post" == order)
            res.add(_val(i))
    }

    /* Прямой обход */
    fun preOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "pre", res)
        return res
    }

    /* Симметричный обход */
    fun inOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "in", res)
        return res
    }

    /* Обратный обход */
    fun postOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "post", res)
        return res
    }
}

/* Основная программа */
fun main() {
    // Инициализация двоичного дерева
    // Используем функцию, которая строит двоичное дерево непосредственно из списка
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\nИнициализация двоичного дерева\n")
    println("Двоичное дерево в виде массива:")
    println(arr)
    println("Связное представление двоичного дерева:")
    printTree(root)

    // Класс двоичного дерева на основе массива
    val abt = ArrayBinaryTree(arr)

    // Доступ к узлу
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("Индекс текущего узла: $i, значение: ${abt._val(i)}")
    println("Индекс левого потомка: $l, значение: ${abt._val(l)}")
    println("Индекс правого потомка: $r, значение: ${abt._val(r)}")
    println("Индекс родителя: $p, значение: ${abt._val(p)}")

    // Обход дерева
    var res = abt.levelOrder()
    println("\nОбход по уровням: $res")
    res = abt.preOrder()
    println("Прямой обход: $res")
    res = abt.inOrder()
    println("Симметричный обход: $res")
    res = abt.postOrder()
    println("Обратный обход: $res")
}