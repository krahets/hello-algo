---
comments: true
---

# 4.3 &nbsp; List

<u>A list</u> is an abstract data structure concept that represents an ordered collection of elements, supporting operations such as element access, modification, insertion, deletion, and traversal, without requiring users to consider capacity limitations. Lists can be implemented based on linked lists or arrays.

- A linked list can naturally be viewed as a list, supporting element insertion, deletion, search, and modification operations, and can flexibly expand dynamically.
- An array also supports element insertion, deletion, search, and modification, but since its length is immutable, it can only be viewed as a list with length limitations.

When implementing lists using arrays, **the immutable length property reduces the practicality of the list**. This is because we usually cannot determine in advance how much data we need to store, making it difficult to choose an appropriate list length. If the length is too small, it may fail to meet usage requirements; if the length is too large, it will waste memory space.

To solve this problem, we can use a <u>dynamic array</u> to implement a list. It inherits all the advantages of arrays and can dynamically expand during program execution.

In fact, **the lists provided in the standard libraries of many programming languages are implemented based on dynamic arrays**, such as `list` in Python, `ArrayList` in Java, `vector` in C++, and `List` in C#. In the following discussion, we will treat "list" and "dynamic array" as equivalent concepts.

## 4.3.1 &nbsp; Common List Operations

### 1. &nbsp; Initialize a List

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

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 2. &nbsp; Access Elements

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

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 3. &nbsp; Insert and Delete Elements

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

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 4. &nbsp; Traverse a List

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

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 5. &nbsp; Concatenate Lists

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

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%90%8E&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%90%8E&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 6. &nbsp; Sort a List

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

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC%8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC%8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 4.3.2 &nbsp; List Implementation

Many programming languages have built-in lists, such as Java, C++, and Python. Their implementations are quite complex, and the parameters are carefully considered, such as initial capacity, expansion multiples, and so on. Interested readers can consult the source code to learn more.

To deepen our understanding of how lists work, we attempt to implement a simple list with three key design considerations:

- **Initial capacity**: Select a reasonable initial capacity for the underlying array. In this example, we choose 10 as the initial capacity.
- **Size tracking**: Declare a variable `size` to record the current number of elements in the list and update it in real-time as elements are inserted and deleted. Based on this variable, we can locate the end of the list and determine whether expansion is needed.
- **Expansion mechanism**: When the list capacity is full upon inserting an element, we need to expand. We create a larger array based on the expansion multiple and then move all elements from the current array to the new array in order. In this example, we specify that the array should be expanded to 2 times its previous size each time.

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """List class"""

        def __init__(self):
            """Constructor"""
            self._capacity: int = 10  # List capacity
            self._arr: list[int] = [0] * self._capacity  # Array (stores list elements)
            self._size: int = 0  # List length (current number of elements)
            self._extend_ratio: int = 2  # Multiple by which the list capacity is extended each time

        def size(self) -> int:
            """Get list length (current number of elements)"""
            return self._size

        def capacity(self) -> int:
            """Get list capacity"""
            return self._capacity

        def get(self, index: int) -> int:
            """Access element"""
            # If the index is out of bounds, throw an exception, as below
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            return self._arr[index]

        def set(self, num: int, index: int):
            """Update element"""
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            self._arr[index] = num

        def add(self, num: int):
            """Add element at the end"""
            # When the number of elements exceeds capacity, trigger the extension mechanism
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """Insert element in the middle"""
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            # When the number of elements exceeds capacity, trigger the extension mechanism
            if self._size == self.capacity():
                self.extend_capacity()
            # Move all elements at and after index index backward by one position
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # Update the number of elements
            self._size += 1

        def remove(self, index: int) -> int:
            """Remove element"""
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            num = self._arr[index]
            # Move all elements after index index forward by one position
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # Update the number of elements
            self._size -= 1
            # Return the removed element
            return num

        def extend_capacity(self):
            """Extend list capacity"""
            # Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # Update list capacity
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """Return list with valid length"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* List class */
    class MyList {
      private:
        int *arr;             // Array (stores list elements)
        int arrCapacity = 10; // List capacity
        int arrSize = 0;      // List length (current number of elements)
        int extendRatio = 2;   // Multiple by which the list capacity is extended each time

      public:
        /* Constructor */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* Destructor */
        ~MyList() {
            delete[] arr;
        }

        /* Get list length (current number of elements)*/
        int size() {
            return arrSize;
        }

        /* Get list capacity */
        int capacity() {
            return arrCapacity;
        }

        /* Update element */
        int get(int index) {
            // If the index is out of bounds, throw an exception, as below
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            return arr[index];
        }

        /* Add elements at the end */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            arr[index] = num;
        }

        /* Direct traversal of list elements */
        void add(int num) {
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // Update the number of elements
            arrSize++;
        }

        /* Sort list */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (size() == capacity())
                extendCapacity();
            // Move all elements after index index forward by one position
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Update the number of elements
            arrSize++;
        }

        /* Remove element */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            int num = arr[index];
            // Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Update the number of elements
            arrSize--;
            // Return the removed element
            return num;
        }

        /* Driver Code */
        void extendCapacity() {
            // Create a new array with length extendRatio times the original array
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // Copy all elements from the original array to the new array
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // Free memory
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* Convert list to Vector for printing */
        vector<int> toVector() {
            // Elements enqueue
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
    /* List class */
    class MyList {
        private int[] arr; // Array (stores list elements)
        private int capacity = 10; // List capacity
        private int size = 0; // List length (current number of elements)
        private int extendRatio = 2; // Multiple by which the list capacity is extended each time

        /* Constructor */
        public MyList() {
            arr = new int[capacity];
        }

        /* Get list length (current number of elements) */
        public int size() {
            return size;
        }

        /* Get list capacity */
        public int capacity() {
            return capacity;
        }

        /* Update element */
        public int get(int index) {
            // If the index is out of bounds, throw an exception, as below
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            return arr[index];
        }

        /* Add elements at the end */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            arr[index] = num;
        }

        /* Direct traversal of list elements */
        public void add(int num) {
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // Update the number of elements
            size++;
        }

        /* Sort list */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (size == capacity())
                extendCapacity();
            // Move all elements after index index forward by one position
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Update the number of elements
            size++;
        }

        /* Remove element */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            int num = arr[index];
            // Move all elements after index forward by one position
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Update the number of elements
            size--;
            // Return the removed element
            return num;
        }

        /* Driver Code */
        public void extendCapacity() {
            // Create a new array with length extendRatio times the original array and copy the original array to the new array
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // Add elements at the end
            capacity = arr.length;
        }

        /* Convert list to array */
        public int[] toArray() {
            int size = size();
            // Elements enqueue
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
    ```

=== "Go"

    ```go title="my_list.go"
    /* List class */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* Constructor */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // List capacity
            arr:         make([]int, 10), // Array (stores list elements)
            arrSize:     0,               // List length (current number of elements)
            extendRatio: 2,               // Multiple by which the list capacity is extended each time
        }
    }

    /* Get list length (current number of elements) */
    func (l *myList) size() int {
        return l.arrSize
    }

    /* Get list capacity */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* Update element */
    func (l *myList) get(index int) int {
        // If the index is out of bounds, throw an exception, as below
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        return l.arr[index]
    }

    /* Add elements at the end */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        l.arr[index] = num
    }

    /* Direct traversal of list elements */
    func (l *myList) add(num int) {
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // Update the number of elements
        l.arrSize++
    }

    /* Sort list */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // Move all elements after index index forward by one position
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // Update the number of elements
        l.arrSize++
    }

    /* Remove element */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        num := l.arr[index]
        // Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // Update the number of elements
        l.arrSize--
        // Return the removed element
        return num
    }

    /* Driver Code */
    func (l *myList) extendCapacity() {
        // Create a new array with length extendRatio times the original array and copy the original array to the new array
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // Add elements at the end
        l.arrCapacity = len(l.arr)
    }

    /* Return list with valid length */
    func (l *myList) toArray() []int {
        // Elements enqueue
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* List class */
    class MyList {
        private var arr: [Int] // Array (stores list elements)
        private var _capacity: Int // List capacity
        private var _size: Int // List length (current number of elements)
        private let extendRatio: Int // Multiple by which the list capacity is extended each time

        /* Constructor */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* Get list length (current number of elements) */
        func size() -> Int {
            _size
        }

        /* Get list capacity */
        func capacity() -> Int {
            _capacity
        }

        /* Update element */
        func get(index: Int) -> Int {
            // Throw error if index out of bounds, same below
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            return arr[index]
        }

        /* Add elements at the end */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            arr[index] = num
        }

        /* Direct traversal of list elements */
        func add(num: Int) {
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // Update the number of elements
            _size += 1
        }

        /* Sort list */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if size() == capacity() {
                extendCapacity()
            }
            // Move all elements after index index forward by one position
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // Update the number of elements
            _size += 1
        }

        /* Remove element */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            let num = arr[index]
            // Move all elements after index forward by one position
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // Update the number of elements
            _size -= 1
            // Return the removed element
            return num
        }

        /* Driver Code */
        func extendCapacity() {
            // Create a new array with length extendRatio times the original array and copy the original array to the new array
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // Add elements at the end
            _capacity = arr.count
        }

        /* Convert list to array */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* List class */
    class MyList {
        #arr = new Array(); // Array (stores list elements)
        #capacity = 10; // List capacity
        #size = 0; // List length (current number of elements)
        #extendRatio = 2; // Multiple by which the list capacity is extended each time

        /* Constructor */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* Get list length (current number of elements) */
        size() {
            return this.#size;
        }

        /* Get list capacity */
        capacity() {
            return this.#capacity;
        }

        /* Update element */
        get(index) {
            // If the index is out of bounds, throw an exception, as below
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            return this.#arr[index];
        }

        /* Add elements at the end */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            this.#arr[index] = num;
        }

        /* Direct traversal of list elements */
        add(num) {
            // If length equals capacity, need to expand
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Add new element to end of list
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* Sort list */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Move all elements after index index forward by one position
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // Update the number of elements
            this.#arr[index] = num;
            this.#size++;
        }

        /* Remove element */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            let num = this.#arr[index];
            // Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // Update the number of elements
            this.#size--;
            // Return the removed element
            return num;
        }

        /* Driver Code */
        extendCapacity() {
            // Create a new array with length extendRatio times the original array and copy the original array to the new array
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // Add elements at the end
            this.#capacity = this.#arr.length;
        }

        /* Convert list to array */
        toArray() {
            let size = this.size();
            // Elements enqueue
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
    /* List class */
    class MyList {
        private arr: Array<number>; // Array (stores list elements)
        private _capacity: number = 10; // List capacity
        private _size: number = 0; // List length (current number of elements)
        private extendRatio: number = 2; // Multiple by which the list capacity is extended each time

        /* Constructor */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* Get list length (current number of elements) */
        public size(): number {
            return this._size;
        }

        /* Get list capacity */
        public capacity(): number {
            return this._capacity;
        }

        /* Update element */
        public get(index: number): number {
            // If the index is out of bounds, throw an exception, as below
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            return this.arr[index];
        }

        /* Add elements at the end */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            this.arr[index] = num;
        }

        /* Direct traversal of list elements */
        public add(num: number): void {
            // If length equals capacity, need to expand
            if (this._size === this._capacity) this.extendCapacity();
            // Add new element to end of list
            this.arr[this._size] = num;
            this._size++;
        }

        /* Sort list */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // Move all elements after index index forward by one position
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // Update the number of elements
            this.arr[index] = num;
            this._size++;
        }

        /* Remove element */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            let num = this.arr[index];
            // Move all elements after index forward by one position
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // Update the number of elements
            this._size--;
            // Return the removed element
            return num;
        }

        /* Driver Code */
        public extendCapacity(): void {
            // Create new array of length size and copy original array to new array
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // Add elements at the end
            this._capacity = this.arr.length;
        }

        /* Convert list to array */
        public toArray(): number[] {
            let size = this.size();
            // Elements enqueue
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
    /* List class */
    class MyList {
      late List<int> _arr; // Array (stores list elements)
      int _capacity = 10; // List capacity
      int _size = 0; // List length (current number of elements)
      int _extendRatio = 2; // Multiple by which the list capacity is extended each time

      /* Constructor */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* Get list length (current number of elements) */
      int size() => _size;

      /* Get list capacity */
      int capacity() => _capacity;

      /* Update element */
      int get(int index) {
        if (index >= _size) throw RangeError('Index out of bounds');
        return _arr[index];
      }

      /* Add elements at the end */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('Index out of bounds');
        _arr[index] = _num;
      }

      /* Direct traversal of list elements */
      void add(int _num) {
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // Update the number of elements
        _size++;
      }

      /* Sort list */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('Index out of bounds');
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (_size == _capacity) extendCapacity();
        // Move all elements after index index forward by one position
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // Update the number of elements
        _size++;
      }

      /* Remove element */
      int remove(int index) {
        if (index >= _size) throw RangeError('Index out of bounds');
        int _num = _arr[index];
        // Move all elements after index forward by one position
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // Update the number of elements
        _size--;
        // Return the removed element
        return _num;
      }

      /* Driver Code */
      void extendCapacity() {
        // Create new array with length _extendRatio times original array
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // Copy original array to new array
        List.copyRange(_newNums, 0, _arr);
        // Update _arr reference
        _arr = _newNums;
        // Add elements at the end
        _capacity = _arr.length;
      }

      /* Convert list to array */
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
    /* List class */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // Array (stores list elements)
        capacity: usize,     // List capacity
        size: usize,         // List length (current number of elements)
        extend_ratio: usize, // Multiple by which the list capacity is extended each time
    }

    #[allow(unused, unused_comparisons)]
    impl MyList {
        /* Constructor */
        pub fn new(capacity: usize) -> Self {
            let mut vec = vec![0; capacity];
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* Get list length (current number of elements) */
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* Get list capacity */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* Update element */
        pub fn get(&self, index: usize) -> i32 {
            // If the index is out of bounds, throw an exception, as below
            if index >= self.size {
                panic!("Index out of bounds")
            };
            return self.arr[index];
        }

        /* Add elements at the end */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("Index out of bounds")
            };
            self.arr[index] = num;
        }

        /* Direct traversal of list elements */
        pub fn add(&mut self, num: i32) {
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // Update the number of elements
            self.size += 1;
        }

        /* Sort list */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("Index out of bounds")
            };
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // Move all elements after index index forward by one position
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // Update the number of elements
            self.size += 1;
        }

        /* Remove element */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("Index out of bounds")
            };
            let num = self.arr[index];
            // Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // Update the number of elements
            self.size -= 1;
            // Return the removed element
            return num;
        }

        /* Driver Code */
        pub fn extend_capacity(&mut self) {
            // Create new array with length extend_ratio times original, copy original array to new array
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // Add elements at the end
            self.capacity = new_capacity;
        }

        /* Convert list to array */
        pub fn to_array(&self) -> Vec<i32> {
            // Elements enqueue
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
    /* List class */
    typedef struct {
        int *arr;        // Array (stores list elements)
        int capacity;    // List capacity
        int size;        // List size
        int extendRatio; // List expansion multiplier
    } MyList;

    /* Constructor */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* Destructor */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* Get list length */
    int size(MyList *nums) {
        return nums->size;
    }

    /* Get list capacity */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* Update element */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* Add elements at the end */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* Direct traversal of list elements */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Expand capacity
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* Sort list */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Expand capacity
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* Remove element */
    // Note: stdio.h occupies the remove keyword
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* Driver Code */
    void extendCapacity(MyList *nums) {
        // Allocate space first
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // Copy old data to new data
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // Free old data
        free(temp);

        // Update new data
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* Convert list to Array for printing */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* List class */
    class MyList {
        private var arr: IntArray = intArrayOf() // Array (stores list elements)
        private var capacity: Int = 10 // List capacity
        private var size: Int = 0 // List length (current number of elements)
        private var extendRatio: Int = 2 // Multiple by which the list capacity is extended each time

        /* Constructor */
        init {
            arr = IntArray(capacity)
        }

        /* Get list length (current number of elements) */
        fun size(): Int {
            return size
        }

        /* Get list capacity */
        fun capacity(): Int {
            return capacity
        }

        /* Update element */
        fun get(index: Int): Int {
            // If the index is out of bounds, throw an exception, as below
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            return arr[index]
        }

        /* Add elements at the end */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            arr[index] = num
        }

        /* Direct traversal of list elements */
        fun add(num: Int) {
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // Update the number of elements
            size++
        }

        /* Sort list */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            // When the number of elements exceeds capacity, trigger the extension mechanism
            if (size == capacity())
                extendCapacity()
            // Move all elements after index index forward by one position
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // Update the number of elements
            size++
        }

        /* Remove element */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            val num = arr[index]
            // Move all elements after index forward by one position
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // Update the number of elements
            size--
            // Return the removed element
            return num
        }

        /* Driver Code */
        fun extendCapacity() {
            // Create a new array with length extendRatio times the original array and copy the original array to the new array
            arr = arr.copyOf(capacity() * extendRatio)
            // Add elements at the end
            capacity = arr.size
        }

        /* Convert list to array */
        fun toArray(): IntArray {
            val size = size()
            // Elements enqueue
            val arr = IntArray(size)
            for (i in 0..<size) {
                arr[i] = get(i)
            }
            return arr
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_list.rb"
    ### List class ###
    class MyList
      attr_reader :size       # Get list length (current number of elements)
      attr_reader :capacity   # Get list capacity

      ### Constructor ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### Access element ###
      def get(index)
        # If the index is out of bounds, throw an exception, as below
        raise IndexError, "Index out of bounds" if index < 0 || index >= size
        @arr[index]
      end

      ### Access element ###
      def set(index, num)
        raise IndexError, "Index out of bounds" if index < 0 || index >= size
        @arr[index] = num
      end

      ### Add element at end ###
      def add(num)
        # When the number of elements exceeds capacity, trigger the extension mechanism
        extend_capacity if size == capacity
        @arr[size] = num

        # Update the number of elements
        @size += 1
      end

      ### Insert element in middle ###
      def insert(index, num)
        raise IndexError, "Index out of bounds" if index < 0 || index >= size

        # When the number of elements exceeds capacity, trigger the extension mechanism
        extend_capacity if size == capacity

        # Move all elements after index index forward by one position
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # Update the number of elements
        @size += 1
      end

      ### Delete element ###
      def remove(index)
        raise IndexError, "Index out of bounds" if index < 0 || index >= size
        num = @arr[index]

        # Move all elements after index forward by one position
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # Update the number of elements
        @size -= 1

        # Return the removed element
        num
      end

      ### Expand list capacity ###
      def extend_capacity
        # Create new array with length extend_ratio times original, copy original array to new array
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # Add elements at the end
        @capacity = arr.length
      end

      ### Convert list to array ###
      def to_array
        sz = size
        # Elements enqueue
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```
