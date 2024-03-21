/**
 * File: radix_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
function digit(num, exp) {
    // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
    return Math.floor(num / exp) % 10;
}

/* 计数排序（根据 nums 第 k 位排序） */
function countingSortDigit(nums, exp) {
    // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
    const counter = new Array(10).fill(0);
    const n = nums.length;
    // 统计 0~9 各数字的出现次数
    for (let i = 0; i < n; i++) {
        const d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
        counter[d]++; // 统计数字 d 的出现次数
    }
    // 求前缀和，将“出现个数”转换为“数组索引”
    for (let i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // 倒序遍历，根据桶内统计结果，将各元素填入 res
    const res = new Array(n).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        const d = digit(nums[i], exp);
        const j = counter[d] - 1; // 获取 d 在数组中的索引 j
        res[j] = nums[i]; // 将当前元素填入索引 j
        counter[d]--; // 将 d 的数量减 1
    }
    // 使用结果覆盖原数组 nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* 基数排序 */
function radixSort(nums) {
    // 获取数组的最大元素，用于判断最大位数
    let m = Number.MIN_VALUE;
    for (const num of nums) {
        if (num > m) {
            m = num;
        }
    }
    // 按照从低位到高位的顺序遍历
    for (let exp = 1; exp <= m; exp *= 10) {
        // 对数组元素的第 k 位执行计数排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
}

/* Driver Code */
const nums = [
    10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244,
    30524779, 82060337, 63832996,
];
radixSort(nums);
console.log('基数排序完成后 nums =', nums);
