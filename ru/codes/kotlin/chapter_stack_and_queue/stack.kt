/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Инициализировать стек */
    val stack = Stack<Int>()

    /* Поместить элемент в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("стек stack = $stack")

    /* Получить верхний элемент стека */
    val peek = stack.peek()
    println("вершина стекаэлемент peek = $peek")

    /* Извлечь элемент из стека */
    val pop = stack.pop()
    println("извлечение из стекаэлемент pop = $pop, извлечение из стекапосле stack = $stack")

    /* Получить длину стека */
    val size = stack.size
    println("Длина стека size = $size")

    /* Проверить, пуста ли структура */
    val isEmpty = stack.isEmpty()
    println("Стек пуст: $isEmpty")
}
