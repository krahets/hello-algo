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
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
    var counter = Array(repeating: 0, count: 10)
    // 统计 0~9 各数字的出现次数
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // 获取 nums[i] 第 k 位，记为 d
        counter[d] += 1 // 统计数字 d 的出现次数
    }
    // 求前缀和，将“出现个数”转换为“数组索引”
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 倒序遍历，根据桶内统计结果，将各元素填入 res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // 获取 d 在数组中的索引 j
        res[j] = nums[i] // 将当前元素填入索引 j
        counter[d] -= 1 // 将 d 的数量减 1
    }
    // 使用结果覆盖原数组 nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 基数排序 */
func radixSort(nums: inout [Int]) {
    // 获取数组的最大元素，用于判断最大位数
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 按照从低位到高位的顺序遍历
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 对数组元素的第 k 位执行计数排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Driver Code */
    static func main() {
        // 基数排序
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("基数排序完成后 nums = \(nums)")
    }
}
