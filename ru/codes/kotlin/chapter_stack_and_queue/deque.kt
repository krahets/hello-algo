/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    // [region]{init_deque}
    /* Инициализация двусторонней очереди */
    val deque = LinkedList<Int>()
    // [endregion]{init_deque}

    // [region]{push}
    /* Добавление элемента в очередь */
    deque.offerLast(2) // Добавить в хвост
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // Добавить в голову
    deque.offerFirst(1)
    // [endregion]{push}
    println("Двусторонняя очередь deque = $deque")

    // [region]{peek_first}
    /* Доступ к элементу */
    val peekFirst = deque.peekFirst() // Элемент в голове
    // [endregion]{peek_first}
    println("Первый элемент peekFirst = $peekFirst")
    // [region]{peek_last}
    val peekLast = deque.peekLast() // Элемент в хвосте
    // [endregion]{peek_last}
    println("Последний элемент peekLast = $peekLast")

    // [region]{pop_first}
    /* Извлечение элемента из очереди */
    val popFirst = deque.pollFirst() // Извлечь элемент из головы
    // [endregion]{pop_first}
    println("Извлеченный из головы элемент = $popFirst, deque после извлечения из головы = $deque")
    // [region]{pop_last}
    val popLast = deque.pollLast() // Извлечь элемент из хвоста
    // [endregion]{pop_last}
    println("Извлеченный из хвоста элемент = $popLast, deque после извлечения из хвоста = $deque")

    // [region]{size}
    /* Получение длины двусторонней очереди */
    val size = deque.size
    // [endregion]{size}
    println("Длина двусторонней очереди size = $size")

    // [region]{is_empty}
    /* Проверка, пуста ли двусторонняя очередь */
    val isEmpty = deque.isEmpty()
    // [endregion]{is_empty}
    println("Пуста ли двусторонняя очередь = $isEmpty")
}