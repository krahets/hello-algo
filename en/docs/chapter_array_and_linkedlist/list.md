# List

A "list" is an abstract data structure concept that represents an ordered collection of elements, supporting operations such as element access, modification, addition, deletion, and traversal, without requiring users to consider capacity limitations. Lists can be implemented based on linked lists or arrays.

- A linked list inherently serves as a list, supporting operations for adding, deleting, searching, and modifying elements, with the flexibility to dynamically adjust its size.
- Arrays also support these operations, but due to their immutable length, they can be considered as a list with a length limit.

When implementing lists using arrays, **the immutability of length reduces the practicality of the list**. This is because predicting the amount of data to be stored in advance is often challenging, making it difficult to choose an appropriate list length. If the length is too small, it may not meet the requirements; if too large, it may waste memory space.

To solve this problem, we can implement lists using a "dynamic array." It inherits the advantages of arrays and can dynamically expand during program execution.

In fact, **many programming languages' standard libraries implement lists using dynamic arrays**, such as Python's `list`, Java's `ArrayList`, C++'s `vector`, and C#'s `List`. In the following discussion, we will consider "list" and "dynamic array" as synonymous concepts.

## Common list operations

### Initializing a list

We typically use two initialization methods: "without initial values" and "with initial values".

=== "Python"

    ```python title="list.py"
    # Initialize list
    # Without initial values
    nums1: list[int] = []
    # With initial values
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Initialize list */
    // Note, in C++ the vector is the equivalent of nums described here
    // Without initial values
    vector<int> nums1;
    // With initial values
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* Initialize list */
    // Without initial values
    List<Integer> nums1 = new ArrayList<>();
    // With initial values (note the element type should be the wrapper class Integer[] for int[])
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Initialize list */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* Initialize list */
    // Without initial values
    nums1 := []int{}
    // With initial values
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Initialize list */
    // Without initial values
    let nums1: [Int] = []
    // With initial values
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Initialize list */
    // Without initial values
    const nums1 = [];
    // With initial values
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Initialize list */
    // Without initial values
    const nums1: number[] = [];
    // With initial values
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Initialize list */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Initialize list */
    // Without initial values
    let nums1: Vec<i32> = Vec::new();
    // With initial values
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // Initialize list
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

### Accessing elements

Lists are essentially arrays, thus they can access and update elements in $O(1)$ time, which is very efficient.

=== "Python"

    ```python title="list.py"
    # Access elements
    num: int = nums[1]  # Access the element at index 1

    # Update elements
    nums[1] = 0    # Update the element at index 1 to 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Access elements */
    int num = nums[1];  // Access the element at index 1

    /* Update elements */
    nums[1] = 0;  // Update the element at index 1 to 0
    ```

=== "Java"

    ```java title="list.java"
    /* Access elements */
    int num = nums.get(1);  // Access the element at index 1

    /* Update elements */
    nums.set(1, 0);  // Update the element at index 1 to 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Access elements */
    int num = nums[1];  // Access the element at index 1

    /* Update elements */
    nums[1] = 0;  // Update the element at index 1 to 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* Access elements */
    num := nums[1]  // Access the element at index 1

    /* Update elements */
    nums[1] = 0     // Update the element at index 1 to 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Access elements */
    let num = nums[1] // Access the element at index 1

    /* Update elements */
    nums[1] = 0 // Update the element at index 1 to 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* Access elements */
    const num = nums[1];  // Access the element at index 1

    /* Update elements */
    nums[1] = 0;  // Update the element at index 1 to 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Access elements */
    const num: number = nums[1];  // Access the element at index 1

    /* Update elements */
    nums[1] = 0;  // Update the element at index 1 to 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Access elements */
    int num = nums[1];  // Access the element at index 1

    /* Update elements */
    nums[1] = 0;  // Update the element at index 1 to 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Access elements */
    let num: i32 = nums[1];  // Access the element at index 1
    /* Update elements */
    nums[1] = 0;             // Update the element at index 1 to 0
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // Access elements
    var num = nums.items[1]; // Access the element at index 1

    // Update elements
    nums.items[1] = 0; // Update the element at index 1 to 0  
    ```

### Inserting and removing elements

Compared to arrays, lists offer more flexibility in adding and removing elements. While adding elements to the end of a list is an $O(1)$ operation, the efficiency of inserting and removing elements elsewhere in the list remains the same as in arrays, with a time complexity of $O(n)$.

=== "Python"

    ```python title="list.py"
    # Clear list
    nums.clear()

    # Append elements at the end
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Insert element in the middle
    nums.insert(3, 6)  # Insert number 6 at index 3

    # Remove elements
    nums.pop(3)        # Remove the element at index 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Clear list */
    nums.clear();

    /* Append elements at the end */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Insert element in the middle */
    nums.insert(nums.begin() + 3, 6);  // Insert number 6 at index 3

    /* Remove elements */
    nums.erase(nums.begin() + 3);      // Remove the element at index 3
    ```

=== "Java"

    ```java title="list.java"
    /* Clear list */
    nums.clear();

    /* Append elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert element in the middle */
    nums.add(3, 6);  // Insert number 6 at index 3

    /* Remove elements */
    nums.remove(3);  // Remove the element at index 3
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Clear list */
    nums.Clear();

    /* Append elements at the end */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Insert element in the middle */
    nums.Insert(3, 6);

    /* Remove elements */
    nums.RemoveAt(3);
    ```

=== "Go"

    ```go title="list_test.go"
    /* Clear list */
    nums = nil

    /* Append elements at the end */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* Insert element in the middle */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert number 6 at index 3

    /* Remove elements */
    nums = append(nums[:3], nums[4:]...) // Remove the element at index 3
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Clear list */
    nums.removeAll()

    /* Append elements at the end */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* Insert element in the middle */
    nums.insert(6, at: 3) // Insert number 6 at index 3

    /* Remove elements */
    nums.remove(at: 3) // Remove the element at index 3
    ```

=== "JS"

    ```javascript title="list.js"
    /* Clear list */
    nums.length = 0;

    /* Append elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert element in the middle */
    nums.splice(3, 0, 6);

    /* Remove elements */
    nums.splice(3, 1);
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Clear list */
    nums.length = 0;

    /* Append elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert element in the middle */
    nums.splice(3, 0, 6);

    /* Remove elements */
    nums.splice(3, 1);
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Clear list */
    nums.clear();

    /* Append elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert element in the middle */
    nums.insert(3, 6); // Insert number 6 at index 3

    /* Remove elements */
    nums.removeAt(3); // Remove the element at index 3
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Clear list */
    nums.clear();

    /* Append elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert element in the middle */
    nums.insert(3, 6);  // Insert number 6 at index 3

    /* Remove elements */
    nums.remove(3);    // Remove the element at index 3
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // Clear list
    nums.clearRetainingCapacity();

    // Append elements at the end
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);

    // Insert element in the middle
    try nums.insert(3, 6); // Insert number 6 at index 3

    // Remove elements
    _ = nums.orderedRemove(3); // Remove the element at index 3
    ```

### Iterating the list

Similar to arrays, lists can be iterated either by using indices or by directly iterating through each element.

=== "Python"

    ```python title="list.py"
    # Iterate through the list by index
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Iterate directly through list elements
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Iterate through the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* Iterate directly through list elements */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* Iterate through the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* Iterate directly through list elements */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Iterate through the list by index */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* Iterate directly through list elements */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* Iterate through the list by index */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* Iterate directly through list elements */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Iterate through the list by index */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* Iterate directly through list elements */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* Iterate through the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Iterate directly through list elements */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Iterate through the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Iterate directly through list elements */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Iterate through the list by index */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    
    /* Iterate directly through list elements */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // Iterate through the list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Iterate directly through list elements
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // Iterate through the list by index
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums[i];
    }

    // Iterate directly through list elements
    count = 0;
    for (nums.items) |num| {
        count += num;
    }
    ```

### Concatenating lists

Given a new list `nums1`, we can append it to the end of the original list.

=== "Python"

    ```python title="list.py"
    # Concatenate two lists
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # Concatenate nums1 to the end of nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Concatenate two lists */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // Concatenate nums1 to the end of nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Concatenate two lists */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // Concatenate nums1 to the end of nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // Concatenate nums1 to the end of nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Concatenate two lists */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // Concatenate nums1 to the end of nums
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Concatenate two lists */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // Concatenate nums1 to the end of nums
    ```

=== "JS"

    ```javascript title="list.js"
    /* Concatenate two lists */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Concatenate nums1 to the end of nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Concatenate two lists */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Concatenate nums1 to the end of nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // Concatenate nums1 to the end of nums
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Concatenate two lists */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // Concatenate two lists
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items); // Concatenate nums1 to the end of nums
    ```

### Sorting the list

Once the list is sorted, we can employ algorithms commonly used in array-related algorithm problems, such as "binary search" and "two-pointer" algorithms.

=== "Python"

    ```python title="list.py"
    # Sort the list
    nums.sort()  # After sorting, the list elements are in ascending order
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Sort the list */
    sort(nums.begin(), nums.end());  // After sorting, the list elements are in ascending order
    ```

=== "Java"

    ```java title="list.java"
    /* Sort the list */
    Collections.sort(nums);  // After sorting, the list elements are in ascending order
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Sort the list */
    nums.Sort(); // After sorting, the list elements are in ascending order
    ```

=== "Go"

    ```go title="list_test.go"
    /* Sort the list */
    sort.Ints(nums)  // After sorting, the list elements are in ascending order
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Sort the list */
    nums.sort() // After sorting, the list elements are in ascending order
    ```

=== "JS"

    ```javascript title="list.js"
    /* Sort the list */  
    nums.sort((a, b) => a - b);  // After sorting, the list elements are in ascending order
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Sort the list */
    nums.sort((a, b) => a - b);  // After sorting, the list elements are in ascending order
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Sort the list */
    nums.sort(); // After sorting, the list elements are in ascending order
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Sort the list */
    nums.sort(); // After sorting, the list elements are in ascending order
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // Sort the list
    std.sort.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    ```

## List implementation

Many programming languages come with built-in lists, including Java, C++, Python, etc. Their implementations tend to be intricate, featuring carefully considered settings for various parameters, like initial capacity and expansion factors. Readers who are curious can delve into the source code for further learning.

To enhance our understanding of how lists work, we will attempt to implement a simplified version of a list, focusing on three crucial design aspects:

- **Initial capacity**: Choose a reasonable initial capacity for the array. In this example, we choose 10 as the initial capacity.
- **Size recording**: Declare a variable `size` to record the current number of elements in the list, updating in real-time with element insertion and deletion. With this variable, we can locate the end of the list and determine whether expansion is needed.
- **Expansion mechanism**: If the list reaches full capacity upon an element insertion, an expansion process is required. This involves creating a larger array based on the expansion factor, and then transferring all elements from the current array to the new one. In this example, we stipulate that the array size should double with each expansion.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
