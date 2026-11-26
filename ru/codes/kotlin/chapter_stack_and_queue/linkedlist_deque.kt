/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Узел двусвязного списка */
class ListNode(var _val: Int) {
    // Значение узла
    var next: ListNode? = null // Ссылка на следующий узел
    var prev: ListNode? = null // Ссылка на предыдущий узел
}

/* Двусторонняя очередь (дек) на основе двусвязного списка */
class LinkedListDeque {
    private var front: ListNode? = null // Первый узел front
    private var rear: ListNode? = null // Последний узел rear
    private var queSize: Int = 0 // Длина дека

    /* Получить длину дека */
    fun size(): Int {
        return queSize
    }

    /* Проверить, пуст ли дек */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Добавить элемент в дек */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if (isEmpty()) {
            rear = node
            front = rear
            // Добавить элемент в начало дека
        } else if (isFront) {
            // Добавить node в начало связного списка
            front?.prev = node
            node.next = front
            front = node // Обновить ссылку на первый узел
            // Добавить элемент в конец дека
        } else {
            // Добавить node в конец связного списка
            rear?.next = node
            node.prev = rear
            rear = node // Обновить ссылку на последний узел
        }
        queSize++ // Обновить длину дека
    }

    /* Добавить элемент в начало дека */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* Добавить элемент в конец дека */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* Извлечь элемент из дека */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // Извлечь элемент из начала дека
        else if (isFront) {
            _val = front!!._val // Временно сохранить значение первого узла
            // Удалить первый узел
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // Обновить ссылку на первый узел
            // Извлечь элемент из конца дека
        } else {
            _val = rear!!._val // Временно сохранить значение последнего узла
            // Удалить последний узел
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // Обновить ссылку на последний узел
        }
        queSize-- // Обновить длину дека
        return _val
    }

    /* Извлечь элемент из начала дека */
    fun popFirst(): Int {
        return pop(true)
    }

    /* Извлечь элемент из конца дека */
    fun popLast(): Int {
        return pop(false)
    }

    /* Посмотреть первый элемент дека */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Посмотреть последний элемент дека */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* Вернуть массив для вывода */
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
    /* Инициализировать дек */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("Дек deque = ${deque.toArray().contentToString()}")

    /* Посмотреть первый и последний элементы */
    val peekFirst = deque.peekFirst()
    println("Первый элемент дека peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Последний элемент дека peekLast = $peekLast")

    /* Добавить элементы в дек */
    deque.pushLast(4)
    println("После добавления 4 в конец дека deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("После добавления 1 в начало дека deque = ${deque.toArray().contentToString()}")

    /* Извлечь элементы из дека */
    val popLast = deque.popLast()
    println("Извлечённый последний элемент = ${popLast}, после извлечения deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Извлечённый первый элемент = ${popFirst}, после извлечения deque = ${deque.toArray().contentToString()}")

    /* Получить длину дека */
    val size = deque.size()
    println("Длина дека size = $size")

    /* Проверить, пуст ли дек */
    val isEmpty = deque.isEmpty()
    println("Дек пуст = $isEmpty")
}