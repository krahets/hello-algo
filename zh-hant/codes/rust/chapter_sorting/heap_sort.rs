/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 堆積的長度為 n，從節點 i 開始由上而下調整堆積 */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // 找出節點 i、l、r 中值最大的節點，記為 ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // 若節點 i 的值最大或索引 l、r 超出範圍，便無須繼續調整堆積，跳出迴圈
        if ma == i {
            break;
        }
        // 交換兩個節點
        nums.swap(i, ma);
        // 以迴圈繼續向下調整堆積
        i = ma;
    }
}

/* 堆積排序 */
fn heap_sort(nums: &mut [i32]) {
    // 建立堆積：對所有非葉節點執行堆積調整
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // 從堆積中取出最大元素，重複 n-1 輪
    for i in (1..nums.len()).rev() {
        // 交換根節點與最右側的葉節點（即交換首尾元素）
        nums.swap(0, i);
        // 從根節點開始，由上而下調整堆積
        sift_down(nums, i, 0);
    }
}

/* 主程式 */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("堆積排序完成後 nums = ");
    print_util::print_array(&nums);
}
