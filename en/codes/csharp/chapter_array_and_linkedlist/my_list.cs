/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* List class */
class MyList {
    private int[] arr;           // Array (stores list elements)
    private int arrCapacity = 10;    // List capacity
    private int arrSize = 0;         // List length (current number of elements)
    private readonly int extendRatio = 2;  // Multiple by which the list capacity is extended each time

    /* Constructor */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* Get list length (current number of elements) */
    public int Size() {
        return arrSize;
    }

    /* Get list capacity */
    public int Capacity() {
        return arrCapacity;
    }

    /* Update element */
    public int Get(int index) {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        return arr[index];
    }

    /* Add elements at the end */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        arr[index] = num;
    }

    /* Direct traversal of list elements */
    public void Add(int num) {
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Sort list */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Move all elements after index index forward by one position
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Remove element */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        int num = arr[index];
        // Move all elements after index forward by one position
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Driver Code */
    public void ExtendCapacity() {
        // Create new array of length arrCapacity * extendRatio and copy original array to new array
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // Add elements at the end
        arrCapacity = arr.Length;
    }

    /* Convert list to array */
    public int[] ToArray() {
        // Elements enqueue
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
        /* Initialize list */
        MyList nums = new();
        /* Direct traversal of list elements */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("List nums = " + string.Join(",", nums.ToArray()) +
                           ", capacity = " + nums.Capacity() + ", length = " + nums.Size());

        /* Sort list */
        nums.Insert(3, 6);
        Console.WriteLine("Insert number 6 at index 3, resulting in nums = " + string.Join(",", nums.ToArray()));

        /* Remove element */
        nums.Remove(3);
        Console.WriteLine("Remove element at index 3, resulting in nums = " + string.Join(",", nums.ToArray()));

        /* Update element */
        int num = nums.Get(1);
        Console.WriteLine("Access element at index 1, get num = " + num);

        /* Add elements at the end */
        nums.Set(1, 0);
        Console.WriteLine("Update element at index 1 to 0, resulting in nums = " + string.Join(",", nums.ToArray()));

        /* Test capacity expansion mechanism */
        for (int i = 0; i < 10; i++) {
            // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
            nums.Add(i);
        }
        Console.WriteLine("List nums after expansion = " + string.Join(",", nums.ToArray()) +
                           ", capacity = " + nums.Capacity() + ", length = " + nums.Size());
    }
}
