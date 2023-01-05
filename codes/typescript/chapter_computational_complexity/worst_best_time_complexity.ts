/*
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
function randomNumbers(n: number): number[] {
    let nums = Array(n);
    // 生成数组 nums = { 1, 2, 3, ..., n }
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 随机打乱数组元素
    for (let i = 0; i < n; i++) {
        let r = Math.floor(Math.random() * (i + 1));
        let temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* 查找数组 nums 中数字 1 所在索引 */
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* Driver Code */
function main(): void {
    for (let i = 0; i < 10; i++) {
        let n = 100;
        let nums = randomNumbers(n);
        let index = findOne(nums);
        console.log(
            "\n数组 [ 1, 2, ..., n ] 被打乱后 = [" + nums.join(", ") + "]"
        );
        console.log("数字 1 的索引为 " + index);
    }
}
