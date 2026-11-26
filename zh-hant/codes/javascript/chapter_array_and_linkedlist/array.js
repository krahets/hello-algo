/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 隨機存取元素 */
function randomAccess(nums) {
    // 從區間 [0, nums.length) 隨機選取一個數
    const random_index = Math.floor(Math.random() * nums.length);
    // 取得並回傳隨機選出的元素
    const random_num = nums[random_index];
    return random_num;
}

/* 增加陣列長度 */
// 請注意，JavaScript 的 Array 是動態陣列，可直接增加長度
// 為方便學習，此函式將 Array 視為長度固定的陣列
function extend(nums, enlarge) {
    // 初始化加長後的陣列
    const res = new Array(nums.length + enlarge).fill(0);
    // 將原陣列的所有元素複製到新陣列
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // 回傳加長後的新陣列
    return res;
}

/* 在陣列的索引 index 處插入元素 num */
function insert(nums, num, index) {
    // 將索引 index 起的所有元素往後移一格
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 將 num 指派給索引 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
function remove(nums, index) {
    // 將索引 index 之後的所有元素往前移一格
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
function traverse(nums) {
    let count = 0;
    // 依索引走訪陣列
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // 直接走訪陣列中的元素
    for (const num of nums) {
        count += num;
    }
}

/* 在陣列中尋找指定元素 */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* 範例主程式 */
/* 初始化陣列 */
const arr = new Array(5).fill(0);
console.log('陣列 arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('陣列 nums =', nums);

/* 隨機存取 */
let random_num = randomAccess(nums);
console.log('從 nums 隨機取得的元素為', random_num);

/* 增加長度 */
nums = extend(nums, 3);
console.log('將陣列長度增加至 8，得到 nums =', nums);

/* 插入元素 */
insert(nums, 6, 3);
console.log('在索引 3 處插入數字 6，得到 nums =', nums);

/* 刪除元素 */
remove(nums, 2);
console.log('刪除索引 2 處的元素，得到 nums =', nums);

/* 走訪陣列 */
traverse(nums);

/* 尋找元素 */
let index = find(nums, 3);
console.log('在 nums 中尋找元素 3，得到索引 =', index);
