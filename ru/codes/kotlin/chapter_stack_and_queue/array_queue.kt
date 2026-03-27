/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Очередь на основе циклического массива */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // Массив для хранения элементов очереди
    private var front: Int = 0 // Указатель front, указывающий на первый элемент очереди
    private var queSize: Int = 0 // Длина очереди

    /* Получить вместимость очереди */
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

    /* Поместить в очередь */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("Очередь заполнена")
            return
        }
        // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        val rear = (front + queSize) % capacity()
        // Добавить num в конец очереди
        nums[rear] = num
        queSize++
    }

    /* Извлечь из очереди */
    fun pop(): Int {
        val num = peek()
        // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* Получить элемент в начале очереди */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Вернутьмассив */
    fun toArray(): IntArray {
        // Преобразовать только элементы списка в пределах действительной длины
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
    /* Инициализировать очередь */
    val capacity = 10
    val queue = ArrayQueue(capacity)

    /* Поместить элемент в очередь */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("очередь queue = ${queue.toArray().contentToString()}")

    /* Получить элемент в начале очереди */
    val peek = queue.peek()
    println("голова очередиэлемент peek = $peek")

    /* Извлечь элемент из очереди */
    val pop = queue.pop()
    println("Элемент, извлеченный из очереди, pop = ${pop}, queue после извлечения =  ${queue.toArray().contentToString()}")

    /* Получить длину очереди */
    val size = queue.size()
    println("Длина очереди size = $size")

    /* Проверить, пуста ли очередь */
    val isEmpty = queue.isEmpty()
    println("Очередь пуста: $isEmpty")

    /* Проверить кольцевой массив */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("Итерация $i: после enqueue + dequeue queue = ${queue.toArray().contentToString()}")
    }
}
