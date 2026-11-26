---
comments: true
---

# 4.3 &nbsp; Lists

A <u>list</u> is an abstract data structure representing an ordered collection of elements. It supports access, updates, insertion, removal, and traversal without requiring the user to manage capacity limits. A list can be implemented with a linked list or an array.

- A linked list naturally serves as a list: we can insert, remove, find, and update elements, and it can grow dynamically as needed.
- An array also supports insertion, removal, lookup, and updates. Its fixed length, however, makes it a list with a length limit.

When a list is backed by an array, **the array's fixed length makes the list less practical**. We usually do not know in advance how much data we will store, so choosing a suitable length is difficult. Too short, and the list may not meet our needs. Too long, and it wastes memory.

We can solve this problem by implementing the list with a <u>dynamic array</u>. It preserves the advantages of an array and can grow while the program is running.

In fact, **many programming languages provide lists backed by dynamic arrays in their standard libraries**. Examples include Python's `list`, Java's `ArrayList`, C++'s `vector`, and C#'s `List`. In the discussion that follows, we use “list” and “dynamic array” interchangeably.

## 4.3.1 &nbsp; Common list operations

### 1. &nbsp; Initializing a list

We generally initialize a list in one of two ways: with or without initial values.

=== "Python"

    ```python title="list.py"
    # Initialize the list
    # Without initial values
    empty_nums: list[int] = []
    # With initial values
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Initialize the list */
    // Without initial values
    vector<int> emptyNums;
    // With initial values
    vector<int> nums = {1, 3, 2, 5, 4};
    ```

=== "Java"

    ```java title="list.java"
    /* Initialize the list */
    // Without initial values
    List<Integer> emptyNums = new ArrayList<>();
    // With initial values (use Integer[] rather than int[] because the list requires Integer, the wrapper class for int)
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Initialize the list */
    // Without initial values
    List<int> emptyNums = [];
    // With initial values
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* Initialize the list */
    // Without initial values
    emptyNums := []int{}
    // With initial values
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Initialize the list */
    // Without initial values
    let emptyNums: [Int] = []
    // With initial values
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Initialize the list */
    // Without initial values
    const emptyNums = [];
    // With initial values
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Initialize the list */
    // Without initial values
    const emptyNums: number[] = [];
    // With initial values
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Initialize the list */
    // Without initial values
    List<int> emptyNums = [];
    // With initial values
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    // Initialize the list
    // Without initial values
    let empty_nums: Vec<i32> = Vec::new();
    // With initial values
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C has no built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Initialize the list */
    // Without initial values
    val emptyNums = mutableListOf<Int>()
    // With initial values
    val nums = mutableListOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Initialize the list
    # Without initial values
    empty_nums = []
    # With initial values
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Visualize execution"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20%23%20Without%20initial%20values%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20%23%20Without%20initial%20values%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Accessing an element

Because the list is backed by an array, accessing or updating an element is efficient and takes $O(1)$ time.

=== "Python"

    ```python title="list.py"
    # Access an element
    x: int = nums[1]  # Access the element at index 1

    # Update an element
    nums[1] = 0  # Set the element at index 1 to 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Access an element */
    int num = nums[1]; // Access the element at index 1

    /* Update an element */
    nums[1] = 0; // Set the element at index 1 to 0
    ```

=== "Java"

    ```java title="list.java"
    /* Access an element */
    int num = nums.get(1); // Access the element at index 1

    /* Update an element */
    nums.set(1, 0); // Set the element at index 1 to 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Access an element */
    int num = nums[1]; // Access the element at index 1

    /* Update an element */
    nums[1] = 0; // Set the element at index 1 to 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* Access an element */
    num := nums[1] // Access the element at index 1

    /* Update an element */
    nums[1] = 0 // Set the element at index 1 to 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Access an element */
    let num = nums[1] // Access the element at index 1

    /* Update an element */
    nums[1] = 0 // Set the element at index 1 to 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* Access an element */
    const num = nums[1]; // Access the element at index 1

    /* Update an element */
    nums[1] = 0; // Set the element at index 1 to 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Access an element */
    const num: number = nums[1]; // Access the element at index 1

    /* Update an element */
    nums[1] = 0; // Set the element at index 1 to 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Access an element */
    int _num = nums[1]; // Access the element at index 1

    /* Update an element */
    nums[1] = 0; // Set the element at index 1 to 0
    ```

=== "Rust"

    ```rust title="list.rs"
    // Access an element
    let num = nums[1]; // Access the element at index 1

    // Update an element
    nums[1] = 0; // Set the element at index 1 to 0
    ```

=== "C"

    ```c title="list.c"
    // C has no built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Access an element */
    val num = nums[1] // Access the element at index 1

    /* Update an element */
    nums[1] = 0 // Set the element at index 1 to 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Access an element
    num = nums[1] # Access the element at index 1

    # Update an element
    nums[1] = 0 # Set the element at index 1 to 0
    ```

??? pythontutor "Visualize execution"

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20Access%20an%20element%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20Read%20the%20element%20at%20index%201%0A%0A%20%20%20%20%23%20Update%20an%20element%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20Set%20the%20element%20at%20index%201%20to%200&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20Access%20an%20element%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20Read%20the%20element%20at%20index%201%0A%0A%20%20%20%20%23%20Update%20an%20element%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20Set%20the%20element%20at%20index%201%20to%200&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 3. &nbsp; Inserting and removing elements

Unlike a fixed-length array, a list lets us add or remove elements freely. Appending an element takes $O(1)$ time amortized, while insertion and removal still have the same $O(n)$ time complexity as in an array.

=== "Python"

    ```python title="list.py"
    # Clear the list
    nums.clear()

    # Append an element
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Insert an element in the middle
    nums.insert(3, 6)  # Insert 6 at index 3

    # Remove an element
    nums.pop(3)  # Remove the element at index 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Clear the list */
    nums.clear();

    /* Append an element */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Insert an element in the middle */
    nums.insert(nums.begin() + 3, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.erase(nums.begin() + 3); // Remove the element at index 3
    ```

=== "Java"

    ```java title="list.java"
    /* Clear the list */
    nums.clear();

    /* Append an element */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.add(3, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.remove(3); // Remove the element at index 3
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Clear the list */
    nums.Clear();

    /* Append an element */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Insert an element in the middle */
    nums.Insert(3, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.RemoveAt(3); // Remove the element at index 3
    ```

=== "Go"

    ```go title="list_test.go"
    /* Clear the list */
    nums = nil

    /* Append an element */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* Insert an element in the middle */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert 6 at index 3

    /* Remove an element */
    nums = append(nums[:3], nums[4:]...) // Remove the element at index 3
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Clear the list */
    nums.removeAll()

    /* Append an element */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* Insert an element in the middle */
    nums.insert(6, at: 3) // Insert 6 at index 3

    /* Remove an element */
    nums.remove(at: 3) // Remove the element at index 3
    ```

=== "JS"

    ```javascript title="list.js"
    /* Clear the list */
    nums.length = 0;

    /* Append an element */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.splice(3, 1); // Remove the element at index 3
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Clear the list */
    nums.length = 0;

    /* Append an element */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.splice(3, 1); // Remove the element at index 3
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Clear the list */
    nums.clear();

    /* Append an element */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.insert(3, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.removeAt(3); // Remove the element at index 3
    ```

=== "Rust"

    ```rust title="list.rs"
    // Clear the list
    nums.clear();

    // Append an element
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    // Insert an element in the middle
    nums.insert(3, 6); // Insert 6 at index 3

    // Remove an element
    nums.remove(3); // Remove the element at index 3
    ```

=== "C"

    ```c title="list.c"
    // C has no built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Clear the list */
    nums.clear()

    /* Append an element */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)

    /* Insert an element in the middle */
    nums.add(3, 6) // Insert 6 at index 3

    /* Remove an element */
    nums.removeAt(3) // Remove the element at index 3
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Clear the list
    nums.clear

    # Append an element
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # Insert an element in the middle
    nums.insert(3, 6) # Insert 6 at index 3

    # Remove an element
    nums.delete_at(3) # Remove the element at index 3
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Clear%20the%20list%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20Add%20elements%20at%20the%20end%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20an%20element%20in%20the%20middle%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20Insert%206%20at%20index%203%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20Remove%20the%20element%20at%20index%203&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Clear%20the%20list%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20Add%20elements%20at%20the%20end%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20an%20element%20in%20the%20middle%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20Insert%206%20at%20index%203%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20Remove%20the%20element%20at%20index%203&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 4. &nbsp; Traversing a list

As with an array, we can traverse a list by index or iterate directly over its elements.

=== "Python"

    ```python title="list.py"
    # Traverse the list by index
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Iterate directly over the list elements
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

    /* Iterate directly over the list elements */
    count = 0;
    for (int x : nums) {
        count += x;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* Iterate directly over the list elements */
    for (int x : nums) {
        count += x;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* Iterate directly over the list elements */
    count = 0;
    foreach (int x in nums) {
        count += x;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* Traverse the list by index */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* Iterate directly over the list elements */
    count = 0
    for _, x := range nums {
        count += x
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Traverse the list by index */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* Iterate directly over the list elements */
    count = 0
    for x in nums {
        count += x
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* Traverse the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (const x of nums) {
        count += x;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Traverse the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (const x of nums) {
        count += x;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Traverse the list by index */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
      count += nums[i];
    }

    /* Iterate directly over the list elements */
    count = 0;
    for (var x in nums) {
      count += x;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // Traverse the list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Iterate directly over the list elements
    _count = 0;
    for x in &nums {
        _count += x;
    }
    ```

=== "C"

    ```c title="list.c"
    // C has no built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Traverse the list by index */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Iterate directly over the list elements */
    for (j in nums) {
        count += j
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Traverse the list by index
    count = 0
    for i in 0...nums.length
      count += nums[i]
    end

    # Iterate directly over the list elements
    count = 0
    nums.each do |x|
      count += x
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Iterate%20over%20the%20list%20by%20index%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20Iterate%20over%20the%20elements%20directly%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Iterate%20over%20the%20list%20by%20index%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20Iterate%20over%20the%20elements%20directly%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 5. &nbsp; Concatenating lists

Given another list `nums1`, we can append its contents to the end of the original list.

=== "Python"

    ```python title="list.py"
    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # Append nums1 to nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Concatenate two lists */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    // Append nums1 to nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Concatenate two lists */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1); // Append nums1 to nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1); // Append nums1 to nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Concatenate two lists */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...) // Append nums1 to nums
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Concatenate two lists */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // Append nums1 to nums
    ```

=== "JS"

    ```javascript title="list.js"
    /* Concatenate two lists */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1); // Append nums1 to nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Concatenate two lists */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1); // Append nums1 to nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1); // Append nums1 to nums
    ```

=== "Rust"

    ```rust title="list.rs"
    // Concatenate two lists
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append moves the elements out of nums1, leaving it empty
    ```

=== "C"

    ```c title="list.c"
    // C has no built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Concatenate two lists */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // Append nums1 to nums
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "Visualize execution"

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Concatenate%20two%20lists%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20Add%20the%20elements%20of%20nums1%20to%20the%20end%20of%20nums&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Concatenate%20two%20lists%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20Add%20the%20elements%20of%20nums1%20to%20the%20end%20of%20nums&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 6. &nbsp; Sorting a list

Once we sort a list, we can apply binary search and two-pointer algorithms, both common in array problems.

=== "Python"

    ```python title="list.py"
    # Sort the list
    nums.sort()  # After sorting, the list elements are in ascending order
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Sort the list */
    sort(nums.begin(), nums.end()); // After sorting, the list elements are in ascending order
    ```

=== "Java"

    ```java title="list.java"
    /* Sort the list */
    Collections.sort(nums); // After sorting, the list elements are in ascending order
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Sort the list */
    nums.Sort(); // After sorting, the list elements are in ascending order
    ```

=== "Go"

    ```go title="list_test.go"
    /* Sort the list */
    sort.Ints(nums) // After sorting, the list elements are in ascending order
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Sort the list */
    nums.sort() // After sorting, the list elements are in ascending order
    ```

=== "JS"

    ```javascript title="list.js"
    /* Sort the list */
    nums.sort((a, b) => a - b); // After sorting, the list elements are in ascending order
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Sort the list */
    nums.sort((a, b) => a - b); // After sorting, the list elements are in ascending order
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Sort the list */
    nums.sort(); // After sorting, the list elements are in ascending order
    ```

=== "Rust"

    ```rust title="list.rs"
    // Sort the list
    nums.sort(); // After sorting, the list elements are in ascending order
    ```

=== "C"

    ```c title="list.c"
    // C has no built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Sort the list */
    nums.sort() // After sorting, the list elements are in ascending order
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Sort the list
    nums = nums.sort { |a, b| a <=> b } # After sorting, the list elements are in ascending order
    ```

??? pythontutor "Visualize execution"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Sort%20the%20list%0A%20%20%20%20nums.sort%28%29%20%20%23%20The%20elements%20are%20now%20in%20ascending%20order&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Sort%20the%20list%0A%20%20%20%20nums.sort%28%29%20%20%23%20The%20elements%20are%20now%20in%20ascending%20order&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 4.3.2 &nbsp; Implementing a list

Many languages, including Java, C++, and Python, provide lists. Their implementations are complex and their parameters, such as initial capacity and growth factor, are carefully chosen. You can explore these choices in the source code.

To see how a list works, let's implement a simple one. The design has three main parts.

- **Initial capacity.** Choose a reasonable initial capacity for the array. In this example, we use 10.
- **Element count.** Declare a variable `size` to track the current number of elements and update it whenever an element is inserted or removed. It tells us where the list ends and whether the array needs to grow.
- **Capacity growth.** If the list is full when we insert an element, it needs more space. Create a larger array using the growth factor and move all current elements into it in order. In this example, we double the capacity each time.

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """List class"""

        def __init__(self):
            """Constructor"""
            self._capacity: int = 10  # List capacity
            self._arr: list[int] = [0] * self._capacity  # Array that stores the list elements
            self._size: int = 0  # List length (current number of elements)
            self._extend_ratio: int = 2  # Factor by which the list capacity grows

        def size(self) -> int:
            """Get the list length (current number of elements)"""
            return self._size

        def capacity(self) -> int:
            """Get the list capacity"""
            return self._capacity

        def get(self, index: int) -> int:
            """Access an element"""
            # Throw an exception if the index is out of bounds, here and below
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            return self._arr[index]

        def set(self, num: int, index: int):
            """Update an element"""
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            self._arr[index] = num

        def add(self, num: int):
            """Append an element"""
            # Increase capacity when the elements would no longer fit
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """Insert an element in the middle"""
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            # Increase capacity when the elements would no longer fit
            if self._size == self.capacity():
                self.extend_capacity()
            # Shift the elements from index onward one position to the right
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # Update the element count
            self._size += 1

        def remove(self, index: int) -> int:
            """Remove an element"""
            if index < 0 or index >= self._size:
                raise IndexError("Index out of bounds")
            num = self._arr[index]
            # Shift the elements after index one position to the left
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # Update the element count
            self._size -= 1
            # Return the removed element
            return num

        def extend_capacity(self):
            """Increase the list capacity"""
            # Create an array _extend_ratio times as long and copy the original array into it
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # Update the list capacity
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """Return the list up to its current length"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* List class */
    class MyList {
      private:
        int *arr;             // Array that stores the list elements
        int arrCapacity = 10; // List capacity
        int arrSize = 0;      // List length (current number of elements)
        int extendRatio = 2;   // Factor by which the list capacity grows

      public:
        /* Constructor */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* Destructor */
        ~MyList() {
            delete[] arr;
        }

        /* Get the list length (current number of elements)*/
        int size() {
            return arrSize;
        }

        /* Get the list capacity */
        int capacity() {
            return arrCapacity;
        }

        /* Access an element */
        int get(int index) {
            // Throw an exception if the index is out of bounds, here and below
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            return arr[index];
        }

        /* Update an element */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            arr[index] = num;
        }

        /* Append an element */
        void add(int num) {
            // Increase capacity when the elements would no longer fit
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // Update the element count
            arrSize++;
        }

        /* Insert an element in the middle */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            // Increase capacity when the elements would no longer fit
            if (size() == capacity())
                extendCapacity();
            // Shift the elements from index onward one position to the right
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Update the element count
            arrSize++;
        }

        /* Remove an element */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("Index out of bounds");
            int num = arr[index];
            // Shift the elements after index one position to the left
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Update the element count
            arrSize--;
            // Return the removed element
            return num;
        }

        /* Increase the list capacity */
        void extendCapacity() {
            // Create an array whose length is extendRatio times the original length
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // Copy all elements from the original array into the new array
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // Free memory
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* Convert the list to a vector for printing */
        vector<int> toVector() {
            // Convert only the elements within the current list length
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
        private int[] arr; // Array that stores the list elements
        private int capacity = 10; // List capacity
        private int size = 0; // List length (current number of elements)
        private int extendRatio = 2; // Factor by which the list capacity grows

        /* Constructor */
        public MyList() {
            arr = new int[capacity];
        }

        /* Get the list length (current number of elements) */
        public int size() {
            return size;
        }

        /* Get the list capacity */
        public int capacity() {
            return capacity;
        }

        /* Access an element */
        public int get(int index) {
            // Throw an exception if the index is out of bounds, here and below
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            return arr[index];
        }

        /* Update an element */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            arr[index] = num;
        }

        /* Append an element */
        public void add(int num) {
            // Increase capacity when the elements would no longer fit
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // Update the element count
            size++;
        }

        /* Insert an element in the middle */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            // Increase capacity when the elements would no longer fit
            if (size == capacity())
                extendCapacity();
            // Shift the elements from index onward one position to the right
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Update the element count
            size++;
        }

        /* Remove an element */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Index out of bounds");
            int num = arr[index];
            // Shift the elements after index one position to the left
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Update the element count
            size--;
            // Return the removed element
            return num;
        }

        /* Increase the list capacity */
        public void extendCapacity() {
            // Create an array extendRatio times as long and copy the original array into it
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // Update the list capacity
            capacity = arr.length;
        }

        /* Convert the list to an array */
        public int[] toArray() {
            int size = size();
            // Convert only the elements within the current list length
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
            arr:         make([]int, 10), // Array that stores the list elements
            arrSize:     0,               // List length (current number of elements)
            extendRatio: 2,               // Factor by which the list capacity grows
        }
    }

    /* Get the list length (current number of elements) */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  Get the list capacity */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* Access an element */
    func (l *myList) get(index int) int {
        // Throw an exception if the index is out of bounds, here and below
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        return l.arr[index]
    }

    /* Update an element */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        l.arr[index] = num
    }

    /* Append an element */
    func (l *myList) add(num int) {
        // Increase capacity when the elements would no longer fit
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // Update the element count
        l.arrSize++
    }

    /* Insert an element in the middle */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        // Increase capacity when the elements would no longer fit
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // Shift the elements from index onward one position to the right
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // Update the element count
        l.arrSize++
    }

    /* Remove an element */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("Index out of bounds")
        }
        num := l.arr[index]
        // Shift the elements after index one position to the left
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // Update the element count
        l.arrSize--
        // Return the removed element
        return num
    }

    /* Increase the list capacity */
    func (l *myList) extendCapacity() {
        // Create an array extendRatio times as long and copy the original array into it
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // Update the list capacity
        l.arrCapacity = len(l.arr)
    }

    /* Return the list up to its current length */
    func (l *myList) toArray() []int {
        // Convert only the elements within the current list length
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* List class */
    class MyList {
        private var arr: [Int] // Array that stores the list elements
        private var _capacity: Int // List capacity
        private var _size: Int // List length (current number of elements)
        private let extendRatio: Int // Factor by which the list capacity grows

        /* Constructor */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* Get the list length (current number of elements)*/
        func size() -> Int {
            _size
        }

        /* Get the list capacity */
        func capacity() -> Int {
            _capacity
        }

        /* Access an element */
        func get(index: Int) -> Int {
            // Throw an error if the index is out of bounds, here and below
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            return arr[index]
        }

        /* Update an element */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            arr[index] = num
        }

        /* Append an element */
        func add(num: Int) {
            // Increase capacity when the elements would no longer fit
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // Update the element count
            _size += 1
        }

        /* Insert an element in the middle */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            // Increase capacity when the elements would no longer fit
            if size() == capacity() {
                extendCapacity()
            }
            // Shift the elements from index onward one position to the right
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // Update the element count
            _size += 1
        }

        /* Remove an element */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("Index out of bounds")
            }
            let num = arr[index]
            // Shift the elements after index one position to the left
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // Update the element count
            _size -= 1
            // Return the removed element
            return num
        }

        /* Increase the list capacity */
        func extendCapacity() {
            // Create an array extendRatio times as long and copy the original array into it
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // Update the list capacity
            _capacity = arr.count
        }

        /* Convert the list to an array */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* List class */
    class MyList {
        #arr = new Array(); // Array that stores the list elements
        #capacity = 10; // List capacity
        #size = 0; // List length (current number of elements)
        #extendRatio = 2; // Factor by which the list capacity grows

        /* Constructor */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* Get the list length (current number of elements)*/
        size() {
            return this.#size;
        }

        /* Get the list capacity */
        capacity() {
            return this.#capacity;
        }

        /* Access an element */
        get(index) {
            // Throw an exception if the index is out of bounds, here and below
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            return this.#arr[index];
        }

        /* Update an element */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            this.#arr[index] = num;
        }

        /* Append an element */
        add(num) {
            // Increase capacity if the length equals the capacity
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Append the new element to the list
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* Insert an element in the middle */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            // Increase capacity when the elements would no longer fit
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Shift the elements from index onward one position to the right
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // Update the element count
            this.#arr[index] = num;
            this.#size++;
        }

        /* Remove an element */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
            let num = this.#arr[index];
            // Shift the elements after index one position to the left
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // Update the element count
            this.#size--;
            // Return the removed element
            return num;
        }

        /* Increase the list capacity */
        extendCapacity() {
            // Create an array extendRatio times as long and copy the original array into it
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // Update the list capacity
            this.#capacity = this.#arr.length;
        }

        /* Convert the list to an array */
        toArray() {
            let size = this.size();
            // Convert only the elements within the current list length
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
        private arr: Array<number>; // Array that stores the list elements
        private _capacity: number = 10; // List capacity
        private _size: number = 0; // List length (current number of elements)
        private extendRatio: number = 2; // Factor by which the list capacity grows

        /* Constructor */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* Get the list length (current number of elements)*/
        public size(): number {
            return this._size;
        }

        /* Get the list capacity */
        public capacity(): number {
            return this._capacity;
        }

        /* Access an element */
        public get(index: number): number {
            // Throw an exception if the index is out of bounds, here and below
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            return this.arr[index];
        }

        /* Update an element */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            this.arr[index] = num;
        }

        /* Append an element */
        public add(num: number): void {
            // Increase capacity if the length equals the capacity
            if (this._size === this._capacity) this.extendCapacity();
            // Append the new element to the list
            this.arr[this._size] = num;
            this._size++;
        }

        /* Insert an element in the middle */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            // Increase capacity when the elements would no longer fit
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // Shift the elements from index onward one position to the right
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // Update the element count
            this.arr[index] = num;
            this._size++;
        }

        /* Remove an element */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
            let num = this.arr[index];
            // Shift the elements after index one position to the left
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // Update the element count
            this._size--;
            // Return the removed element
            return num;
        }

        /* Increase the list capacity */
        public extendCapacity(): void {
            // Create an array of length size and copy the original array into it
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // Update the list capacity
            this._capacity = this.arr.length;
        }

        /* Convert the list to an array */
        public toArray(): number[] {
            let size = this.size();
            // Convert only the elements within the current list length
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
      late List<int> _arr; // Array that stores the list elements
      int _capacity = 10; // List capacity
      int _size = 0; // List length (current number of elements)
      int _extendRatio = 2; // Factor by which the list capacity grows

      /* Constructor */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* Get the list length (current number of elements)*/
      int size() => _size;

      /* Get the list capacity */
      int capacity() => _capacity;

      /* Access an element */
      int get(int index) {
        if (index >= _size) throw RangeError('Index out of bounds');
        return _arr[index];
      }

      /* Update an element */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('Index out of bounds');
        _arr[index] = _num;
      }

      /* Append an element */
      void add(int _num) {
        // Increase capacity when the elements would no longer fit
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // Update the element count
        _size++;
      }

      /* Insert an element in the middle */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('Index out of bounds');
        // Increase capacity when the elements would no longer fit
        if (_size == _capacity) extendCapacity();
        // Shift the elements from index onward one position to the right
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // Update the element count
        _size++;
      }

      /* Remove an element */
      int remove(int index) {
        if (index >= _size) throw RangeError('Index out of bounds');
        int _num = _arr[index];
        // Shift the elements after index one position to the left
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // Update the element count
        _size--;
        // Return the removed element
        return _num;
      }

      /* Increase the list capacity */
      void extendCapacity() {
        // Create an array whose length is _extendRatio times the original length
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // Copy the original array into the new array
        List.copyRange(_newNums, 0, _arr);
        // Update the reference in _arr
        _arr = _newNums;
        // Update the list capacity
        _capacity = _arr.length;
      }

      /* Convert the list to an array */
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
        arr: Vec<i32>,       // Array that stores the list elements
        capacity: usize,     // List capacity
        size: usize,         // List length (current number of elements)
        extend_ratio: usize, // Factor by which the list capacity grows
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

        /* Get the list length (current number of elements)*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* Get the list capacity */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* Access an element */
        pub fn get(&self, index: usize) -> i32 {
            // Throw an exception if the index is out of bounds, here and below
            if index >= self.size {
                panic!("Index out of bounds")
            };
            return self.arr[index];
        }

        /* Update an element */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("Index out of bounds")
            };
            self.arr[index] = num;
        }

        /* Append an element */
        pub fn add(&mut self, num: i32) {
            // Increase capacity when the elements would no longer fit
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // Update the element count
            self.size += 1;
        }

        /* Insert an element in the middle */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("Index out of bounds")
            };
            // Increase capacity when the elements would no longer fit
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // Shift the elements from index onward one position to the right
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // Update the element count
            self.size += 1;
        }

        /* Remove an element */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("Index out of bounds")
            };
            let num = self.arr[index];
            // Shift the elements after index one position to the left
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // Update the element count
            self.size -= 1;
            // Return the removed element
            return num;
        }

        /* Increase the list capacity */
        pub fn extend_capacity(&mut self) {
            // Create an array extend_ratio times as long and copy the original array into it
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // Update the list capacity
            self.capacity = new_capacity;
        }

        /* Convert the list to an array */
        pub fn to_array(&self) -> Vec<i32> {
            // Convert only the elements within the current list length
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
        int *arr;        // Array that stores the list elements
        int capacity;    // List capacity
        int size;        // List size
        int extendRatio; // Factor by which the list capacity grows
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

    /* Get the list length */
    int size(MyList *nums) {
        return nums->size;
    }

    /* Get the list capacity */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* Access an element */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* Update an element */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* Append an element */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Increase capacity
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* Insert an element in the middle */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // Increase capacity when the elements would no longer fit
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Increase capacity
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* Remove an element */
    // Note: stdio.h already uses the name remove
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* Increase the list capacity */
    void extendCapacity(MyList *nums) {
        // Allocate space first
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // Copy the old data into the new space
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // Free the old storage
        free(temp);

        // Use the new storage
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* Convert the list to an array for printing */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* List class */
    class MyList {
        private var arr: IntArray = intArrayOf() // Array that stores the list elements
        private var capacity: Int = 10 // List capacity
        private var size: Int = 0 // List length (current number of elements)
        private var extendRatio: Int = 2 // Factor by which the list capacity grows

        /* Constructor */
        init {
            arr = IntArray(capacity)
        }

        /* Get the list length (current number of elements) */
        fun size(): Int {
            return size
        }

        /* Get the list capacity */
        fun capacity(): Int {
            return capacity
        }

        /* Access an element */
        fun get(index: Int): Int {
            // Throw an exception if the index is out of bounds, here and below
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            return arr[index]
        }

        /* Update an element */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            arr[index] = num
        }

        /* Append an element */
        fun add(num: Int) {
            // Increase capacity when the elements would no longer fit
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // Update the element count
            size++
        }

        /* Insert an element in the middle */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            // Increase capacity when the elements would no longer fit
            if (size == capacity())
                extendCapacity()
            // Shift the elements from index onward one position to the right
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // Update the element count
            size++
        }

        /* Remove an element */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Index out of bounds")
            val num = arr[index]
            // Shift the elements after index one position to the left
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // Update the element count
            size--
            // Return the removed element
            return num
        }

        /* Increase the list capacity */
        fun extendCapacity() {
            // Create an array extendRatio times as long and copy the original array into it
            arr = arr.copyOf(capacity() * extendRatio)
            // Update the list capacity
            capacity = arr.size
        }

        /* Convert the list to an array */
        fun toArray(): IntArray {
            val size = size()
            // Convert only the elements within the current list length
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
      attr_reader :size       # Get the list length (current number of elements)
      attr_reader :capacity   # Get the list capacity

      ### Constructor ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### Access an element ###
      def get(index)
        # Throw an exception if the index is out of bounds, here and below
        raise IndexError, "Index out of bounds" if index < 0 || index >= size
        @arr[index]
      end

      ### Access an element ###
      def set(index, num)
        raise IndexError, "Index out of bounds" if index < 0 || index >= size
        @arr[index] = num
      end

      ### Append an element ###
      def add(num)
        # Increase capacity when the elements would no longer fit
        extend_capacity if size == capacity
        @arr[size] = num

        # Update the element count
        @size += 1
      end

      ### Insert an element in the middle ###
      def insert(index, num)
        raise IndexError, "Index out of bounds" if index < 0 || index >= size

        # Increase capacity when the elements would no longer fit
        extend_capacity if size == capacity

        # Shift the elements from index onward one position to the right
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # Update the element count
        @size += 1
      end

      ### Remove an element ###
      def remove(index)
        raise IndexError, "Index out of bounds" if index < 0 || index >= size
        num = @arr[index]

        # Shift the elements after index one position to the left
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # Update the element count
        @size -= 1

        # Return the removed element
        num
      end

      ### Increase the list capacity ###
      def extend_capacity
        # Create an array extend_ratio times as long and copy the original array into it
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # Update the list capacity
        @capacity = arr.length
      end

      ### Convert the list to an array ###
      def to_array
        sz = size
        # Convert only the elements within the current list length
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22List%20class%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20list%20length%20%28current%20number%20of%20elements%29%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20list%20capacity%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Access%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Update%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Append%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20an%20element%20in%20the%20middle%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20Shift%20the%20elements%20from%20index%20onward%20one%20position%20to%20the%20right%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20Shift%20the%20elements%20after%20index%20i%20one%20position%20to%20the%20left%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Increase%20the%20list%20capacity%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20Append%20an%20element%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20Insert%20an%20element%20in%20the%20middle%0A%20%20%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20Access%20an%20element%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20Update%20an%20element%0A%20%20%20%20nums.set%280,%201%29%0A%0A%20%20%20%20%23%20Test%20capacity%20growth%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22List%20class%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20list%20length%20%28current%20number%20of%20elements%29%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20list%20capacity%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Access%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Update%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Append%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20an%20element%20in%20the%20middle%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20Shift%20the%20elements%20from%20index%20onward%20one%20position%20to%20the%20right%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20an%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Index%20out%20of%20bounds%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20Shift%20the%20elements%20after%20index%20i%20one%20position%20to%20the%20left%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Increase%20the%20list%20capacity%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20list%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20Append%20an%20element%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20Insert%20an%20element%20in%20the%20middle%0A%20%20%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20Access%20an%20element%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20Update%20an%20element%0A%20%20%20%20nums.set%280,%201%29%0A%0A%20%20%20%20%23%20Test%20capacity%20growth%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>
