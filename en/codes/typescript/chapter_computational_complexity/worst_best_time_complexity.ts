/**
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Generate a shuffled array containing { 1, 2, ..., n } */
function randomNumbers(n: number): number[] {
    const nums = Array(n);
    // Generate the array nums = { 1, 2, 3, ..., n }
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Shuffle the array elements at random
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* Find the index of 1 in the array nums */
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        // Best case: 1 is the first element, so the search takes O(1) time
        // Worst case: 1 is the last element, so the search takes O(n) time
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* Driver Code */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\nShuffled array [ 1, 2, ..., n ] = [' + nums.join(', ') + ']');
    console.log('Index of 1 = ' + index);
}

export {};
