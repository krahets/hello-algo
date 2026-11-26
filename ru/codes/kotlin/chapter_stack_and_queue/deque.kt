/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Пример использования */
fun main() {
    /* Инициализировать дек */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("Дек deque = $deque")

    /* Посмотреть первый и последний элементы */
    val peekFirst = deque.peekFirst()
    println("Первый элемент дека peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Последний элемент дека peekLast = $peekLast")

    /* Добавить элементы в дек */
    deque.offerLast(4)
    println("После добавления 4 в конец дека deque = $deque")
    deque.offerFirst(1)
    println("После добавления 1 в начало дека deque = $deque")

    /* Извлечь элементы из дека */
    val popLast = deque.pollLast()
    println("Извлечённый последний элемент = $popLast, после извлечения deque = $deque")
    val popFirst = deque.pollFirst()
    println("Извлечённый первый элемент = $popFirst, после извлечения deque = $deque")

    /* Получить длину дека */
    val size = deque.size
    println("Длина дека size = $size")

    /* Проверить, пуст ли дек */
    val isEmpty = deque.isEmpty()
    println("Дек пуст = $isEmpty")
}