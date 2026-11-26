/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* List class */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Array that stores the list elements
    capacity: usize,     // List capacity
    size: usize,         // List length (current number of elements)
    extend_ratio: usize, // Factor by which the list capacity grows
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

    /* Get the list length (current number of elements)*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* Get the list capacity */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* Access an element */
    pub fn get(&self, index: usize) -> i32 {
        // Throw an exception if the index is out of bounds, here and below
        if index >= self.size {
            panic!("Index out of bounds")
        };
        return self.arr[index];
    }

    /* Update an element */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("Index out of bounds")
        };
        self.arr[index] = num;
    }

    /* Append an element */
    pub fn add(&mut self, num: i32) {
        // Increase capacity when the elements would no longer fit
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Update the element count
        self.size += 1;
    }

    /* Insert an element in the middle */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        // Increase capacity when the elements would no longer fit
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Shift the elements from index onward one position to the right
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // Update the element count
        self.size += 1;
    }

    /* Remove an element */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        let num = self.arr[index];
        // Shift the elements after index one position to the left
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // Update the element count
        self.size -= 1;
        // Return the removed element
        return num;
    }

    /* Increase the list capacity */
    pub fn extend_capacity(&mut self) {
        // Create an array extend_ratio times as long and copy the original array into it
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // Update the list capacity
        self.capacity = new_capacity;
    }

    /* Convert the list to an array */
    pub fn to_array(&self) -> Vec<i32> {
        // Convert only the elements within the current list length
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Driver Code */
fn main() {
    /* Initialize the list */
    let mut nums = MyList::new(10);
    /* Append an element */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("List nums = ");
    print_util::print_array(&nums.to_array());
    print!(" with capacity = {} and length = {}", nums.capacity(), nums.size());

    /* Insert an element in the middle */
    nums.insert(3, 6);
    print!("\nAfter inserting 6 at index 3, nums = ");
    print_util::print_array(&nums.to_array());

    /* Remove an element */
    nums.remove(3);
    print!("\nAfter removing the element at index 3, nums = ");
    print_util::print_array(&nums.to_array());

    /* Access an element */
    let num = nums.get(1);
    println!("\nReading index 1 gives num = {num}");

    /* Update an element */
    nums.set(1, 0);
    print!("After setting the element at index 1 to 0, nums = ");
    print_util::print_array(&nums.to_array());

    /* Test capacity growth */
    for i in 0..10 {
        // At i = 5, the list length would exceed its capacity, so the list grows
        nums.add(i);
    }
    print!("\nAfter increasing capacity, nums = ");
    print_util::print_array(&nums.to_array());
    print!(" with capacity = {} and length = {}", nums.capacity(), nums.size());
}
