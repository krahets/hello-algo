/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 물건 */
class Item(
    val w: Int, // 물건
    val v: Int  // 물건의 가치
)

/* 탐욕 알고리즘으로 분할 가능 배낭 풀기 */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // 무게와 가치를 속성으로 갖는 물건의 리스트를 만든다
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // 탐욕 선택을 반복한다
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 담는다
            res += item.v
            cap -= item.w
        } else {
            // 남은 용량이 부족하면 현재 물건의 일부만 배낭에 담는다
            res += item.v.toDouble() / item.w * cap
            // 남은 용량이 없으므로 반복문을 빠져나온다
            break
        }
    }
    return res
}

/* 실행 예제 */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // 탐욕 알고리즘
    val res = fractionalKnapsack(wgt, _val, cap)
    println("배낭 용량 안에서 얻는 최대 가치: $res")
}