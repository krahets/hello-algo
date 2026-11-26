/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* 快速排序 */
struct QuickSort;

impl QuickSort {
    /* 哨兵分割 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 以 nums[left] 為基準值
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 從右向左尋找第一個小於基準值的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 從左向右尋找第一個大於基準值的元素
            }
            nums.swap(i, j); // 交換這兩個元素
        }
        nums.swap(i, left); // 交換元素，將基準值移到兩個子陣列的交界處
        i // 回傳基準值的索引
    }

    /* 快速排序 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 子陣列長度為 1 時終止遞迴
        if left >= right {
            return;
        }
        // 哨兵分割
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 遞迴處理左、右子陣列
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 快速排序（以中位數作為基準值的最佳化） */
struct QuickSortMedian;

impl QuickSortMedian {
    /* 取三個候選元素的中位數 */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m 介於 l 和 r 之間
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l 介於 m 和 r 之間
        }
        right
    }

    /* 哨兵分割（三數取中） */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 取三個候選元素的中位數
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 將中位數與陣列最左端的元素交換
        nums.swap(left, med);
        // 以 nums[left] 為基準值
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 從右向左尋找第一個小於基準值的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 從左向右尋找第一個大於基準值的元素
            }
            nums.swap(i, j); // 交換這兩個元素
        }
        nums.swap(i, left); // 交換元素，將基準值移到兩個子陣列的交界處
        i // 回傳基準值的索引
    }

    /* 快速排序 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 子陣列長度為 1 時終止遞迴
        if left >= right {
            return;
        }
        // 哨兵分割
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 遞迴處理左、右子陣列
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 快速排序（遞迴深度最佳化） */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* 哨兵分割 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 以 nums[left] 為基準值
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 從右向左尋找第一個小於基準值的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 從左向右尋找第一個大於基準值的元素
            }
            nums.swap(i, j); // 交換這兩個元素
        }
        nums.swap(i, left); // 交換元素，將基準值移到兩個子陣列的交界處
        i // 回傳基準值的索引
    }

    /* 快速排序（遞迴深度最佳化） */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 子陣列長度為 1 時終止
        while left < right {
            // 執行哨兵分割
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 對兩個子陣列中較短的一個執行快速排序
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 遞迴排序左子陣列
                left = pivot + 1; // 剩餘的未排序區間為 [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 遞迴排序右子陣列
                right = pivot - 1; // 剩餘的未排序區間為 [left, pivot - 1]
            }
        }
    }
}

/* 主程式 */
fn main() {
    /* 快速排序 */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序完成後 nums = {:?}", nums);

    /* 快速排序（以中位數作為基準值的最佳化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序（以中位數作為基準值的最佳化）完成後 nums = {:?}", nums);

    /* 快速排序（遞迴深度最佳化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序（遞迴深度最佳化）完成後 nums = {:?}", nums);
}
