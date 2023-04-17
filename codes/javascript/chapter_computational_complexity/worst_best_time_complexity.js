/**
 * File: worst_best_time_complexity.js
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
function randomNumbers(n) {
    const nums = Array(n);
    // 生成数组 nums = { 1, 2, 3, ..., n }
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 随机打乱数组元素
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* 查找数组 nums 中数字 1 所在索引 */
function findOne(nums) {
    for (let i = 0; i < nums.length; i++) {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
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
    console.log('\n数组 [ 1, 2, ..., n ] 被打乱后 = [' + nums.join(', ') + ']');
    console.log('数字 1 的索引为 ' + index);
}
