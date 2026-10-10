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

    /* Получение длины очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверка, пуста ли очередь */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Поместить в очередь */
    fun push(num: Int) {
        // Добавить num после хвостового узла
        val node = ListNode(num)
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
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

    /* Доступ к элементу в начале очереди */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Преобразовать связный список в Array и вернуть */
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
    /* Инициализация очереди */
    val queue = LinkedListQueue()

    /* Добавление элемента в очередь */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("Очередь queue = ${queue.toArray().contentToString()}")

    /* Доступ к элементу в начале очереди */
    val peek = queue.peek()
    println("Первый элемент peek = $peek")

    /* Извлечение элемента из очереди */
    val pop = queue.pop()
    println("Извлеченный элемент pop = $pop, queue после извлечения = ${queue.toArray().contentToString()}")

    /* Получение длины очереди */
    val size = queue.size()
    println("Длина очереди size = $size")

    /* Проверка, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("Пуста ли очередь = $isEmpty")
}