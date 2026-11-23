/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* List class */
class MyList {
    private int[] arr;           // Array (stores the list elements)
    private int arrCapacity = 10;    // List capacity
    private int arrSize = 0;         // List length (current number of elements)
    private readonly int extendRatio = 2;  // Factor by which the list capacity grows each time

    /* Constructor */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* Get the list length (current number of elements)*/
    public int Size() {
        return arrSize;
    }

    /* Get the list capacity */
    public int Capacity() {
        return arrCapacity;
    }

    /* Access an element */
    public int Get(int index) {
        // Throw an exception if the index is out of bounds; the same applies below
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        return arr[index];
    }

    /* Update an element */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        arr[index] = num;
    }

    /* Append at the end */
    public void Add(int num) {
        // Grow the capacity when adding an element would exceed it
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Insert an element in the middle */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        // Grow the capacity when adding an element would exceed it
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Shift all elements at and after index `index` one position to the right
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Remove an element */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        int num = arr[index];
        // Shift all elements after index `index` one position to the left
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Grow the list capacity */
    public void ExtendCapacity() {
        // Create an array of length arrCapacity * extendRatio and copy the original array into it
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // Update the list capacity
        arrCapacity = arr.Length;
    }

    /* Convert the list to an array */
    public int[] ToArray() {
        // Convert only the list elements within the occupied range
        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = Get(i);
        }
        return arr;
    }
}

public class my_list {
    [Test]
    public void Test() {
        /* Initialize the list */
        MyList nums = new();
        /* Append at the end */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("List nums = " + string.Join(",", nums.ToArray()) +
                           " , capacity = " + nums.Capacity() + " , size = " + nums.Size());

        /* Insert an element in the middle */
        nums.Insert(3, 6);
        Console.WriteLine("Insert the number 6 at index 3, giving nums = " + string.Join(",", nums.ToArray()));

        /* Remove an element */
        nums.Remove(3);
        Console.WriteLine("Remove the element at index 3, giving nums = " + string.Join(",", nums.ToArray()));

        /* Access an element */
        int num = nums.Get(1);
        Console.WriteLine("Access the element at index 1, giving num = " + num);

        /* Update an element */
        nums.Set(1, 0);
        Console.WriteLine("Update the element at index 1 to 0, giving nums = " + string.Join(",", nums.ToArray()));

        /* Test capacity growth */
        for (int i = 0; i < 10; i++) {
            // When i = 5, the list length would exceed its capacity, triggering capacity growth
            nums.Add(i);
        }
        Console.WriteLine("After expansion, list nums = " + string.Join(",", nums.ToArray()) +
                           " , capacity = " + nums.Capacity() + " , size = " + nums.Size());
    }
}
