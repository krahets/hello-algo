/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

/* List class */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Array (stores list elements)
    capacity: usize,     // List capacity
    size: usize,         // List length (current number of elements)
    extend_ratio: usize, // Multiple for each list expansion
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* Constructor */
    pub fn new(capacity: usize) -> Self {
        let mut vec = Vec::new();
        vec.resize(capacity, 0);
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* Get list length (current number of elements)*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* Get list capacity */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* Access element */
    pub fn get(&self, index: usize) -> i32 {
        // If the index is out of bounds, throw an exception, as below
        if index >= self.size {
            panic!("Index out of bounds")
        };
        return self.arr[index];
    }

    /* Update element */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("Index out of bounds")
        };
        self.arr[index] = num;
    }

    /* Add element at the end */
    pub fn add(&mut self, num: i32) {
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Update the number of elements
        self.size += 1;
    }

    /* Insert element in the middle */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Move all elements after `index` one position backward
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
        // Move all elements after `index` one position forward
        for j in (index..self.size - 1) {
            self.arr[j] = self.arr[j + 1];
        }
        // Update the number of elements
        self.size -= 1;
        // Return the removed element
        return num;
    }

    /* Extend list */
    pub fn extend_capacity(&mut self) {
        // Create a new array with a length of extend_ratio times the original array and copy the original array into it
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // Update list capacity
        self.capacity = new_capacity;
    }

    /* Convert the list to an array */
    pub fn to_array(&mut self) -> Vec<i32> {
        // Only convert elements within valid length range
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
    /* Add element at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("List nums =");
    print_util::print_array(&nums.to_array());
    print!(", capacity = {}, length = {}", nums.capacity(), nums.size());

    /* Insert element in the middle */
    nums.insert(3, 6);
    print!("\nInsert number 6 at index 3, resulting in nums = ");
    print_util::print_array(&nums.to_array());

    /* Remove element */
    nums.remove(3);
    print!("\nRemove the element at index 3, resulting in nums = ");
    print_util::print_array(&nums.to_array());

    /* Access element */
    let num = nums.get(1);
    println!("\nAccess element at index 1, resulting in num = {num}");

    /* Update element */
    nums.set(1, 0);
    print!("Update the element at index 1 to 0, resulting in nums =");
    print_util::print_array(&nums.to_array());

    /* Test expansion mechanism */
    for i in 0..10 {
        // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
        nums.add(i);
    }
    print!("\nList after expansion, nums = ");
    print_util::print_array(&nums.to_array());
    print!(", capacity = {}, length = {}", nums.capacity(), nums.size());
}
