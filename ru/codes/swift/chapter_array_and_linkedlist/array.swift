/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Чтение случайного элемента */
func randomAccess(nums: [Int]) -> Int {
    // Выбрать случайное число из интервала [0, nums.count)
    let randomIndex = nums.indices.randomElement()!
    // Получить и вернуть случайный элемент
    let randomNum = nums[randomIndex]
    return randomNum
}

/* Увеличение длины массива */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // Создать массив увеличенной длины
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // Скопировать все элементы исходного массива в новый
    for i in nums.indices {
        res[i] = nums[i]
    }
    // Вернуть новый массив увеличенной длины
    return res
}

/* Вставить num в массив по индексу index */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Сдвинуть на одну позицию вправо все элементы начиная с index
    for i in stride(from: nums.count - 1, to: index, by: -1) {
        nums[i] = nums[i - 1]
    }
    // Записать num по индексу index
    nums[index] = num
}

/* Удалить элемент по индексу index */
func remove(nums: inout [Int], index: Int) {
    // Сдвинуть все элементы после index на одну позицию влево
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* Обход массива */
func traverse(nums: [Int]) {
    var count = 0
    // Обойти массив по индексам
    for i in nums.indices {
        count += nums[i]
    }
    // Перебрать элементы массива напрямую
    for num in nums {
        count += num
    }
    // Одновременно перебирать индексы и элементы
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* Поиск заданного элемента в массиве */
func find(nums: [Int], target: Int) -> Int {
    for i in nums.indices {
        if nums[i] == target {
            return i
        }
    }
    return -1
}

@main
enum _Array {
    /* Демонстрационный код */
    static func main() {
        /* Инициализация массива */
        let arr = Array(repeating: 0, count: 5)
        print("Массив arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("Массив nums = \(nums)")

        /* Чтение случайного элемента */
        let randomNum = randomAccess(nums: nums)
        print("Случайный элемент nums: \(randomNum)")

        /* Увеличение длины */
        nums = extend(nums: nums, enlarge: 3)
        print("После увеличения длины массива до 8 nums = \(nums)")

        /* Вставка элемента */
        insert(nums: &nums, num: 6, index: 3)
        print("После вставки числа 6 по индексу 3 nums = \(nums)")

        /* Удаление элемента */
        remove(nums: &nums, index: 2)
        print("После удаления элемента по индексу 2 nums = \(nums)")

        /* Обход массива */
        traverse(nums: nums)

        /* Поиск элемента */
        let index = find(nums: nums, target: 3)
        print("Индекс элемента 3 в nums = \(index)")
    }
}
