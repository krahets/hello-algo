/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Max-куча */
class MaxHeap(nums: MutableList<Int>?) {
    // Использовать список вместо массива, чтобы не учитывать проблему расширения
    private val maxHeap = mutableListOf<Int>()

    /* Конструктор, создающий кучу по входному списку */
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

    /* Получить размер кучи */
    fun size(): Int {
        return maxHeap.size
    }

    /* Проверить, пуста ли куча */
    fun isEmpty(): Boolean {
        /* Проверить, пуста ли куча */
        return size() == 0
    }

    /* Обратиться к элементу на вершине кучи */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* Добавить элемент в кучу */
    fun push(_val: Int) {
        // Добавить узел
        maxHeap.add(_val)
        // Выполнить heapify снизу вверх
        siftUp(size() - 1)
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    private fun siftUp(it: Int) {
        // Параметры функций в Kotlin неизменяемы, поэтому создается временная переменная
        var i = it
        while (true) {
            // Получить родительский узел для узла i
            val p = parent(i)
            // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // Поменять местами два узла
            swap(i, p)
            // Циклически выполнять просеивание вверх
            i = p
        }
    }

    /* Извлечение элемента из кучи */
    fun pop(): Int {
        // Обработка пустого случая
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        swap(0, size() - 1)
        // Удалить узел
        val _val = maxHeap.removeAt(size() - 1)
        // Выполнить heapify сверху вниз
        siftDown(0)
        // Вернуть элемент на вершине кучи
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
            // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
            if (ma == i) break
            // Поменять местами два узла
            swap(i, ma)
            // Циклически выполнять просеивание вниз
            i = ma
        }
    }

    /* Вывести кучу (в виде двоичного дерева) */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* Инициализировать max-кучу */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\nПосле построения кучи по входному списку")
    maxHeap.print()

    /* Получить верхний элемент кучи */
    var peek = maxHeap.peek()
    print("\nвершина кучиэлементравно $peek\n")

    /* Добавить элемент в кучу */
    val _val = 7
    maxHeap.push(_val)
    print("\nЭлемент $_val после добавления в кучу\n")
    maxHeap.print()

    /* Извлечь верхний элемент из кучи */
    peek = maxHeap.pop()
    print("\nвершина кучиЭлемент $peek после извлечения из кучи\n")
    maxHeap.print()

    /* Получить размер кучи */
    val size = maxHeap.size()
    print("\nКоличество элементов в куче равно $size\n")

    /* Проверить, пуста ли куча */
    val isEmpty = maxHeap.isEmpty()
    print("\nкучапуст ли $isEmpty\n")
}
