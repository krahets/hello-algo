/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* List class */
class MyList {
    private int[] arr; // Array (stores the list elements)
    private int capacity = 10; // List capacity
    private int size = 0; // List length (current number of elements)
    private int extendRatio = 2; // Factor by which the list capacity grows each time

    /* Constructor */
    public MyList() {
        arr = new int[capacity];
    }

    /* Get the list length (current number of elements) */
    public int size() {
        return size;
    }

    /* Get the list capacity */
    public int capacity() {
        return capacity;
    }

    /* Access an element */
    public int get(int index) {
        // Throw an exception if the index is out of bounds; the same applies below
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        return arr[index];
    }

    /* Update an element */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        arr[index] = num;
    }

    /* Append at the end */
    public void add(int num) {
        // Grow the capacity when adding an element would exceed it
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // Update the number of elements
        size++;
    }

    /* Insert an element in the middle */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        // Grow the capacity when adding an element would exceed it
        if (size == capacity())
            extendCapacity();
        // Shift all elements at and after index `index` one position to the right
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the number of elements
        size++;
    }

    /* Remove an element */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        int num = arr[index];
        // Shift all elements after index `index` one position to the left
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        size--;
        // Return the removed element
        return num;
    }

    /* Grow the list capacity */
    public void extendCapacity() {
        // Create an array extendRatio times as long as the original and copy the original array into it
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // Update the list capacity
        capacity = arr.length;
    }

    /* Convert the list to an array */
    public int[] toArray() {
        int size = size();
        // Convert only the list elements within the occupied range
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Driver code */
    public static void main(String[] args) {
        /* Initialize the list */
        MyList nums = new MyList();
        /* Append at the end */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("List nums = " + Arrays.toString(nums.toArray()) +
                " , capacity = " + nums.capacity() + " , size = " + nums.size());

        /* Insert an element in the middle */
        nums.insert(3, 6);
        System.out.println("Insert the number 6 at index 3, giving nums = " + Arrays.toString(nums.toArray()));

        /* Remove an element */
        nums.remove(3);
        System.out.println("Remove the element at index 3, giving nums = " + Arrays.toString(nums.toArray()));

        /* Access an element */
        int num = nums.get(1);
        System.out.println("Access the element at index 1, giving num = " + num);

        /* Update an element */
        nums.set(1, 0);
        System.out.println("Update the element at index 1 to 0, giving nums = " + Arrays.toString(nums.toArray()));

        /* Test capacity growth */
        for (int i = 0; i < 10; i++) {
            // When i = 5, the list length would exceed its capacity, triggering capacity growth
            nums.add(i);
        }
        System.out.println("After expansion, list nums = " + Arrays.toString(nums.toArray()) +
                " , capacity = " + nums.capacity() + " , size = " + nums.size());
    }
}
