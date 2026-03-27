/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Инициализация очереди */
    val queue = LinkedList<Int>()

    /* Добавление элемента в очередь */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("Очередь queue = $queue")

    /* Доступ к элементу в начале очереди */
    val peek = queue.peek()
    println("Первый элемент peek = $peek")

    /* Извлечение элемента из очереди */
    val pop = queue.poll()
    println("Извлеченный элемент pop = $pop, queue после извлечения = $queue")

    /* Получение длины очереди */
    val size = queue.size
    println("Длина очереди size = $size")

    /* Проверка, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("Пуста ли очередь = $isEmpty")
}