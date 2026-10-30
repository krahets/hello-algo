# Lists

A <u>list</u> is an abstract data structure representing an ordered collection. It supports access, modification, insertion, removal, and traversal without requiring users to manage capacity limits. Lists can be implemented with linked lists or arrays.

- A linked list naturally serves as a list, supporting these operations and flexible dynamic growth.
- An array also supports these operations, but its fixed length makes it a list with a length limit.

When an array implements a list, **its fixed length limits the list's usefulness**. We often cannot predict how much data we will store. Too small an allocation may not meet our needs; too large an allocation wastes memory.

A <u>dynamic array</u> solves this problem. It retains the advantages of an array while allowing capacity to grow during execution.

**Many standard-library lists use dynamic arrays**, including Python's `list`, Java's `ArrayList`, C++'s `vector`, and C#'s `List`. In the discussion that follows, we treat lists and dynamic arrays as equivalent concepts.

## Common list operations

### Initializing a list

We usually initialize a list either without elements or with explicit initial values:

=== "Python"

    ```python title="list.py"
    # Initialize lists
    # Without initial values
    nums1: list[int] = []
    # With initial values
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Initialize lists */
    // In C++, vector is the list type used for nums here
    // Without initial values
    vector<int> nums1;
    // With initial values
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* Initialize lists */
    // Without initial values
    List<Integer> nums1 = new ArrayList<>();
    // With initial values (use Integer[], the boxed counterpart of int[])
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Initialize lists */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* Initialize lists */
    // Without initial values
    nums1 := []int{}
    // With initial values
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Initialize lists */
    // Without initial values
    let nums1: [Int] = []
    // With initial values
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Initialize lists */
    // Without initial values
    const nums1 = [];
    // With initial values
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Initialize lists */
    // Without initial values
    const nums1: number[] = [];
    // With initial values
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Initialize lists */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Initialize lists */
    // Without initial values
    let nums1: Vec<i32> = Vec::new();
    // With initial values
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Initialize lists */
    // Without initial values
    var nums1 = listOf<Int>()
    // With initial values
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Initialize lists
    # Without initial values
    nums1 = []
    # With initial values
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20%23%20Without%20initial%20values%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Accessing an element

Since the list is based on an array, accessing and updating an element are efficient $O(1)$ operations.

=== "Python"

    ```python title="list.py"
    # Access an element
    num: int = nums[1]  # Access the element at index 1

    # Update an element
    nums[1] = 0    # Set the element at index 1 to 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Access an element */
    int num = nums[1];  // Access the element at index 1

    /* Update an element */
    nums[1] = 0;  // Set the element at index 1 to 0
    ```

=== "Java"

    ```java title="list.java"
    /* Access an element */
    int num = nums.get(1);  // Access the element at index 1

    /* Update an element */
    nums.set(1, 0);  // Set the element at index 1 to 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Access an element */
    int num = nums[1];  // Access the element at index 1

    /* Update an element */
    nums[1] = 0;  // Set the element at index 1 to 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* Access an element */
    num := nums[1]  // Access the element at index 1

    /* Update an element */
    nums[1] = 0     // Set the element at index 1 to 0
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
    const num = nums[1];  // Access the element at index 1

    /* Update an element */
    nums[1] = 0;  // Set the element at index 1 to 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Access an element */
    const num: number = nums[1];  // Access the element at index 1

    /* Update an element */
    nums[1] = 0;  // Set the element at index 1 to 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Access an element */
    int num = nums[1];  // Access the element at index 1

    /* Update an element */
    nums[1] = 0;  // Set the element at index 1 to 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Access an element */
    let num: i32 = nums[1];  // Access the element at index 1
    /* Update an element */
    nums[1] = 0;             // Set the element at index 1 to 0
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Access an element */
    val num = nums[1]       // Access the element at index 1
    /* Update an element */
    nums[1] = 0             // Set the element at index 1 to 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Access an element
    num = nums[1] # Access the element at index 1
    # Update an element
    nums[1] = 0 # Set the element at index 1 to 0
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20Access%20an%20element%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20Access%20the%20element%20at%20index%201%0A%0A%20%20%20%20%23%20Update%20an%20element%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20Set%20the%20element%20at%20index%201%20to%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Inserting and removing elements

Unlike a fixed array, a list can freely add and remove elements. Appending takes $O(1)$ time, while insertion and removal retain the array's $O(n)$ time complexity.

=== "Python"

    ```python title="list.py"
    # Clear the list
    nums.clear()

    # Append elements
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Insert an element in the middle
    nums.insert(3, 6)  # Insert 6 at index 3

    # Remove an element
    nums.pop(3)        # Remove the element at index 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Clear the list */
    nums.clear();

    /* Append elements */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Insert an element in the middle */
    nums.insert(nums.begin() + 3, 6);  // Insert 6 at index 3

    /* Remove an element */
    nums.erase(nums.begin() + 3);      // Remove the element at index 3
    ```

=== "Java"

    ```java title="list.java"
    /* Clear the list */
    nums.clear();

    /* Append elements */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.add(3, 6);  // Insert 6 at index 3

    /* Remove an element */
    nums.remove(3);  // Remove the element at index 3
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Clear the list */
    nums.Clear();

    /* Append elements */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Insert an element in the middle */
    nums.Insert(3, 6);  // Insert 6 at index 3

    /* Remove an element */
    nums.RemoveAt(3);  // Remove the element at index 3
    ```

=== "Go"

    ```go title="list_test.go"
    /* Clear the list */
    nums = nil

    /* Append elements */
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

    /* Append elements */
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

    /* Append elements */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.splice(3, 1);  // Remove the element at index 3
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Clear the list */
    nums.length = 0;

    /* Append elements */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert 6 at index 3

    /* Remove an element */
    nums.splice(3, 1);  // Remove the element at index 3
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Clear the list */
    nums.clear();

    /* Append elements */
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
    /* Clear the list */
    nums.clear();

    /* Append elements */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.insert(3, 6);  // Insert 6 at index 3

    /* Remove an element */
    nums.remove(3);    // Remove the element at index 3
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Clear the list */
    nums.clear();

    /* Append elements */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.add(3, 6);  // Insert 6 at index 3

    /* Remove an element */
    nums.remove(3);  // Remove the element at index 3
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Clear the list
    nums.clear

    # Append elements
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

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Clear%20the%20list%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20Append%20elements%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20an%20element%20in%20the%20middle%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20Insert%206%20at%20index%203%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20Remove%20the%20element%20at%20index%203&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Traversing a list

Like an array, a list can be traversed by index or by visiting its elements directly.

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
    // C does not provide a built-in dynamic array
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

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Traverse%20the%20list%20by%20index%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20Traverse%20list%20elements%20directly%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Concatenating lists

Given another list `nums1`, we can append its elements to the end of the original list.

=== "Python"

    ```python title="list.py"
    # Concatenate two lists
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # Append nums1 to nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Concatenate two lists */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // Append nums1 to nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Concatenate two lists */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // Append nums1 to nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // Append nums1 to nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Concatenate two lists */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // Append nums1 to nums
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
    nums.push(...nums1);  // Append nums1 to nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Concatenate two lists */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Append nums1 to nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // Append nums1 to nums
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Concatenate two lists */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Concatenate two lists */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // Append nums1 to nums
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Concatenate%20two%20lists%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20Append%20nums1%20to%20nums&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Sorting a list

Once the list is sorted, we can apply binary search and two-pointer algorithms, which often appear in array problems.

=== "Python"

    ```python title="list.py"
    # Sort the list
    nums.sort()  # After sorting, elements are in ascending order
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Sort the list */
    sort(nums.begin(), nums.end());  // After sorting, elements are in ascending order
    ```

=== "Java"

    ```java title="list.java"
    /* Sort the list */
    Collections.sort(nums);  // After sorting, elements are in ascending order
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Sort the list */
    nums.Sort(); // After sorting, elements are in ascending order
    ```

=== "Go"

    ```go title="list_test.go"
    /* Sort the list */
    sort.Ints(nums)  // After sorting, elements are in ascending order
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Sort the list */
    nums.sort() // After sorting, elements are in ascending order
    ```

=== "JS"

    ```javascript title="list.js"
    /* Sort the list */
    nums.sort((a, b) => a - b);  // After sorting, elements are in ascending order
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Sort the list */
    nums.sort((a, b) => a - b);  // After sorting, elements are in ascending order
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Sort the list */
    nums.sort(); // After sorting, elements are in ascending order
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Sort the list */
    nums.sort(); // After sorting, elements are in ascending order
    ```

=== "C"

    ```c title="list.c"
    // C does not provide a built-in dynamic array
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Sort the list */
    nums.sort() // After sorting, elements are in ascending order
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Sort the list
    nums = nums.sort { |a, b| a <=> b } # After sorting, elements are in ascending order
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Sort%20the%20list%0A%20%20%20%20nums.sort%28%29%20%20%23%20After%20sorting%2C%20elements%20are%20in%20ascending%20order&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## Implementing a list

Many languages, including Java, C++, and Python, provide lists. Their implementations are sophisticated, with carefully chosen parameters such as initial capacity and growth factor. Interested readers can study their source code.

To understand how a list works, let's implement a simplified version with three key design choices.

- **Initial capacity**: Choose a reasonable starting array capacity. We use 10 here.
- **Element count**: Maintain `size`, the number of elements, updating it on insertion and removal. It identifies the list's end and tells us when expansion is needed.
- **Growth mechanism**: If insertion finds the capacity full, allocate a larger array using a growth factor and copy all current elements into it. Here, capacity doubles each time.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
