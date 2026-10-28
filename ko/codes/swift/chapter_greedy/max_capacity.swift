/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 최대 용량: 탐욕 */
func maxCapacity(ht: [Int]) -> Int {
    // i와 j가 각각 배열의 양 끝을 가리키도록 초기화한다
    var i = ht.startIndex, j = ht.endIndex - 1
    // 최대 용량의 초깃값은 0이다
    var res = 0
    // 두 칸막이가 만날 때까지 탐욕적 선택을 반복한다
    while i < j {
        // 최대 용량을 갱신한다
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 낮은 칸막이를 안쪽으로 이동한다
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
    /* 실행 코드 */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // 탐욕 알고리즘
        let res = maxCapacity(ht: ht)
        print("최대 용량 = \(res)")
    }
}
