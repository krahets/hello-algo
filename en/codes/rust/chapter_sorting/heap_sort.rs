/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* Heap length is n, start heapifying node i, from top to bottom */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // Determine the largest node among i, l, r, noted as ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
        if ma == i {
            break;
        }
        // Swap two nodes
        let temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // Loop downwards heapification
        i = ma;
    }
}

/* Heap sort */
fn heap_sort(nums: &mut [i32]) {
    // Build heap operation: heapify all nodes except leaves
    for i in (0..=nums.len() / 2 - 1).rev() {
        sift_down(nums, nums.len(), i);
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for i in (1..=nums.len() - 1).rev() {
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        let tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // Start heapifying the root node, from top to bottom
        sift_down(nums, i, 0);
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("After heap sort, nums =");
    print_util::print_array(&nums);
}
