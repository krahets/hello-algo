/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 最大容量（貪欲法） */
func maxCapacity(ht: [Int]) -> Int {
    // i と j を配列の両端に置く
    var i = ht.startIndex, j = ht.endIndex - 1
    // 最大容量の初期値は 0
    var res = 0
    // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
    while i < j {
        // 最大容量を更新する
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 低い板のポインタを内側へ動かす
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
    /* 実行例 */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // 貪欲法
        let res = maxCapacity(ht: ht)
        print("最大容量は \(res)")
    }
}
