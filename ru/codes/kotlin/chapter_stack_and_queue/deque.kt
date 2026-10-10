/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Инициализация двусторонней очереди */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("Двусторонняя очередь deque = $deque")

    /* Доступ к элементу */
    val peekFirst = deque.peekFirst()
    println("Первый элемент peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Последний элемент peekLast = $peekLast")

    /* Добавление элемента в очередь */
    deque.offerLast(4)
    println("После добавления элемента 4 в хвост deque = $deque")
    deque.offerFirst(1)
    println("После добавления элемента 1 в голову deque = $deque")

    /* Извлечение элемента из очереди */
    val popLast = deque.pollLast()
    println("Извлеченный из хвоста элемент = $popLast, deque после извлечения из хвоста = $deque")
    val popFirst = deque.pollFirst()
    println("Извлеченный из головы элемент = $popFirst, deque после извлечения из головы = $deque")

    /* Получение длины двусторонней очереди */
    val size = deque.size
    println("Длина двусторонней очереди size = $size")

    /* Проверка, пуста ли двусторонняя очередь */
    val isEmpty = deque.isEmpty()
    println("Пуста ли двусторонняя очередь = $isEmpty")
}