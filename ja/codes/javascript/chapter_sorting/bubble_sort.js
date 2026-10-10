/**
 * File: bubble_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* バブルソート */
function bubbleSort(nums) {
    // 外側のループ：未ソート区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
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

/* バブルソート（フラグ最適化） */
function bubbleSortWithFlag(nums) {
    // 外側のループ：未ソート区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // フラグを初期化する
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // 交換する要素を記録
            }
        }
        if (!flag) break; // このバブル処理で要素交換が一度もなければそのまま終了
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('バブルソート完了後 nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('バブルソート完了後 nums =', nums1);
