/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // Вставить элемент в кучу
    print("\nПосле вставки элемента $_val:\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // Извлечь элемент из корня
    print("\nПосле извлечения элемента $_val из корня:\n")
    printHeap(heap)
}

/* Пример использования */
fun main() {
    /* Инициализировать кучу */
    // Инициализировать мин-кучу
    var minHeap = PriorityQueue<Int>()

    // Инициализировать макс-кучу, задав Comparator лямбда-выражением
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\nВ этом примере используется макс-куча")

    /* Вставить элемент в кучу */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* Получить элемент в корне */
    val peek = maxHeap.peek()
    print("\nЭлемент в корне: $peek\n")

    /* Извлечь элемент из корня */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* Размер кучи */
    val size = maxHeap.size
    print("\nЧисло элементов в куче: $size\n")

    /* Проверить, пуста ли куча */
    val isEmpty = maxHeap.isEmpty()
    print("\nПуста ли куча: $isEmpty\n")

    /* Построить кучу по входному списку */
    // Временная сложность — O(n), а не O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nМин-куча, построенная по входному списку:")
    printHeap(minHeap)
}