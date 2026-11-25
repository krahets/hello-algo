/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Создать массив из чисел { 1, 2, ..., n } в случайном порядке */
func randomNumbers(n: Int) -> [Int] {
    // Создать массив nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // Случайно перемешать элементы массива
    nums.shuffle()
    return nums
}

/* Найти индекс числа 1 в массиве nums */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // Если 1 стоит в начале массива, сложность минимальна: O(1)
        // Если 1 стоит в конце массива, сложность максимальна: O(n)
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* Основная программа */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("Массив [ 1, 2, ..., n ] после перемешивания = \(nums)")
            print("Индекс числа 1: \(index)")
        }
    }
}
