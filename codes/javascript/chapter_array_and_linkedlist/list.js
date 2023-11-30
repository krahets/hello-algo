/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 初始化列表 */
const nums = [1, 3, 2, 5, 4];
console.log(`列表 nums = ${nums}`);

/* 访问元素 */
const num = nums[1];
console.log(`访问索引 1 处的元素，得到 num = ${num}`);

/* 更新元素 */
nums[1] = 0;
console.log(`将索引 1 处的元素更新为 0 ，得到 nums = ${nums}`);

/* 清空列表 */
nums.length = 0;
console.log(`清空列表后 nums = ${nums}`);

/* 在尾部添加元素 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`添加元素后 nums = ${nums}`);

/* 在中间插入元素 */
nums.splice(3, 0, 6);
console.log(`在索引 3 处插入数字 6 ，得到 nums = ${nums}`);

/* 删除元素 */
nums.splice(3, 1);
console.log(`删除索引 3 处的元素，得到 nums = ${nums}`);

/* 通过索引遍历列表 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* 直接遍历列表元素 */
count = 0;
for (const x of nums) {
    count += x;
}

/* 拼接两个列表 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`将列表 nums1 拼接到 nums 之后，得到 nums = ${nums}`);

/* 排序列表 */
nums.sort((a, b) => a - b);
console.log(`排序列表后 nums = ${nums}`);
