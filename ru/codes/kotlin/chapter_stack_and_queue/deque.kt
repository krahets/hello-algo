/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Инициализировать двустороннюю очередь */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("двусторонняя очередь deque = $deque")

    /* Получить доступ к элементу */
    val peekFirst = deque.peekFirst()
    println("голова очередиэлемент peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("хвост очередиэлемент peekLast = $peekLast")

    /* Поместить элемент в очередь */
    deque.offerLast(4)
    println("После помещения элемента 4 в хвост очереди deque = $deque")
    deque.offerFirst(1)
    println("После помещения элемента 1 в голову очереди deque = $deque")

    /* Извлечь элемент из очереди */
    val popLast = deque.pollLast()
    println("Элемент, извлеченный из хвоста очереди = $popLast, deque после извлечения из хвоста = $deque")
    val popFirst = deque.pollFirst()
    println("Элемент, извлеченный из головы очереди = $popFirst, deque после извлечения из головы = $deque")

    /* Получить длину двусторонней очереди */
    val size = deque.size
    println("Длина двусторонней очереди size = $size")

    /* Проверить, пуста ли двусторонняя очередь */
    val isEmpty = deque.isEmpty()
    println("Двусторонняя очередь пуста: $isEmpty")
}
