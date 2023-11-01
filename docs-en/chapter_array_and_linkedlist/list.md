# List

"A list is an abstract data structure that represents an ordered collection of elements and supports operations such as accessing, modifying, adding, deleting, and traversing elements without the need to consider capacity constraints. Lists can be implemented based on linked lists or arrays.

- A linked list can naturally be viewed as a list, which supports element addition, deletion, checking, and modification operations, and can be flexibly and dynamically expanded.
- Arrays also support adding, deleting, checking, and changing elements, but because their length is immutable, they can only be viewed as a list with a length limit.

When implementing lists using arrays, **the immutable nature of the length causes lists to be less useful**. This is because we usually cannot determine in advance how much data we need to store, making it difficult to choose an appropriate list length. If the length is too small, it is likely to be unsatisfactory for use; if it is too large, it will result in wasted memory space.

To solve this problem, we can use "dynamic array dynamic array" to implement the list. It inherits the advantages of arrays and can be dynamically expanded during the program.

In fact, the standard library in many programming languages provides lists based on dynamic array implementations, such as `list` in Python, `ArrayList` in Java, `vector` in C++, and `List` in C#. For the rest of this discussion, we'll treat "lists" and "dynamic arrays" as equivalent concepts.

## Common Operations On Lists

### Initialize The List.

We usually use the two initialization methods "without initial value" and "with initial value".

=== "Python"

    ```python title="list.py"
    # Initialize the list
    # No initial value
    nums1: list[int] = []
    # With initial values
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Initialize list */
    // Note that in C++, vectors are the nums described in this article.
    // No initial value
    vector<int> nums1;
    // With initial values
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* Initialize list */
    // No initial value
    List<Integer> nums1 = new ArrayList<>();
    // with initial values (note that the element type of the array needs to be Integer[], the wrapper class for int[])
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Initialize list */
    // No initial value
    List<int> nums1 = new();
    // With initial values
    int[] numbers = new int[] { 1, 3, 2, 5, 4 };
    List<int> nums = numbers.ToList();
    ```

=== "Go"

    ```go title="list_test.go"
    /* Initialize list */
    // No initial value
    nums1 := []int
    // With initial values
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Initialize list */
    // No initial value
    let nums1: [Int] = []
    // With initial values
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Initialize list */
    // No initial value
    const nums1 = [];
    // With initial values
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Initialize list */
    // No initial value
    const nums1: number[] = [];
    // With initial values
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Initialize list */
    // No initial value
    List<int> nums1 = [];
    // With initial values
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Initialize list */
    // No initial value
    let nums1: Vec<i32> = Vec::new();
    // With initial values
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array.
    ```

=== "Zig"

    ```zig title="list.zig"
    // Initialization list
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

### Accessing Elements

Lists are essentially arrays, so it is efficient to access and update elements in $O(1)$ time.

=== "Python"

    ```python title="list.py"
    # Access to elements
    num: int = nums[1]  # access the element at index 1

    # Update elements
    nums[1] = 0    # update element at index 1 to 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Access to elements */
    int num = nums[1];  // access the element at index 1

    /* Update elements */
    nums[1] = 0;  // update element at index 1 to 0
    ```

=== "Java"

    ```java title="list.java"
    /* Access to elements */
    int num = nums.get(1);  // access the element at index 1

    /* Update elements */
    nums.set(1, 0);  // update the element at index 1 to 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Access to elements */
    int num = nums[1];  // access the element at index 1

    /* Update elements */
    nums[1] = 0;  // update element at index 1 to 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* Access to elements */
    num := nums[1]  // access the element at index 1

    /* Update elements */
    nums[1] = 0     // update the element at index 1 to 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Access to elements */
    let num = nums[1] // access the element at index 1

    /* Update elements */
    nums[1] = 0 // update the element at index 1 to 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* Access to elements */
    const num = nums[1];  // access the element at index 1

    /* Update elements */
    nums[1] = 0;  // update element at index 1 to 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Access to elements */
    const num: number = nums[1];  // access the element at index 1

    /* Update elements */
    nums[1] = 0;  // update element at index 1 to 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Access to elements */
    int num = nums[1];  // access the element at index 1

    /* Update elements */
    nums[1] = 0;  // update element at index 1 to 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Access to elements */
    let num: i32 = nums[1];  // access the element at index 1
    /* Update elements */
    nums[1] = 0;             // update element at index 1 to 0
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array.
    ```

=== "Zig"

    ```zig title="list.zig"
    // Accessing elements
    var num = nums.items[1]; // access the element at index 1

    // Update the element
    nums.items[1] = 0; // update the element at index 1 to 0
    ```

### Inserting And Deleting Elements

Compared to arrays, lists are free to add and remove elements. Adding elements to the end of the list has a time complexity of $O(1)$ , but inserting and deleting elements is still as efficient as an array with a time complexity of $O(n)$ .

=== "Python"

    ```python title="list.py"
    # Empty the list
    nums.clear()

    # Add elements to the end
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Insert elements in the middle
    nums.insert(3, 6)  # insert the number 6 at index 3

    # Delete element
    nums.pop(3)        # remove the element at index 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Empty list */
    nums.clear();

    /* Add element at the end */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Insertion of elements in the middle */
    nums.insert(nums.begin() + 3, 6);  // insert the number 6 at index 3

    /* Delete element */
    nums.erase(nums.begin() + 3);      // remove the element at index 3
    ```

=== "Java"

    ```java title="list.java"
    /* Empty list */
    nums.clear();

    /* Add element at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insertion of elements in the middle */
    nums.add(3, 6);  // insert the number 6 at index 3

    /* Delete element */
    nums.remove(3);  // Remove the element at index 3.
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Empty list */
    nums.Clear();

    /* Add element at the end */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Insertion of elements in the middle */
    nums.Insert(3, 6);

    /* Delete element */
    nums.RemoveAt(3);
    ```

=== "Go"

    ```go title="list_test.go"
    /* Empty list */
    nums = nil

    /* Add element at the end */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* Insertion of elements in the middle */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert the number 6 at index 3.

    /* Delete element */
    nums = append(nums[:3], nums[4:]...) // Delete the element at index 3.
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Empty list */
    nums.removeAll()

    /* Add element at the end */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* Insertion of elements in the middle */
    nums.insert(6, at: 3) // insert the number 6 at index 3

    /* Delete element */
    nums.remove(at: 3) // remove the element at index 3
    ```

=== "JS"

    ```javascript title="list.js"
    /* Empty list */
    nums.length = 0;

    /* Add element at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insertion of elements in the middle */
    nums.splice(3, 0, 6);

    /* Delete element */
    nums.splice(3, 1);
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Empty list */
    nums.length = 0;

    /* Add element at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insertion of elements in the middle */
    nums.splice(3, 0, 6);

    /* Delete element */
    nums.splice(3, 1);
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Empty list */
    nums.clear();

    /* Add element at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insertion of elements in the middle */
    nums.insert(3, 6); // insert the number 6 at index 3

    /* Delete element */
    nums.removeAt(3); // Remove the element at index 3.
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Empty list */
    nums.clear();

    /* Add element at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insertion of elements in the middle */
    nums.insert(3, 6);  // insert the number 6 at index 3

    /* Delete element */
    nums.remove(3);    // Remove the element at index 3.
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array.
    ```

=== "Zig"

    ```zig title="list.zig"
    // Empty the list.
    nums.clearRetainingCapacity();

    // Add elements to the end
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);

    // Insert elements in the middle
    try nums.insert(3, 6); // insert the number 6 at index 3

    // Delete the element
    _ = nums.orderedRemove(3); // remove the element at index 3
    ```

### Traverse The List.

As with arrays, lists can be traversed by index or by traversing the elements directly.

=== "Python"

    ```python title="list.py"
    # Iterate through the list by indexes
    count = 0
    for i in range(len(nums)):
        count += 1

    # Iterate over the list elements directly
    count = 0
    for num in nums:
        count += 1
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Iterate through the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count++;
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (int num : nums) {
        count++;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* Iterate through the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count++;
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (int num : nums) {
        count++;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Iterate through the list by index */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count++;
    }

    /* Iterate directly over the list elements */
    count = 0;
    foreach (int num in nums) {
        count++;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* Iterate through the list by index */
    count := 0
    for i := 0; i < len(nums); i++ {
        count++
    }

    /* Iterate directly over the list elements */
    count = 0
    for range nums {
        count++
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Iterate through the list by index */
    var count = 0
    for _ in nums.indices {
        count += 1
    }

    /* Iterate directly over the list elements */
    count = 0
    for _ in nums {
        count += 1
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* Iterate through the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count++;
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (const num of nums) {
        count++;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Iterate through the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count++;
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (const num of nums) {
        count++;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Iterate through the list by index */
    int count = 0;
    for (int i = 0; i < nums.length; i++) {
        count++;
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (int num in nums) {
        count++;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Iterate through the list by index */
    let mut count = 0;
    for (index, value) in nums.iter().enumerate() {
        count += 1;
    }

    /* Iterate directly over the list elements */
    let mut count = 0;
    for value in nums.iter() {
        count += 1;
    }
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array.
    ```

=== "Zig"

    ```zig title="list.zig"
    // Iterate through the list by indexes
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < nums.items.len) : (i += 1) {
        count += 1;
    }

    // Iterate directly over the list elements.
    count = 0;
    for (nums.items) |_| {
        count += 1;
    }
    ```

### Splice The List

Given a new list `nums1` , we can splice that list onto the end of the original list.

=== "Python"

    ```python title="list.py"
    # Splicing two lists together
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # splice list nums1 after nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Splice two lists */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // Splice the list nums1 after nums.
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Splice two lists */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // splice the list nums1 after nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Splice two lists */
    List<int> nums1 = new() { 6, 8, 7, 10, 9 };
    nums.AddRange(nums1);  // splice the list nums1 after nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Splice two lists */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // Append the list nums1 to the list after nums.
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Splice two lists */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // splice list nums1 after nums
    ```

=== "JS"

    ```javascript title="list.js"
    /* Splice two lists */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // splice the list nums1 after nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Splice two lists */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // splice the list nums1 after nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Splice two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // splice the list nums1 after nums
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Splice two lists */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array.
    ```

=== "Zig"

    ```zig title="list.zig"
    // Splicing two lists together
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items); // splice list nums1 after nums
    ```

### Sort The List

Once the list is sorting algorithm is complete, we can use the "binary search" and "double pointer" algorithms that are often examined in array-based algorithmic problems.

=== "Python"

    ```python title="list.py"
    # Sort the list
    nums.sort()  # After sorting, list elements are ordered from smallest to largest
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Sort list */
    sort(nums.begin(), nums.end());  // after sorting, the list elements are sorted from smallest to largest
    ```

=== "Java"

    ```java title="list.java"
    /* Sort list */
    Collections.sort(nums);  // after sorting, the list elements are ordered from smallest to largest
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Sort list */
    nums.Sort(); // After sorting, the list elements are ordered from smallest to largest
    ```

=== "Go"

    ```go title="list_test.go"
    /* Sort list */
    sort.Ints(nums)  // After sorting, the list elements are sorted from smallest to largest
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Sort list */
    nums.sort() // After sorting, the list elements are arranged from smallest to largest
    ```

=== "JS"

    ```javascript title="list.js"
    /* Sort list */
    nums.sort((a, b) => a - b);  // after sorting, the list elements are ordered from smallest to largest
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Sort list */
    nums.sort((a, b) => a - b);  // after sorting, the list elements are ordered from smallest to largest
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Sort list */
    nums.sort(); // after sorting, the list elements are sorted from smallest to largest
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Sort list */
    nums.sort(); // after sorting, the list elements are sorted from smallest to largest
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array.
    ```

=== "Zig"

    ```zig title="list.zig"
    // Sort the list
    std.sort.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    ```

## List Implementations

Many programming languages provide built-in lists, such as Java, C++, Python, and so on. Their implementation is more complex, and the setting of each parameter is also very delicate, such as the initial capacity, expansion multiplier and so on. Interested readers can check the source code to learn.

To deepen the solution of how lists work, let's try to implement a simple version of a list, including the following three key designs.

- **Initial Capacity**: pick a reasonable initial capacity for the array. In this example, we choose 10 as the initial capacity.
- **Quantity Record**: declares a variable `size` that is used to record the current number of elements in the list and is updated in real time as elements are inserted and deleted. Based on this variable, we can locate the tail of the list, as well as determine if it needs to be expanded.
- **Expansion Mechanism**: If the list capacity is full when an element is inserted, it needs to be expanded. First, a larger array is created based on the expansion factor, and then all the elements of the current array are moved to the new array in turn. In this example, we specify that the array should be expanded to twice its previous size each time.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
