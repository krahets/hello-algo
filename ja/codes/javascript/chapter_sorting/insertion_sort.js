/**
 * File: insertion_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 挿入ソート */
function insertionSort(nums) {
    // 外側のループ：ソート済み区間は [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        let base = nums[i],
            j = i - 1;
        // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
            j--;
        }
        nums[j + 1] = base; // 正しい位置に base を代入する
    }
}

/* 実行用コード */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('挿入ソート完了後 nums =', nums);
