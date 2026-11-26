/**
 * File: selection_sort.js
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 選択ソート */
function selectionSort(nums) {
    let n = nums.length;
    // 外側のループ：未整列区間は [i, n-1]
    for (let i = 0; i < n - 1; i++) {
        // 内側のループ：未整列区間の最小要素を探す
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // 最小要素のインデックスを記録
            }
        }
        // その最小要素と未整列区間の先頭要素を交換
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* 実行例 */
const nums = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('選択ソート後の nums =', nums);
