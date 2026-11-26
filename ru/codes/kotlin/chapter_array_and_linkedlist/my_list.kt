/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Класс списка */
class MyList {
    private var arr: IntArray = intArrayOf() // Массив для хранения элементов списка
    private var capacity: Int = 10 // Ёмкость списка
    private var size: Int = 0 // Длина списка (текущее количество элементов)
    private var extendRatio: Int = 2 // Коэффициент увеличения ёмкости списка

    /* Конструктор */
    init {
        arr = IntArray(capacity)
    }

    /* Получить длину списка (текущее количество элементов) */
    fun size(): Int {
        return size
    }

    /* Получить ёмкость списка */
    fun capacity(): Int {
        return capacity
    }

    /* Доступ к элементу */
    fun get(index: Int): Int {
        // При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс за пределами списка")
        return arr[index]
    }

    /* Изменение элемента */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс за пределами списка")
        arr[index] = num
    }

    /* Добавление элемента в конец */
    fun add(num: Int) {
        // Если для элементов не хватает места, увеличить ёмкость
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // Обновить количество элементов
        size++
    }

    /* Вставка элемента в середину */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс за пределами списка")
        // Если для элементов не хватает места, увеличить ёмкость
        if (size == capacity())
            extendCapacity()
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // Обновить количество элементов
        size++
    }

    /* Удаление элемента */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Индекс за пределами списка")
        val num = arr[index]
        // Сдвинуть все элементы после index на одну позицию влево
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // Обновить количество элементов
        size--
        // Вернуть удалённый элемент
        return num
    }

    /* Увеличение ёмкости списка */
    fun extendCapacity() {
        // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
        arr = arr.copyOf(capacity() * extendRatio)
        // Обновить ёмкость списка
        capacity = arr.size
    }

    /* Преобразовать список в массив */
    fun toArray(): IntArray {
        val size = size()
        // Преобразовать только используемую часть списка
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Демонстрационный код */
fun main() {
    /* Инициализация списка */
    val nums = MyList()
    /* Добавление элемента в конец */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("Список nums = ${nums.toArray().contentToString()}, ёмкость = ${nums.capacity()}, длина = ${nums.size()}")

    /* Вставка элемента в середину */
    nums.insert(3, 6)
    println("После вставки числа 6 по индексу 3 nums = ${nums.toArray().contentToString()}")

    /* Удаление элемента */
    nums.remove(3)
    println("После удаления элемента по индексу 3 nums = ${nums.toArray().contentToString()}")

    /* Доступ к элементу */
    val num = nums.get(1)
    println("Элемент по индексу 1: num = $num")

    /* Изменение элемента */
    nums.set(1, 0)
    println("После записи 0 по индексу 1 nums = ${nums.toArray().contentToString()}")

    /* Проверка увеличения ёмкости */
    for (i in 0..9) {
        // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
        nums.add(i)
    }
    println("После увеличения ёмкости список nums = ${nums.toArray().contentToString()}, ёмкость = ${nums.capacity()}, длина = ${nums.size()}")
}