/**
 * File: insertion_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 挿入ソート */
function insertionSort(nums: number[]): void {
    // 外側のループ：整列済み区間は [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        const base = nums[i];
        let j = i - 1;
        // 内側のループ：整列済み区間 [0, i-1] の正しい位置に base を挿入
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // nums[j] を 1 つ右に移動
            j--;
        }
        nums[j + 1] = base; // 正しい位置に base を代入
    }
}

/* 実行例 */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('挿入ソート後の nums =', nums);

export {};
