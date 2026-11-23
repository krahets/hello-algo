/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 最大容量：貪欲法 */
func maxCapacity(ht: [Int]) -> Int {
    // i, j を初期化し、配列の両端をそれぞれ指すようにする
    var i = ht.startIndex, j = ht.endIndex - 1
    // 最大容量の初期値は 0
    var res = 0
    // 2 枚の板が出会うまで貪欲な選択を繰り返す
    while i < j {
        // 最大容量を更新する
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 低い方の仕切り板を内側に移動する
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
    /* 実行用コード */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // 貪欲アルゴリズム
        let res = maxCapacity(ht: ht)
        print("最大容量は \(res)")
    }
}
