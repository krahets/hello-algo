/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Случайный доступ к элементу */
func randomAccess(nums: [Int]) -> Int {
    // Случайным образом выбрать число из интервала [0, nums.count)
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
    // Вернуть новый массив после расширения
    return res
}

/* Вставить элемент num по индексу index в массив */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
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

/* Обход массива */
func traverse(nums: [Int]) {
    var count = 0
    // Обход массива по индексам
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
        /* Инициализация массива */
        let arr = Array(repeating: 0, count: 5)
        print("Массив arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("Массив nums = \(nums)")

        /* Случайный доступ */
        let randomNum = randomAccess(nums: nums)
        print("Случайный элемент из nums = \(randomNum)")

        /* Расширение длины */
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
        print("Поиск элемента 3 в nums: индекс = \(index)")
    }
}
