/**
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
function randomNumbers(n: number): number[] {
    const nums = Array(n);
    // 建立陣列 nums = { 1, 2, 3, ..., n }
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 隨機打亂陣列元素
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* 在陣列 nums 中尋找數字 1 的索引 */
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* 主程式 */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\n陣列 [ 1, 2, ..., n ] 打亂順序後 = [' + nums.join(', ') + ']');
    console.log('數字 1 的索引為 ' + index);
}

export {};
