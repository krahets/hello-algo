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
    private int extendRatio = 2; // Multiple by which the list capacity is extended each time

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

    /* Update element */
    public int get(int index) {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        return arr[index];
    }

    /* Add elements at the end */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        arr[index] = num;
    }

    /* Direct traversal of list elements */
    public void add(int num) {
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // Update the number of elements
        size++;
    }

    /* Sort list */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (size == capacity())
            extendCapacity();
        // Move all elements after index index forward by one position
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
        // Move all elements after index forward by one position
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        size--;
        // Return the removed element
        return num;
    }

    /* Driver Code */
    public void extendCapacity() {
        // Create a new array with length extendRatio times the original array and copy the original array to the new array
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // Add elements at the end
        capacity = arr.length;
    }

    /* Convert list to array */
    public int[] toArray() {
        int size = size();
        // Elements enqueue
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
        /* Direct traversal of list elements */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("List nums = " + Arrays.toString(nums.toArray()) +
                ", capacity = " + nums.capacity() + ", length = " + nums.size());

        /* Sort list */
        nums.insert(3, 6);
        System.out.println("Insert number 6 at index 3, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Remove element */
        nums.remove(3);
        System.out.println("Remove element at index 3, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Update element */
        int num = nums.get(1);
        System.out.println("Access element at index 1, get num = " + num);

        /* Add elements at the end */
        nums.set(1, 0);
        System.out.println("Update element at index 1 to 0, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Test capacity expansion mechanism */
        for (int i = 0; i < 10; i++) {
            // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
            nums.add(i);
        }
        System.out.println("List nums after expansion = " + Arrays.toString(nums.toArray()) +
                ", capacity = " + nums.capacity() + ", length = " + nums.size());
    }
}
