/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Предмет */
class Item(
    val w: Int, // Вес предмета
    val v: Int  // Стоимость предмета
)

/* Дробный рюкзак: жадный алгоритм */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // Создаём список предметов с двумя свойствами: весом и стоимостью
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // Сортируем по убыванию удельной стоимости item.v / item.w
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // На каждом шаге делаем жадный выбор
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // Если места достаточно, кладём предмет целиком
            res += item.v
            cap -= item.w
        } else {
            // Если места недостаточно, кладём часть предмета
            res += item.v.toDouble() / item.w * cap
            // Рюкзак заполнен, выходим из цикла
            break
        }
    }
    return res
}

/* Пример запуска */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // Жадный алгоритм
    val res = fractionalKnapsack(wgt, _val, cap)
    println("Максимальная стоимость при заданной вместимости рюкзака: $res")
}