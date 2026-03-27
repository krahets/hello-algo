/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Стек на основе массива */
class ArrayStack {
    // Инициализация списка (динамического массива)
    private val stack = mutableListOf<Int>()

    /* Получение длины стека */
    fun size(): Int {
        return stack.size
    }

    /* Проверка, пуст ли стек */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Поместить в стек */
    fun push(num: Int) {
        stack.add(num)
    }

    /* Извлечь из стека */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* Доступ к верхнему элементу стека */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* Преобразовать List в Array и вернуть */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* Driver Code */
fun main() {
    /* Инициализация стека */
    val stack = ArrayStack()

    /* Помещение элемента в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Стек stack = ${stack.toArray().contentToString()}")

    /* Доступ к верхнему элементу стека */
    val peek = stack.peek()
    println("Верхний элемент peek = $peek")

    /* Извлечение элемента из стека */
    val pop = stack.pop()
    println("Извлеченный элемент pop = $pop, stack после извлечения = ${stack.toArray().contentToString()}")

    /* Получение длины стека */
    val size = stack.size()
    println("Длина стека size = $size")

    /* Проверка на пустоту */
    val isEmpty = stack.isEmpty()
    println("Пуст ли стек = $isEmpty")
}