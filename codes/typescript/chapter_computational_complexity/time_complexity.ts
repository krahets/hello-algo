/**
 * File: time_complexity.ts
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 常数阶 */
function constant(n: number): number {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* 线性阶 */
function linear(n: number): number {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* 线性阶（遍历数组） */
function arrayTraversal(nums: number[]): number {
    let count = 0;
    // 循环次数与数组长度成正比
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* 平方阶 */
function quadratic(n: number): number {
    let count = 0;
    // 循环次数与数据大小 n 成平方关系
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 平方阶（冒泡排序） */
function bubbleSort(nums: number[]): number {
    let count = 0; // 计数器
    // 外循环：未排序区间为 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 元素交换包含 3 个单元操作
            }
        }
    }
    return count;
}

/* 指数阶（循环实现） */
function exponential(n: number): number {
    let count = 0,
        base = 1;
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指数阶（递归实现） */
function expRecur(n: number): number {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 对数阶（循环实现） */
function logarithmic(n: number): number {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 对数阶（递归实现） */
function logRecur(n: number): number {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* 线性对数阶 */
function linearLogRecur(n: number): number {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 阶乘阶（递归实现） */
function factorialRecur(n: number): number {
    if (n === 0) return 1;
    let count = 0;
    // 从 1 个分裂出 n 个
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
const n = 8;
console.log('输入数据大小 n = ' + n);

let count = constant(n);
console.log('常数阶的操作数量 = ' + count);

count = linear(n);
console.log('线性阶的操作数量 = ' + count);
count = arrayTraversal(new Array(n));
console.log('线性阶（遍历数组）的操作数量 = ' + count);

count = quadratic(n);
console.log('平方阶的操作数量 = ' + count);
var nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('平方阶（冒泡排序）的操作数量 = ' + count);

count = exponential(n);
console.log('指数阶（循环实现）的操作数量 = ' + count);
count = expRecur(n);
console.log('指数阶（递归实现）的操作数量 = ' + count);

count = logarithmic(n);
console.log('对数阶（循环实现）的操作数量 = ' + count);
count = logRecur(n);
console.log('对数阶（递归实现）的操作数量 = ' + count);

count = linearLogRecur(n);
console.log('线性对数阶（递归实现）的操作数量 = ' + count);

count = factorialRecur(n);
console.log('阶乘阶（递归实现）的操作数量 = ' + count);

export {};
