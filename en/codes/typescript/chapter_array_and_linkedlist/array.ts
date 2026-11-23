/**
 * File: array.ts
 * Created Time: 2022-12-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Access an element at a random index */
function randomAccess(nums: number[]): number {
    // Choose a random index in the interval [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Get and return the randomly selected element
    const random_num = nums[random_index];
    return random_num;
}

/* Extend the array length */
// Note: TypeScript Array is a dynamic array and can grow directly
// For learning purposes, this function treats Array as a fixed-length array
function extend(nums: number[], enlarge: number): number[] {
    // Initialize an array with the extended length
    const res = new Array(nums.length + enlarge).fill(0);
    // Copy all elements from the original array to the new array
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Return the new, extended array
    return res;
}

/* Insert element num at index `index` in the array */
function insert(nums: number[], num: number, index: number): void {
    // Shift all elements at and after index `index` one position to the right
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index `index`
    nums[index] = num;
}

/* Remove the element at index `index` */
function remove(nums: number[], index: number): void {
    // Shift all elements after index `index` one position to the left
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Traverse the array */
function traverse(nums: number[]): void {
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

/* Find a specified element in the array */
function find(nums: number[], target: number): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) {
            return i;
        }
    }
    return -1;
}

/* Driver code */
/* Initialize the array */
const arr: number[] = new Array(5).fill(0);
console.log('Array arr =', arr);
let nums: number[] = [1, 3, 2, 5, 4];
console.log('Array nums =', nums);

/* Random access */
let random_num = randomAccess(nums);
console.log('Randomly selected element from nums:', random_num);

/* Extend the length */
nums = extend(nums, 3);
console.log('Extend the array length to 8, giving nums =', nums);

/* Insert an element */
insert(nums, 6, 3);
console.log('Insert the number 6 at index 3, giving nums =', nums);

/* Remove an element */
remove(nums, 2);
console.log('Remove the element at index 2, giving nums =', nums);

/* Traverse the array */
traverse(nums);

/* Find an element */
let index = find(nums, 3);
console.log('Find element 3 in nums, giving index =', index);

export {};
