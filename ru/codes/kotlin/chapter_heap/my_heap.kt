/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Максимальная куча */
class MaxHeap(nums: MutableList<Int>?) {
    // Использовать список вместо массива, чтобы не учитывать проблему расширения
    private val maxHeap = mutableListOf<Int>()

    /* Конструктор, строящий кучу по входному списку */
    init {
        // Добавить элементы списка в кучу без изменений
        maxHeap.addAll(nums!!)
        // Выполнить heapify для всех узлов, кроме листовых
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* Получить индекс левого дочернего узла */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Получить индекс правого дочернего узла */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Получить индекс родительского узла */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // Округление вниз при делении
    }

    /* Поменять элементы местами */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* Получение размера кучи */
    fun size(): Int {
        return maxHeap.size
    }

    /* Проверка, пуста ли куча */
    fun isEmpty(): Boolean {
        /* Проверка, пуста ли куча */
        return size() == 0
    }

    /* Доступ к элементу на вершине кучи */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* Добавление элемента в кучу */
    fun push(_val: Int) {
        // Добавление узла
        maxHeap.add(_val)
        // Просеивание снизу вверх
        siftUp(size() - 1)
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    private fun siftUp(it: Int) {
        // Параметры функций в Kotlin неизменяемы, поэтому создается временная переменная
        var i = it
        while (true) {
            // Получение родительского узла для узла i
            val p = parent(i)
            // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // Поменять два узла местами
            swap(i, p)
            // Циклическое просеивание вверх
            i = p
        }
    }

    /* Извлечение элемента из кучи */
    fun pop(): Int {
        // Обработка пустого случая
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        swap(0, size() - 1)
        // Удаление узла
        val _val = maxHeap.removeAt(size() - 1)
        // Просеивание сверху вниз
        siftDown(0)
        // Вернуть элемент с вершины кучи
        return _val
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    private fun siftDown(it: Int) {
        // Параметры функций в Kotlin неизменяемы, поэтому создается временная переменная
        var i = it
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if (ma == i) break
            // Поменять два узла местами
            swap(i, ma)
            // Циклическое просеивание вниз
            i = ma
        }
    }

    /* Вывести кучу (двоичное дерево) */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* Инициализация максимальной кучи */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\nПосле построения кучи из входного списка")
    maxHeap.print()

    /* Получение элемента с вершины кучи */
    var peek = maxHeap.peek()
    print("\nЭлемент на вершине кучи = $peek\n")

    /* Добавление элемента в кучу */
    val _val = 7
    maxHeap.push(_val)
    print("\nПосле добавления элемента $_val в кучу\n")
    maxHeap.print()

    /* Извлечение элемента с вершины кучи */
    peek = maxHeap.pop()
    print("\nПосле извлечения элемента вершины кучи $peek\n")
    maxHeap.print()

    /* Получение размера кучи */
    val size = maxHeap.size()
    print("\nКоличество элементов в куче = $size\n")

    /* Проверка, пуста ли куча */
    val isEmpty = maxHeap.isEmpty()
    print("\nПуста ли куча: $isEmpty\n")
}