/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* List class */
class MyList {
    private var arr: [Int] // Array (stores the list elements)
    private var _capacity: Int // List capacity
    private var _size: Int // List length (current number of elements)
    private let extendRatio: Int // Factor by which the list capacity grows each time

    /* Constructor */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* Get the list length (current number of elements)*/
    func size() -> Int {
        _size
    }

    /* Get the list capacity */
    func capacity() -> Int {
        _capacity
    }

    /* Access an element */
    func get(index: Int) -> Int {
        // An out-of-bounds index triggers a fatal error; the same check is used below
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        return arr[index]
    }

    /* Update an element */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        arr[index] = num
    }

    /* Append at the end */
    func add(num: Int) {
        // Grow the capacity when adding an element would exceed it
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // Update the number of elements
        _size += 1
    }

    /* Insert an element in the middle */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        // Grow the capacity when adding an element would exceed it
        if size() == capacity() {
            extendCapacity()
        }
        // Shift all elements at and after index `index` one position to the right
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // Update the number of elements
        _size += 1
    }

    /* Remove an element */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        let num = arr[index]
        // Shift all elements after index `index` one position to the left
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // Update the number of elements
        _size -= 1
        // Return the removed element
        return num
    }

    /* Grow the list capacity */
    func extendCapacity() {
        // Create an array extendRatio times as long as the original and copy the original array into it
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // Update the list capacity
        _capacity = arr.count
    }

    /* Convert the list to an array */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Driver code */
    static func main() {
        /* Initialize the list */
        let nums = MyList()
        /* Append at the end */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("List nums = \(nums.toArray()), capacity = \(nums.capacity()), length = \(nums.size())")

        /* Insert an element in the middle */
        nums.insert(index: 3, num: 6)
        print("After inserting 6 at index 3, nums = \(nums.toArray())")

        /* Remove an element */
        nums.remove(index: 3)
        print("After removing the element at index 3, nums = \(nums.toArray())")

        /* Access an element */
        let num = nums.get(index: 1)
        print("Access the element at index 1; num = \(num)")

        /* Update an element */
        nums.set(index: 1, num: 0)
        print("After updating the element at index 1 to 0, nums = \(nums.toArray())")

        /* Test capacity growth */
        for i in 0 ..< 10 {
            // When i = 5, the list length would exceed its capacity, triggering capacity growth
            nums.add(num: i)
        }
        print("After capacity growth, list nums = \(nums.toArray()), capacity = \(nums.capacity()), length = \(nums.size())")
    }
}
