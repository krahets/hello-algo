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

/* 분할 가능한 배낭: 탐욕 */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // 탐욕적 선택을 반복한다
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
            res += item.v
            cap -= item.w
        } else {
            // 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
            res += item.v.toDouble() / item.w * cap
            // 남은 용량이 없으므로 반복문을 종료한다
            break
        }
    }
    return res
}

/* 실행 코드 */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // 탐욕 알고리즘
    val res = fractionalKnapsack(wgt, _val, cap)
    println("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res")
}