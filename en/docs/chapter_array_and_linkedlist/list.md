# List

<u>A list</u> is an abstract data structure concept that represents an ordered collection of elements, supporting operations such as element access, modification, insertion, deletion, and traversal, without requiring users to consider capacity limitations. Lists can be implemented based on linked lists or arrays.

- A linked list can naturally be viewed as a list, supporting element insertion, deletion, search, and modification operations, and can flexibly expand dynamically.
- An array also supports element insertion, deletion, search, and modification, but since its length is immutable, it can only be viewed as a list with length limitations.

When implementing lists using arrays, **the immutable length property reduces the practicality of the list**. This is because we usually cannot determine in advance how much data we need to store, making it difficult to choose an appropriate list length. If the length is too small, it may fail to meet usage requirements; if the length is too large, it will waste memory space.

To solve this problem, we can use a <u>dynamic array</u> to implement a list. It inherits all the advantages of arrays and can dynamically expand during program execution.

In fact, **the lists provided in the standard libraries of many programming languages are implemented based on dynamic arrays**, such as `list` in Python, `ArrayList` in Java, `vector` in C++, and `List` in C#. In the following discussion, we will treat "list" and "dynamic array" as equivalent concepts.

## Common List Operations

### Initialize a List

We typically use two initialization methods: "without initial values" and "with initial values":

=== "Python"

    ```python title="list.py"
    # Initialize a list
    # Without initial values
    nums1: list[int] = []
    # With initial values
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Initialize a list */
    // Note that vector in C++ is equivalent to nums as described in this article
    // Without initial values
    vector<int> nums1;
    // With initial values
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* Initialize a list */
    // Without initial values
    List<Integer> nums1 = new ArrayList<>();
    // With initial values (note that array elements should use the wrapper class Integer[] instead of int[])
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Initialize a list */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* Initialize a list */
    // Without initial values
    nums1 := []int{}
    // With initial values
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Initialize a list */
    // Without initial values
    let nums1: [Int] = []
    // With initial values
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Initialize a list */
    // Without initial values
    const nums1 = [];
    // With initial values
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Initialize a list */
    // Without initial values
    const nums1: number[] = [];
    // With initial values
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Initialize a list */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Initialize a list */
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
    /* Initialize a list */
    // Without initial values
    var nums1 = listOf<Int>()
    // With initial values
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Initialize a list
    # Without initial values
    nums1 = []
    # With initial values
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Access Elements

Since a list is essentially an array, we can access and update elements in $O(1)$ time complexity, which is very efficient.

=== "Python"

    ```python title="list.py"
    # Access an element
    num: int = nums[1]  # Access element at index 1

    # Update an element
    nums[1] = 0    # Update element at index 1 to 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Access an element */
    int num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Java"

    ```java title="list.java"
    /* Access an element */
    int num = nums.get(1);  // Access element at index 1

    /* Update an element */
    nums.set(1, 0);  // Update element at index 1 to 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Access an element */
    int num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* Access an element */
    num := nums[1]  // Access element at index 1

    /* Update an element */
    nums[1] = 0     // Update element at index 1 to 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Access an element */
    let num = nums[1] // Access element at index 1

    /* Update an element */
    nums[1] = 0 // Update element at index 1 to 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* Access an element */
    const num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Access an element */
    const num: number = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Access an element */
    int num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Access an element */
    let num: i32 = nums[1];  // Access element at index 1
    /* Update an element */
    nums[1] = 0;             // Update element at index 1 to 0
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Access an element */
    val num = nums[1]       // Access element at index 1
    /* Update an element */
    nums[1] = 0             // Update element at index 1 to 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Access an element
    num = nums[1] # Access element at index 1
    # Update an element
    nums[1] = 0 # Update element at index 1 to 0
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Insert and Delete Elements

Compared to arrays, lists can freely add and delete elements. Adding an element at the end of a list has a time complexity of $O(1)$, but inserting and deleting elements still have the same efficiency as arrays, with a time complexity of $O(n)$.

=== "Python"

    ```python title="list.py"
    # Clear the list
    nums.clear()

    # Add elements at the end
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Insert an element in the middle
    nums.insert(3, 6)  # Insert number 6 at index 3

    # Delete an element
    nums.pop(3)        # Delete element at index 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Insert an element in the middle */
    nums.insert(nums.begin() + 3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.erase(nums.begin() + 3);      // Delete element at index 3
    ```

=== "Java"

    ```java title="list.java"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.add(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(3);  // Delete element at index 3
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Clear the list */
    nums.Clear();

    /* Add elements at the end */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Insert an element in the middle */
    nums.Insert(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.RemoveAt(3);  // Delete element at index 3
    ```

=== "Go"

    ```go title="list_test.go"
    /* Clear the list */
    nums = nil

    /* Add elements at the end */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* Insert an element in the middle */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert number 6 at index 3

    /* Delete an element */
    nums = append(nums[:3], nums[4:]...) // Delete element at index 3
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Clear the list */
    nums.removeAll()

    /* Add elements at the end */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* Insert an element in the middle */
    nums.insert(6, at: 3) // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(at: 3) // Delete element at index 3
    ```

=== "JS"

    ```javascript title="list.js"
    /* Clear the list */
    nums.length = 0;

    /* Add elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert number 6 at index 3

    /* Delete an element */
    nums.splice(3, 1);  // Delete element at index 3
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Clear the list */
    nums.length = 0;

    /* Add elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert number 6 at index 3

    /* Delete an element */
    nums.splice(3, 1);  // Delete element at index 3
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.insert(3, 6); // Insert number 6 at index 3

    /* Delete an element */
    nums.removeAt(3); // Delete element at index 3
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.insert(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(3);    // Delete element at index 3
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.add(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(3);  // Delete element at index 3
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Clear the list
    nums.clear

    # Add elements at the end
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # Insert an element in the middle
    nums.insert(3, 6) # Insert number 6 at index 3

    # Delete an element
    nums.delete_at(3) # Delete element at index 3
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Traverse a List

Like arrays, lists can be traversed by index or by directly iterating through elements.

=== "Python"

    ```python title="list.py"
    # Traverse the list by index
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Traverse list elements directly
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* Traverse list elements directly */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* Traverse the list by index */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* Traverse list elements directly */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Traverse the list by index */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* Traverse list elements directly */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* Traverse the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Traverse the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Traverse the list by index */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // Traverse the list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Traverse list elements directly
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
    /* Traverse the list by index */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Traverse list elements directly */
    for (num in nums) {
        count += num
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Traverse the list by index
    count = 0
    for i in 0...nums.length
        count += nums[i]
    end

    # Traverse list elements directly
    count = 0
    for num in nums
        count += num
    end
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Concatenate Lists

Given a new list `nums1`, we can concatenate it to the end of the original list.

=== "Python"

    ```python title="list.py"
    # Concatenate two lists
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # Concatenate list nums1 to the end of nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Concatenate two lists */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // Concatenate list nums1 to the end of nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Concatenate two lists */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Concatenate two lists */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // Concatenate list nums1 to the end of nums
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Concatenate two lists */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // Concatenate list nums1 to the end of nums
    ```

=== "JS"

    ```javascript title="list.js"
    /* Concatenate two lists */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Concatenate two lists */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // Concatenate list nums1 to the end of nums
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
    /* Concatenate two lists */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // Concatenate list nums1 to the end of nums
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%90%8E&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Sort a List

After sorting a list, we can use "binary search" and "two-pointer" algorithms, which are frequently tested in array algorithm problems.

=== "Python"

    ```python title="list.py"
    # Sort a list
    nums.sort()  # After sorting, list elements are arranged from smallest to largest
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Sort a list */
    sort(nums.begin(), nums.end());  // After sorting, list elements are arranged from smallest to largest
    ```

=== "Java"

    ```java title="list.java"
    /* Sort a list */
    Collections.sort(nums);  // After sorting, list elements are arranged from smallest to largest
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Sort a list */
    nums.Sort(); // After sorting, list elements are arranged from smallest to largest
    ```

=== "Go"

    ```go title="list_test.go"
    /* Sort a list */
    sort.Ints(nums)  // After sorting, list elements are arranged from smallest to largest
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Sort a list */
    nums.sort() // After sorting, list elements are arranged from smallest to largest
    ```

=== "JS"

    ```javascript title="list.js"
    /* Sort a list */
    nums.sort((a, b) => a - b);  // After sorting, list elements are arranged from smallest to largest
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Sort a list */
    nums.sort((a, b) => a - b);  // After sorting, list elements are arranged from smallest to largest
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Sort a list */
    nums.sort(); // After sorting, list elements are arranged from smallest to largest
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Sort a list */
    nums.sort(); // After sorting, list elements are arranged from smallest to largest
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Sort a list */
    nums.sort() // After sorting, list elements are arranged from smallest to largest
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Sort a list
    nums = nums.sort { |a, b| a <=> b } # After sorting, list elements are arranged from smallest to largest
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC%8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## List Implementation

Many programming languages have built-in lists, such as Java, C++, and Python. Their implementations are quite complex, and the parameters are carefully considered, such as initial capacity, expansion multiples, and so on. Interested readers can consult the source code to learn more.

To deepen our understanding of how lists work, we attempt to implement a simple list with three key design considerations:

- **Initial capacity**: Select a reasonable initial capacity for the underlying array. In this example, we choose 10 as the initial capacity.
- **Size tracking**: Declare a variable `size` to record the current number of elements in the list and update it in real-time as elements are inserted and deleted. Based on this variable, we can locate the end of the list and determine whether expansion is needed.
- **Expansion mechanism**: When the list capacity is full upon inserting an element, we need to expand. We create a larger array based on the expansion multiple and then move all elements from the current array to the new array in order. In this example, we specify that the array should be expanded to 2 times its previous size each time.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
