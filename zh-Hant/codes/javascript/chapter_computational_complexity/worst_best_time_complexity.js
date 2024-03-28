/**
 * File: worst_best_time_complexity.js
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
function randomNumbers(n) {
    const nums = Array(n);
    // 生成陣列 nums = { 1, 2, 3, ..., n }
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

/* 查詢陣列 nums 中數字 1 所在索引 */
function findOne(nums) {
    for (let i = 0; i < nums.length; i++) {
        // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* Driver Code */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\n陣列 [ 1, 2, ..., n ] 被打亂後 = [' + nums.join(', ') + ']');
    console.log('數字 1 的索引為 ' + index);
}
