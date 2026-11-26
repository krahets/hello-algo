/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* Максимальная вместимость: жадный алгоритм */
fun maxCapacity(ht: IntArray): Int {
    // Ставим i и j на противоположные концы массива
    var i = 0
    var j = ht.size - 1
    // Изначально максимальная вместимость равна 0
    var res = 0
    // Повторяем жадный выбор, пока перегородки не встретятся
    while (i < j) {
        // Обновляем максимальную вместимость
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Сдвигаем указатель у более низкой перегородки к центру
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* Пример запуска */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // Жадный алгоритм
    val res = maxCapacity(ht)
    println("Максимальная вместимость: $res")
}