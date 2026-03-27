/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Очередь на основе связного списка */
class LinkedListQueue(
    // Головной узел front, хвостовой узел rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* Получить длину очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверить, пуста ли очередь */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Поместить в очередь */
    fun push(num: Int) {
        // Добавить num после хвостового узла
        val node = ListNode(num)
        // Если очередь пуста, сделать так, чтобы головной и хвостовой узлы указывали на этот узел
        if (front == null) {
            front = node
            rear = node
            // Если очередь не пуста, добавить этот узел после хвостового узла
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* Извлечь из очереди */
    fun pop(): Int {
        val num = peek()
        // Удалить головной узел
        front = front?.next
        queSize--
        return num
    }

    /* Получить элемент в начале очереди */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Преобразовать связный список в Array и вернуть его */
    fun toArray(): IntArray {
        var node = front
        val res = IntArray(size())
        for (i in res.indices) {
            res[i] = node!!._val
            node = node.next
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* Инициализировать очередь */
    val queue = LinkedListQueue()

    /* Поместить элемент в очередь */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("очередь queue = ${queue.toArray().contentToString()}")

    /* Получить элемент в начале очереди */
    val peek = queue.peek()
    println("голова очередиэлемент peek = $peek")

    /* Извлечь элемент из очереди */
    val pop = queue.pop()
    println("Элемент, извлеченный из очереди, pop = $pop, queue после извлечения = ${queue.toArray().contentToString()}")

    /* Получить длину очереди */
    val size = queue.size()
    println("Длина очереди size = $size")

    /* Проверить, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("Очередь пуста: $isEmpty")
}
