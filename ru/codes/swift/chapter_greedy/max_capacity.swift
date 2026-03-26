/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Максимальная вместимость: жадный алгоритм */
func maxCapacity(ht: [Int]) -> Int {
    // Инициализировать i и j так, чтобы они располагались на двух концах массива
    var i = ht.startIndex, j = ht.endIndex - 1
    // Начальная максимальная вместимость равна 0
    var res = 0
    // Повторять жадный выбор, пока две доски не встретятся
    while i < j {
        // Обновить максимальную вместимость
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Сдвинуть внутрь более короткую сторону
        if ht[i] < ht[j] {
            i += 1
        } else {
            j -= 1
        }
    }
    return res
}

@main
enum MaxCapacity {
    /* Driver Code */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // Жадный алгоритм
        let res = maxCapacity(ht: ht)
        print("максимальныйвместимостьравно \(res)")
    }
}
