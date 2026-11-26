/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 初始化列表 */
const nums = [1, 3, 2, 5, 4];
console.log(`列表 nums = ${nums}`);

/* 存取元素 */
const num = nums[1];
console.log(`存取索引 1 處的元素，得到 num = ${num}`);

/* 更新元素 */
nums[1] = 0;
console.log(`將索引 1 處的元素更新為 0，得到 nums = ${nums}`);

/* 清空列表 */
nums.length = 0;
console.log(`清空列表後，nums = ${nums}`);

/* 在尾端加入元素 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`加入元素後，nums = ${nums}`);

/* 在中間插入元素 */
nums.splice(3, 0, 6);
console.log(`在索引 3 處插入數字 6，得到 nums = ${nums}`);

/* 刪除元素 */
nums.splice(3, 1);
console.log(`刪除索引 3 處的元素，得到 nums = ${nums}`);

/* 依索引走訪列表 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* 直接走訪列表中的元素 */
count = 0;
for (const x of nums) {
    count += x;
}

/* 串接兩個列表 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`將列表 nums1 接在 nums 之後，得到 nums = ${nums}`);

/* 排序列表 */
nums.sort((a, b) => a - b);
console.log(`列表排序後，nums = ${nums}`);
