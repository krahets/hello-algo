/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 合併左子陣列和右子陣列 */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // 左子陣列區間為 [left, mid], 右子陣列區間為 [mid+1, right]
    // 建立一個臨時陣列 tmp ，用於存放合併後的結果
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // 初始化左子陣列和右子陣列的起始索引
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // 當左右子陣列都還有元素時，進行比較並將較小的元素複製到臨時陣列中
    while i <= mid && j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i];
            i += 1;
        } else {
            tmp[k] = nums[j];
            j += 1;
        }
        k += 1;
    }
    // 將左子陣列和右子陣列的剩餘元素複製到臨時陣列中
    while i <= mid {
        tmp[k] = nums[i];
        k += 1;
        i += 1;
    }
    while j <= right {
        tmp[k] = nums[j];
        k += 1;
        j += 1;
    }
    // 將臨時陣列 tmp 中的元素複製回原陣列 nums 的對應區間
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* 合併排序 */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // 終止條件
    if left >= right {
        return; // 當子陣列長度為 1 時終止遞迴
    }

    // 劃分階段
    let mid = left + (right - left) / 2; // 計算中點
    merge_sort(nums, left, mid); // 遞迴左子陣列
    merge_sort(nums, mid + 1, right); // 遞迴右子陣列

    // 合併階段
    merge(nums, left, mid, right);
}

/* Driver Code */
fn main() {
    /* 合併排序 */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("合併排序完成後 nums = {:?}", nums);
}
