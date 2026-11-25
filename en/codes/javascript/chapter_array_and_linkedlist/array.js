/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Access a random element */
function randomAccess(nums) {
    // Pick a random index in [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Get and return the element at that index
    const random_num = nums[random_index];
    return random_num;
}

/* Extend the array */
// A JavaScript Array is dynamic and can grow directly
// For this example, treat Array as a fixed-length array
function extend(nums, enlarge) {
    // Initialize an array with the new length
    const res = new Array(nums.length + enlarge).fill(0);
    // Copy all elements from the original array into the new array
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Return the new, longer array
    return res;
}

/* Insert num at the specified array index */
function insert(nums, num, index) {
    // Shift the elements from index onward one position to the right
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Store num at the specified index
    nums[index] = num;
}

/* Remove the element at the specified index */
function remove(nums, index) {
    // Shift all elements after index one position to the left
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Traverse the array */
function traverse(nums) {
    let count = 0;
    // Traverse the array by index
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // Iterate directly over the array elements
    for (const num of nums) {
        count += num;
    }
}

/* Find a given element in the array */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* Driver Code */
/* Initialize the array */
const arr = new Array(5).fill(0);
console.log('Array arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('Array nums =', nums);

/* Random access */
let random_num = randomAccess(nums);
console.log('Random element from nums:', random_num);

/* Extend the array */
nums = extend(nums, 3);
console.log('After extending the array to length 8, nums =', nums);

/* Insert an element */
insert(nums, 6, 3);
console.log('After inserting 6 at index 3, nums =', nums);

/* Remove an element */
remove(nums, 2);
console.log('After removing the element at index 2, nums =', nums);

/* Traverse the array */
traverse(nums);

/* Find an element */
let index = find(nums, 3);
console.log('Index of 3 in nums =', index);
