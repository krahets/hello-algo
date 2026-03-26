/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Стек на основе связного списка */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // Считать головной узел вершиной стека
    private var stkSize: Int = 0 // Длина стека
) {

    /* Получить длину стека */
    fun size(): Int {
        return stkSize
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* Преобразовать List в Array и вернуть его */
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
    /* Инициализировать стек */
    val stack = LinkedListStack()

    /* Поместить элемент в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("стек stack = ${stack.toArray().contentToString()}")

    /* Получить верхний элемент стека */
    val peek = stack.peek()!!
    println("вершина стекаэлемент peek = $peek")

    /* Извлечь элемент из стека */
    val pop = stack.pop()!!
    println("извлечение из стекаэлемент pop = $pop, извлечение из стекапосле stack = ${stack.toArray().contentToString()}")

    /* Получить длину стека */
    val size = stack.size()
    println("Длина стека size = $size")

    /* Проверить, пуста ли структура */
    val isEmpty = stack.isEmpty()
    println("стекпуст ли = $isEmpty")
}
