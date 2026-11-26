/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* List class */
class MyList {
    private int[] arr;           // Array that stores the list elements
    private int arrCapacity = 10;    // List capacity
    private int arrSize = 0;         // List length (current number of elements)
    private readonly int extendRatio = 2;  // Factor by which the list capacity grows

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
        // Throw an exception if the index is out of bounds, here and below
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

    /* Append an element */
    public void Add(int num) {
        // Increase capacity when the elements would no longer fit
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Update the element count
        arrSize++;
    }

    /* Insert an element in the middle */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        // Increase capacity when the elements would no longer fit
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Shift the elements from index onward one position to the right
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the element count
        arrSize++;
    }

    /* Remove an element */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        int num = arr[index];
        // Shift the elements after index one position to the left
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the element count
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Increase the list capacity */
    public void ExtendCapacity() {
        // Create an array of length arrCapacity * extendRatio and copy the original array into it
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // Update the list capacity
        arrCapacity = arr.Length;
    }

    /* Convert the list to an array */
    public int[] ToArray() {
        // Convert only the elements within the current list length
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
        /* Append an element */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("List nums = " + string.Join(",", nums.ToArray()) +
                           " with capacity = " + nums.Capacity() + " and length = " + nums.Size());

        /* Insert an element in the middle */
        nums.Insert(3, 6);
        Console.WriteLine("After inserting 6 at index 3, nums = " + string.Join(",", nums.ToArray()));

        /* Remove an element */
        nums.Remove(3);
        Console.WriteLine("After removing the element at index 3, nums = " + string.Join(",", nums.ToArray()));

        /* Access an element */
        int num = nums.Get(1);
        Console.WriteLine("Reading index 1 gives num = " + num);

        /* Update an element */
        nums.Set(1, 0);
        Console.WriteLine("After setting the element at index 1 to 0, nums = " + string.Join(",", nums.ToArray()));

        /* Test capacity growth */
        for (int i = 0; i < 10; i++) {
            // At i = 5, the list length would exceed its capacity, so the list grows
            nums.Add(i);
        }
        Console.WriteLine("After increasing capacity, nums = " + string.Join(",", nums.ToArray()) +
                           " with capacity = " + nums.Capacity() + " and length = " + nums.Size());
    }
}
