// File: time_complexity.ts
// Created Time: 2022-12-21
// Author: leeguooooo (leeguooooo@gmail.com)

/* 常数阶 */
function constant(n: number): number {
    let count = 0
    const size = 100000
    for (let i = 0; i < size; i++) {
        count++
    }
    return count
}

/* 线性阶 */
function linear(n: number): number {
    let count = 0
    for (let i = 0; i < n; i++) {
        count++
    }
    return count
}

/* 线性阶（遍历数组） */
function arrayTraversal(nums: number[]): number {
    let count = 0
    // 循环次数与数组长度成正比
    for (let num of nums) {
        count++
    }
    return count
}

/* 平方阶 */
function quadratic(n: number): number {
    let count = 0
    // 循环次数与数组长度成平方关系
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++
        }
    }
    return count
}

/* 平方阶（冒泡排序） */
function bubbleSort(nums: number[]): number {
    let count = 0 // 计数器
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for (let i = nums.length - 1; i > 0; i--) {
        // 内循环：冒泡操作
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // 元素交换包含 3 个单元操作
            }
        }
    }
    return count
}

/* 指数阶（循环实现） */
function exponential(n: number): number {
    let count = 0,
        base = 1
    // cell 每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指数阶（递归实现）*/
function expRecur(n: number): number {
    if (n == 1) return 1
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 对数阶（循环实现） */
function logarithmic(n: number): number {
    let count = 0
    while (n > 1) {
        n = n / 2
        count++
    }
    return count
}

/* 对数阶（递归实现）*/
function logRecur(n: number): number {
    if (n <= 1) return 0
    return logRecur(n / 2) + 1
}

/* 线性对数阶 */
function linearLogRecur(n: number): number {
    if (n <= 1) return 1
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (let i = 0; i < n; i++) {
        count++
    }
    return count
}

/* 阶乘阶（递归实现） */
function factorialRecur(n: number): number {
    if (n == 0) return 1
    let count = 0
    // 从 1 个分裂出 n 个
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
function randomNumbers(n: number): number[] {
    // 生成数组 nums = { 1, 2, 3, ..., n }
    let nums = [...Array(n).keys()].map((i) => i + 1)
    shuffle(nums)
    return nums
}

/* 查找数组 nums 中数字 1 所在索引 */
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === 1) return i
    }
    return -1
}

/* 随机打乱数组元素 */
function shuffle(arr: number[]) {
    let n = arr.length
    for (let i = 0; i < n; i++) {
        let j = Math.floor(Math.random() * n)
            ;[arr[i], arr[j]] = [arr[j], arr[i]]
    }
}

/* Driver Code */
; (function main() {
    for (let i = 0; i < 10; i++) {
        let n = 100
        let nums = randomNumbers(n)
        let index = findOne(nums)
        console.log('\n数组 [ 1, 2, ..., n ] 被打乱后 =', nums)
        console.log('数字 1 的索引为', index)
    }
})()
