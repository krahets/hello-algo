/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* List class */
class MyList {
    private var arr: IntArray = intArrayOf() // Array (stores list elements)
    private var capacity: Int = 10 // List capacity
    private var size: Int = 0 // List length (current number of elements)
    private var extendRatio: Int = 2 // Multiple by which the list capacity is extended each time

    /* Constructor */
    init {
        arr = IntArray(capacity)
    }

    /* Get list length (current number of elements) */
    fun size(): Int {
        return size
    }

    /* Get list capacity */
    fun capacity(): Int {
        return capacity
    }

    /* Update element */
    fun get(index: Int): Int {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        return arr[index]
    }

    /* Add elements at the end */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        arr[index] = num
    }

    /* Direct traversal of list elements */
    fun add(num: Int) {
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // Update the number of elements
        size++
    }

    /* Sort list */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (size == capacity())
            extendCapacity()
        // Move all elements after index index forward by one position
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // Update the number of elements
        size++
    }

    /* Remove element */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        val num = arr[index]
        // Move all elements after index forward by one position
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // Update the number of elements
        size--
        // Return the removed element
        return num
    }

    /* Driver Code */
    fun extendCapacity() {
        // Create a new array with length extendRatio times the original array and copy the original array to the new array
        arr = arr.copyOf(capacity() * extendRatio)
        // Add elements at the end
        capacity = arr.size
    }

    /* Convert list to array */
    fun toArray(): IntArray {
        val size = size()
        // Elements enqueue
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Driver Code */
fun main() {
    /* Initialize list */
    val nums = MyList()
    /* Direct traversal of list elements */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("List nums = ${nums.toArray().contentToString()}, capacity = ${nums.capacity()}, length = ${nums.size()}")

    /* Sort list */
    nums.insert(3, 6)
    println("Insert number 6 at index 3, get nums = ${nums.toArray().contentToString()}")

    /* Remove element */
    nums.remove(3)
    println("Delete element at index 3, get nums = ${nums.toArray().contentToString()}")

    /* Update element */
    val num = nums.get(1)
    println("Access element at index 1, get num = $num")

    /* Add elements at the end */
    nums.set(1, 0)
    println("Update element at index 1 to 0, get nums = ${nums.toArray().contentToString()}")

    /* Test capacity expansion mechanism */
    for (i in 0..9) {
        // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
        nums.add(i)
    }
    println("After expansion, list nums = ${nums.toArray().contentToString()}, capacity = ${nums.capacity()}, length =  ${nums.size()}")
}