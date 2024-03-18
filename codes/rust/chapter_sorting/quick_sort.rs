/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* 快速排序 */
struct QuickSort;

impl QuickSort {
    /* 哨兵划分 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 以 nums[left] 为基准数
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            nums.swap(i, j); // 交换这两个元素
        }
        nums.swap(i, left); // 将基准数交换至两子数组的分界线
        i // 返回基准数的索引
    }

    /* 快速排序 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 子数组长度为 1 时终止递归
        if left >= right {
            return;
        }
        // 哨兵划分
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 递归左子数组、右子数组
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 快速排序（中位基准数优化） */
struct QuickSortMedian;

impl QuickSortMedian {
    /* 选取三个候选元素的中位数 */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m 在 l 和 r 之间
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l 在 m 和 r 之间
        }
        right
    }

    /* 哨兵划分（三数取中值） */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 选取三个候选元素的中位数
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        nums.swap(left, med);
        // 以 nums[left] 为基准数
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            nums.swap(i, j); // 交换这两个元素
        }
        nums.swap(i, left); // 将基准数交换至两子数组的分界线
        i // 返回基准数的索引
    }

    /* 快速排序 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 子数组长度为 1 时终止递归
        if left >= right {
            return;
        }
        // 哨兵划分
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 递归左子数组、右子数组
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 快速排序（尾递归优化） */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* 哨兵划分 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 以 nums[left] 为基准数
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            nums.swap(i, j); // 交换这两个元素
        }
        nums.swap(i, left); // 将基准数交换至两子数组的分界线
        i // 返回基准数的索引
    }

    /* 快速排序（尾递归优化） */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 子数组长度为 1 时终止
        while left < right {
            // 哨兵划分操作
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 对两个子数组中较短的那个执行快速排序
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 递归排序左子数组
                left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* 快速排序 */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序完成后 nums = {:?}", nums);

    /* 快速排序（中位基准数优化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序（中位基准数优化）完成后 nums = {:?}", nums);

    /* 快速排序（尾递归优化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序（尾递归优化）完成后 nums = {:?}", nums);
}
