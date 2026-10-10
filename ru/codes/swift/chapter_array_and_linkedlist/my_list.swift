/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Класс списка */
class MyList {
    private var arr: [Int] // Массив (для хранения элементов списка)
    private var _capacity: Int // Вместимость списка
    private var _size: Int // Длина списка (текущее число элементов)
    private let extendRatio: Int // Коэффициент увеличения списка при каждом расширении

    /* Конструктор */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* Получить длину списка (текущее число элементов) */
    func size() -> Int {
        _size
    }

    /* Получить вместимость списка */
    func capacity() -> Int {
        _capacity
    }

    /* Доступ к элементу */
    func get(index: Int) -> Int {
        // Если индекс выходит за границы, выбросить ошибку; далее аналогично
        if index < 0 || index >= size() {
            fatalError("индекс выходит за границы")
        }
        return arr[index]
    }

    /* Обновление элемента */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("индекс выходит за границы")
        }
        arr[index] = num
    }

    /* Добавление элемента в конец */
    func add(num: Int) {
        // При превышении вместимости по числу элементов запускается расширение
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // Обновить число элементов
        _size += 1
    }

    /* Вставка элемента в середину */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("индекс выходит за границы")
        }
        // При превышении вместимости по числу элементов запускается расширение
        if size() == capacity() {
            extendCapacity()
        }
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // Обновить число элементов
        _size += 1
    }

    /* Удаление элемента */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("индекс выходит за границы")
        }
        let num = arr[index]
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // Обновить число элементов
        _size -= 1
        // Вернуть удаленный элемент
        return num
    }

    /* Расширение списка */
    func extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // Обновить вместимость списка
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
        /* Инициализация списка */
        let nums = MyList()
        /* Добавление элемента в конец */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("Список nums = \(nums.toArray()) , вместимость = \(nums.capacity()) , длина = \(nums.size())")

        /* Вставка элемента в середину */
        nums.insert(index: 3, num: 6)
        print("После вставки числа 6 по индексу 3 nums = \(nums.toArray())")

        /* Удаление элемента */
        nums.remove(index: 3)
        print("После удаления элемента по индексу 3 nums = \(nums.toArray())")

        /* Доступ к элементу */
        let num = nums.get(index: 1)
        print("Элемент по индексу 1: num = \(num)")

        /* Обновление элемента */
        nums.set(index: 1, num: 0)
        print("После обновления элемента по индексу 1 до 0 nums = \(nums.toArray())")

        /* Проверка механизма расширения */
        for i in 0 ..< 10 {
            // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
            nums.add(num: i)
        }
        print("Список nums после увеличения вместимости = \(nums.toArray()) , вместимость = \(nums.capacity()) , длина = \(nums.size())")
    }
}
