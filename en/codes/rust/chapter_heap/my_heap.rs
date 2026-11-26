/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Max-heap */
struct MaxHeap {
    // Use a vector instead of an array so it can grow as needed
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* Constructor: build a heap from the input list */
    fn new(nums: Vec<i32>) -> Self {
        // Copy the list elements into the heap in their original order
        let mut heap = MaxHeap { max_heap: nums };
        // Heapify all non-leaf nodes
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

    /* Peek at the root */
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

    /* Sift up from node i */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // Node i is already the root, so stop sifting
            if i == 0 {
                break;
            }
            // Get the parent of node i
            let p = Self::parent(i);
            // Stop sifting when the node already satisfies the heap property
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
            panic!("index out of bounds");
        }
        // Swap the root and the rightmost leaf (the first and last elements)
        self.swap(0, self.size() - 1);
        // Remove the node
        let val = self.max_heap.pop().unwrap();
        // Sift down
        self.sift_down(0);
        // Return the root element
        val
    }

    /* Sift down from node i */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // Store the index of the largest of nodes i, l, and r in ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // Stop if i is already largest or both child indices l and r are out of bounds
            if ma == i {
                break;
            }
            // Swap the two nodes
            self.swap(i, ma);
            // Continue sifting down
            i = ma;
        }
    }

    /* Print the heap as a binary tree */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver code */
fn main() {
    /* Initialize a max-heap */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nHeap built from the input list:");
    max_heap.print();

    /* Get the root element */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nRoot element: {}", peek);
    }

    /* Push an element onto the heap */
    let val = 7;
    max_heap.push(val);
    println!("\nHeap after pushing {}:", val);
    max_heap.print();

    /* Pop the root */
    let peek = max_heap.pop();
    println!("\nHeap after popping the root ({}):", peek);
    max_heap.print();

    /* Get the heap size */
    let size = max_heap.size();
    println!("\nNumber of elements in the heap: {}", size);

    /* Check whether the heap is empty */
    let is_empty = max_heap.is_empty();
    println!("\nIs the heap empty? {}", is_empty);
}
