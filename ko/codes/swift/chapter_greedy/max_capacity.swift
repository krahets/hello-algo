/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 탐욕 알고리즘으로 최대 용량 구하기 */
func maxCapacity(ht: [Int]) -> Int {
    // i와 j를 각각 배열의 양 끝에 놓는다
    var i = ht.startIndex, j = ht.endIndex - 1
    // 최대 용량의 초깃값은 0이다
    var res = 0
    // 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
    while i < j {
        // 최대 용량을 갱신한다
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
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
    /* 실행 예제 */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // 탐욕 알고리즘
        let res = maxCapacity(ht: ht)
        print("최대 용량: \(res)")
    }
}
