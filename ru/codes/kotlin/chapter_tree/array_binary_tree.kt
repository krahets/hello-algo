/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Класс двоичного дерева в массивном представлении */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* Вместимость списка */
    fun size(): Int {
        return tree.size
    }

    /* Получить значение узла с индексом i */
    fun _val(i: Int): Int? {
        // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* Получить индекс левого дочернего узла узла с индексом i */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Получить индекс правого дочернего узла узла с индексом i */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Получить индекс родительского узла узла с индексом i */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* Обход в ширину */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // Непосредственно обходить массив
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* Обход в глубину */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // Если это пустая позиция, вернуть
        if (_val(i) == null)
            return
        // Предварительный обход
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

    /* Предварительный обход */
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

/* Driver Code */
fun main() {
    // Инициализировать двоичное дерево
    // Здесь используется функция, напрямую строящая двоичное дерево из списка
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\nИнициализация двоичного дерева\n")
    println("Массивное представление двоичного дерева:")
    println(arr)
    println("Связное представление двоичного дерева:")
    printTree(root)

    // Класс двоичного дерева в массивном представлении
    val abt = ArrayBinaryTree(arr)

    // Доступ к узлу
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("Текущий узел: индекс = $i, значение = ${abt._val(i)}")
    println("Индекс левого дочернего узла = $l, значение = ${abt._val(l)}")
    println("Индекс правого дочернего узла = $r, значение = ${abt._val(r)}")
    println("Индекс родительского узла = $p, значение = ${abt._val(p)}")

    // Обходить дерево
    var res = abt.levelOrder()
    println("\nОбход в ширину = $res")
    res = abt.preOrder()
    println("Предварительный обход = $res")
    res = abt.inOrder()
    println("Симметричный обход = $res")
    res = abt.postOrder()
    println("Обратный обход = $res")
}