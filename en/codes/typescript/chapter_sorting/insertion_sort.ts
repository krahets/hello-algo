/**
 * File: insertion_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Insertion sort */
function insertionSort(nums: number[]): void {
    // Outer loop: the sorted range is [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        const base = nums[i];
        let j = i - 1;
        // Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
            j--;
        }
        nums[j + 1] = base; // Place base at the correct position
    }
}

/* Driver code */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('After insertion sort, nums =', nums);

export {};
