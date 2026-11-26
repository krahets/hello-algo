/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* List class */
class MyList {
    private var arr: IntArray = intArrayOf() // Array that stores the list elements
    private var capacity: Int = 10 // List capacity
    private var size: Int = 0 // List length (current number of elements)
    private var extendRatio: Int = 2 // Factor by which the list capacity grows

    /* Constructor */
    init {
        arr = IntArray(capacity)
    }

    /* Get the list length (current number of elements) */
    fun size(): Int {
        return size
    }

    /* Get the list capacity */
    fun capacity(): Int {
        return capacity
    }

    /* Access an element */
    fun get(index: Int): Int {
        // Throw an exception if the index is out of bounds, here and below
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        return arr[index]
    }

    /* Update an element */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        arr[index] = num
    }

    /* Append an element */
    fun add(num: Int) {
        // Increase capacity when the elements would no longer fit
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // Update the element count
        size++
    }

    /* Insert an element in the middle */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        // Increase capacity when the elements would no longer fit
        if (size == capacity())
            extendCapacity()
        // Shift the elements from index onward one position to the right
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // Update the element count
        size++
    }

    /* Remove an element */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        val num = arr[index]
        // Shift the elements after index one position to the left
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // Update the element count
        size--
        // Return the removed element
        return num
    }

    /* Increase the list capacity */
    fun extendCapacity() {
        // Create an array extendRatio times as long and copy the original array into it
        arr = arr.copyOf(capacity() * extendRatio)
        // Update the list capacity
        capacity = arr.size
    }

    /* Convert the list to an array */
    fun toArray(): IntArray {
        val size = size()
        // Convert only the elements within the current list length
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Driver Code */
fun main() {
    /* Initialize the list */
    val nums = MyList()
    /* Append an element */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("List nums = ${nums.toArray().contentToString()}, capacity = ${nums.capacity()}, length = ${nums.size()}")

    /* Insert an element in the middle */
    nums.insert(3, 6)
    println("After inserting 6 at index 3, nums = ${nums.toArray().contentToString()}")

    /* Remove an element */
    nums.remove(3)
    println("After removing the element at index 3, nums = ${nums.toArray().contentToString()}")

    /* Access an element */
    val num = nums.get(1)
    println("Reading index 1 gives num = $num")

    /* Update an element */
    nums.set(1, 0)
    println("After setting the element at index 1 to 0, nums = ${nums.toArray().contentToString()}")

    /* Test capacity growth */
    for (i in 0..9) {
        // At i = 5, the list length would exceed its capacity, so the list grows
        nums.add(i)
    }
    println("After increasing capacity, nums = ${nums.toArray().contentToString()}, capacity = ${nums.capacity()}, length = ${nums.size()}")
}