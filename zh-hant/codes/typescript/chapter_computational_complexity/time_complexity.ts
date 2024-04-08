/**
 * File: time_complexity.ts
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 常數階 */
function constant(n: number): number {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* 線性階 */
function linear(n: number): number {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* 線性階（走訪陣列） */
function arrayTraversal(nums: number[]): number {
    let count = 0;
    // 迴圈次數與陣列長度成正比
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* 平方階 */
function quadratic(n: number): number {
    let count = 0;
    // 迴圈次數與資料大小 n 成平方關係
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 平方階（泡沫排序） */
function bubbleSort(nums: number[]): number {
    let count = 0; // 計數器
    // 外迴圈：未排序區間為 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 元素交換包含 3 個單元操作
            }
        }
    }
    return count;
}

/* 指數階（迴圈實現） */
function exponential(n: number): number {
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

/* 指數階（遞迴實現） */
function expRecur(n: number): number {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 對數階（迴圈實現） */
function logarithmic(n: number): number {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 對數階（遞迴實現） */
function logRecur(n: number): number {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* 線性對數階 */
function linearLogRecur(n: number): number {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 階乘階（遞迴實現） */
function factorialRecur(n: number): number {
    if (n === 0) return 1;
    let count = 0;
    // 從 1 個分裂出 n 個
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// 可以修改 n 執行，體會一下各種複雜度的操作數量變化趨勢
const n = 8;
console.log('輸入資料大小 n = ' + n);

let count = constant(n);
console.log('常數階的操作數量 = ' + count);

count = linear(n);
console.log('線性階的操作數量 = ' + count);
count = arrayTraversal(new Array(n));
console.log('線性階（走訪陣列）的操作數量 = ' + count);

count = quadratic(n);
console.log('平方階的操作數量 = ' + count);
var nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('平方階（泡沫排序）的操作數量 = ' + count);

count = exponential(n);
console.log('指數階（迴圈實現）的操作數量 = ' + count);
count = expRecur(n);
console.log('指數階（遞迴實現）的操作數量 = ' + count);

count = logarithmic(n);
console.log('對數階（迴圈實現）的操作數量 = ' + count);
count = logRecur(n);
console.log('對數階（遞迴實現）的操作數量 = ' + count);

count = linearLogRecur(n);
console.log('線性對數階（遞迴實現）的操作數量 = ' + count);

count = factorialRecur(n);
console.log('階乘階（遞迴實現）的操作數量 = ' + count);

export {};
