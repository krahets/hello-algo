/**
 * File: radix_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* 取得元素 num 的第 k 位數字，其中 exp = 10^(k-1) */
function digit(num: number, exp: number): number {
    // 傳入 exp 而非 k，可避免在此重複執行成本較高的次方運算
    return Math.floor(num / exp) % 10;
}

/* 計數排序（依 nums 中各元素的第 k 位數字排序） */
function countingSortDigit(nums: number[], exp: number): void {
    // 十進位的每個數位介於 0~9 之間，因此需要長度為 10 的桶陣列
    const counter = new Array(10).fill(0);
    const n = nums.length;
    // 統計 0~9 各數字出現的次數
    for (let i = 0; i < n; i++) {
        const d = digit(nums[i], exp); // 取得 nums[i] 的第 k 位數字，記為 d
        counter[d]++; // 統計數字 d 出現的次數
    }
    // 計算前綴和，將「出現次數」轉為「陣列索引」
    for (let i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // 反向走訪，依桶內的統計結果將各元素填入 res
    const res = new Array(n).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        const d = digit(nums[i], exp);
        const j = counter[d] - 1; // 取得 d 在陣列中的索引 j
        res[j] = nums[i]; // 將目前的元素填入索引 j 的位置
        counter[d]--; // 將 d 的數量減 1
    }
    // 用結果覆寫原陣列 nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* 基數排序 */
function radixSort(nums: number[]): void {
    // 取得陣列中的最大元素，用來判斷最多有幾位數
    let m: number = Math.max(... nums);
    // 依序從最低位走訪到最高位
    for (let exp = 1; exp <= m; exp *= 10) {
        // 依陣列元素的第 k 位數字執行計數排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
}

/* 主程式 */
const nums = [
    10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244,
    30524779, 82060337, 63832996,
];
radixSort(nums);
console.log('基數排序完成後 nums =', nums);

export {};
