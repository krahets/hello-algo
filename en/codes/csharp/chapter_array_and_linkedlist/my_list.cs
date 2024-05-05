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
    private readonly int extendRatio = 2;  // Multiple for each list expansion

    /* Constructor */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* Get list length (current number of elements)*/
    public int Size() {
        return arrSize;
    }

    /* Get list capacity */
    public int Capacity() {
        return arrCapacity;
    }

    /* Access element */
    public int Get(int index) {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        return arr[index];
    }

    /* Update element */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        arr[index] = num;
    }

    /* Add element at the end */
    public void Add(int num) {
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Insert element in the middle */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Move all elements after `index` one position backward
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
        // Move all elements after `index` one position forward
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Extend list */
    public void ExtendCapacity() {
        // Create a new array of length arrCapacity * extendRatio and copy the original array into the new array
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // Update list capacity
        arrCapacity = arr.Length;
    }

    /* Convert the list to an array */
    public int[] ToArray() {
        // Only convert elements within valid length range
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
        /* Add element at the end */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("List nums = " + string.Join(", ", nums.ToArray()) +
                           ", capacity = " + nums.Capacity() + ", length = " + nums.Size());

        /* Insert element in the middle */
        nums.Insert(3, 6);
        Console.WriteLine("Insert the number 6 at index 3, resulting in nums = " + string.Join(", ", nums.ToArray()));

        /* Remove element */
        nums.Remove(3);
        Console.WriteLine("Remove the element at index 3, resulting in nums = " + string.Join(", ", nums.ToArray()));

        /* Access element */
        int num = nums.Get(1);
        Console.WriteLine("Access the element at index 1, obtained num =" + num);

        /* Update element */
        nums.Set(1, 0);
        Console.WriteLine("Update the element at index 1 to 0, resulting in nums = " + string.Join(", ", nums.ToArray()));

        /* Test expansion mechanism */
        for (int i = 0; i < 10; i++) {
            // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
            nums.Add(i);
        }
        Console.WriteLine("After extending the list, nums = " + string.Join(", ", nums.ToArray()) +
                           ", capacity = " + nums.Capacity() + ", length = " + nums.Size());
    }
}
