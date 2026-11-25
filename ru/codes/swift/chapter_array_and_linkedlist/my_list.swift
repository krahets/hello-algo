/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Класс списка */
class MyList {
    private var arr: [Int] // Массив для хранения элементов списка
    private var _capacity: Int // Ёмкость списка
    private var _size: Int // Длина списка (текущее количество элементов)
    private let extendRatio: Int // Коэффициент увеличения ёмкости списка

    /* Конструктор */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* Получить длину списка (текущее количество элементов)*/
    func size() -> Int {
        _size
    }

    /* Получить ёмкость списка */
    func capacity() -> Int {
        _capacity
    }

    /* Доступ к элементу */
    func get(index: Int) -> Int {
        // При выходе индекса за границы сообщить об ошибке. То же правило действует ниже
        if index < 0 || index >= size() {
            fatalError("Индекс за пределами списка")
        }
        return arr[index]
    }

    /* Изменение элемента */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Индекс за пределами списка")
        }
        arr[index] = num
    }

    /* Добавление элемента в конец */
    func add(num: Int) {
        // Если для элементов не хватает места, увеличить ёмкость
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // Обновить количество элементов
        _size += 1
    }

    /* Вставка элемента в середину */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Индекс за пределами списка")
        }
        // Если для элементов не хватает места, увеличить ёмкость
        if size() == capacity() {
            extendCapacity()
        }
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // Обновить количество элементов
        _size += 1
    }

    /* Удаление элемента */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("Индекс за пределами списка")
        }
        let num = arr[index]
        // Сдвинуть все элементы после index на одну позицию влево
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // Обновить количество элементов
        _size -= 1
        // Вернуть удалённый элемент
        return num
    }

    /* Увеличение ёмкости списка */
    func extendCapacity() {
        // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // Обновить ёмкость списка
        _capacity = arr.count
    }

    /* Преобразовать список в массив */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Демонстрационный код */
    static func main() {
        /* Инициализация списка */
        let nums = MyList()
        /* Добавление элемента в конец */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("Список nums = \(nums.toArray()), ёмкость = \(nums.capacity()), длина = \(nums.size())")

        /* Вставка элемента в середину */
        nums.insert(index: 3, num: 6)
        print("После вставки числа 6 по индексу 3 nums = \(nums.toArray())")

        /* Удаление элемента */
        nums.remove(index: 3)
        print("После удаления элемента по индексу 3 nums = \(nums.toArray())")

        /* Доступ к элементу */
        let num = nums.get(index: 1)
        print("Элемент по индексу 1: num = \(num)")

        /* Изменение элемента */
        nums.set(index: 1, num: 0)
        print("После записи 0 по индексу 1 nums = \(nums.toArray())")

        /* Проверка увеличения ёмкости */
        for i in 0 ..< 10 {
            // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
            nums.add(num: i)
        }
        print("После увеличения ёмкости список nums = \(nums.toArray()), ёмкость = \(nums.capacity()), длина = \(nums.size())")
    }
}
