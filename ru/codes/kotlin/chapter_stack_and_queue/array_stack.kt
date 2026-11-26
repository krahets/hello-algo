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

    /* Получить размер стека */
    fun size(): Int {
        return stack.size
    }

    /* Проверить, пуст ли стек */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Поместить элемент в стек */
    fun push(num: Int) {
        stack.add(num)
    }

    /* Снять элемент со стека */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* Посмотреть элемент на вершине стека */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* Преобразовать список в массив и вернуть его */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* Пример использования */
fun main() {
    /* Инициализировать стек */
    val stack = ArrayStack()

    /* Поместить элементы в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Стек stack = ${stack.toArray().contentToString()}")

    /* Посмотреть элемент на вершине стека */
    val peek = stack.peek()
    println("Элемент на вершине стека peek = $peek")

    /* Снять элемент со стека */
    val pop = stack.pop()
    println("Снятый элемент pop = $pop, после снятия stack = ${stack.toArray().contentToString()}")

    /* Получить размер стека */
    val size = stack.size()
    println("Размер стека size = $size")

    /* Проверить, пуст ли стек */
    val isEmpty = stack.isEmpty()
    println("Стек пуст = $isEmpty")
}