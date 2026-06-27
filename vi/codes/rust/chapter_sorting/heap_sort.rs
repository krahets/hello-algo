/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Heap length is n, start heapifying node i, from top to bottom */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // Swap two nodes
        if ma == i {
            break;
        }
        // Swap two nodes
        nums.swap(i, ma);
        // Loop downwards heapification
        i = ma;
    }
}

/* Heap sort */
fn heap_sort(nums: &mut [i32]) {
    // Build heap operation: heapify all nodes except leaves
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for i in (1..nums.len()).rev() {
        // Delete node
        nums.swap(0, i);
        // Start heapifying the root node, from top to bottom
        sift_down(nums, i, 0);
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("After heap sort completes, nums = ");
    print_util::print_array(&nums);
}
