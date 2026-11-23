/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Предмет */
class Item(
    val w: Int, // Предмет
    val v: Int  // Стоимость предмета
)

/* Дробный рюкзак: жадный алгоритм */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // Создать список предметов с двумя свойствами: вес и стоимость
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // Отсортировать по удельной стоимости item.v / item.w в порядке убывания
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // Циклический жадный выбор
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // Если оставшейся вместимости достаточно, положить в рюкзак текущий предмет целиком
            res += item.v
            cap -= item.w
        } else {
            // Если оставшейся вместимости недостаточно, положить в рюкзак часть текущего предмета
            res += item.v.toDouble() / item.w * cap
            // Свободной вместимости больше не осталось, поэтому выйти из цикла
            break
        }
    }
    return res
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // Жадный алгоритм
    val res = fractionalKnapsack(wgt, _val, cap)
    println("Максимальная стоимость предметов без превышения вместимости рюкзака = $res")
}