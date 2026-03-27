/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Класс списка */
class MyList {
    private var arr: IntArray = intArrayOf() // Массив (хранит элементы списка)
    private var capacity: Int = 10 // Вместимость списка
    private var size: Int = 0 // Длина списка (текущее количество элементов)
    private var extendRatio: Int = 2 // Коэффициент расширения списка при каждом увеличении

    /* Конструктор */
    init {
        arr = IntArray(capacity)
    }

    /* Получить длину списка (текущее количество элементов) */
    fun size(): Int {
        return size
    }

    /* Получить вместимость списка */
    fun capacity(): Int {
        return capacity
    }

    /* Получить доступ к элементу */
    fun get(index: Int): Int {
        // Если индекс выходит за границы, выбросить исключение; далее аналогично
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс вне допустимого диапазона")
        return arr[index]
    }

    /* Обновить элемент */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс вне допустимого диапазона")
        arr[index] = num
    }

    /* Добавить элемент в конец */
    fun add(num: Int) {
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // Обновить количество элементов
        size++
    }

    /* Вставить элемент в середину */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс вне допустимого диапазона")
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (size == capacity())
            extendCapacity()
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // Обновить количество элементов
        size++
    }

    /* Удалить элемент */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс вне допустимого диапазона")
        val num = arr[index]
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // Обновить количество элементов
        size--
        // Вернуть удаленный элемент
        return num
    }

    /* Расширение списка */
    fun extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        arr = arr.copyOf(capacity() * extendRatio)
        // ОбновитьВместимость списка
        capacity = arr.size
    }

    /* Преобразовать список в массив */
    fun toArray(): IntArray {
        val size = size()
        // Преобразовать только элементы списка в пределах действительной длины
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Driver Code */
fun main() {
    /* Инициализировать список */
    val nums = MyList()
    /* Добавить элемент в конец */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("Список nums = ${nums.toArray().contentToString()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}")

    /* Вставить элемент в середину */
    nums.insert(3, 6)
    println("После вставки числа 6 по индексу 3 получаем nums = ${nums.toArray().contentToString()}")

    /* Удалить элемент */
    nums.remove(3)
    println("Удалитьиндекс 3 поэлемент, получаем nums = ${nums.toArray().contentToString()}")

    /* Получить доступ к элементу */
    val num = nums.get(1)
    println("обратиться киндекс 1 поэлемент, получаем num = $num")

    /* Обновить элемент */
    nums.set(1, 0)
    println("После обновления элемента по индексу 1 на 0 получаем nums = ${nums.toArray().contentToString()}")

    /* Проверить механизм расширения */
    for (i in 0..9) {
        // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
        nums.add(i)
    }
    println("Список nums после расширения = ${nums.toArray().contentToString()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}")
}
