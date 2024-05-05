/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Initialize list */
const nums = [1, 3, 2, 5, 4];
console.log(`列表 nums = ${nums}`);

/* Access element */
const num = nums[1];
console.log(`访问索引 1 处的元素，得到 num = ${num}`);

/* Update element */
nums[1] = 0;
console.log(`将索引 1 处的元素更新为 0 ，得到 nums = ${nums}`);

/* Clear list */
nums.length = 0;
console.log(`清空列表后 nums = ${nums}`);

/* Add element at the end */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`添加元素后 nums = ${nums}`);

/* Insert element in the middle */
nums.splice(3, 0, 6);
console.log(`在索引 3 处插入数字 6 ，得到 nums = ${nums}`);

/* Remove element */
nums.splice(3, 1);
console.log(`删除索引 3 处的元素，得到 nums = ${nums}`);

/* Traverse the list by index */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* Traverse the list elements */
count = 0;
for (const x of nums) {
    count += x;
}

/* Concatenate two lists */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`将列表 nums1 拼接到 nums 之后，得到 nums = ${nums}`);

/* Sort list */
nums.sort((a, b) => a - b);
console.log(`排序列表后 nums = ${nums}`);
