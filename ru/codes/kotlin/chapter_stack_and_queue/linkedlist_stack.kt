/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Стек на основе связного списка */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // Первый узел списка служит вершиной стека
    private var stkSize: Int = 0 // Размер стека
) {

    /* Получить размер стека */
    fun size(): Int {
        return stkSize
    }

    /* Проверить, пуст ли стек */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Поместить элемент в стек */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* Снять элемент со стека */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* Посмотреть элемент на вершине стека */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* Преобразовать связный список в массив и вернуть его */
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

/* Пример использования */
fun main() {
    /* Инициализировать стек */
    val stack = LinkedListStack()

    /* Поместить элементы в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Стек stack = ${stack.toArray().contentToString()}")

    /* Посмотреть элемент на вершине стека */
    val peek = stack.peek()!!
    println("Элемент на вершине стека peek = $peek")

    /* Снять элемент со стека */
    val pop = stack.pop()!!
    println("Снятый элемент pop = $pop, после снятия stack = ${stack.toArray().contentToString()}")

    /* Получить размер стека */
    val size = stack.size()
    println("Размер стека size = $size")

    /* Проверить, пуст ли стек */
    val isEmpty = stack.isEmpty()
    println("Стек пуст = $isEmpty")
}