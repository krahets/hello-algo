/*
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

function randomNumbers(n: number): number[] {
    let nums = Array(n);
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 随机打乱数组元素
    for (let i = 0; i < n; i++) {
        let r = Math.floor(Math.random() * n);
        let temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] == 1) {
            return i;
        }
    }
    return -1;
}

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
