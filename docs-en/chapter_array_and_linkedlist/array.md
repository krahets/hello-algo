# Array

"An array is a linear data structure that stores elements of the same type in contiguous memory space. The position of an element in an array is called the "index index" of that element. The figure below shows the main terms and concepts of array.

![How arrays are defined and stored](array.assets/array_definition.png)

## Common Operations On Arrays

### Initialize An Array

There are two types of initialization of arrays that we can choose according to our needs: no initial value, and given initial value. Without specifying an initial value, most programming languages initialize the array elements to $0$ .

=== "Python"

    ```python title="array.py"
    # Initialize the array
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4] 
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Initialize the array */
    // Stored on the stack
    int arr[5];
    int nums[5] = { 1, 3, 2, 5, 4 };
    // Stored on heap (requires manual space freeing)
    int* arr1 = new int[5];
    int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="array.java"
    /* Initialize the array */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Initialize the array */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "Go"

    ```go title="array.go"
    /* Initialize the array */
    var arr [5]int
    // In Go, arrays are arrays when the length is specified ([5]int), and slices are slices when the length is not specified ([]int).
    // Since Go's arrays are designed to have their length determined at compile time, you can only use constants to specify the length.
    // To make it easier to implement the extend() method, think of a slice as an array.
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Initialize the array */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    let nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="array.js"
    /* Initialize the array */
    var arr = new Array(5).fill(0);
    var nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Initialize the array */
    let arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Initialize the array */
    List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Initialize the array */
    let arr: Vec<i32> = vec![0; 5]; // [0, 0, 0, 0, 0]
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    /* Initialize the array */
    int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
    int nums[5] = { 1, 3, 2, 5, 4 };
    ```

=== "Zig"

    ```zig title="array.zig"
    // Initialize the array.
    var arr = [_]i32{0} **5; // { 0, 0, 0, 0, 0 }
    var nums = [_]i32{ 1, 3, 2, 5, 4 };
    ```

### Accessing Elements

Array elements are stored in contiguous memory space, which means that calculating the memory address of an array element is very easy. Given an array memory address (i.e., the first element memory address) and the index of an element, we can use the formula shown in the figure below to calculate to get the memory address of that element, and thus access this element directly.

![Memory address calculation for array elements](array.assets/array_memory_location_calculation.png)

Looking at the figure above, we see that the first element of the array is indexed at $0$, which seems counter-intuitive since it would be more natural to start counting at $1$. However, from the perspective of the address calculation formula, **the meaning of index is essentially the offset of the memory address**. The address offset of the first element is $0$, so it makes sense that it is indexed as $0$.

Accessing elements in an array is very efficient, we can randomly access any element in the array in $O(1)$ time.

```src
[file]{array}-[class]{}-[func]{random_access}
```

### Insert Element

The elements of an array are "next to each other" in memory, and there is no room for any more data between them. As shown in the figure below, if you want to insert an element in the middle of an array, you need to move all the elements after that element back one place, and then assign the element to the index.

![Example of inserting elements into an array](array.assets/array_insert_element.png)

It is worth noting that since the length of the array is fixed, inserting an element will always result in the "loss" of the last element of the array. We leave the solution to this problem to the section on lists.

```src
[file]{array}-[class]{}-[func]{insert}
```

### Delete Element

Similarly, as shown in the figure below, if you want to delete the element at index $i$, you need to move all the elements after index $i$ forward by one bit.

![Example of removing elements from an array](array.assets/array_remove_element.png)

Note that after the deletion of the element is complete, the element at the end becomes "meaningless", so we don't need to modify it.

```src
[file]{array}-[class]{}-[func]{remove}
```

In general, insertion and deletion operations on arrays have the following disadvantages.

- **High time complexity**: the average time complexity of both insertion and deletion of arrays is $O(n)$ , where $n$ is the length of the array.
- **Lost Elements**: since the length of the array is immutable, elements out of the range of the length of the array are lost after insertion.
- **Memory Waste**: We can initialize a long array and use only the first part, so that when inserting data, the missing end elements are "meaningless", but this will also result in a partial waste of memory space.

### Traversing Array

In most programming languages, we can either traverse an array by index or traverse directly to get each element in the array.

```src
[file]{array}-[class]{}-[func]{traverse}
```

### Find An Element

Finding the specified element in an array requires traversing the array, determining whether the element values match in each round, and outputting the corresponding index if they do.

Because arrays are linear data structures, the above lookup operation is called "linear lookup".

```src
[file]{array}-[class]{}-[func]{find}
```

### Expanded Array

In complex system environments, it is difficult for a program to guarantee that the memory space after an array is available, thus making it impossible to safely extend the array capacity. Therefore in most programming languages, **the length of an array is immutable**.

If we want to expand the array, we need to recreate a larger array and copy the elements of the original array to the new one in turn. This is a $O(n)$ operation, which is time-consuming when the array is very large.

```src
[file]{array}-[class]{}-[func]{extend}
```

## Arrays Benefits And Limitations

Arrays are stored in contiguous memory spaces with elements of the same type. This practice contains a wealth of a priori information that can be used by the system to optimize the operational efficiency of the data structure.

- **Space efficient**: Arrays allocate contiguous blocks of memory for data without additional structural overhead.
- **Supports random access**: Arrays allow any element to be accessed in $O(1)$ time.
- **Cache locality**: When an array element is accessed, the computer not only loads it, but also caches the rest of the data around it, thereby leveraging the cache to speed up the execution of subsequent operations.

Continuous space storage is a double-edged sword with the following disadvantages.

- **Insertion and deletion are inefficient**: Insertion and deletion operations require moving a large number of elements when there are many elements in the array.
- **Length immutable**: Arrays have a fixed length after initialization, and expanding an array requires copying all the data to the new array, which has a lot of overhead.
- **Space Waste**: If an array is allocated a larger size than is actually needed, the extra space is wasted.

## Typical Applications Of Arrays

Arrays are a basic and common data structure that are frequently used in various types of algorithms as well as for implementing complex data structures.

- **Random Access**: if we want to randomize some samples, then we can store them in an array and generate a random sequence to achieve random sampling of samples based on the index.
- **Sorting and Searching**: Arrays are the most commonly used data structure for sorting and searching algorithms. Quick sort, merge sort, binary search, etc. are all performed primarily on arrays.
- **Lookup Tables**: When we need to find an element quickly or need to find the correspondence of an element, we can use an array as a lookup table. If we want to implement a character to ASCII mapping, we can use the ASCII value of the character as the index and store the corresponding element in the corresponding position in the array.
- **Machine Learning**: neural networks make heavy use of linear algebra operations between vectors, matrices, and tensors, which are constructed as arrays. Arrays are the most commonly used data structure in neural network programming.
- **Data Structure Implementation**: arrays can be used to implement data structures such as stacks, queues, hash tables, heaps, graphs, and so on. For example, the adjacency matrix representation of a graph is actually a two-dimensional array.
