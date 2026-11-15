/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    // [region]{init_stack}
    /* Инициализация стека */
    val stack = Stack<Int>()
    // [endregion]{init_stack}

    // [region]{push}
    /* Помещение элемента в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    // [endregion]{push}
    println("Стек stack = $stack")

    // [region]{peek}
    /* Доступ к верхнему элементу стека */
    val peek = stack.peek()
    // [endregion]{peek}
    println("Верхний элемент peek = $peek")

    // [region]{pop}
    /* Извлечение элемента из стека */
    val pop = stack.pop()
    // [endregion]{pop}
    println("Извлеченный элемент pop = $pop, stack после извлечения = $stack")

    // [region]{size}
    /* Получение длины стека */
    val size = stack.size
    // [endregion]{size}
    println("Длина стека size = $size")

    // [region]{is_empty}
    /* Проверка на пустоту */
    val isEmpty = stack.isEmpty()
    // [endregion]{is_empty}
    println("Пуст ли стек = $isEmpty")
}