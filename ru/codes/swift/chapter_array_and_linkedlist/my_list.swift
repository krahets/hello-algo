/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Класс списка */
class MyList {
    private var arr: [Int] // Массив (хранит элементы списка)
    private var _capacity: Int // Вместимость списка
    private var _size: Int // Длина списка (текущее количество элементов)
    private let extendRatio: Int // Коэффициент расширения списка при каждом увеличении

    /* Конструктор */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* Получить длину списка (текущее количество элементов) */
    func size() -> Int {
        _size
    }

    /* Получить вместимость списка */
    func capacity() -> Int {
        _capacity
    }

    /* Получить доступ к элементу */
    func get(index: Int) -> Int {
        // Если индекс выходит за границы, выбросить ошибку; далее аналогично
        if index < 0 || index >= size() {
            fatalError("Индекс вне допустимого диапазона")
        }
        return arr[index]
    }

    /* Обновить элемент */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Индекс вне допустимого диапазона")
        }
        arr[index] = num
    }

    /* Добавить элемент в конец */
    func add(num: Int) {
        // Если число элементов превышает вместимость, запустить механизм расширения
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // Обновить количество элементов
        _size += 1
    }

    /* Вставить элемент в середину */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Индекс вне допустимого диапазона")
        }
        // Если число элементов превышает вместимость, запустить механизм расширения
        if size() == capacity() {
            extendCapacity()
        }
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // Обновить количество элементов
        _size += 1
    }

    /* Удалить элемент */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("Индекс вне допустимого диапазона")
        }
        let num = arr[index]
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // Обновить количество элементов
        _size -= 1
        // Вернуть удаленный элемент
        return num
    }

    /* Расширение списка */
    func extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // ОбновитьВместимость списка
        _capacity = arr.count
    }

    /* Преобразовать список в массив */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Driver Code */
    static func main() {
        /* Инициализировать список */
        let nums = MyList()
        /* Добавить элемент в конец */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("Список nums = \(nums.toArray()), вместимость = \(nums.capacity()), длина = \(nums.size())")

        /* Вставить элемент в середину */
        nums.insert(index: 3, num: 6)
        print("После вставки числа 6 по индексу 3 получаем nums = \(nums.toArray())")

        /* Удалить элемент */
        nums.remove(index: 3)
        print("Удалитьиндекс 3 поэлемент, получаем nums = \(nums.toArray())")

        /* Получить доступ к элементу */
        let num = nums.get(index: 1)
        print("обратиться киндекс 1 поэлемент, получаем num = \(num)")

        /* Обновить элемент */
        nums.set(index: 1, num: 0)
        print("После обновления элемента по индексу 1 на 0 получаем nums = \(nums.toArray())")

        /* Проверить механизм расширения */
        for i in 0 ..< 10 {
            // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
            nums.add(num: i)
        }
        print("Список nums после расширения = \(nums.toArray()), вместимость = \(nums.capacity()), длина = \(nums.size())")
    }
}
