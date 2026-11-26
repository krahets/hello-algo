/**
 * File: two_sum.ts
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* 方法 1：総当たり */
function twoSumBruteForce(nums: number[], target: number): number[] {
    const n = nums.length;
    // 二重ループの時間計算量は O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* 方法 2：補助のハッシュテーブルを使う */
function twoSumHashTable(nums: number[], target: number): number[] {
    // 補助のハッシュテーブルの空間計算量は O(n)
    let m: Map<number, number> = new Map();
    // 一重ループの時間計算量は O(n)
    for (let i = 0; i < nums.length; i++) {
        let index = m.get(target - nums[i]);
        if (index !== undefined) {
            return [index, i];
        } else {
            m.set(nums[i], i);
        }
    }
    return [];
}

/* 実行例 */
// 方法 1
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('方法 1 の res = ', res);

// 方法 2
res = twoSumHashTable(nums, target);
console.log('方法 2 の res = ', res);

export {};
