/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Initialize the list */
const nums = [1, 3, 2, 5, 4];
console.log(`List nums = ${nums}`);

// [region]{access_element}
/* Access an element */
const num = nums[1]; // Access the element at index 1
// [endregion]{access_element}
console.log(`Access the element at index 1, giving num = ${num}`);

// [region]{update_element}
/* Update an element */
nums[1] = 0; // Update the element at index 1 to 0
// [endregion]{update_element}
console.log(`Update the element at index 1 to 0, giving nums = ${nums}`);

// [region]{clear_list}
/* Clear the list */
nums.length = 0;
// [endregion]{clear_list}
console.log(`After clearing the list, nums = ${nums}`);

// [region]{append_element}
/* Append an element at the end */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
// [endregion]{append_element}
console.log(`After appending elements, nums = ${nums}`);

// [region]{insert_element}
/* Insert an element in the middle */
nums.splice(3, 0, 6); // Insert the number 6 at index 3
// [endregion]{insert_element}
console.log(`Insert the number 6 at index 3, giving nums = ${nums}`);

// [region]{remove_element}
/* Remove an element */
nums.splice(3, 1); // Remove the element at index 3
// [endregion]{remove_element}
console.log(`Remove the element at index 3, giving nums = ${nums}`);

// [region]{iterate_list}
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
// [endregion]{iterate_list}

// [region]{concat_list}
/* Concatenate two lists */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1); // Append list nums1 to nums
// [endregion]{concat_list}
console.log(`Append list nums1 to nums, giving nums = ${nums}`);

// [region]{sort_list}
/* Sort the list */
nums.sort((a, b) => a - b); // After sorting, the list elements are in ascending order
// [endregion]{sort_list}
console.log(`After sorting the list, nums = ${nums}`);
