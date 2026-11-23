/**
 * File: bubble_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* バブルソート */
function bubbleSort(nums: number[]): void {
    // 外側のループ：未ソート区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* バブルソート（フラグによる最適化）*/
function bubbleSortWithFlag(nums: number[]): void {
    // 外側のループ：未ソート区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // フラグを初期化する
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // 要素を交換したことを記録する
            }
        }
        if (!flag) break; // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
    }
}

/* 実行用コード */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('バブルソート完了後 nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('バブルソート完了後 nums =', nums1);

export {};
