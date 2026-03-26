/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Стек на основе массива */
class ArrayStack {
    // Инициализировать список (динамический массив)
    private val stack = mutableListOf<Int>()

    /* Получить длину стека */
    fun size(): Int {
        return stack.size
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* Преобразовать List в Array и вернуть его */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* Driver Code */
fun main() {
    /* Инициализировать стек */
    val stack = ArrayStack()

    /* Поместить элемент в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("стек stack = ${stack.toArray().contentToString()}")

    /* Получить верхний элемент стека */
    val peek = stack.peek()
    println("вершина стекаэлемент peek = $peek")

    /* Извлечь элемент из стека */
    val pop = stack.pop()
    println("извлечение из стекаэлемент pop = $pop, извлечение из стекапосле stack = ${stack.toArray().contentToString()}")

    /* Получить длину стека */
    val size = stack.size()
    println("Длина стека size = $size")

    /* Проверить, пуста ли структура */
    val isEmpty = stack.isEmpty()
    println("стекпуст ли = $isEmpty")
}
