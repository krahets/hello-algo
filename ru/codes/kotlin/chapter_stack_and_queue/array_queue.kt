/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Очередь на основе кольцевого массива */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // Массив для хранения элементов очереди
    private var front: Int = 0 // Указатель head, указывающий на первый элемент очереди
    private var queSize: Int = 0 // Длина очереди

    /* Получить вместимость очереди */
    fun capacity(): Int {
        return nums.size
    }

    /* Получение длины очереди */
    fun size(): Int {
        return queSize
    }

    /* Проверка, пуста ли очередь */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Поместить в очередь */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("Очередь заполнена")
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        val rear = (front + queSize) % capacity()
        // Добавить num в хвост очереди
        nums[rear] = num
        queSize++
    }

    /* Извлечь из очереди */
    fun pop(): Int {
        val num = peek()
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* Доступ к элементу в начале очереди */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Вернуть массив */
    fun toArray(): IntArray {
        // Преобразовывать только элементы списка в пределах фактической длины
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

/* Driver Code */
fun main() {
    /* Инициализация очереди */
    val capacity = 10
    val queue = ArrayQueue(capacity)

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
    println("Извлеченный элемент pop = ${pop}, queue после извлечения = ${queue.toArray().contentToString()}")

    /* Получение длины очереди */
    val size = queue.size()
    println("Длина очереди size = $size")

    /* Проверка, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("Пуста ли очередь = $isEmpty")

    /* Проверка кольцевого массива */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("После $i-го раунда операций enqueue и dequeue queue = ${queue.toArray().contentToString()}")
    }
}