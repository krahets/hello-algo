/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // 判断节点 i, l, r 中值最大的节点，记为 ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
        if ma == i {
            break;
        }
        // 交换两节点
        let temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // 循环向下堆化
        i = ma;
    }
}

/* 堆排序 */
fn heap_sort(nums: &mut [i32]) {
    // 建堆操作：堆化除叶节点以外的其他所有节点
    for i in (0..=nums.len() / 2 - 1).rev() {
        sift_down(nums, nums.len(), i);
    }
    // 从堆中提取最大元素，循环 n-1 轮
    for i in (1..=nums.len() - 1).rev() {
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        let tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // 以根节点为起点，从顶至底进行堆化
        sift_down(nums, i, 0);
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("堆排序完成后 nums = ");
    print_util::print_array(&nums);
}
