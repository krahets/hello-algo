/**
 * File: counting_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* 計數排序 */
// 簡易實作，無法用來將物件排序
function countingSortNaive(nums) {
    // 1. 找出陣列中的最大元素 m
    let m = Math.max(...nums);
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. 走訪 counter，將各元素填入原陣列 nums
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* 計數排序 */
// 完整實作，可將物件排序，且屬於穩定排序
function countingSort(nums) {
    // 1. 找出陣列中的最大元素 m
    let m = Math.max(...nums);
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. 計算 counter 的前綴和，將「出現次數」轉為「結尾索引」
    // 也就是說，counter[num]-1 是 num 在 res 中最後一次出現的索引
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. 反向走訪 nums，將各元素填入結果陣列 res
    // 初始化陣列 res，用來記錄結果
    const n = nums.length;
    const res = new Array(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // 將 num 放到對應索引的位置
        counter[num]--; // 將前綴和減 1，取得下次放置 num 時所需的索引
    }
    // 用結果陣列 res 覆寫原陣列 nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* 主程式 */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('計數排序（無法將物件排序）完成後 nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('計數排序完成後 nums1 =', nums1);
