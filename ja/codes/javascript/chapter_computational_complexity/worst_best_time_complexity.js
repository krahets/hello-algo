/**
 * File: worst_best_time_complexity.js
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成 */
function randomNumbers(n) {
    const nums = Array(n);
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 配列要素をランダムにシャッフル
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* 配列 nums 内で数値 1 のインデックスを探す */
function findOne(nums) {
    for (let i = 0; i < nums.length; i++) {
        // 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
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
    console.log('\n配列 [ 1, 2, ..., n ] をシャッフルした後 = [' + nums.join(', ') + ']');
    console.log('数字 1 のインデックスは ' + index);
}
