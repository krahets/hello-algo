/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Узел двусвязного списка */
class ListNode(var _val: Int) {
    // Значение узла
    var next: ListNode? = null // Ссылка на узел-преемник
    var prev: ListNode? = null // Ссылка на узел-предшественник
}

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
    private var front: ListNode? = null // Головной узел front
    private var rear: ListNode? = null // Хвостовой узел rear
    private var queSize: Int = 0 // Длина двусторонней очереди

    /* Получение длины двусторонней очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверка, пуста ли двусторонняя очередь */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Операция добавления в очередь */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (isEmpty()) {
            rear = node
            front = rear
            // Операция добавления в голову очереди
        } else if (isFront) {
            // Добавить node в голову списка
            front?.prev = node
            node.next = front
            front = node // Обновить головной узел
            // Операция добавления в хвост очереди
        } else {
            // Добавить node в хвост списка
            rear?.next = node
            node.prev = rear
            rear = node // Обновить хвостовой узел
        }
        queSize++ // Обновить длину очереди
    }

    /* Добавление в голову очереди */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* Добавление в хвост очереди */
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

    /* Извлечение из головы очереди */
    fun popFirst(): Int {
        return pop(true)
    }

    /* Извлечение из хвоста очереди */
    fun popLast(): Int {
        return pop(false)
    }

    /* Доступ к элементу в начале очереди */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Доступ к элементу в конце очереди */
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

/* Driver Code */
fun main() {
    /* Инициализация двусторонней очереди */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("Двусторонняя очередь deque = ${deque.toArray().contentToString()}")

    /* Доступ к элементу */
    val peekFirst = deque.peekFirst()
    println("Первый элемент peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Последний элемент peekLast = $peekLast")

    /* Добавление элемента в очередь */
    deque.pushLast(4)
    println("После добавления элемента 4 в хвост deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("После добавления элемента 1 в голову deque = ${deque.toArray().contentToString()}")

    /* Извлечение элемента из очереди */
    val popLast = deque.popLast()
    println("Извлеченный из хвоста элемент = ${popLast}, deque после извлечения из хвоста = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Извлеченный из головы элемент = ${popFirst}, deque после извлечения из головы = ${deque.toArray().contentToString()}")

    /* Получение длины двусторонней очереди */
    val size = deque.size()
    println("Длина двусторонней очереди size = $size")

    /* Проверка, пуста ли двусторонняя очередь */
    val isEmpty = deque.isEmpty()
    println("Пуста ли двусторонняя очередь = $isEmpty")
}