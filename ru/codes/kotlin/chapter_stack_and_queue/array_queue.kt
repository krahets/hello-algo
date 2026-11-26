/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Очередь на основе кольцевого массива */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // Массив для хранения элементов очереди
    private var front: Int = 0 // Индекс первого элемента очереди
    private var queSize: Int = 0 // Длина очереди

    /* Получить ёмкость очереди */
    fun capacity(): Int {
        return nums.size
    }

    /* Получить длину очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверить, пуста ли очередь */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Добавить элемент в очередь */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("Очередь заполнена")
            return
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        val rear = (front + queSize) % capacity()
        // Добавить num в конец очереди
        nums[rear] = num
        queSize++
    }

    /* Извлечь элемент из очереди */
    fun pop(): Int {
        val num = peek()
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* Посмотреть первый элемент очереди */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Вернуть массив */
    fun toArray(): IntArray {
        // Преобразовать только те элементы, которые сейчас находятся в очереди
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[j % capacity()]
            i++
            j++
        }
        return res
    }
}

/* Пример использования */
fun main() {
    /* Инициализировать очередь */
    val capacity = 10
    val queue = ArrayQueue(capacity)

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
    println("Извлечённый элемент pop = ${pop}, после извлечения queue =  ${queue.toArray().contentToString()}")

    /* Получить длину очереди */
    val size = queue.size()
    println("Длина очереди size = $size")

    /* Проверить, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("Очередь пуста = $isEmpty")

    /* Проверить работу кольцевого массива */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("В цикле $i после добавления и извлечения элемента queue = ${queue.toArray().contentToString()}")
    }
}