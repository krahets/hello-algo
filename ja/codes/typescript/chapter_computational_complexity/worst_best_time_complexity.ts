/**
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* { 1, 2, ..., n } の要素をランダムに並べた配列を生成 */
function randomNumbers(n: number): number[] {
    const nums = Array(n);
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 配列の要素をシャッフル
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* 配列 nums で数値 1 のインデックスを探す */
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        // 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        // 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* 実行例 */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\n配列 [ 1, 2, ..., n ] のシャッフル結果 = [' + nums.join(', ') + ']');
    console.log('数値 1 のインデックスは ' + index);
}

export {};
