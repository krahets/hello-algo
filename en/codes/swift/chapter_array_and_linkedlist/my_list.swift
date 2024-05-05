/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* List class */
class MyList {
    private var arr: [Int] // Array (stores list elements)
    private var _capacity: Int // List capacity
    private var _size: Int // List length (current number of elements)
    private let extendRatio: Int // Multiple for each list expansion

    /* Constructor */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* Get list length (current number of elements)*/
    func size() -> Int {
        _size
    }

    /* Get list capacity */
    func capacity() -> Int {
        _capacity
    }

    /* Access element */
    func get(index: Int) -> Int {
        // If the index is out of bounds, throw an error, as below
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        return arr[index]
    }

    /* Update element */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        arr[index] = num
    }

    /* Add element at the end */
    func add(num: Int) {
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // Update the number of elements
        _size += 1
    }

    /* Insert element in the middle */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if size() == capacity() {
            extendCapacity()
        }
        // Move all elements after `index` one position backward
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // Update the number of elements
        _size += 1
    }

    /* Remove element */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        let num = arr[index]
        // Move all elements after `index` one position forward
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // Update the number of elements
        _size -= 1
        // Return the removed element
        return num
    }

    /* Extend list */
    func extendCapacity() {
        // Create a new array with a length multiple of the original array by extendRatio, and copy the original array to the new array
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // Update list capacity
        _capacity = arr.count
    }

    /* Convert the list to an array */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Driver Code */
    static func main() {
        /* Initialize list */
        let nums = MyList()
        /* Add element at the end */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("List nums = \(nums.toArray()), capacity = \(nums.capacity()), length = \(nums.size())")

        /* Insert element in the middle */
        nums.insert(index: 3, num: 6)
        print("Insert number 6 at index 3, resulting in nums = \(nums.toArray())")

        /* Remove element */
        nums.remove(index: 3)
        print("Remove the element at index 3, resulting in nums = \(nums.toArray())")

        /* Access element */
        let num = nums.get(index: 1)
        print("Access the element at index 1, resulting in num = \(num)")

        /* Update element */
        nums.set(index: 1, num: 0)
        print("Update the element at index 1 to 0, resulting in nums = \(nums.toArray())")

        /* Test expansion mechanism */
        for i in 0 ..< 10 {
            // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
            nums.add(num: i)
        }
        print("After extending capacity, list nums = \(nums.toArray()), capacity = \(nums.capacity()), length = \(nums.size())")
    }
}
