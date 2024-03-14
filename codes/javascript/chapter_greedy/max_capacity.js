/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大容量：贪心 */
function maxCapacity(ht) {
    // 初始化 i, j，使其分列数组两端
    let i = 0,
        j = ht.length - 1;
    // 初始最大容量为 0
    let res = 0;
    // 循环贪心选择，直至两板相遇
    while (i < j) {
        // 更新最大容量
        const cap = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 向内移动短板
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Driver Code */
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// 贪心算法
const res = maxCapacity(ht);
console.log(`最大容量为 ${res}`);
