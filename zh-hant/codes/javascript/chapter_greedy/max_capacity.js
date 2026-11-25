/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大容量：貪婪法 */
function maxCapacity(ht) {
    // 將 i、j 分別設在陣列的兩端
    let i = 0,
        j = ht.length - 1;
    // 起始最大容量為 0
    let res = 0;
    // 反覆執行貪婪選擇，直到兩塊隔板相遇
    while (i < j) {
        // 更新最大容量
        const cap = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 將較矮隔板的指標往內移
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* 主程式 */
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// 貪婪演算法
const res = maxCapacity(ht);
console.log(`最大容量為 ${res}`);
