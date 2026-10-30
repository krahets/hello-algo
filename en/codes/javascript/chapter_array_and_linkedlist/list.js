/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Initialize the list */
const nums = [1, 3, 2, 5, 4];
console.log(`List nums = ${nums}`);

/* Access an element */
const num = nums[1];
console.log(`Access the element at index 1, giving num = ${num}`);

/* Update an element */
nums[1] = 0;
console.log(`Update the element at index 1 to 0, giving nums = ${nums}`);

/* Clear the list */
nums.length = 0;
console.log(`After clearing the list, nums = ${nums}`);

/* Append an element at the end */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`After appending elements, nums = ${nums}`);

/* Insert an element in the middle */
nums.splice(3, 0, 6);
console.log(`Insert the number 6 at index 3, giving nums = ${nums}`);

/* Remove an element */
nums.splice(3, 1);
console.log(`Remove the element at index 3, giving nums = ${nums}`);

/* Traverse the list by index */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* Iterate directly over the list elements */
count = 0;
for (const x of nums) {
    count += x;
}

/* Concatenate two lists */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`Append list nums1 to nums, giving nums = ${nums}`);

/* Sort the list */
nums.sort((a, b) => a - b);
console.log(`After sorting the list, nums = ${nums}`);
