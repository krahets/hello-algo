/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
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
        // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* Driver Code */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("Массив [1, 2, ..., n] после перемешивания = \(nums)")
            print("Индекс числа 1 = \(index)")
        }
    }
}
