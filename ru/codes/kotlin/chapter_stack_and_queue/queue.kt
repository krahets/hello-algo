/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    // [region]{init_queue}
    /* Инициализация очереди */
    val queue = LinkedList<Int>()
    // [endregion]{init_queue}

    // [region]{push}
    /* Добавление элемента в очередь */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    // [endregion]{push}
    println("Очередь queue = $queue")

    // [region]{peek}
    /* Доступ к элементу в начале очереди */
    val peek = queue.peek()
    // [endregion]{peek}
    println("Первый элемент peek = $peek")

    // [region]{pop}
    /* Извлечение элемента из очереди */
    val pop = queue.poll()
    // [endregion]{pop}
    println("Извлеченный элемент pop = $pop, queue после извлечения = $queue")

    // [region]{size}
    /* Получение длины очереди */
    val size = queue.size
    // [endregion]{size}
    println("Длина очереди size = $size")

    // [region]{is_empty}
    /* Проверка, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    // [endregion]{is_empty}
    println("Пуста ли очередь = $isEmpty")
}