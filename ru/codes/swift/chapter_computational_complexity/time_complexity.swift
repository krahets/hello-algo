/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Постоянная сложность */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* Линейная сложность */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* Линейная сложность (обход массива) */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // Число итераций пропорционально длине массива
    for _ in nums {
        count += 1
    }
    return count
}

/* Квадратичная сложность */
func quadratic(n: Int) -> Int {
    var count = 0
    // Число итераций квадратично зависит от размера данных n
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* Квадратичная сложность (пузырьковая сортировка) */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // Счетчик
    // Внешний цикл: неотсортированный диапазон [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // Обмен элементов включает 3 элементарные операции
            }
        }
    }
    return count
}

/* Экспоненциальная сложность (итеративная реализация) */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Экспоненциальная сложность (рекурсивная реализация) */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* Логарифмическая сложность (итеративная реализация) */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* Логарифмическая сложность (рекурсивная реализация) */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* Линейно-логарифмическая сложность */
func linearLogRecur(n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    var count = linearLogRecur(n: n / 2) + linearLogRecur(n: n / 2)
    for _ in stride(from: 0, to: n, by: 1) {
        count += 1
    }
    return count
}

/* Факториальная сложность (рекурсивная реализация) */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // Из одного получается n
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* Driver Code */
    static func main() {
        // Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
        let n = 8
        print("Размер входных данных n = \(n)")

        var count = constant(n: n)
        print("Число операций константной сложности = \(count)")

        count = linear(n: n)
        print("Число операций линейной сложности = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("Число операций линейной сложности (обход массива) = \(count)")

        count = quadratic(n: n)
        print("Число операций квадратичной сложности = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("Число операций квадратичной сложности (пузырьковая сортировка) = \(count)")

        count = exponential(n: n)
        print("Число операций экспоненциальной сложности (итеративная реализация) = \(count)")
        count = expRecur(n: n)
        print("Число операций экспоненциальной сложности (рекурсивная реализация) = \(count)")

        count = logarithmic(n: n)
        print("Число операций логарифмической сложности (итеративная реализация) = \(count)")
        count = logRecur(n: n)
        print("Число операций логарифмической сложности (рекурсивная реализация) = \(count)")

        count = linearLogRecur(n: n)
        print("Число операций линейно-логарифмической сложности (рекурсивная реализация) = \(count)")

        count = factorialRecur(n: n)
        print("Число операций факториальной сложности (рекурсивная реализация) = \(count)")
    }
}
