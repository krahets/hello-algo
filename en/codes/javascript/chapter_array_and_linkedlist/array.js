/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Random access to elements */
function randomAccess(nums) {
    // Randomly select a number in the interval [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Retrieve and return a random element
    const random_num = nums[random_index];
    return random_num;
}

/* Extend array length */
// Please note that JavaScript's Array is a dynamic array that can be extended
// For learning purposes, this function treats Array as a fixed-length array
function extend(nums, enlarge) {
    // Initialize an extended length array
    const res = new Array(nums.length + enlarge).fill(0);
    // Copy all elements from the original array to the new array
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Return the new array after expansion
    return res;
}

/* Insert element num at `index` */
function insert(nums, num, index) {
    // Move all elements after `index` one position backward
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index
    nums[index] = num;
}

/* Remove the element at `index` */
function remove(nums, index) {
    // Move all elements after `index` one position forward
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
    // Traverse array elements
    for (const num of nums) {
        count += num;
    }
}

/* Search for a specified element in the array */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* Driver Code */
/* Initialize an array */
const arr = new Array(5).fill(0);
console.log('Array arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('Array nums =', nums);

/* Random access */
let random_num = randomAccess(nums);
console.log('Retrieve a random element in nums', random_num);

/* Length extension */
nums = extend(nums, 3);
console.log('Extend the array length to 8, resulting in nums =', nums);

/* Insert element */
insert(nums, 6, 3);
console.log('Insert number 6 at index 3, resulting in nums =', nums);

/* Remove element */
remove(nums, 2);
console.log('Remove the element at index 2, resulting in nums =', nums);

/* Traverse array */
traverse(nums);

/* Search for elements */
let index = find(nums, 3);
console.log('Search for element 3 in nums, resulting in index =', index);
