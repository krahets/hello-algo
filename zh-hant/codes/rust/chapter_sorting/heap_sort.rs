/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 堆積的長度為 n ，從節點 i 開始，從頂至底堆積化 */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // 判斷節點 i, l, r 中值最大的節點，記為 ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
        if ma == i {
            break;
        }
        // 交換兩節點
        nums.swap(i, ma);
        // 迴圈向下堆積化
        i = ma;
    }
}

/* 堆積排序 */
fn heap_sort(nums: &mut [i32]) {
    // 建堆積操作：堆積化除葉節點以外的其他所有節點
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // 從堆積中提取最大元素，迴圈 n-1 輪
    for i in (1..nums.len()).rev() {
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        nums.swap(0, i);
        // 以根節點為起點，從頂至底進行堆積化
        sift_down(nums, i, 0);
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("堆積排序完成後 nums = ");
    print_util::print_array(&nums);
}
