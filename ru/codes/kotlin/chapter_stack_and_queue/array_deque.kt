/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Двусторонняя очередь на основе циклического массива */
/* Конструктор */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // Массив для хранения элементов двусторонней очереди
    private var front: Int = 0 // Указатель front, указывающий на первый элемент очереди
    private var queSize: Int = 0 // Длина двусторонней очереди

    /* Получить вместимость двусторонней очереди */
    fun capacity(): Int {
        return nums.size
    }

    /* Получить длину двусторонней очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверить, пуста ли двусторонняя очередь */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Вычислить индекс циклического массива */
    private fun index(i: Int): Int {
        // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        // Когда i выходит за конец массива, он возвращается к началу
        // Когда i выходит за начало массива, он возвращается к концу
        return (i + capacity()) % capacity()
    }

    /* Поместить в голову очереди */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("Двусторонняя очередь заполнена")
            return
        }
        // Указатель головы очереди сдвигается на одну позицию влево
        // Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        front = index(front - 1)
        // Добавить num в голову очереди
        nums[front] = num
        queSize++
    }

    /* Поместить в хвост очереди */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("Двусторонняя очередь заполнена")
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс за последним элементом
        val rear = index(front + queSize)
        // Добавить num в конец очереди
        nums[rear] = num
        queSize++
    }

    /* Извлечь из головы очереди */
    fun popFirst(): Int {
        val num = peekFirst()
        // Указатель головы очереди сдвигается на одну позицию вперед
        front = index(front + 1)
        queSize--
        return num
    }

    /* Извлечь из хвоста очереди */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* Получить элемент в начале очереди */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Обратиться к элементу в хвосте очереди */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Вычислить индекс хвостового элемента
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* Вернуть массив для печати */
    fun toArray(): IntArray {
        // Преобразовать только элементы списка в пределах действительной длины
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
    /* Инициализировать двустороннюю очередь */
    val deque = ArrayDeque(10)
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("двусторонняя очередь deque = ${deque.toArray().contentToString()}")

    /* Получить доступ к элементу */
    val peekFirst = deque.peekFirst()
    println("голова очередиэлемент peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("хвост очередиэлемент peekLast = $peekLast")

    /* Поместить элемент в очередь */
    deque.pushLast(4)
    println("После помещения элемента 4 в хвост очереди deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("После помещения элемента 1 в голову очереди deque = ${deque.toArray().contentToString()}")

    /* Извлечь элемент из очереди */
    val popLast = deque.popLast()
    println("Элемент, извлеченный из хвоста очереди = ${popLast}, deque после извлечения из хвоста = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Элемент, извлеченный из головы очереди = ${popFirst}, deque после извлечения из головы = ${deque.toArray().contentToString()}")

    /* Получить длину двусторонней очереди */
    val size = deque.size()
    println("Длина двусторонней очереди size = $size")

    /* Проверить, пуста ли двусторонняя очередь */
    val isEmpty = deque.isEmpty()
    println("Двусторонняя очередь пуста: $isEmpty")
}
