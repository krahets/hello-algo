---
comments: true
---

# 4.1 &nbsp; Array

An <u>array</u> is a linear data structure that operates as a lineup of similar items, stored together in a computer's memory in contiguous spaces. It's like a sequence that maintains organized storage. Each item in this lineup has its unique 'spot' known as an <u>index</u>. Please refer to Figure 4-1 to observe how arrays work and grasp these key terms.

![Array definition and storage method](array.assets/array_definition.png){ class="animation-figure" }

<p align="center"> Figure 4-1 &nbsp; Array definition and storage method </p>

## 4.1.1 &nbsp; Common operations on arrays

### 1. &nbsp; Initializing arrays

Arrays can be initialized in two ways depending on the needs: either without initial values or with specified initial values. When initial values are not specified, most programming languages will set the array elements to $0$:

=== "Python"

    ```python title="array.py"
    # Initialize array
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Initialize array */
    // Stored on stack
    int arr[5];
    int nums[5] = { 1, 3, 2, 5, 4 };
    // Stored on heap (manual memory release needed)
    int* arr1 = new int[5];
    int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="array.java"
    /* Initialize array */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Initialize array */
    int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
    int[] nums = [1, 3, 2, 5, 4];
    ```

=== "Go"

    ```go title="array.go"
    /* Initialize array */
    var arr [5]int
    // In Go, specifying the length ([5]int) denotes an array, while not specifying it ([]int) denotes a slice.
    // Since Go's arrays are designed to have compile-time fixed length, only constants can be used to specify the length.
    // For convenience in implementing the extend() method, the Slice will be considered as an Array here.
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Initialize array */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    let nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="array.js"
    /* Initialize array */
    var arr = new Array(5).fill(0);
    var nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Initialize array */
    let arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Initialize array */
    List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Initialize array */
    let arr: Vec<i32> = vec![0; 5]; // [0, 0, 0, 0, 0]
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    /* Initialize array */
    int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
    int nums[5] = { 1, 3, 2, 5, 4 };
    ```

=== "Kotlin"

    ```kotlin title="array.kt"

    ```

=== "Zig"

    ```zig title="array.zig"
    // Initialize array
    var arr = [_]i32{0} ** 5; // { 0, 0, 0, 0, 0 }
    var nums = [_]i32{ 1, 3, 2, 5, 4 };
    ```

### 2. &nbsp; Accessing elements

Elements in an array are stored in contiguous memory spaces, making it simpler to compute each element's memory address. The formula shown in the Figure below aids in determining an element's memory address, utilizing the array's memory address (specifically, the first element's address) and the element's index. This computation streamlines direct access to the desired element.

![Memory address calculation for array elements](array.assets/array_memory_location_calculation.png){ class="animation-figure" }

<p align="center"> Figure 4-2 &nbsp; Memory address calculation for array elements </p>

As observed in Figure 4-2, array indexing conventionally begins at $0$. While this might appear counterintuitive, considering counting usually starts at $1$, within the address calculation formula, **an index is essentially an offset from the memory address**. For the first element's address, this offset is $0$, validating its index as $0$.

Accessing elements in an array is highly efficient, allowing us to randomly access any element in $O(1)$ time.

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """Random access to elements"""
        # Randomly select a number from the interval [0, len(nums)-1]
        random_index = random.randint(0, len(nums) - 1)
        # Retrieve and return a random element
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Random access to elements */
    int randomAccess(int *nums, int size) {
        // Randomly select a number in the range [0, size)
        int randomIndex = rand() % size;
        // Retrieve and return a random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Random access to elements */
    int randomAccess(int[] nums) {
        // Randomly select a number in the interval [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Retrieve and return a random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{RandomAccess}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{randomAccess}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{randomAccess}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{randomAccess}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{randomAccess}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{randomAccess}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{random_access}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{randomAccess}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{randomAccess}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{random_access}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{randomAccess}
    ```

### 3. &nbsp; Inserting elements

Array elements are tightly packed in memory, with no space available to accommodate additional data between them. As illustrated in Figure 4-3, inserting an element in the middle of an array requires shifting all subsequent elements back by one position to create room for the new element.

![Array element insertion example](array.assets/array_insert_element.png){ class="animation-figure" }

<p align="center"> Figure 4-3 &nbsp; Array element insertion example </p>

It's important to note that due to the fixed length of an array, inserting an element will unavoidably result in the loss of the last element in the array. Solutions to address this issue will be explored in the "List" chapter.

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """Insert element num at `index`"""
        # Move all elements after `index` one position backward
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # Assign num to the element at index
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Insert element num at `index` */
    void insert(int *nums, int size, int num, int index) {
        // Move all elements after `index` one position backward
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Insert element num at `index` */
    void insert(int[] nums, int num, int index) {
        // Move all elements after `index` one position backward
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Insert}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{insert}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{insert}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{insert}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{insert}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{insert}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{insert}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{insert}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{insert}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{insert}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{insert}
    ```

### 4. &nbsp; Deleting elements

Similarly, as depicted in Figure 4-4, to delete an element at index $i$, all elements following index $i$ must be moved forward by one position.

![Array element deletion example](array.assets/array_remove_element.png){ class="animation-figure" }

<p align="center"> Figure 4-4 &nbsp; Array element deletion example </p>

Please note that after deletion, the former last element becomes "meaningless," hence requiring no specific modification.

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """Remove the element at `index`"""
        # Move all elements after `index` one position forward
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Remove the element at `index` */
    void remove(int *nums, int size, int index) {
        // Move all elements after `index` one position forward
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Remove the element at `index` */
    void remove(int[] nums, int index) {
        // Move all elements after `index` one position forward
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Remove}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{remove}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{remove}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{remove}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{remove}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{remove}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{remove}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{removeItem}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{remove}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{remove}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{remove}
    ```

In summary, the insertion and deletion operations in arrays present the following disadvantages:

- **High time complexity**: Both insertion and deletion in an array have an average time complexity of $O(n)$, where $n$ is the length of the array.
- **Loss of elements**: Due to the fixed length of arrays, elements that exceed the array's capacity are lost during insertion.
- **Waste of memory**: Initializing a longer array and utilizing only the front part results in "meaningless" end elements during insertion, leading to some wasted memory space.

### 5. &nbsp; Traversing arrays

In most programming languages, we can traverse an array either by using indices or by directly iterating over each element:

=== "Python"

    ```python title="array.py"
    def traverse(nums: list[int]):
        """Traverse array"""
        count = 0
        # Traverse array by index
        for i in range(len(nums)):
            count += nums[i]
        # Traverse array elements
        for num in nums:
            count += num
        # Traverse both data index and elements
        for i, num in enumerate(nums):
            count += nums[i]
            count += num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Traverse array */
    void traverse(int *nums, int size) {
        int count = 0;
        // Traverse array by index
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Traverse array */
    void traverse(int[] nums) {
        int count = 0;
        // Traverse array by index
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Traverse array elements
        for (int num : nums) {
            count += num;
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Traverse}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{traverse}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{traverse}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{traverse}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{traverse}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{traverse}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{traverse}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{traverse}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{traverse}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{traverse}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{traverse}
    ```

### 6. &nbsp; Finding elements

Locating a specific element within an array involves iterating through the array, checking each element to determine if it matches the desired value.

Because arrays are linear data structures, this operation is commonly referred to as "linear search."

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """Search for a specified element in the array"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Search for a specified element in the array */
    int find(int *nums, int size, int target) {
        for (int i = 0; i < size; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Search for a specified element in the array */
    int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Find}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{find}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{find}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{find}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{find}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{find}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{find}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{find}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{find}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{find}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{find}
    ```

### 7. &nbsp; Expanding arrays

In complex system environments, ensuring the availability of memory space after an array for safe capacity extension becomes challenging. Consequently, in most programming languages, **the length of an array is immutable**.

To expand an array,  it's necessary to create a larger array and then copy the elements from the original array. This operation has a time complexity of $O(n)$ and can be time-consuming for large arrays. The code are as follows:

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """Extend array length"""
        # Initialize an extended length array
        res = [0] * (len(nums) + enlarge)
        # Copy all elements from the original array to the new array
        for i in range(len(nums)):
            res[i] = nums[i]
        # Return the new array after expansion
        return res
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Extend array length */
    int *extend(int *nums, int size, int enlarge) {
        // Initialize an extended length array
        int *res = new int[size + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // Free memory
        delete[] nums;
        // Return the new array after expansion
        return res;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Extend array length */
    int[] extend(int[] nums, int enlarge) {
        // Initialize an extended length array
        int[] res = new int[nums.length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the new array after expansion
        return res;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Extend}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{extend}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{extend}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{extend}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{extend}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{extend}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{extend}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{extend}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{extend}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{extend}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{extend}
    ```

## 4.1.2 &nbsp; Advantages and limitations of arrays

Arrays are stored in contiguous memory spaces and consist of elements of the same type. This approach provides substantial prior information that systems can leverage to optimize the efficiency of data structure operations.

- **High space efficiency**: Arrays allocate a contiguous block of memory for data, eliminating the need for additional structural overhead.
- **Support for random access**: Arrays allow $O(1)$ time access to any element.
- **Cache locality**: When accessing array elements, the computer not only loads them but also caches the surrounding data, utilizing high-speed cache to enchance subsequent operation speeds.

However, continuous space storage is a double-edged sword, with the following limitations:

- **Low efficiency in insertion and deletion**: As arrays accumulate many elements, inserting or deleting elements requires shifting a large number of elements.
- **Fixed length**: The length of an array is fixed after initialization. Expanding an array requires copying all data to a new array, incurring significant costs.
- **Space wastage**: If the allocated array size exceeds the what is necessary, the extra space is wasted.

## 4.1.3 &nbsp; Typical applications of arrays

Arrays are fundamental and widely used data structures. They find frequent application in various algorithms and serve in the implementation of complex data structures.

- **Random access**: Arrays are ideal for storing data when random sampling is required. By generating a random sequence based on indices, we can achieve random sampling efficiently.
- **Sorting and searching**: Arrays are the most commonly used data structure for sorting and searching algorithms.  Techniques like quick sort, merge sort, binary search, etc., are primarily operate on arrays.
- **Lookup tables**: Arrays serve as efficient lookup tables for quick element or relationship retrieval. For instance, mapping characters to ASCII codes becomes seamless by using the ASCII code values as indices and storing corresponding elements in the array.
- **Machine learning**: Within the domain of neural networks, arrays play a pivotal role in executing crucial linear algebra operations involving vectors, matrices, and tensors. Arrays serve as the primary and most extensively used data structure in neural network programming.
- **Data structure implementation**:  Arrays serve as the building blocks for implementing various data structures like stacks, queues, hash tables, heaps, graphs, etc. For instance, the adjacency matrix representation of a graph is essentially a two-dimensional array.
