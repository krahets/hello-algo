/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* 快速排序 */
struct QuickSort;

impl QuickSort {
    /* 哨兵劃分 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 以 nums[left] 為基準數
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 從右向左找首個小於基準數的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 從左向右找首個大於基準數的元素
            }
            nums.swap(i, j); // 交換這兩個元素
        }
        nums.swap(i, left); // 將基準數交換至兩子陣列的分界線
        i // 返回基準數的索引
    }

    /* 快速排序 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 子陣列長度為 1 時終止遞迴
        if left >= right {
            return;
        }
        // 哨兵劃分
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 遞迴左子陣列、右子陣列
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 快速排序（中位基準數最佳化） */
struct QuickSortMedian;

impl QuickSortMedian {
    /* 選取三個候選元素的中位數 */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m 在 l 和 r 之間
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l 在 m 和 r 之間
        }
        right
    }

    /* 哨兵劃分（三數取中值） */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 選取三個候選元素的中位數
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 將中位數交換至陣列最左端
        nums.swap(left, med);
        // 以 nums[left] 為基準數
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 從右向左找首個小於基準數的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 從左向右找首個大於基準數的元素
            }
            nums.swap(i, j); // 交換這兩個元素
        }
        nums.swap(i, left); // 將基準數交換至兩子陣列的分界線
        i // 返回基準數的索引
    }

    /* 快速排序 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 子陣列長度為 1 時終止遞迴
        if left >= right {
            return;
        }
        // 哨兵劃分
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 遞迴左子陣列、右子陣列
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 快速排序（尾遞迴最佳化） */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* 哨兵劃分 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 以 nums[left] 為基準數
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 從右向左找首個小於基準數的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 從左向右找首個大於基準數的元素
            }
            nums.swap(i, j); // 交換這兩個元素
        }
        nums.swap(i, left); // 將基準數交換至兩子陣列的分界線
        i // 返回基準數的索引
    }

    /* 快速排序（尾遞迴最佳化） */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 子陣列長度為 1 時終止
        while left < right {
            // 哨兵劃分操作
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 對兩個子陣列中較短的那個執行快速排序
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 遞迴排序左子陣列
                left = pivot + 1; // 剩餘未排序區間為 [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 遞迴排序右子陣列
                right = pivot - 1; // 剩餘未排序區間為 [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* 快速排序 */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序完成後 nums = {:?}", nums);

    /* 快速排序（中位基準數最佳化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序（中位基準數最佳化）完成後 nums = {:?}", nums);

    /* 快速排序（尾遞迴最佳化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("快速排序（尾遞迴最佳化）完成後 nums = {:?}", nums);
}
