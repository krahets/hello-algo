/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 随机访问元素 */
function randomAccess(nums) {
    // 在区间 [0, nums.length) 中随机抽取一个数字
    const random_index = Math.floor(Math.random() * nums.length);
    // 获取并返回随机元素
    const random_num = nums[random_index];
    return random_num;
}

/* 扩展数组长度 */
// 请注意，JavaScript 的 Array 是动态数组，可以直接扩展
// 为了方便学习，本函数将 Array 看作长度不可变的数组
function extend(nums, enlarge) {
    // 初始化一个扩展长度后的数组
    const res = new Array(nums.length + enlarge).fill(0);
    // 将原数组中的所有元素复制到新数组
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // 返回扩展后的新数组
    return res;
}

/* 在数组的索引 index 处插入元素 num */
function insert(nums, num, index) {
    // 把索引 index 以及之后的所有元素向后移动一位
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num;
}

/* 删除索引 index 处的元素 */
function remove(nums, index) {
    // 把索引 index 之后的所有元素向前移动一位
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 遍历数组 */
function traverse(nums) {
    let count = 0;
    // 通过索引遍历数组
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // 直接遍历数组元素
    for (const num of nums) {
        count += num;
    }
}

/* 在数组中查找指定元素 */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* Driver Code */
/* 初始化数组 */
const arr = new Array(5).fill(0);
console.log('数组 arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('数组 nums =', nums);

/* 随机访问 */
let random_num = randomAccess(nums);
console.log('在 nums 中获取随机元素', random_num);

/* 长度扩展 */
nums = extend(nums, 3);
console.log('将数组长度扩展至 8 ，得到 nums =', nums);

/* 插入元素 */
insert(nums, 6, 3);
console.log('在索引 3 处插入数字 6 ，得到 nums =', nums);

/* 删除元素 */
remove(nums, 2);
console.log('删除索引 2 处的元素，得到 nums =', nums);

/* 遍历数组 */
traverse(nums);

/* 查找元素 */
let index = find(nums, 3);
console.log('在 nums 中查找元素 3 ，得到索引 =', index);
