/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 隨機訪問元素 */
function randomAccess(nums) {
    // 在區間 [0, nums.length) 中隨機抽取一個數字
    const random_index = Math.floor(Math.random() * nums.length);
    // 獲取並返回隨機元素
    const random_num = nums[random_index];
    return random_num;
}

/* 擴展陣列長度 */
// 請注意，JavaScript 的 Array 是動態陣列，可以直接擴展
// 為了方便學習，本函式將 Array 看作長度不可變的陣列
function extend(nums, enlarge) {
    // 初始化一個擴展長度後的陣列
    const res = new Array(nums.length + enlarge).fill(0);
    // 將原陣列中的所有元素複製到新陣列
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // 返回擴展後的新陣列
    return res;
}

/* 在陣列的索引 index 處插入元素 num */
function insert(nums, num, index) {
    // 把索引 index 以及之後的所有元素向後移動一位
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 將 num 賦給 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
function remove(nums, index) {
    // 把索引 index 之後的所有元素向前移動一位
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
function traverse(nums) {
    let count = 0;
    // 透過索引走訪陣列
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // 直接走訪陣列元素
    for (const num of nums) {
        count += num;
    }
}

/* 在陣列中查詢指定元素 */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* Driver Code */
/* 初始化陣列 */
const arr = new Array(5).fill(0);
console.log('陣列 arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('陣列 nums =', nums);

/* 隨機訪問 */
let random_num = randomAccess(nums);
console.log('在 nums 中獲取隨機元素', random_num);

/* 長度擴展 */
nums = extend(nums, 3);
console.log('將陣列長度擴展至 8 ，得到 nums =', nums);

/* 插入元素 */
insert(nums, 6, 3);
console.log('在索引 3 處插入數字 6 ，得到 nums =', nums);

/* 刪除元素 */
remove(nums, 2);
console.log('刪除索引 2 處的元素，得到 nums =', nums);

/* 走訪陣列 */
traverse(nums);

/* 查詢元素 */
let index = find(nums, 3);
console.log('在 nums 中查詢元素 3 ，得到索引 =', index);
