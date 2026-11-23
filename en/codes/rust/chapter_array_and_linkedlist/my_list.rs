/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* List type */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Array (stores the list elements)
    capacity: usize,     // List capacity
    size: usize,         // List length (current number of elements)
    extend_ratio: usize, // Factor by which the list capacity grows each time
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
        // Panic if the index is out of bounds; the same applies below
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

    /* Append an element at the end */
    pub fn add(&mut self, num: i32) {
        // Grow the capacity when adding an element would exceed it
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Update the number of elements
        self.size += 1;
    }

    /* Insert an element in the middle */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        // Grow the capacity when adding an element would exceed it
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Shift all elements at and after index `index` one position to the right
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // Update the number of elements
        self.size += 1;
    }

    /* Remove an element */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        let num = self.arr[index];
        // Shift all elements after index `index` one position to the left
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // Update the number of elements
        self.size -= 1;
        // Return the removed element
        return num;
    }

    /* Grow the list capacity */
    pub fn extend_capacity(&mut self) {
        // Grow the backing vector to extend_ratio times its original length, preserving its elements
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // Update the list capacity
        self.capacity = new_capacity;
    }

    /* Copy the list elements into a vector */
    pub fn to_array(&self) -> Vec<i32> {
        // Convert only the list elements within the occupied range
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Driver code */
fn main() {
    /* Initialize the list */
    let mut nums = MyList::new(10);
    /* Append an element at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("List nums = ");
    print_util::print_array(&nums.to_array());
    print!(" , capacity = {}, size = {}", nums.capacity(), nums.size());

    /* Insert an element in the middle */
    nums.insert(3, 6);
    print!("\nInsert the number 6 at index 3, giving nums = ");
    print_util::print_array(&nums.to_array());

    /* Remove an element */
    nums.remove(3);
    print!("\nRemove the element at index 3, giving nums = ");
    print_util::print_array(&nums.to_array());

    /* Access an element */
    let num = nums.get(1);
    println!("\nAccessing the element at index 1 gives num = {num}");

    /* Update an element */
    nums.set(1, 0);
    print!("Update the element at index 1 to 0, giving nums = ");
    print_util::print_array(&nums.to_array());

    /* Test capacity growth */
    for i in 0..10 {
        // When i = 5, the list length would exceed its capacity, triggering capacity growth
        nums.add(i);
    }
    print!("\nAfter expanding capacity, list nums = ");
    print_util::print_array(&nums.to_array());
    print!(" , capacity = {}, size = {}", nums.capacity(), nums.size());
}
