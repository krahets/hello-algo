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
    // Инициализировать i и j так, чтобы они располагались по двум концам массива
    var i = 0
    var j = ht.size - 1
    // Начальная максимальная вместимость равна 0
    var res = 0
    // Выполнять жадный выбор в цикле, пока две доски не встретятся
    while (i < j) {
        // Обновить максимальную вместимость
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Сдвигать внутрь более короткую сторону
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* Driver Code */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // Жадный алгоритм
    val res = maxCapacity(ht)
    println("Максимальная вместимость = $res")
}