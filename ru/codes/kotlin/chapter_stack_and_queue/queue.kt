/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Инициализировать очередь */
    val queue = LinkedList<Int>()

    /* Поместить элемент в очередь */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("очередь queue = $queue")

    /* Получить элемент в начале очереди */
    val peek = queue.peek()
    println("элемент в голове очереди peek = $peek")

    /* Извлечь элемент из очереди */
    val pop = queue.poll()
    println("Элемент, извлеченный из очереди, pop = $pop, queue после извлечения = $queue")

    /* Получить длину очереди */
    val size = queue.size
    println("Длина очереди size = $size")

    /* Проверить, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("очередьпуст ли = $isEmpty")
}
