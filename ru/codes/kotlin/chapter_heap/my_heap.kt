/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Макс-куча */
class MaxHeap(nums: MutableList<Int>?) {
    // Список, в отличие от массива, расширяется автоматически
    private val maxHeap = mutableListOf<Int>()

    /* Конструктор кучи по входному списку */
    init {
        // Поместить элементы списка в кучу в прежнем порядке
        maxHeap.addAll(nums!!)
        // Выполнить просеивание для всех узлов, кроме листьев
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* Индекс левого ребёнка */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Индекс правого ребёнка */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Индекс родителя */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // Целочисленное деление с округлением вниз
    }

    /* Поменять элементы местами */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* Размер кучи */
    fun size(): Int {
        return maxHeap.size
    }

    /* Проверить, пуста ли куча */
    fun isEmpty(): Boolean {
        /* Проверить, пуста ли куча */
        return size() == 0
    }

    /* Посмотреть элемент в корне */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* Вставить элемент в кучу */
    fun push(_val: Int) {
        // Добавить узел
        maxHeap.add(_val)
        // Просеивание вверх
        siftUp(size() - 1)
    }

    /* Просеивать вверх от узла i */
    private fun siftUp(it: Int) {
        // Параметры функции в Kotlin неизменяемы, поэтому создаём временную переменную
        var i = it
        while (true) {
            // Найти родителя узла i
            val p = parent(i)
            // Если вышли за корень или узел уже на своём месте, завершить просеивание
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // Поменять два узла местами
            swap(i, p)
            // Продолжить просеивание вверх
            i = p
        }
    }

    /* Извлечь элемент из кучи */
    fun pop(): Int {
        // Проверить, пуста ли куча
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Поменять местами корень и крайний правый лист (первый и последний элементы)
        swap(0, size() - 1)
        // Удалить узел
        val _val = maxHeap.removeAt(size() - 1)
        // Просеивание вниз
        siftDown(0)
        // Вернуть элемент из корня
        return _val
    }

    /* Просеивать вниз от узла i */
    private fun siftDown(it: Int) {
        // Параметры функции в Kotlin неизменяемы, поэтому создаём временную переменную
        var i = it
        while (true) {
            // Сохранить в ma индекс наибольшего из узлов i, l и r
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // Если i уже наибольший или оба индекса l и r вне диапазона, завершить просеивание
            if (ma == i) break
            // Поменять два узла местами
            swap(i, ma)
            // Продолжить просеивание вниз
            i = ma
        }
    }

    /* Вывести кучу в виде бинарного дерева */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Пример использования */
fun main() {
    /* Инициализировать макс-кучу */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\nКуча, построенная по входному списку:")
    maxHeap.print()

    /* Получить элемент в корне */
    var peek = maxHeap.peek()
    print("\nЭлемент в корне: $peek\n")

    /* Вставить элемент в кучу */
    val _val = 7
    maxHeap.push(_val)
    print("\nПосле вставки элемента $_val:\n")
    maxHeap.print()

    /* Извлечь элемент из корня */
    peek = maxHeap.pop()
    print("\nПосле извлечения элемента $peek из корня:\n")
    maxHeap.print()

    /* Размер кучи */
    val size = maxHeap.size()
    print("\nЧисло элементов в куче: $size\n")

    /* Проверить, пуста ли куча */
    val isEmpty = maxHeap.isEmpty()
    print("\nПуста ли куча: $isEmpty\n")
}