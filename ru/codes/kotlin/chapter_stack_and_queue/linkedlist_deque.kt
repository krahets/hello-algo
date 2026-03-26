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

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
    private var front: ListNode? = null // Головной узел front
    private var rear: ListNode? = null // Хвостовой узел rear
    private var queSize: Int = 0 // Длина двусторонней очереди

    /* Получить длину двусторонней очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверить, пуста ли двусторонняя очередь */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Операция помещения в очередь */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (isEmpty()) {
            rear = node
            front = rear
            // Операция помещения в голову очереди
        } else if (isFront) {
            // Добавить node в голову связного списка
            front?.prev = node
            node.next = front
            front = node // Обновить головной узел
            // Операция помещения в хвост очереди
        } else {
            // Добавить node в хвост связного списка
            rear?.next = node
            node.prev = rear
            rear = node // Обновить хвостовой узел
        }
        queSize++ // Обновить длину очереди
    }

    /* Поместить в голову очереди */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* Поместить в хвост очереди */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* Операция извлечения из очереди */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // Операция извлечения из головы очереди
        if (isFront) {
            _val = front!!._val // Временно сохранить значение головного узла
            // Удалить головной узел
            val fNext = front!!.next
            if (fNext != null) {
                fNext.prev = null
                front!!.next = null
            }
            front = fNext // Обновить головной узел
            // Операция извлечения из хвоста очереди
        } else {
            _val = rear!!._val // Временно сохранить значение хвостового узла
            // Удалить хвостовой узел
            val rPrev = rear!!.prev
            if (rPrev != null) {
                rPrev.next = null
                rear!!.prev = null
            }
            rear = rPrev // Обновить хвостовой узел
        }
        queSize-- // Обновить длину очереди
        return _val
    }

    /* Извлечь из головы очереди */
    fun popFirst(): Int {
        return pop(true)
    }

    /* Извлечь из хвоста очереди */
    fun popLast(): Int {
        return pop(false)
    }

    /* Получить элемент в начале очереди */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Обратиться к элементу в хвосте очереди */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* Вернуть массив для печати */
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
    /* Инициализировать двустороннюю очередь */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("двусторонняя очередь deque = ${deque.toArray().contentToString()}")

    /* Получить доступ к элементу */
    val peekFirst = deque.peekFirst()
    println("элемент в голове очереди peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("элемент в хвосте очереди peekLast = $peekLast")

    /* Поместить элемент в очередь */
    deque.pushLast(4)
    println("После помещения элемента 4 в хвост очереди deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("После помещения элемента 1 в голову очереди deque = ${deque.toArray().contentToString()}")

    /* Извлечь элемент из очереди */
    val popLast = deque.popLast()
    println("Элемент, извлеченный из хвоста очереди, = ${popLast}, deque после извлечения из хвоста = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Элемент, извлеченный из головы очереди, = ${popFirst}, deque после извлечения из головы = ${deque.toArray().contentToString()}")

    /* Получить длину двусторонней очереди */
    val size = deque.size()
    println("Длина двусторонней очереди size = $size")

    /* Проверить, пуста ли двусторонняя очередь */
    val isEmpty = deque.isEmpty()
    println("двусторонняя Очередь пуста: $isEmpty")
}
