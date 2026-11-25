/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Получить k-ю цифру числа num, где exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
    (num / exp) % 10
}

/* Сортировка подсчётом по k-й цифре элементов nums */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
    var counter = Array(repeating: 0, count: 10)
    // Подсчитать вхождения каждой цифры от 0 до 9
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // Получить k-ю цифру nums[i] и обозначить её d
        counter[d] += 1 // Подсчитать вхождения цифры d
    }
    // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // Пройти массив с конца и заполнить res по данным счётчиков
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // Найти индекс j в массиве для цифры d
        res[j] = nums[i] // Записать текущий элемент по индексу j
        counter[d] -= 1 // Уменьшить счётчик d на 1
    }
    // Скопировать результат в исходный массив nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* Поразрядная сортировка */
func radixSort(nums: inout [Int]) {
    // Найти максимум массива, чтобы определить наибольшее число разрядов
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // Перебирать разряды от младшего к старшему
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // Отсортировать элементы подсчётом по k-й цифре
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // То есть exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Тестовый пример */
    static func main() {
        // Поразрядная сортировка
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("После поразрядной сортировки nums = \(nums)")
    }
}
