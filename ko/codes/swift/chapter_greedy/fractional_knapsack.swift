/**
 * File: fractional_knapsack.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 물건 */
class Item {
    var w: Int // 물건의 무게
    var v: Int // 물건의 가치

    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

/* 분할 가능한 배낭: 탐욕 */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // 탐욕적 선택을 반복한다
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
            res += Double(item.v)
            cap -= item.w
        } else {
            // 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
            res += Double(item.v) / Double(item.w) * Double(cap)
            // 남은 용량이 없으므로 반복문을 종료한다
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* 실행 코드 */
    static func main() {
        // 물건의 무게
        let wgt = [10, 20, 30, 40, 50]
        // 물건의 가치
        let val = [50, 120, 150, 210, 240]
        // 배낭 용량
        let cap = 50

        // 탐욕 알고리즘
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = \(res)")
    }
}
