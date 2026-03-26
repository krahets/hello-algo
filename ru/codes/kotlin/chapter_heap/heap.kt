/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // Добавить элемент в кучу
    print("\nЭлемент $_val после добавления в кучу\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // Извлечь верхний элемент из кучи
    print("\nвершина кучиЭлемент $_val после извлечения из кучи\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* Инициализировать кучу */
    // Инициализировать min-кучу
    var minHeap = PriorityQueue<Int>()

    // Инициализировать max-кучу (достаточно изменить Comparator с помощью lambda-выражения)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\nНиже приведены тестовые примеры max-кучи")

    /* Добавить элемент в кучу */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* Получить верхний элемент кучи */
    val peek = maxHeap.peek()
    print("\nвершина кучиэлементравно $peek\n")

    /* Извлечь верхний элемент из кучи */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* Получить размер кучи */
    val size = maxHeap.size
    print("\nКоличество элементов в куче равно $size\n")

    /* Проверить, пуста ли куча */
    val isEmpty = maxHeap.isEmpty()
    print("\nкучапуст ли $isEmpty\n")

    /* Входсписокипостроение кучи */
    // Временная сложность равна O(n), а не O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nВходсписокипостроитьmin-кучапосле")
    printHeap(minHeap)
}
