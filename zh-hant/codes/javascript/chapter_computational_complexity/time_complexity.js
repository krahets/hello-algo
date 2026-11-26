/**
 * File: time_complexity.js
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 常數階 */
function constant(n) {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* 線性階 */
function linear(n) {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* 線性階（走訪陣列） */
function arrayTraversal(nums) {
    let count = 0;
    // 迴圈次數與陣列長度成正比
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* 平方階 */
function quadratic(n) {
    let count = 0;
    // 迴圈次數正比於資料大小 n 的平方
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 平方階（氣泡排序） */
function bubbleSort(nums) {
    let count = 0; // 計數器
    // 外層迴圈：未排序區間為 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 交換元素需 3 個基本操作
            }
        }
    }
    return count;
}

/* 指數階（迴圈實作） */
function exponential(n) {
    let count = 0,
        base = 1;
    // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指數階（遞迴實作） */
function expRecur(n) {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 對數階（迴圈實作） */
function logarithmic(n) {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 對數階（遞迴實作） */
function logRecur(n) {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* 線性對數階 */
function linearLogRecur(n) {
    if (n <= 1) return 1;
    const half = Math.floor(n / 2);
    let count = linearLogRecur(half) + linearLogRecur(half);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 階乘階（遞迴實作） */
function factorialRecur(n) {
    if (n === 0) return 1;
    let count = 0;
    // 1 個呼叫分為 n 個
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* 主程式 */
// 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
const n = 8;
console.log('輸入規模 n = ' + n);

let count = constant(n);
console.log('常數階的操作次數 = ' + count);

count = linear(n);
console.log('線性階的操作次數 = ' + count);
count = arrayTraversal(new Array(n));
console.log('線性階（走訪陣列）的操作次數 = ' + count);

count = quadratic(n);
console.log('平方階的操作次數 = ' + count);
let nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('平方階（氣泡排序）的操作次數 = ' + count);

count = exponential(n);
console.log('指數階（迴圈實作）的操作次數 = ' + count);
count = expRecur(n);
console.log('指數階（遞迴實作）的操作次數 = ' + count);

count = logarithmic(n);
console.log('對數階（迴圈實作）的操作次數 = ' + count);
count = logRecur(n);
console.log('對數階（遞迴實作）的操作次數 = ' + count);

count = linearLogRecur(n);
console.log('線性對數階（遞迴實作）的操作次數 = ' + count);

count = factorialRecur(n);
console.log('階乘階（遞迴實作）的操作次數 = ' + count);
