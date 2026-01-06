/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* List class */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Array (stores list elements)
    capacity: usize,     // List capacity
    size: usize,         // List length (current number of elements)
    extend_ratio: usize, // Multiple by which the list capacity is extended each time
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* Constructor */
    pub fn new(capacity: usize) -> Self {
        let mut vec = vec![0; capacity];
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* Get list length (current number of elements) */
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* Get list capacity */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* Update element */
    pub fn get(&self, index: usize) -> i32 {
        // If the index is out of bounds, throw an exception, as below
        if index >= self.size {
            panic!("Index out of bounds")
        };
        return self.arr[index];
    }

    /* Add elements at the end */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("Index out of bounds")
        };
        self.arr[index] = num;
    }

    /* Direct traversal of list elements */
    pub fn add(&mut self, num: i32) {
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Update the number of elements
        self.size += 1;
    }

    /* Sort list */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Move all elements after index index forward by one position
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // Update the number of elements
        self.size += 1;
    }

    /* Remove element */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        let num = self.arr[index];
        // Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // Update the number of elements
        self.size -= 1;
        // Return the removed element
        return num;
    }

    /* Driver Code */
    pub fn extend_capacity(&mut self) {
        // Create new array with length extend_ratio times original, copy original array to new array
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // Add elements at the end
        self.capacity = new_capacity;
    }

    /* Convert list to array */
    pub fn to_array(&self) -> Vec<i32> {
        // Elements enqueue
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Driver Code */
fn main() {
    /* Initialize list */
    let mut nums = MyList::new(10);
    /* Direct traversal of list elements */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("List nums = ");
    print_util::print_array(&nums.to_array());
    print!(", capacity = {}, length = {}", nums.capacity(), nums.size());

    /* Sort list */
    nums.insert(3, 6);
    print!("\nInsert number 6 at index 3, get nums = ");
    print_util::print_array(&nums.to_array());

    /* Remove element */
    nums.remove(3);
    print!("\nDelete element at index 3, get nums = ");
    print_util::print_array(&nums.to_array());

    /* Update element */
    let num = nums.get(1);
    println!("\nAccess element at index 1, get num = {num}");

    /* Add elements at the end */
    nums.set(1, 0);
    print!("Update element at index 1 to 0, resulting in nums = ");
    print_util::print_array(&nums.to_array());

    /* Test capacity expansion mechanism */
    for i in 0..10 {
        // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
        nums.add(i);
    }
    print!("\nAfter expanding list, nums = ");
    print_util::print_array(&nums.to_array());
    print!(", capacity = {}, length = {}", nums.capacity(), nums.size());
}
