/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Random access to element */
function randomAccess(nums) {
    // Randomly select a number in the interval [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Retrieve and return the random element
    const random_num = nums[random_index];
    return random_num;
}

/* Extend array length */
// Note: JavaScript's Array is dynamic array, can be directly expanded
// For learning purposes, this function treats Array as fixed-length array
function extend(nums, enlarge) {
    // Initialize an array with extended length
    const res = new Array(nums.length + enlarge).fill(0);
    // Copy all elements from the original array to the new array
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Return the extended new array
    return res;
}

/* Insert element num at index index in the array */
function insert(nums, num, index) {
    // Move all elements at and after index index backward by one position
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index index
    nums[index] = num;
}

/* Remove the element at index index */
function remove(nums, index) {
    // Move all elements after index index forward by one position
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Traverse array */
function traverse(nums) {
    let count = 0;
    // Traverse array by index
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // Direct traversal of array elements
    for (const num of nums) {
        count += num;
    }
}

/* Find the specified element in the array */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* Driver Code */
/* Initialize array */
const arr = new Array(5).fill(0);
console.log('Array arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('Array nums =', nums);

/* Insert element */
let random_num = randomAccess(nums);
console.log('Get random element in nums', random_num);

/* Traverse array */
nums = extend(nums, 3);
console.log('Extend array length to 8, get nums =', nums);

/* Insert element */
insert(nums, 6, 3);
console.log('Insert number 6 at index 3, get nums =', nums);

/* Remove element */
remove(nums, 2);
console.log('Remove element at index 2, get nums =', nums);

/* Traverse array */
traverse(nums);

/* Find element */
let index = find(nums, 3);
console.log('Find element 3 in nums, get index =', index);
