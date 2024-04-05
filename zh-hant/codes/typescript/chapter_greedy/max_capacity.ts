/**
 * File: max_capacity.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大容量：貪婪 */
function maxCapacity(ht: number[]): number {
    // 初始化 i, j，使其分列陣列兩端
    let i = 0,
        j = ht.length - 1;
    // 初始最大容量為 0
    let res = 0;
    // 迴圈貪婪選擇，直至兩板相遇
    while (i < j) {
        // 更新最大容量
        const cap: number = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 向內移動短板
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Driver Code */
const ht: number[] = [3, 8, 5, 2, 7, 7, 3, 4];

// 貪婪演算法
const res: number = maxCapacity(ht);
console.log(`最大容量為 ${res}`);

export {};
