/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 合併左、右子陣列 */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
    // 建立暫存陣列 tmp，用來存放合併結果
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // 設定左、右子陣列的起始索引
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
    // 將左、右子陣列中剩餘的元素複製到暫存陣列
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
    // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* 合併排序 */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // 終止條件
    if left >= right {
        return; // 當子陣列的長度為 1 時，終止遞迴
    }

    // 分割階段
    let mid = left + (right - left) / 2; // 計算中點
    merge_sort(nums, left, mid); // 遞迴處理左子陣列
    merge_sort(nums, mid + 1, right); // 遞迴處理右子陣列

    // 合併階段
    merge(nums, left, mid, right);
}

/* 主程式 */
fn main() {
    /* 合併排序 */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("合併排序完成後 nums = {:?}", nums);
}
