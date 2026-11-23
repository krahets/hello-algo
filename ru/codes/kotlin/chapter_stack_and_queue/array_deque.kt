/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Двусторонняя очередь на основе кольцевого массива */
/* Конструктор */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // Массив для хранения элементов двусторонней очереди
    private var front: Int = 0 // Указатель head, указывающий на первый элемент очереди
    private var queSize: Int = 0 // Длина двусторонней очереди

    /* Получить вместимость двусторонней очереди */
    fun capacity(): Int {
        return nums.size
    }

    /* Получение длины двусторонней очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверка, пуста ли двусторонняя очередь */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Вычислить индекс в кольцевом массиве */
    private fun index(i: Int): Int {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        return (i + capacity()) % capacity()
    }

    /* Добавление в голову очереди */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("Двусторонняя очередь заполнена")
            return
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        front = index(front - 1)
        // Добавить num в голову очереди
        nums[front] = num
        queSize++
    }

    /* Добавление в хвост очереди */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("Двусторонняя очередь заполнена")
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        val rear = index(front + queSize)
        // Добавить num в хвост очереди
        nums[rear] = num
        queSize++
    }

    /* Извлечение из головы очереди */
    fun popFirst(): Int {
        val num = peekFirst()
        // Указатель головы сдвигается на одну позицию назад
        front = index(front + 1)
        queSize--
        return num
    }

    /* Извлечение из хвоста очереди */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* Доступ к элементу в начале очереди */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Доступ к элементу в конце очереди */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Вычислить индекс хвостового элемента
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* Вернуть массив для вывода */
    fun toArray(): IntArray {
        // Преобразовывать только элементы списка в пределах фактической длины
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[index(j)]
            i++
            j++
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* Инициализация двусторонней очереди */
    val deque = ArrayDeque(10)
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