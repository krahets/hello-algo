/**
 * File: worst_best_time_complexity.js
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
function randomNumbers(n) {
    const nums = Array(n);
    // Generate array nums = { 1, 2, 3, ..., n }
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Randomly shuffle array elements
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* Find the index of number 1 in array nums */
function findOne(nums) {
    for (let i = 0; i < nums.length; i++) {
        // When element 1 is at the start of the array, achieve best time complexity O(1)
        // When element 1 is at the end of the array, achieve worst time complexity O(n)
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
    console.log('\nThe array [1, 2, ..., n] after being shuffled = [' + nums.join(', ') + ']');
    console.log('The index of number 1 is' + index);
}
