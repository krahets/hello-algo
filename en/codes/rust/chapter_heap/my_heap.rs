/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* Max-heap */
struct MaxHeap {
    // Use vector instead of array to avoid needing to resize
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* Constructor, build heap based on input list */
    fn new(nums: Vec<i32>) -> Self {
        // Add all list elements into the heap
        let mut heap = MaxHeap { max_heap: nums };
        // Heapify all nodes except leaves
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
        (i - 1) / 2 // Integer division down
    }

    /* Swap elements */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* Get heap size */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* Determine if heap is empty */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* Access heap top element */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* Push the element into heap */
    fn push(&mut self, val: i32) {
        // Add node
        self.max_heap.push(val);
        // Heapify from bottom to top
        self.sift_up(self.size() - 1);
    }

    /* Start heapifying node i, from bottom to top */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // Node i is already the top node of the heap, end heapification
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
            // Loop upwards heapification
            i = p;
        }
    }

    /* Element exits heap */
    fn pop(&mut self) -> i32 {
        // Empty handling
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        self.swap(0, self.size() - 1);
        // Remove node
        let val = self.max_heap.pop().unwrap();
        // Heapify from top to bottom
        self.sift_down(0);
        // Return heap top element
        val
    }

    /* Start heapifying node i, from top to bottom */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // Determine the largest node among i, l, r, noted as ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if ma == i {
                break;
            }
            // Swap two nodes
            self.swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Print heap (binary tree) */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver Code */
fn main() {
    /* Initialize max-heap */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nEnter list and build heap");
    max_heap.print();

    /* Access heap top element */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nThe top element of the heap is {}", peek);
    }

    /* Push the element into heap */
    let val = 7;
    max_heap.push(val);
    println!("\nElement {} after being added to the heap", val);
    max_heap.print();

    /* Pop the element at the heap top */
    let peek = max_heap.pop();
    println!("\nTop element {} after being removed from the heap", peek);
    max_heap.print();

    /* Get heap size */
    let size = max_heap.size();
    println!("\nThe number of elements in the heap is {}", size);

    /* Determine if heap is empty */
    let is_empty = max_heap.is_empty();
    println!("\nIs the heap empty {}", is_empty);
}
