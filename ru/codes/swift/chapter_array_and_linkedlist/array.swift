/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Случайный доступ к элементу */
func randomAccess(nums: [Int]) -> Int {
    // Случайно выбрать число в интервале [0, nums.count)
    let randomIndex = nums.indices.randomElement()!
    // Получить и вернуть случайный элемент
    let randomNum = nums[randomIndex]
    return randomNum
}

/* Увеличить длину массива */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // Инициализировать массив увеличенной длины
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // Скопировать все элементы исходного массива в новый массив
    for i in nums.indices {
        res[i] = nums[i]
    }
    // Вернуть новый расширенный массив
    return res
}

/* Вставить элемент num в массив по индексу index */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Сдвинуть индекс index и все последующие элементы на одну позицию назад
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // Присвоить num элементу по индексу index
    nums[index] = num
}

/* Удалить элемент по индексу index */
func remove(nums: inout [Int], index: Int) {
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* Перебрать массив */
func traverse(nums: [Int]) {
    var count = 0
    // Обходить массив по индексам
    for i in nums.indices {
        count += nums[i]
    }
    // Непосредственно обходить элементы массива
    for num in nums {
        count += num
    }
    // Одновременно обходить индексы и элементы данных
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* Найти заданный элемент в массиве */
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
    /* Driver Code */
    static func main() {
        /* Инициализировать массив */
        let arr = Array(repeating: 0, count: 5)
        print("массив arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("массив nums = \(nums)")

        /* Случайный доступ */
        let randomNum = randomAccess(nums: nums)
        print("Полученный случайный элемент из nums \(randomNum)")

        /* Расширение длины */
        nums = extend(nums: nums, enlarge: 3)
        print("После расширения длины массива до 8 получаем nums = \(nums)")

        /* Вставить элемент */
        insert(nums: &nums, num: 6, index: 3)
        print("После вставки числа 6 по индексу 3 получаем nums = \(nums)")

        /* Удалить элемент */
        remove(nums: &nums, index: 2)
        print("После удаления элемента по индексу 2 получаем nums = \(nums)")

        /* Перебрать массив */
        traverse(nums: nums)

        /* Найти элемент */
        let index = find(nums: nums, target: 3)
        print("Поиск элемента 3 в nums дает индекс = \(index)")
    }
}
