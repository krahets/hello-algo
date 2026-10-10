/**
 * File: insertion_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Insertion sort */
function insertionSort(nums: number[]): void {
    // Outer loop: sorted interval is [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        const base = nums[i];
        let j = i - 1;
        // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
            j--;
        }
        nums[j + 1] = base; // Assign base to the correct position
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('After insertion sort, nums =', nums);

export {};
