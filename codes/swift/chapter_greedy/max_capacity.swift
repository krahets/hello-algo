/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 最大容量：贪心 */
func maxCapacity(ht: [Int]) -> Int {
    // 初始化 i, j，使其分列数组两端
    var i = ht.startIndex, j = ht.endIndex - 1
    // 初始最大容量为 0
    var res = 0
    // 循环贪心选择，直至两板相遇
    while i < j {
        // 更新最大容量
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 向内移动短板
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
    /* Driver Code */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // 贪心算法
        let res = maxCapacity(ht: ht)
        print("最大容量为 \(res)")
    }
}
