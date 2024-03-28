/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 初始化串列 */
const nums = [1, 3, 2, 5, 4];
console.log(`串列 nums = ${nums}`);

/* 訪問元素 */
const num = nums[1];
console.log(`訪問索引 1 處的元素，得到 num = ${num}`);

/* 更新元素 */
nums[1] = 0;
console.log(`將索引 1 處的元素更新為 0 ，得到 nums = ${nums}`);

/* 清空串列 */
nums.length = 0;
console.log(`清空串列後 nums = ${nums}`);

/* 在尾部新增元素 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`新增元素後 nums = ${nums}`);

/* 在中間插入元素 */
nums.splice(3, 0, 6);
console.log(`在索引 3 處插入數字 6 ，得到 nums = ${nums}`);

/* 刪除元素 */
nums.splice(3, 1);
console.log(`刪除索引 3 處的元素，得到 nums = ${nums}`);

/* 透過索引走訪串列 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* 直接走訪串列元素 */
count = 0;
for (const x of nums) {
    count += x;
}

/* 拼接兩個串列 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`將串列 nums1 拼接到 nums 之後，得到 nums = ${nums}`);

/* 排序串列 */
nums.sort((a, b) => a - b);
console.log(`排序串列後 nums = ${nums}`);
