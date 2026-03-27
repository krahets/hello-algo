/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Класс списка */
class MyList {
    private var arr: IntArray = intArrayOf() // Массив (для хранения элементов списка)
    private var capacity: Int = 10 // Вместимость списка
    private var size: Int = 0 // Длина списка (текущее число элементов)
    private var extendRatio: Int = 2 // Коэффициент увеличения списка при каждом расширении

    /* Конструктор */
    init {
        arr = IntArray(capacity)
    }

    /* Получить длину списка (текущее число элементов) */
    fun size(): Int {
        return size
    }

    /* Получить вместимость списка */
    fun capacity(): Int {
        return capacity
    }

    /* Доступ к элементу */
    fun get(index: Int): Int {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("индекс выходит за границы")
        return arr[index]
    }

    /* Обновление элемента */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("индекс выходит за границы")
        arr[index] = num
    }

    /* Добавление элемента в конец */
    fun add(num: Int) {
        // При превышении вместимости по числу элементов запускается расширение
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // Обновить число элементов
        size++
    }

    /* Вставка элемента в середину */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("индекс выходит за границы")
        // При превышении вместимости по числу элементов запускается расширение
        if (size == capacity())
            extendCapacity()
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // Обновить число элементов
        size++
    }

    /* Удаление элемента */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("индекс выходит за границы")
        val num = arr[index]
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // Обновить число элементов
        size--
        // Вернуть удаленный элемент
        return num
    }

    /* Расширение списка */
    fun extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        arr = arr.copyOf(capacity() * extendRatio)
        // Обновить вместимость списка
        capacity = arr.size
    }

    /* Преобразовать список в массив */
    fun toArray(): IntArray {
        val size = size()
        // Преобразовывать только элементы списка в пределах фактической длины
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Driver Code */
fun main() {
    /* Инициализация списка */
    val nums = MyList()
    /* Добавление элемента в конец */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("Список nums = ${nums.toArray().contentToString()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}")

    /* Вставка элемента в середину */
    nums.insert(3, 6)
    println("После вставки числа 6 по индексу 3 nums = ${nums.toArray().contentToString()}")

    /* Удаление элемента */
    nums.remove(3)
    println("После удаления элемента по индексу 3 nums = ${nums.toArray().contentToString()}")

    /* Доступ к элементу */
    val num = nums.get(1)
    println("Элемент по индексу 1: num = $num")

    /* Обновление элемента */
    nums.set(1, 0)
    println("После обновления элемента по индексу 1 до 0 nums = ${nums.toArray().contentToString()}")

    /* Проверка механизма расширения */
    for (i in 0..9) {
        // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
        nums.add(i)
    }
    println("Список nums после увеличения вместимости = ${nums.toArray().contentToString()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}")
}