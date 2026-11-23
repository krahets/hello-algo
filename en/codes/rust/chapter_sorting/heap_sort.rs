/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Sift down from node i in a heap of size n */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // Find the node with the largest value among i, l, and r, and store its index in ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // Stop if node i is largest or both child indices l and r are out of bounds
        if ma == i {
            break;
        }
        // Swap the two nodes
        nums.swap(i, ma);
        // Continue sifting down
        i = ma;
    }
}

/* Heap sort */
fn heap_sort(nums: &mut [i32]) {
    // Build the heap by sifting down from every non-leaf node
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // Extract the largest element from the heap, repeating for n-1 rounds
    for i in (1..nums.len()).rev() {
        // Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
        nums.swap(0, i);
        // Sift down starting at the root
        sift_down(nums, i, 0);
    }
}

/* Driver code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("After heap sort, nums = ");
    print_util::print_array(&nums);
}
