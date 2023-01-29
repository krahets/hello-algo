/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
    (num / exp) % 10
}

/* 计数排序（根据 nums 第 k 位排序） */
func countSort(nums: inout [Int], exp: Int) {
    // 十进制的各位数字范围为 0~9 ，因此需要长度为 10 的桶
    var bucket = Array(repeating: 0, count: 10)
    let n = nums.count
    // 借助桶来统计 0~9 各数字的出现次数
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // 获取 nums[i] 第 k 位，记为 d
        bucket[d] += 1 // 统计数字 d 的出现次数
    }
    // 求前缀和，将“出现个数”转换为“数组索引”
    for i in 1 ..< 10 {
        bucket[i] += bucket[i - 1]
    }
    // 倒序遍历，根据桶内统计结果，将各元素填入暂存数组 tmp
    var tmp = Array(repeating: 0, count: n)
    for i in stride(from: n - 1, through: 0, by: -1) {
        let d = digit(num: nums[i], exp: exp)
        let j = bucket[d] - 1 // 获取 d 在数组中的索引 j
        tmp[j] = nums[i] // 将当前元素填入索引 j
        bucket[d] -= 1 // 将 d 的数量减 1
    }
    // 将 tmp 复制到 nums
    for i in nums.indices {
        nums[i] = tmp[i]
    }
}

/* 基数排序 */
func radixSort(nums: inout [Int]) {
    // 获取数组的最大元素，用于判断最大位数
    var ma = Int.min
    for num in nums {
        if num > ma {
            ma = num
        }
    }
    // 按照从低位到高位的顺序遍历
    for exp in sequence(first: 1, next: { ma >= ($0 * 10) ? $0 * 10 : nil }) {
        // 对数组元素的第 k 位执行「计数排序」
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // k = 3 -> exp = 100
        // 即 exp = 10^(k-1)
        countSort(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Driver Code */
    static func main() {
        /* 基数排序 */
        var nums = [23, 12, 3, 4, 788, 192]
        radixSort(nums: &nums)
        print("基数排序完成后 nums = \(nums)")
    }
}
