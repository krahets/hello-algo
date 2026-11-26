/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Очередь на основе связного списка */
class LinkedListQueue(
    // front — первый узел, rear — последний
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

    /* Добавить элемент в очередь */
    fun push(num: Int) {
        // Добавить узел со значением num после последнего узла
        val node = ListNode(num)
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (front == null) {
            front = node
            rear = node
            // Если очередь непуста, добавить новый узел после последнего
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* Извлечь элемент из очереди */
    fun pop(): Int {
        val num = peek()
        // Удалить первый узел
        front = front?.next
        queSize--
        return num
    }

    /* Посмотреть первый элемент очереди */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Преобразовать связный список в массив и вернуть его */
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

/* Пример использования */
fun main() {
    /* Инициализировать очередь */
    val queue = LinkedListQueue()

    /* Добавить элементы в очередь */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("Очередь queue = ${queue.toArray().contentToString()}")

    /* Посмотреть первый элемент очереди */
    val peek = queue.peek()
    println("Первый элемент очереди peek = $peek")

    /* Извлечь элемент из очереди */
    val pop = queue.pop()
    println("Извлечённый элемент pop = $pop, после извлечения queue = ${queue.toArray().contentToString()}")

    /* Получить длину очереди */
    val size = queue.size()
    println("Длина очереди size = $size")

    /* Проверить, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("Очередь пуста = $isEmpty")
}