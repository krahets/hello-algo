/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Пример использования */
fun main() {
    /* Инициализировать стек */
    val stack = Stack<Int>()

    /* Поместить элементы в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Стек stack = $stack")

    /* Посмотреть элемент на вершине стека */
    val peek = stack.peek()
    println("Элемент на вершине стека peek = $peek")

    /* Снять элемент со стека */
    val pop = stack.pop()
    println("Снятый элемент pop = $pop, после снятия stack = $stack")

    /* Получить размер стека */
    val size = stack.size
    println("Размер стека size = $size")

    /* Проверить, пуст ли стек */
    val isEmpty = stack.isEmpty()
    println("Стек пуст = $isEmpty")
}