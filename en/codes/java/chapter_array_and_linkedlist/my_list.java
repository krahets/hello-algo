/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* List class */
class MyList {
    private int[] arr; // Array (stores list elements)
    private int capacity = 10; // List capacity
    private int size = 0; // List length (current number of elements)
    private int extendRatio = 2; // Multiple for each list expansion

    /* Constructor */
    public MyList() {
        arr = new int[capacity];
    }

    /* Get list length (current number of elements) */
    public int size() {
        return size;
    }

    /* Get list capacity */
    public int capacity() {
        return capacity;
    }

    /* Access element */
    public int get(int index) {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        return arr[index];
    }

    /* Update element */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        arr[index] = num;
    }

    /* Add element at the end */
    public void add(int num) {
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // Update the number of elements
        size++;
    }

    /* Insert element in the middle */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if (size == capacity())
            extendCapacity();
        // Move all elements after `index` one position backward
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the number of elements
        size++;
    }

    /* Remove element */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        int num = arr[index];
        // Move all elements after `index` one position forward
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        size--;
        // Return the removed element
        return num;
    }

    /* Extend list */
    public void extendCapacity() {
        // Create a new array with a length multiple of the original array by extendRatio, and copy the original array to the new array
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // Update list capacity
        capacity = arr.length;
    }

    /* Convert the list to an array */
    public int[] toArray() {
        int size = size();
        // Only convert elements within valid length range
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Driver Code */
    public static void main(String[] args) {
        /* Initialize list */
        MyList nums = new MyList();
        /* Add element at the end */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("List nums = " + Arrays.toString(nums.toArray()) +
                ", capacity = " + nums.capacity() + ", length = " + nums.size());

        /* Insert element in the middle */
        nums.insert(3, 6);
        System.out.println("Insert the number 6 at index 3, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Remove element */
        nums.remove(3);
        System.out.println("Remove the element at index 3, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Access element */
        int num = nums.get(1);
        System.out.println("Access the element at index 1, obtained num = " + num);

        /* Update element */
        nums.set(1, 0);
        System.out.println("Update the element at index 1 to 0, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Test expansion mechanism */
        for (int i = 0; i < 10; i++) {
            // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
            nums.add(i);
        }
        System.out.println("After extending, list nums = " + Arrays.toString(nums.toArray()) +
                ", capacity = " + nums.capacity() + ", length = " + nums.size());
    }
}
