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

/* Подсчетная сортировка (сортировка по k-му разряду nums) */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // Диапазон десятичного разряда равен 0~9, поэтому нужен массив корзин длины 10
    var counter = Array(repeating: 0, count: 10)
    // Подсчитать количество появлений каждой цифры от 0 до 9
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // Получить k-й разряд nums[i] и обозначить его как d
        counter[d] += 1 // Подсчитать количество появлений цифры d
    }
    // Вычислить префиксную сумму и преобразовать число появлений в индексы массива
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // Обойти в обратном порядке и, согласно статистике по корзинам, заполнить элементы в res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // Получить индекс j цифры d в массиве
        res[j] = nums[i] // Записать текущий элемент в индекс j
        counter[d] -= 1 // Уменьшить количество d на 1
    }
    // Перезаписать исходный массив nums результатом
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* Поразрядная сортировка */
func radixSort(nums: inout [Int]) {
    // Получить максимальный элемент массива, чтобы определить наибольшее число разрядов
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // Перебирать от младшего разряда к старшему
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // Выполнить подсчетную сортировку по k-му разряду элементов массива
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
        print("Поразрядная сортировкапосле завершения nums = \(nums)")
    }
}
