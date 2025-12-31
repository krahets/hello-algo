---
comments: true
---

# 4.1 &nbsp; Array

An <u>array</u> is a linear data structure that stores elements of the same type in contiguous memory space. The position of an element in the array is called the element's <u>index</u>. Figure 4-1 illustrates the main concepts and storage method of arrays.

![Array definition and storage method](array.assets/array_definition.png){ class="animation-figure" }

<p align="center"> Figure 4-1 &nbsp; Array definition and storage method </p>

## 4.1.1 &nbsp; Common Array Operations

### 1. &nbsp; Initializing Arrays

We can choose between two array initialization methods based on our needs: without initial values or with given initial values. When no initial values are specified, most programming languages will initialize array elements to $0$:

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
    // Stored on heap (requires manual memory release)
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
    // In Go, specifying length ([5]int) creates an array; not specifying length ([]int) creates a slice
    // Since Go's arrays are designed to have their length determined at compile time, only constants can be used to specify the length
    // For convenience in implementing the extend() method, slices are treated as arrays below
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
    let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
    let slice: &[i32] = &[0; 5];
    // In Rust, specifying length ([i32; 5]) creates an array; not specifying length (&[i32]) creates a slice
    // Since Rust's arrays are designed to have their length determined at compile time, only constants can be used to specify the length
    // Vector is the type generally used as a dynamic array in Rust
    // For convenience in implementing the extend() method, vectors are treated as arrays below
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
    /* Initialize array */
    var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
    var nums = intArrayOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="array.rb"
    # Initialize array
    arr = Array.new(5, 0)
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Code Visualization"

    <div style="height: 243px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0Aarr%20%3D%20%5B0%5D%20*%205%20%20%23%20%5B%200,%200,%200,%200,%200%20%5D%0Anums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0Aarr%20%3D%20%5B0%5D%20*%205%20%20%23%20%5B%200,%200,%200,%200,%200%20%5D%0Anums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 2. &nbsp; Accessing Elements

Array elements are stored in contiguous memory space, which means calculating the memory address of array elements is very easy. Given the array's memory address (the memory address of the first element) and an element's index, we can use the formula shown in Figure 4-2 to calculate the element's memory address and directly access that element.

![Memory address calculation for array elements](array.assets/array_memory_location_calculation.png){ class="animation-figure" }

<p align="center"> Figure 4-2 &nbsp; Memory address calculation for array elements </p>

Observing Figure 4-2, we find that the first element of an array has an index of $0$, which may seem counterintuitive since counting from $1$ would be more natural. However, from the perspective of the address calculation formula, **an index is essentially an offset from the memory address**. The address offset of the first element is $0$, so it is reasonable for its index to be $0$.

Accessing elements in an array is highly efficient; we can randomly access any element in the array in $O(1)$ time.

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """Random access to element"""
        # Randomly select a number from the interval [0, len(nums)-1]
        random_index = random.randint(0, len(nums) - 1)
        # Retrieve and return the random element
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Random access to element */
    int randomAccess(int *nums, int size) {
        // Randomly select a number from interval [0, size)
        int randomIndex = rand() % size;
        // Retrieve and return the random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Random access to element */
    int randomAccess(int[] nums) {
        // Randomly select a number in the interval [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Retrieve and return the random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Random access to element */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Randomly select a number in interval [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Retrieve and return the random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Random access to element */
    func randomAccess(nums []int) (randomNum int) {
        // Randomly select a number in the interval [0, nums.length)
        randomIndex := rand.Intn(len(nums))
        // Retrieve and return the random element
        randomNum = nums[randomIndex]
        return
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Random access to element */
    func randomAccess(nums: [Int]) -> Int {
        // Randomly select a number in interval [0, nums.count)
        let randomIndex = nums.indices.randomElement()!
        // Retrieve and return the random element
        let randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Random access to element */
    function randomAccess(nums) {
        // Randomly select a number in the interval [0, nums.length)
        const random_index = Math.floor(Math.random() * nums.length);
        // Retrieve and return the random element
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Random access to element */
    function randomAccess(nums: number[]): number {
        // Randomly select a number in the interval [0, nums.length)
        const random_index = Math.floor(Math.random() * nums.length);
        // Retrieve and return the random element
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Random access to element */
    int randomAccess(List<int> nums) {
      // Randomly select a number in the interval [0, nums.length)
      int randomIndex = Random().nextInt(nums.length);
      // Retrieve and return the random element
      int randomNum = nums[randomIndex];
      return randomNum;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Random access to element */
    fn random_access(nums: &[i32]) -> i32 {
        // Randomly select a number in interval [0, nums.len())
        let random_index = rand::thread_rng().gen_range(0..nums.len());
        // Retrieve and return the random element
        let random_num = nums[random_index];
        random_num
    }
    ```

=== "C"

    ```c title="array.c"
    /* Random access to element */
    int randomAccess(int *nums, int size) {
        // Randomly select a number from interval [0, size)
        int randomIndex = rand() % size;
        // Retrieve and return the random element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Random access to element */
    fun randomAccess(nums: IntArray): Int {
        // Randomly select a number in interval [0, nums.size)
        val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
        // Retrieve and return the random element
        val randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Random access element ###
    def random_access(nums)
      # Randomly select a number in the interval [0, nums.length)
      random_index = Random.rand(0...nums.length)

      # Retrieve and return the random element
      nums[random_index]
    end
    ```

### 3. &nbsp; Inserting Elements

Array elements are stored "tightly adjacent" in memory, with no space between them to store any additional data. As shown in Figure 4-3, if we want to insert an element in the middle of an array, we need to shift all elements after that position backward by one position, and then assign the value to that index.

![Example of inserting an element into an array](array.assets/array_insert_element.png){ class="animation-figure" }

<p align="center"> Figure 4-3 &nbsp; Example of inserting an element into an array </p>

It is worth noting that since the length of an array is fixed, inserting an element will inevitably cause the element at the end of the array to be "lost". We will leave the solution to this problem for discussion in the "List" chapter.

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """Insert element num at index index in the array"""
        # Move all elements at and after index index backward by one position
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # Assign num to the element at index index
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Insert element num at index index in the array */
    void insert(int *nums, int size, int num, int index) {
        // Move all elements at and after index index backward by one position
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Insert element num at index index in the array */
    void insert(int[] nums, int num, int index) {
        // Move all elements at and after index index backward by one position
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Insert element num at index index in the array */
    void Insert(int[] nums, int num, int index) {
        // Move all elements at and after index index backward by one position
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Insert element num at index index in the array */
    func insert(nums []int, num int, index int) {
        // Move all elements at and after index index backward by one position
        for i := len(nums) - 1; i > index; i-- {
            nums[i] = nums[i-1]
        }
        // Assign num to the element at index index
        nums[index] = num
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Insert element num at index index in the array */
    func insert(nums: inout [Int], num: Int, index: Int) {
        // Move all elements at and after index index backward by one position
        for i in nums.indices.dropFirst(index).reversed() {
            nums[i] = nums[i - 1]
        }
        // Assign num to the element at index index
        nums[index] = num
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Insert element num at index index in the array */
    function insert(nums, num, index) {
        // Move all elements at and after index index backward by one position
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Insert element num at index index in the array */
    function insert(nums: number[], num: number, index: number): void {
        // Move all elements at and after index index backward by one position
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Insert element _num at array index index */
    void insert(List<int> nums, int _num, int index) {
      // Move all elements at and after index index backward by one position
      for (var i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
      }
      // Assign _num to element at index
      nums[index] = _num;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Insert element num at index index in the array */
    fn insert(nums: &mut [i32], num: i32, index: usize) {
        // Move all elements at and after index index backward by one position
        for i in (index + 1..nums.len()).rev() {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }
    ```

=== "C"

    ```c title="array.c"
    /* Insert element num at index index in the array */
    void insert(int *nums, int size, int num, int index) {
        // Move all elements at and after index index backward by one position
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index index
        nums[index] = num;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Insert element num at index index in the array */
    fun insert(nums: IntArray, num: Int, index: Int) {
        // Move all elements at and after index index backward by one position
        for (i in nums.size - 1 downTo index + 1) {
            nums[i] = nums[i - 1]
        }
        // Assign num to the element at index index
        nums[index] = num
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Insert element num at index in array ###
    def insert(nums, num, index)
      # Move all elements at and after index index backward by one position
      for i in (nums.length - 1).downto(index + 1)
        nums[i] = nums[i - 1]
      end

      # Assign num to the element at index index
      nums[index] = num
    end
    ```

### 4. &nbsp; Removing Elements

Similarly, as shown in Figure 4-4, to delete the element at index $i$, we need to shift all elements after index $i$ forward by one position.

![Example of removing an element from an array](array.assets/array_remove_element.png){ class="animation-figure" }

<p align="center"> Figure 4-4 &nbsp; Example of removing an element from an array </p>

Note that after the deletion is complete, the original last element becomes "meaningless", so we do not need to specifically modify it.

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """Remove the element at index index"""
        # Move all elements after index index forward by one position
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Remove the element at index index */
    void remove(int *nums, int size, int index) {
        // Move all elements after index index forward by one position
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Remove the element at index index */
    void remove(int[] nums, int index) {
        // Move all elements after index index forward by one position
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Remove the element at index index */
    void Remove(int[] nums, int index) {
        // Move all elements after index index forward by one position
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Remove the element at index index */
    func remove(nums []int, index int) {
        // Move all elements after index index forward by one position
        for i := index; i < len(nums)-1; i++ {
            nums[i] = nums[i+1]
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Remove the element at index index */
    func remove(nums: inout [Int], index: Int) {
        // Move all elements after index index forward by one position
        for i in nums.indices.dropFirst(index).dropLast() {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Remove the element at index index */
    function remove(nums, index) {
        // Move all elements after index index forward by one position
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Remove the element at index index */
    function remove(nums: number[], index: number): void {
        // Move all elements after index index forward by one position
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Remove the element at index index */
    void remove(List<int> nums, int index) {
      // Move all elements after index index forward by one position
      for (var i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
      }
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Remove the element at index index */
    fn remove(nums: &mut [i32], index: usize) {
        // Move all elements after index index forward by one position
        for i in index..nums.len() - 1 {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* Remove the element at index index */
    // Note: stdio.h occupies the remove keyword
    void removeItem(int *nums, int size, int index) {
        // Move all elements after index index forward by one position
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Remove the element at index index */
    fun remove(nums: IntArray, index: Int) {
        // Move all elements after index index forward by one position
        for (i in index..<nums.size - 1) {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Delete element at index ###
    def remove(nums, index)
      # Move all elements after index index forward by one position
      for i in index...(nums.length - 1)
        nums[i] = nums[i + 1]
      end
    end
    ```

Overall, array insertion and deletion operations have the following drawbacks:

- **High time complexity**: The average time complexity for both insertion and deletion in arrays is $O(n)$, where $n$ is the length of the array.
- **Loss of elements**: Since the length of an array is immutable, after inserting an element, elements that exceed the array's length will be lost.
- **Memory waste**: We can initialize a relatively long array and only use the front portion, so that when inserting data, the lost elements at the end are "meaningless", but this causes some memory space to be wasted.

### 5. &nbsp; Traversing Arrays

In most programming languages, we can traverse an array either by index or by directly iterating through each element in the array:

=== "Python"

    ```python title="array.py"
    def traverse(nums: list[int]):
        """Traverse array"""
        count = 0
        # Traverse array by index
        for i in range(len(nums)):
            count += nums[i]
        # Direct traversal of array elements
        for num in nums:
            count += num
        # Traverse simultaneously data index and elements
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
        // Direct traversal of array elements
        for (int num : nums) {
            count += num;
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Traverse array */
    void Traverse(int[] nums) {
        int count = 0;
        // Traverse array by index
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Direct traversal of array elements
        foreach (int num in nums) {
            count += num;
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Traverse array */
    func traverse(nums []int) {
        count := 0
        // Traverse array by index
        for i := 0; i < len(nums); i++ {
            count += nums[i]
        }
        count = 0
        // Direct traversal of array elements
        for _, num := range nums {
            count += num
        }
        // Traverse simultaneously data index and elements
        for i, num := range nums {
            count += nums[i]
            count += num
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Traverse array */
    func traverse(nums: [Int]) {
        var count = 0
        // Traverse array by index
        for i in nums.indices {
            count += nums[i]
        }
        // Direct traversal of array elements
        for num in nums {
            count += num
        }
        // Traverse simultaneously data index and elements
        for (i, num) in nums.enumerated() {
            count += nums[i]
            count += num
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Traverse array */
    function traverse(nums) {
        let count = 0;
        // Traverse array by index
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Direct traversal of array elements
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Traverse array */
    function traverse(nums: number[]): void {
        let count = 0;
        // Traverse array by index
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Direct traversal of array elements
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Traverse array elements */
    void traverse(List<int> nums) {
      int count = 0;
      // Traverse array by index
      for (var i = 0; i < nums.length; i++) {
        count += nums[i];
      }
      // Direct traversal of array elements
      for (int _num in nums) {
        count += _num;
      }
      // Traverse array using forEach method
      nums.forEach((_num) {
        count += _num;
      });
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Traverse array */
    fn traverse(nums: &[i32]) {
        let mut _count = 0;
        // Traverse array by index
        for i in 0..nums.len() {
            _count += nums[i];
        }
        // Direct traversal of array elements
        _count = 0;
        for &num in nums {
            _count += num;
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* Traverse array */
    void traverse(int *nums, int size) {
        int count = 0;
        // Traverse array by index
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Traverse array */
    fun traverse(nums: IntArray) {
        var count = 0
        // Traverse array by index
        for (i in nums.indices) {
            count += nums[i]
        }
        // Direct traversal of array elements
        for (j in nums) {
            count += j
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Traverse array ###
    def traverse(nums)
      count = 0

      # Traverse array by index
      for i in 0...nums.length
        count += nums[i]
      end

      # Direct traversal of array elements
      for num in nums
        count += num
      end
    end
    ```

### 6. &nbsp; Finding Elements

Finding a specified element in an array requires traversing the array and checking whether the element value matches in each iteration; if it matches, output the corresponding index.

Since an array is a linear data structure, the above search operation is called a "linear search".

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """Find the specified element in the array"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Find the specified element in the array */
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
    /* Find the specified element in the array */
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
    /* Find the specified element in the array */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Find the specified element in the array */
    func find(nums []int, target int) (index int) {
        index = -1
        for i := 0; i < len(nums); i++ {
            if nums[i] == target {
                index = i
                break
            }
        }
        return
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Find the specified element in the array */
    func find(nums: [Int], target: Int) -> Int {
        for i in nums.indices {
            if nums[i] == target {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Find the specified element in the array */
    function find(nums, target) {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) return i;
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Find the specified element in the array */
    function find(nums: number[], target: number): number {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Find the specified element in the array */
    int find(List<int> nums, int target) {
      for (var i = 0; i < nums.length; i++) {
        if (nums[i] == target) return i;
      }
      return -1;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Find the specified element in the array */
    fn find(nums: &[i32], target: i32) -> Option<usize> {
        for i in 0..nums.len() {
            if nums[i] == target {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="array.c"
    /* Find the specified element in the array */
    int find(int *nums, int size, int target) {
        for (int i = 0; i < size; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Find the specified element in the array */
    fun find(nums: IntArray, target: Int): Int {
        for (i in nums.indices) {
            if (nums[i] == target)
                return i
        }
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Find specified element in array ###
    def find(nums, target)
      for i in 0...nums.length
        return i if nums[i] == target
      end

      -1
    end
    ```

### 7. &nbsp; Expanding Arrays

In complex system environments, programs cannot guarantee that the memory space after an array is available, making it unsafe to expand the array's capacity. Therefore, in most programming languages, **the length of an array is immutable**.

If we want to expand an array, we need to create a new, larger array and then copy the original array elements to the new array one by one. This is an $O(n)$ operation, which is very time-consuming when the array is large. The code is shown below:

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """Extend array length"""
        # Initialize an array with extended length
        res = [0] * (len(nums) + enlarge)
        # Copy all elements from the original array to the new array
        for i in range(len(nums)):
            res[i] = nums[i]
        # Return the extended new array
        return res
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Extend array length */
    int *extend(int *nums, int size, int enlarge) {
        // Initialize an array with extended length
        int *res = new int[size + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // Free memory
        delete[] nums;
        // Return the extended new array
        return res;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Extend array length */
    int[] extend(int[] nums, int enlarge) {
        // Initialize an array with extended length
        int[] res = new int[nums.length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the extended new array
        return res;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Extend array length */
    int[] Extend(int[] nums, int enlarge) {
        // Initialize an array with extended length
        int[] res = new int[nums.Length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Return the extended new array
        return res;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Extend array length */
    func extend(nums []int, enlarge int) []int {
        // Initialize an array with extended length
        res := make([]int, len(nums)+enlarge)
        // Copy all elements from the original array to the new array
        for i, num := range nums {
            res[i] = num
        }
        // Return the extended new array
        return res
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Extend array length */
    func extend(nums: [Int], enlarge: Int) -> [Int] {
        // Initialize an array with extended length
        var res = Array(repeating: 0, count: nums.count + enlarge)
        // Copy all elements from the original array to the new array
        for i in nums.indices {
            res[i] = nums[i]
        }
        // Return the extended new array
        return res
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Extend array length */
    // Note: JavaScript's Array is dynamic array, can be directly expanded
    // For learning purposes, this function treats Array as fixed-length array
    function extend(nums, enlarge) {
        // Initialize an array with extended length
        const res = new Array(nums.length + enlarge).fill(0);
        // Copy all elements from the original array to the new array
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the extended new array
        return res;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Extend array length */
    // Note: TypeScript's Array is dynamic array, can be directly expanded
    // For learning purposes, this function treats Array as fixed-length array
    function extend(nums: number[], enlarge: number): number[] {
        // Initialize an array with extended length
        const res = new Array(nums.length + enlarge).fill(0);
        // Copy all elements from the original array to the new array
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the extended new array
        return res;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Extend array length */
    List<int> extend(List<int> nums, int enlarge) {
      // Initialize an array with extended length
      List<int> res = List.filled(nums.length + enlarge, 0);
      // Copy all elements from the original array to the new array
      for (var i = 0; i < nums.length; i++) {
        res[i] = nums[i];
      }
      // Return the extended new array
      return res;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Extend array length */
    fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
        // Initialize an array with extended length
        let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
        // Copy all elements from original array to new
        res[0..nums.len()].copy_from_slice(nums);

        // Return the extended new array
        res
    }
    ```

=== "C"

    ```c title="array.c"
    /* Extend array length */
    int *extend(int *nums, int size, int enlarge) {
        // Initialize an array with extended length
        int *res = (int *)malloc(sizeof(int) * (size + enlarge));
        // Copy all elements from the original array to the new array
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // Initialize expanded space
        for (int i = size; i < size + enlarge; i++) {
            res[i] = 0;
        }
        // Return the extended new array
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Extend array length */
    fun extend(nums: IntArray, enlarge: Int): IntArray {
        // Initialize an array with extended length
        val res = IntArray(nums.size + enlarge)
        // Copy all elements from the original array to the new array
        for (i in nums.indices) {
            res[i] = nums[i]
        }
        // Return the extended new array
        return res
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Extend array length ###
    # Note: Ruby's Array is dynamic array, can be directly expanded
    # For learning purposes, this function treats Array as fixed-length array
    def extend(nums, enlarge)
      # Initialize an array with extended length
      res = Array.new(nums.length + enlarge, 0)

      # Copy all elements from the original array to the new array
      for i in 0...nums.length
        res[i] = nums[i]
      end

      # Return the extended new array
      res
    end
    ```

## 4.1.2 &nbsp; Advantages and Limitations of Arrays

Arrays are stored in contiguous memory space with elements of the same type. This approach contains rich prior information that the system can use to optimize the efficiency of data structure operations.

- **High space efficiency**: Arrays allocate contiguous memory blocks for data without additional structural overhead.
- **Support for random access**: Arrays allow accessing any element in $O(1)$ time.
- **Cache locality**: When accessing array elements, the computer not only loads the element but also caches the surrounding data, thereby leveraging the cache to improve the execution speed of subsequent operations.

Contiguous space storage is a double-edged sword with the following limitations:

- **Low insertion and deletion efficiency**: When an array has many elements, insertion and deletion operations require shifting a large number of elements.
- **Immutable length**: After an array is initialized, its length is fixed. Expanding the array requires copying all data to a new array, which is very costly.
- **Space waste**: If the allocated size of an array exceeds what is actually needed, the extra space is wasted.

## 4.1.3 &nbsp; Typical Applications of Arrays

Arrays are a fundamental and common data structure, frequently used in various algorithms and for implementing various complex data structures.

- **Random access**: If we want to randomly sample some items, we can use an array to store them and generate a random sequence to implement random sampling based on indices.
- **Sorting and searching**: Arrays are the most commonly used data structure for sorting and searching algorithms. Quick sort, merge sort, binary search, and others are primarily performed on arrays.
- **Lookup tables**: When we need to quickly find an element or its corresponding relationship, we can use an array as a lookup table. For example, if we want to implement a mapping from characters to ASCII codes, we can use the ASCII code value of a character as an index, with the corresponding element stored at that position in the array.
- **Machine learning**: Neural networks make extensive use of linear algebra operations between vectors, matrices, and tensors, all of which are constructed in the form of arrays. Arrays are the most commonly used data structure in neural network programming.
- **Data structure implementation**: Arrays can be used to implement stacks, queues, hash tables, heaps, graphs, and other data structures. For example, the adjacency matrix representation of a graph is essentially a two-dimensional array.
