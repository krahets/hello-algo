/**
 * File: merge_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 合併左、右子陣列 */
function merge(nums, left, mid, right) {
    // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
    // 建立暫存陣列 tmp，用來存放合併結果
    const tmp = new Array(right - left + 1);
    // 設定左、右子陣列的起始索引
    let i = left,
        j = mid + 1,
        k = 0;
    // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // 將左、右子陣列中剩餘的元素複製到暫存陣列
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* 合併排序 */
function mergeSort(nums, left, right) {
    // 終止條件
    if (left >= right) return; // 當子陣列的長度為 1 時，終止遞迴
    // 分割階段
    let mid = Math.floor(left + (right - left) / 2); // 計算中點
    mergeSort(nums, left, mid); // 遞迴處理左子陣列
    mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
    // 合併階段
    merge(nums, left, mid, right);
}

/* 主程式 */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('合併排序完成後 nums =', nums);
