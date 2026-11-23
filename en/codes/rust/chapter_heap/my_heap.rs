/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Max heap */
struct MaxHeap {
    // Use a vector instead of a fixed-size array so that capacity grows automatically
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* Constructor: build a heap from the input list */
    fn new(nums: Vec<i32>) -> Self {
        // Place the list elements in the heap without changing their order
        let mut heap = MaxHeap { max_heap: nums };
        // Sift down from every non-leaf node
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* Get the left child index */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* Get the right child index */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* Get the parent index */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // Floor division
    }

    /* Swap elements */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* Get the heap size */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* Check whether the heap is empty */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* Access the top element of the heap */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* Push an element onto the heap */
    fn push(&mut self, val: i32) {
        // Add a node
        self.max_heap.push(val);
        // Sift up
        self.sift_up(self.size() - 1);
    }

    /* Sift up starting from node i */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // Stop sifting up if node i is already the root
            if i == 0 {
                break;
            }
            // Get the parent of node i
            let p = Self::parent(i);
            // Stop sifting up when the node already satisfies the heap property
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // Swap the two nodes
            self.swap(i, p);
            // Continue sifting up
            i = p;
        }
    }

    /* Pop an element from the heap */
    fn pop(&mut self) -> i32 {
        // Handle an empty heap
        if self.is_empty() {
            panic!("Index out of bounds");
        }
        // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
        self.swap(0, self.size() - 1);
        // Remove a node
        let val = self.max_heap.pop().unwrap();
        // Sift down
        self.sift_down(0);
        // Return the top element of the heap
        val
    }

    /* Sift down starting from node i */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // Find the node with the largest value among i, l, and r, and store its index in ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // Stop if node i is largest or both child indices l and r are out of bounds
            if ma == i {
                break;
            }
            // Swap the two nodes
            self.swap(i, ma);
            // Continue sifting down
            i = ma;
        }
    }

    /* Print the heap (binary tree) */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver code */
fn main() {
    /* Initialize a max heap */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nAfter building a heap from the input list:");
    max_heap.print();

    /* Get the top element of the heap */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nTop element: {}", peek);
    }

    /* Push an element onto the heap */
    let val = 7;
    max_heap.push(val);
    println!("\nAfter pushing element {} into the heap", val);
    max_heap.print();

    /* Pop the top element from the heap */
    let peek = max_heap.pop();
    println!("\nAfter removing the top element {} from the heap", peek);
    max_heap.print();

    /* Get the heap size */
    let size = max_heap.size();
    println!("\nNumber of heap elements: {}", size);

    /* Check whether the heap is empty */
    let is_empty = max_heap.is_empty();
    println!("\nIs the heap empty? {}", is_empty);
}
