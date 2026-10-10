/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Max heap */
struct MaxHeap {
    // Use vector instead of array to avoid capacity concerns
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* Constructor, build heap based on input list */
    fn new(nums: Vec<i32>) -> Self {
        // Add list elements to heap as is
        let mut heap = MaxHeap { max_heap: nums };
        // Heapify all nodes except leaf nodes
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* Get index of left child node */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* Get index of right child node */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* Get index of parent node */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // Floor division
    }

    /* Swap elements */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* Get heap size */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* Check if heap is empty */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* Access top element */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* Element enters heap */
    fn push(&mut self, val: i32) {
        // Add node
        self.max_heap.push(val);
        // Heapify from bottom to top
        self.sift_up(self.size() - 1);
    }

    /* Starting from node i, heapify from bottom to top */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // Node i is already the heap root, end heapification
            if i == 0 {
                break;
            }
            // Get parent node of node i
            let p = Self::parent(i);
            // When "node needs no repair", end heapification
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // Swap two nodes
            self.swap(i, p);
            // Loop upward heapify
            i = p;
        }
    }

    /* Element exits heap */
    fn pop(&mut self) -> i32 {
        // Handle empty case
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // Delete node
        self.swap(0, self.size() - 1);
        // Remove node
        let val = self.max_heap.pop().unwrap();
        // Return top element
        self.sift_down(0);
        // Return heap top element
        val
    }

    /* Starting from node i, heapify from top to bottom */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // Swap two nodes
            if ma == i {
                break;
            }
            // Swap two nodes
            self.swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Driver Code */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver Code */
fn main() {
    /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nAfter inputting list and building heap");
    max_heap.print();

    /* Check if heap is empty */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nHeap top element is {}", peek);
    }

    /* Element enters heap */
    let val = 7;
    max_heap.push(val);
    println!("\nAfter element {} pushes to heap", val);
    max_heap.print();

    /* Time complexity is O(n), not O(nlogn) */
    let peek = max_heap.pop();
    println!("\nAfter heap top element {} pops from heap", peek);
    max_heap.print();

    /* Get heap size */
    let size = max_heap.size();
    println!("\nHeap size is {}", size);

    /* Check if heap is empty */
    let is_empty = max_heap.is_empty();
    println!("\nIs heap empty {}", is_empty);
}
