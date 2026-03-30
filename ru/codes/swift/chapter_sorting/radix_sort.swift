/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Получить k-й разряд элемента num, где exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
    (num / exp) % 10
}

/* Сортировка подсчетом (сортировка по k-му разряду nums) */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // Разряды десятичной системы лежат в диапазоне 0~9, поэтому нужен массив корзин длины 10
    var counter = Array(repeating: 0, count: 10)
    // Подсчитать число появлений каждой цифры от 0 до 9
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // Получить k-й разряд nums[i], обозначив его как d
        counter[d] += 1 // Подсчитать число появлений цифры d
    }
    // Вычислить префиксные суммы и преобразовать «число появлений» в «индекс массива»
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // Выполняя обратный проход, заполнить res элементами по статистике в корзинах
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // Получить индекс j цифры d в массиве
        res[j] = nums[i] // Поместить текущий элемент по индексу j
        counter[d] -= 1 // Уменьшить количество d на 1
    }
    // Перезаписать исходный массив nums результатом
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* Поразрядная сортировка */
func radixSort(nums: inout [Int]) {
    // Получить максимальный элемент массива, чтобы определить максимальное число разрядов
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // Проходить разряды от младшего к старшему
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // Выполнить сортировку подсчетом по k-му разряду элементов массива
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // то есть exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Driver Code */
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
