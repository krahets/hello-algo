/**
 * File: bubble_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* バブルソート */
function bubbleSort(nums) {
    // 外側のループ：未整列区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* バブルソート（フラグによる最適化）*/
function bubbleSortWithFlag(nums) {
    // 外側のループ：未整列区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // フラグを初期化
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // 交換があったことを記録
            }
        }
        if (!flag) break; // この走査で交換がなければループを終了
    }
}

/* 実行例 */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('バブルソート後の nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('バブルソート後の nums =', nums1);
