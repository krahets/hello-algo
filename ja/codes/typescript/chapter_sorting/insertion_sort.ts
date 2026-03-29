/**
 * File: insertion_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 挿入ソート */
function insertionSort(nums: number[]): void {
    // 外側ループ：整列済み区間は [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        const base = nums[i];
        let j = i - 1;
        // 内側ループ: base をソート済み区間 [0, i-1] の正しい位置に挿入する
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // nums[j] を 1 つ右へ移動する
            j--;
        }
        nums[j + 1] = base; // base を正しい位置に配置する
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('挿入ソート完了後 nums =', nums);

export {};
