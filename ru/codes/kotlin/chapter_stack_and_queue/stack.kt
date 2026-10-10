/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Инициализация стека */
    val stack = Stack<Int>()

    /* Помещение элемента в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Стек stack = $stack")

    /* Доступ к верхнему элементу стека */
    val peek = stack.peek()
    println("Верхний элемент peek = $peek")

    /* Извлечение элемента из стека */
    val pop = stack.pop()
    println("Извлеченный элемент pop = $pop, stack после извлечения = $stack")

    /* Получение длины стека */
    val size = stack.size
    println("Длина стека size = $size")

    /* Проверка на пустоту */
    val isEmpty = stack.isEmpty()
    println("Пуст ли стек = $isEmpty")
}