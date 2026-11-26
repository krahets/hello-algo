/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Максимальная вместимость: жадный алгоритм */
func maxCapacity(ht: [Int]) -> Int {
    // Ставим i и j на противоположные концы массива
    var i = ht.startIndex, j = ht.endIndex - 1
    // Изначально максимальная вместимость равна 0
    var res = 0
    // Повторяем жадный выбор, пока перегородки не встретятся
    while i < j {
        // Обновляем максимальную вместимость
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Сдвигаем указатель у более низкой перегородки к центру
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
    /* Пример запуска */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // Жадный алгоритм
        let res = maxCapacity(ht: ht)
        print("Максимальная вместимость: \(res)")
    }
}
