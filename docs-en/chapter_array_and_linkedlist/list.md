---
comments: true
---

# 4.3 &nbsp; List

A "list" is an abstract data structure concept, representing an ordered collection of elements. It supports operations like element access, modification, addition, deletion, and traversal, without requiring users to consider capacity limitations. Lists can be implemented based on linked lists or arrays.

- A linked list naturally functions as a list, supporting operations for adding, deleting, searching, and modifying elements, and can dynamically adjust its size.
- Arrays also support these operations, but due to their fixed length, they can be considered as a list with a length limit.

When using arrays to implement lists, **the fixed length property reduces the practicality of the list**. This is because we often cannot determine in advance how much data needs to be stored, making it difficult to choose an appropriate list length. If the length is too small, it may not meet the requirements; if too large, it may waste memory space.

To solve this problem, we can use a "dynamic array" to implement lists. It inherits the advantages of arrays and can dynamically expand during program execution.

In fact, **many programming languages' standard libraries implement lists using dynamic arrays**, such as Python's `list`, Java's `ArrayList`, C++'s `vector`, and C#'s `List`. In the following discussion, we will consider "list" and "dynamic array" as synonymous concepts.

## 4.3.1 &nbsp; Common List Operations

### 1. &nbsp; Initializing a List

We typically use two methods of initialization: "without initial values" and "with initial values".

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

=== "Zig"

    ```zig title="list.zig"
    // Initialize list
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

### 2. &nbsp; Accessing Elements

Lists are essentially arrays, so accessing and updating elements can be done in $O(1)$ time, which is very efficient.

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

=== "Zig"

    ```zig title="list.zig"
    // Access elements
    var num = nums.items[1]; // Access the element at index 1

    // Update elements
    nums.items[1] = 0; // Update the element at index 1 to 0  
    ```

### 3. &nbsp; Inserting and Deleting Elements

Compared to arrays, lists can freely add and remove elements. Adding elements at the end of the list has a time complexity of $O(1)$, but the efficiency of inserting and deleting elements is still the same as in arrays, with a time complexity of $O(n)$.

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

### 4. &nbsp; Traversing the List

Like arrays, lists can be traversed based on index, or by directly iterating over each element.

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

### 5. &nbsp; Concatenating Lists

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

=== "Zig"

    ```zig title="list.zig"
    // Concatenate two lists
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items); // Concatenate nums1 to the end of nums
    ```

### 6. &nbsp; Sorting the List

After sorting the list, we can use algorithms often tested in array-related algorithm problems, such as "binary search" and "two-pointer" algorithms.

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

=== "Zig"

    ```zig title="list.zig"
    // Sort the list
    std.sort.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    ```

## 4.3.2 &nbsp; List Implementation

Many programming languages have built-in lists, such as Java, C++, Python, etc. Their implementations are quite complex, with very meticulous settings for parameters such as initial capacity and expansion multiplier. Interested readers can refer to the source code for learning.

To deepen the understanding of how lists work, let's try implementing a simple version of a list, focusing on three key designs.

- **Initial Capacity**: Choose a reasonable initial capacity for the array. In this example, we choose 10 as the initial capacity.
- **Size Recording**: Declare a variable `size` to record the current number of elements in the list, updating in real-time with element insertion and deletion. With this variable, we can locate the end of the list and determine whether expansion is needed.
- **Expansion Mechanism**: If the list's capacity is full when inserting an element, expansion is necessary. First, create a larger array based on the expansion multiplier, then move all elements of the current array to the new array. In this example, we define that each time the array will expand to twice its previous size.

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """列表类"""

        def __init__(self):
            """构造方法"""
            self._capacity: int = 10  # 列表容量
            self._arr: list[int] = [0] * self._capacity  # 数组（存储列表元素）
            self._size: int = 0  # 列表长度（当前元素数量）
            self._extend_ratio: int = 2  # 每次列表扩容的倍数

        def size(self) -> int:
            """获取列表长度（当前元素数量）"""
            return self._size

        def capacity(self) -> int:
            """获取列表容量"""
            return self._capacity

        def get(self, index: int) -> int:
            """访问元素"""
            # 索引如果越界，则抛出异常，下同
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            return self._arr[index]

        def set(self, num: int, index: int):
            """更新元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            self._arr[index] = num

        def add(self, num: int):
            """在尾部添加元素"""
            # 元素数量超出容量时，触发扩容机制
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """在中间插入元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            # 元素数量超出容量时，触发扩容机制
            if self._size == self.capacity():
                self.extend_capacity()
            # 将索引 index 以及之后的元素都向后移动一位
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # 更新元素数量
            self._size += 1

        def remove(self, index: int) -> int:
            """删除元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            num = self._arr[index]
            # 将索引 index 之后的元素都向前移动一位
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # 更新元素数量
            self._size -= 1
            # 返回被删除的元素
            return num

        def extend_capacity(self):
            """列表扩容"""
            # 新建一个长度为原数组 _extend_ratio 倍的新数组，并将原数组复制到新数组
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # 更新列表容量
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """返回有效长度的列表"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* 列表类 */
    class MyList {
      private:
        int *arr;             // 数组（存储列表元素）
        int arrCapacity = 10; // 列表容量
        int arrSize = 0;      // 列表长度（当前元素数量）
        int extendRatio = 2;   // 每次列表扩容的倍数

      public:
        /* 构造方法 */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* 析构方法 */
        ~MyList() {
            delete[] arr;
        }

        /* 获取列表长度（当前元素数量）*/
        int size() {
            return arrSize;
        }

        /* 获取列表容量 */
        int capacity() {
            return arrCapacity;
        }

        /* 访问元素 */
        int get(int index) {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            return arr[index];
        }

        /* 更新元素 */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            arr[index] = num;
        }

        /* 在尾部添加元素 */
        void add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 在中间插入元素 */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (size() == capacity())
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 删除元素 */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            int num = arr[index];
            // 将索引 index 之后的元素都向前移动一位
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素数量
            arrSize--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        void extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // 将原数组中的所有元素复制到新数组
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // 释放内存
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* 将列表转换为 Vector 用于打印 */
        vector<int> toVector() {
            // 仅转换有效长度范围内的列表元素
            vector<int> vec(size());
            for (int i = 0; i < size(); i++) {
                vec[i] = arr[i];
            }
            return vec;
        }
    };
    ```

=== "Java"

    ```java title="my_list.java"
    /* 列表类 */
    class MyList {
        private int[] arr; // 数组（存储列表元素）
        private int capacity = 10; // 列表容量
        private int size = 0; // 列表长度（当前元素数量）
        private int extendRatio = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        public MyList() {
            arr = new int[capacity];
        }

        /* 获取列表长度（当前元素数量） */
        public int size() {
            return size;
        }

        /* 获取列表容量 */
        public int capacity() {
            return capacity;
        }

        /* 访问元素 */
        public int get(int index) {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            return arr[index];
        }

        /* 更新元素 */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            arr[index] = num;
        }

        /* 在尾部添加元素 */
        public void add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // 更新元素数量
            size++;
        }

        /* 在中间插入元素 */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素数量
            size++;
        }

        /* 删除元素 */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            int num = arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素数量
            size--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        public void extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // 更新列表容量
            capacity = arr.length;
        }

        /* 将列表转换为数组 */
        public int[] toArray() {
            int size = size();
            // 仅转换有效长度范围内的列表元素
            int[] arr = new int[size];
            for (int i = 0; i < size; i++) {
                arr[i] = get(i);
            }
            return arr;
        }
    }
    ```

=== "C#"

    ```csharp title="my_list.cs"
    /* 列表类 */
    class MyList {
        private int[] arr;           // 数组（存储列表元素）
        private int arrCapacity = 10;    // 列表容量
        private int arrSize = 0;         // 列表长度（当前元素数量）
        private readonly int extendRatio = 2;  // 每次列表扩容的倍数

        /* 构造方法 */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* 获取列表长度（当前元素数量）*/
        public int Size() {
            return arrSize;
        }

        /* 获取列表容量 */
        public int Capacity() {
            return arrCapacity;
        }

        /* 访问元素 */
        public int Get(int index) {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            return arr[index];
        }

        /* 更新元素 */
        public void Set(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            arr[index] = num;
        }

        /* 在尾部添加元素 */
        public void Add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 在中间插入元素 */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 删除元素 */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            int num = arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素数量
            arrSize--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        public void ExtendCapacity() {
            // 新建一个长度为 arrCapacity * extendRatio 的数组，并将原数组复制到新数组
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // 更新列表容量
            arrCapacity = arr.Length;
        }

        /* 将列表转换为数组 */
        public int[] ToArray() {
            // 仅转换有效长度范围内的列表元素
            int[] arr = new int[arrSize];
            for (int i = 0; i < arrSize; i++) {
                arr[i] = Get(i);
            }
            return arr;
        }
    }
    ```

=== "Go"

    ```go title="my_list.go"
    /* 列表类 */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* 构造函数 */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // 列表容量
            arr:         make([]int, 10), // 数组（存储列表元素）
            arrSize:     0,               // 列表长度（当前元素数量）
            extendRatio: 2,               // 每次列表扩容的倍数
        }
    }

    /* 获取列表长度（当前元素数量） */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  获取列表容量 */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* 访问元素 */
    func (l *myList) get(index int) int {
        // 索引如果越界，则抛出异常，下同
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        return l.arr[index]
    }

    /* 更新元素 */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        l.arr[index] = num
    }

    /* 在尾部添加元素 */
    func (l *myList) add(num int) {
        // 元素数量超出容量时，触发扩容机制
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // 更新元素数量
        l.arrSize++
    }

    /* 在中间插入元素 */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        // 元素数量超出容量时，触发扩容机制
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // 更新元素数量
        l.arrSize++
    }

    /* 删除元素 */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        num := l.arr[index]
        // 将索引 index 之后的元素都向前移动一位
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // 更新元素数量
        l.arrSize--
        // 返回被删除的元素
        return num
    }

    /* 列表扩容 */
    func (l *myList) extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // 更新列表容量
        l.arrCapacity = len(l.arr)
    }

    /* 返回有效长度的列表 */
    func (l *myList) toArray() []int {
        // 仅转换有效长度范围内的列表元素
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* 列表类 */
    class MyList {
        private var arr: [Int] // 数组（存储列表元素）
        private var _capacity = 10 // 列表容量
        private var _size = 0 // 列表长度（当前元素数量）
        private let extendRatio = 2 // 每次列表扩容的倍数

        /* 构造方法 */
        init() {
            arr = Array(repeating: 0, count: _capacity)
        }

        /* 获取列表长度（当前元素数量）*/
        func size() -> Int {
            _size
        }

        /* 获取列表容量 */
        func capacity() -> Int {
            _capacity
        }

        /* 访问元素 */
        func get(index: Int) -> Int {
            // 索引如果越界则抛出错误，下同
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            return arr[index]
        }

        /* 更新元素 */
        func set(index: Int, num: Int) {
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            arr[index] = num
        }

        /* 在尾部添加元素 */
        func add(num: Int) {
            // 元素数量超出容量时，触发扩容机制
            if _size == _capacity {
                extendCapacity()
            }
            arr[_size] = num
            // 更新元素数量
            _size += 1
        }

        /* 在中间插入元素 */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            // 元素数量超出容量时，触发扩容机制
            if _size == _capacity {
                extendCapacity()
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for j in sequence(first: _size - 1, next: { $0 >= index + 1 ? $0 - 1 : nil }) {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // 更新元素数量
            _size += 1
        }

        /* 删除元素 */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            let num = arr[index]
            // 将将索引 index 之后的元素都向前移动一位
            for j in index ..< (_size - 1) {
                arr[j] = arr[j + 1]
            }
            // 更新元素数量
            _size -= 1
            // 返回被删除的元素
            return num
        }

        /* 列表扩容 */
        func extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
            arr = arr + Array(repeating: 0, count: _capacity * (extendRatio - 1))
            // 更新列表容量
            _capacity = arr.count
        }

        /* 将列表转换为数组 */
        func toArray() -> [Int] {
            var arr = Array(repeating: 0, count: _size)
            for i in 0 ..< _size {
                arr[i] = get(index: i)
            }
            return arr
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* 列表类 */
    class MyList {
        #arr = new Array(); // 数组（存储列表元素）
        #capacity = 10; // 列表容量
        #size = 0; // 列表长度（当前元素数量）
        #extendRatio = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* 获取列表长度（当前元素数量）*/
        size() {
            return this.#size;
        }

        /* 获取列表容量 */
        capacity() {
            return this.#capacity;
        }

        /* 访问元素 */
        get(index) {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            return this.#arr[index];
        }

        /* 更新元素 */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            this.#arr[index] = num;
        }

        /* 在尾部添加元素 */
        add(num) {
            // 如果长度等于容量，则需要扩容
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 将新元素添加到列表尾部
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* 在中间插入元素 */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            // 元素数量超出容量时，触发扩容机制
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // 更新元素数量
            this.#arr[index] = num;
            this.#size++;
        }

        /* 删除元素 */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            let num = this.#arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // 更新元素数量
            this.#size--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // 更新列表容量
            this.#capacity = this.#arr.length;
        }

        /* 将列表转换为数组 */
        toArray() {
            let size = this.size();
            // 仅转换有效长度范围内的列表元素
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "TS"

    ```typescript title="my_list.ts"
    /* 列表类 */
    class MyList {
        private arr: Array<number>; // 数组（存储列表元素）
        private _capacity: number = 10; // 列表容量
        private _size: number = 0; // 列表长度（当前元素数量）
        private extendRatio: number = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* 获取列表长度（当前元素数量）*/
        public size(): number {
            return this._size;
        }

        /* 获取列表容量 */
        public capacity(): number {
            return this._capacity;
        }

        /* 访问元素 */
        public get(index: number): number {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            return this.arr[index];
        }

        /* 更新元素 */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            this.arr[index] = num;
        }

        /* 在尾部添加元素 */
        public add(num: number): void {
            // 如果长度等于容量，则需要扩容
            if (this._size === this._capacity) this.extendCapacity();
            // 将新元素添加到列表尾部
            this.arr[this._size] = num;
            this._size++;
        }

        /* 在中间插入元素 */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            // 元素数量超出容量时，触发扩容机制
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // 更新元素数量
            this.arr[index] = num;
            this._size++;
        }

        /* 删除元素 */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            let num = this.arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // 更新元素数量
            this._size--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        public extendCapacity(): void {
            // 新建一个长度为 size 的数组，并将原数组复制到新数组
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // 更新列表容量
            this._capacity = this.arr.length;
        }

        /* 将列表转换为数组 */
        public toArray(): number[] {
            let size = this.size();
            // 仅转换有效长度范围内的列表元素
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "Dart"

    ```dart title="my_list.dart"
    /* 列表类 */
    class MyList {
      late List<int> _arr; // 数组（存储列表元素）
      int _capacity = 10; // 列表容量
      int _size = 0; // 列表长度（当前元素数量）
      int _extendRatio = 2; // 每次列表扩容的倍数

      /* 构造方法 */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* 获取列表长度（当前元素数量）*/
      int size() => _size;

      /* 获取列表容量 */
      int capacity() => _capacity;

      /* 访问元素 */
      int get(int index) {
        if (index >= _size) throw RangeError('索引越界');
        return _arr[index];
      }

      /* 更新元素 */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('索引越界');
        _arr[index] = _num;
      }

      /* 在尾部添加元素 */
      void add(int _num) {
        // 元素数量超出容量时，触发扩容机制
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // 更新元素数量
        _size++;
      }

      /* 在中间插入元素 */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('索引越界');
        // 元素数量超出容量时，触发扩容机制
        if (_size == _capacity) extendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // 更新元素数量
        _size++;
      }

      /* 删除元素 */
      int remove(int index) {
        if (index >= _size) throw RangeError('索引越界');
        int _num = _arr[index];
        // 将将索引 index 之后的元素都向前移动一位
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // 更新元素数量
        _size--;
        // 返回被删除的元素
        return _num;
      }

      /* 列表扩容 */
      void extendCapacity() {
        // 新建一个长度为原数组 _extendRatio 倍的新数组
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 将原数组复制到新数组
        List.copyRange(_newNums, 0, _arr);
        // 更新 _arr 的引用
        _arr = _newNums;
        // 更新列表容量
        _capacity = _arr.length;
      }

      /* 将列表转换为数组 */
      List<int> toArray() {
        List<int> arr = [];
        for (var i = 0; i < _size; i++) {
          arr.add(get(i));
        }
        return arr;
      }
    }
    ```

=== "Rust"

    ```rust title="my_list.rs"
    /* 列表类 */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // 数组（存储列表元素）
        capacity: usize,      // 列表容量
        size: usize,          // 列表长度（当前元素数量）
        extend_ratio: usize,  // 每次列表扩容的倍数
    }

    #[allow(unused,unused_comparisons)]
    impl MyList {
        /* 构造方法 */
        pub fn new(capacity: usize) -> Self {
            let mut vec = Vec::new(); 
            vec.resize(capacity, 0);
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* 获取列表长度（当前元素数量）*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* 获取列表容量 */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 访问元素 */
        pub fn get(&self, index: usize) -> i32 {
            // 索引如果越界，则抛出异常，下同
            if index >= self.size {panic!("索引越界")};
            return self.arr[index];
        }

        /* 更新元素 */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {panic!("索引越界")};
            self.arr[index] = num;
        }

        /* 在尾部添加元素 */
        pub fn add(&mut self, num: i32) {
            // 元素数量超出容量时，触发扩容机制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // 更新元素数量
            self.size += 1;
        }

        /* 在中间插入元素 */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {panic!("索引越界")};
            // 元素数量超出容量时，触发扩容机制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 更新元素数量
            self.size += 1;
        }

        /* 删除元素 */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {panic!("索引越界")};
            let num = self.arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for j in (index..self.size - 1) {
                self.arr[j] = self.arr[j + 1];
            }
            // 更新元素数量
            self.size -= 1;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        pub fn extend_capacity(&mut self) {
            // 新建一个长度为原数组 extend_ratio 倍的新数组，并将原数组复制到新数组
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // 更新列表容量
            self.capacity = new_capacity;
        }

        /* 将列表转换为数组 */
        pub fn to_array(&mut self) -> Vec<i32> {
            // 仅转换有效长度范围内的列表元素
            let mut arr = Vec::new();
            for i in 0..self.size {
                arr.push(self.get(i));
            }
            arr
        }
    }
    ```

=== "C"

    ```c title="my_list.c"
    /* 列表类 */
    typedef struct {
        int *arr;        // 数组（存储列表元素）
        int capacity;    // 列表容量
        int size;        // 列表大小
        int extendRatio; // 列表每次扩容的倍数
    } MyList;

    /* 构造函数 */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* 析构函数 */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* 获取列表长度 */
    int size(MyList *nums) {
        return nums->size;
    }

    /* 获取列表容量 */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* 访问元素 */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* 更新元素 */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* 在尾部添加元素 */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 扩容
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* 在中间插入元素 */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // 元素数量超出容量时，触发扩容机制
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 扩容
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* 删除元素 */
    // 注意：stdio.h 占用了 remove 关键词
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* 列表扩容 */
    void extendCapacity(MyList *nums) {
        // 先分配空间
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // 拷贝旧数据到新数据
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // 释放旧数据
        free(temp);

        // 更新新数据
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* 将列表转换为 Array 用于打印 */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Zig"

    ```zig title="my_list.zig"
    // 列表类
    fn MyList(comptime T: type) type {
        return struct {
            const Self = @This();
            
            arr: []T = undefined,                        // 数组（存储列表元素）
            arrCapacity: usize = 10,                     // 列表容量
            numSize: usize = 0,                           // 列表长度（当前元素数量）
            extendRatio: usize = 2,                       // 每次列表扩容的倍数
            mem_arena: ?std.heap.ArenaAllocator = null,
            mem_allocator: std.mem.Allocator = undefined, // 内存分配器

            // 构造函数（分配内存+初始化列表）
            pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
                if (self.mem_arena == null) {
                    self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                    self.mem_allocator = self.mem_arena.?.allocator();
                }
                self.arr = try self.mem_allocator.alloc(T, self.arrCapacity);
                @memset(self.arr, @as(T, 0));
            }

            // 析构函数（释放内存）
            pub fn deinit(self: *Self) void {
                if (self.mem_arena == null) return;
                self.mem_arena.?.deinit();
            }

            // 获取列表长度（当前元素数量）
            pub fn size(self: *Self) usize {
                return self.numSize;
            }

            // 获取列表容量
            pub fn capacity(self: *Self) usize {
                return self.arrCapacity;
            }

            // 访问元素
            pub fn get(self: *Self, index: usize) T {
                // 索引如果越界，则抛出异常，下同
                if (index < 0 or index >= self.size()) @panic("索引越界");
                return self.arr[index];
            }  

            // 更新元素
            pub fn set(self: *Self, index: usize, num: T) void {
                // 索引如果越界，则抛出异常，下同
                if (index < 0 or index >= self.size()) @panic("索引越界");
                self.arr[index] = num;
            }  

            // 在尾部添加元素
            pub fn add(self: *Self, num: T) !void {
                // 元素数量超出容量时，触发扩容机制
                if (self.size() == self.capacity()) try self.extendCapacity();
                self.arr[self.size()] = num;
                // 更新元素数量
                self.numSize += 1;
            }  

            // 在中间插入元素
            pub fn insert(self: *Self, index: usize, num: T) !void {
                if (index < 0 or index >= self.size()) @panic("索引越界");
                // 元素数量超出容量时，触发扩容机制
                if (self.size() == self.capacity()) try self.extendCapacity();
                // 将索引 index 以及之后的元素都向后移动一位
                var j = self.size() - 1;
                while (j >= index) : (j -= 1) {
                    self.arr[j + 1] = self.arr[j];
                }
                self.arr[index] = num;
                // 更新元素数量
                self.numSize += 1;
            }

            // 删除元素
            pub fn remove(self: *Self, index: usize) T {
                if (index < 0 or index >= self.size()) @panic("索引越界");
                var num = self.arr[index];
                // 将索引 index 之后的元素都向前移动一位
                var j = index;
                while (j < self.size() - 1) : (j += 1) {
                    self.arr[j] = self.arr[j + 1];
                }
                // 更新元素数量
                self.numSize -= 1;
                // 返回被删除的元素
                return num;
            }

            // 列表扩容
            pub fn extendCapacity(self: *Self) !void {
                // 新建一个长度为 size * extendRatio 的数组，并将原数组复制到新数组
                var newCapacity = self.capacity() * self.extendRatio;
                var extend = try self.mem_allocator.alloc(T, newCapacity);
                @memset(extend, @as(T, 0));
                // 将原数组中的所有元素复制到新数组
                std.mem.copy(T, extend, self.arr);
                self.arr = extend;
                // 更新列表容量
                self.arrCapacity = newCapacity;
            }

            // 将列表转换为数组
            pub fn toArray(self: *Self) ![]T {
                // 仅转换有效长度范围内的列表元素
                var arr = try self.mem_allocator.alloc(T, self.size());
               @memset(arr, @as(T, 0));
                for (arr, 0..) |*num, i| {
                    num.* = self.get(i);
                }
                return arr;
            }
        };
    }
    ```

??? pythontutor "Visualizing Code"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20*%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E9%95%BF%E5%BA%A6%EF%BC%88%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%90%8E%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%89%8D%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E6%89%A9%E5%AE%B9%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20*%20self.capacity%28%29%20*%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.set%280,%201%29%0A%0A%20%20%20%20%23%20%E6%B5%8B%E8%AF%95%E6%89%A9%E5%AE%B9%E6%9C%BA%E5%88%B6%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20*%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E9%95%BF%E5%BA%A6%EF%BC%88%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%90%8E%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%89%8D%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E6%89%A9%E5%AE%B9%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20*%20self.capacity%28%29%20*%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.set%280,%201%29%0A%0A%20%20%20%20%23%20%E6%B5%8B%E8%AF%95%E6%89%A9%E5%AE%B9%E6%9C%BA%E5%88%B6%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>
