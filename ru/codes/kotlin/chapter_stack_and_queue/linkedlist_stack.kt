/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Стек на основе связного списка */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // Использовать головной узел как вершину стека
    private var stkSize: Int = 0 // Длина стека
) {

    /* Получение длины стека */
    fun size(): Int {
        return stkSize
    }

    /* Проверка, пуст ли стек */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Поместить в стек */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* Извлечь из стека */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* Доступ к верхнему элементу стека */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* Преобразовать List в Array и вернуть */
    fun toArray(): IntArray {
        var node = stackPeek
        val res = IntArray(size())
        for (i in res.size - 1 downTo 0) {
            res[i] = node?._val!!
            node = node.next
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* Инициализация стека */
    val stack = LinkedListStack()

    /* Помещение элемента в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Стек stack = ${stack.toArray().contentToString()}")

    /* Доступ к верхнему элементу стека */
    val peek = stack.peek()!!
    println("Верхний элемент peek = $peek")

    /* Извлечение элемента из стека */
    val pop = stack.pop()!!
    println("Извлеченный элемент pop = $pop, stack после извлечения = ${stack.toArray().contentToString()}")

    /* Получение длины стека */
    val size = stack.size()
    println("Длина стека size = $size")

    /* Проверка на пустоту */
    val isEmpty = stack.isEmpty()
    println("Пуст ли стек = $isEmpty")
}