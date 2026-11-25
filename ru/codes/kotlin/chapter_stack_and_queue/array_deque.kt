/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Двусторонняя очередь (дек) на основе кольцевого массива */
/* Конструктор */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // Массив для хранения элементов дека
    private var front: Int = 0 // Индекс первого элемента дека
    private var queSize: Int = 0 // Длина дека

    /* Получить ёмкость дека */
    fun capacity(): Int {
        return nums.size
    }

    /* Получить длину дека */
    fun size(): Int {
        return queSize
    }

    /* Проверить, пуст ли дек */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Вычислить индекс в кольцевом массиве */
    private fun index(i: Int): Int {
        // Операция взятия остатка связывает конец массива с его началом
        // Если индекс i выходит за конец массива, отсчёт продолжается с начала
        // Если индекс i выходит за начало массива, отсчёт продолжается с конца
        return (i + capacity()) % capacity()
    }

    /* Добавить элемент в начало дека */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("Дек заполнен")
            return
        }
        // Сдвинуть индекс начала дека на одну позицию влево
        // При выходе за начало массива операция взятия остатка возвращает front в конец
        front = index(front - 1)
        // Добавить num в начало дека
        nums[front] = num
        queSize++
    }

    /* Добавить элемент в конец дека */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("Дек заполнен")
            return
        }
        // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        val rear = index(front + queSize)
        // Добавить num в конец дека
        nums[rear] = num
        queSize++
    }

    /* Извлечь элемент из начала дека */
    fun popFirst(): Int {
        val num = peekFirst()
        // Сдвинуть индекс начала дека на одну позицию вперёд
        front = index(front + 1)
        queSize--
        return num
    }

    /* Извлечь элемент из конца дека */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* Посмотреть первый элемент дека */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Посмотреть последний элемент дека */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Вычислить индекс последнего элемента
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* Вернуть массив для вывода */
    fun toArray(): IntArray {
        // Преобразовать только те элементы, которые сейчас находятся в деке
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

/* Пример использования */
fun main() {
    /* Инициализировать дек */
    val deque = ArrayDeque(10)
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