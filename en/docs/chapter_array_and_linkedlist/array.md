---
comments: true
---

# 4.1 &nbsp; Arrays

An <u>array</u> is a linear data structure that stores elements of the same type in contiguous memory. An element's position in the array is its <u>index</u>. Figure 4-1 shows the main concepts and storage layout.

![Array definition and storage layout](array.assets/array_definition.png){ class="animation-figure" }

<p align="center"> Figure 4-1 &nbsp; Array definition and storage layout </p>

## 4.1.1 &nbsp; Common array operations

### 1. &nbsp; Initializing an array

We can initialize an array with or without explicit values. When values are not specified, most programming languages initialize the elements to $0$:

=== "Python"

    ```python title="array.py"
    # Initialize arrays
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Initialize arrays */
    // Stored on the stack
    int arr[5] = {};
    int nums[5] = { 1, 3, 2, 5, 4 };
    // Stored on the heap (memory must be freed manually)
    int* arr1 = new int[5] {};
    int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="array.java"
    /* Initialize arrays */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Initialize arrays */
    int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
    int[] nums = [1, 3, 2, 5, 4];
    ```

=== "Go"

    ```go title="array.go"
    /* Initialize arrays */
    var arr [5]int
    // In Go, [5]int is an array with a specified length; []int is a slice
    // Go array lengths are determined at compile time and must be constants
    // To make extend() easier to implement, we treat slices as arrays below
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Initialize arrays */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    let nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="array.js"
    /* Initialize arrays */
    var arr = new Array(5).fill(0);
    var nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Initialize arrays */
    let arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Initialize arrays */
    List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Initialize arrays */
    let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
    let slice: &[i32] = &[0; 5];
    // In Rust, [i32; 5] is an array with a specified length; &[i32] is a slice
    // Rust array lengths are determined at compile time and must be constants
    // Vector is Rust's usual dynamic array type
    // To make extend() easier to implement, we treat a vector as an array below
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    /* Initialize arrays */
    int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
    int nums[5] = { 1, 3, 2, 5, 4 };
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Initialize arrays */
    var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
    var nums = intArrayOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="array.rb"
    # Initialize arrays
    arr = Array.new(5, 0)
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Visualize execution"

    <div style="height: 243px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%23%20Initialize%20arrays%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20Initialize%20arrays%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Accessing an element

Because array elements occupy contiguous memory, their addresses are easy to calculate. Given the array's address (the address of its first element) and an index, the formula in Figure 4-2 gives the element's address, allowing direct access.

![Calculating an array element's memory address](array.assets/array_memory_location_calculation.png){ class="animation-figure" }

<p align="center"> Figure 4-2 &nbsp; Calculating an array element's memory address </p>

The first element has index $0$, which may seem unintuitive because counting from $1$ feels more natural. However, **an index essentially describes an offset from the starting memory address**. The first element's offset is $0$, so index $0$ makes sense.

Array access is very efficient: any element can be accessed directly in $O(1)$ time.

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """Access an element at a random index"""
        # Choose a random number in the range [0, len(nums)-1]
        random_index = random.randint(0, len(nums) - 1)
        # Get and return the randomly selected element
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Access an element at a random index */
    int randomAccess(int *nums, int size) {
        // Choose a random number in [0, size)
        int randomIndex = rand() % size;
        // Get and return the randomly selected element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Access an element at a random index */
    int randomAccess(int[] nums) {
        // Choose a random number in the interval [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Get and return the randomly selected element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Access an element at a random index */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Randomly select a number from [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Get and return the randomly selected element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Access an element at a random index */
    func randomAccess(nums []int) (randomNum int) {
        // Choose a random number in the interval [0, len(nums))
        randomIndex := rand.Intn(len(nums))
        // Get and return the randomly selected element
        randomNum = nums[randomIndex]
        return
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Access an element at a random index */
    func randomAccess(nums: [Int]) -> Int {
        // Pick a random number in the interval [0, nums.count)
        let randomIndex = nums.indices.randomElement()!
        // Get and return the randomly selected element
        let randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Access an element at a random index */
    function randomAccess(nums) {
        // Choose a random index in the interval [0, nums.length)
        const random_index = Math.floor(Math.random() * nums.length);
        // Get and return the randomly selected element
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Access an element at a random index */
    function randomAccess(nums: number[]): number {
        // Choose a random index in the interval [0, nums.length)
        const random_index = Math.floor(Math.random() * nums.length);
        // Get and return the randomly selected element
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Access an element at a random index */
    int randomAccess(List<int> nums) {
      // Choose a random index in the interval [0, nums.length)
      int randomIndex = Random().nextInt(nums.length);
      // Get and return the randomly selected element
      int randomNum = nums[randomIndex];
      return randomNum;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Access an element at a random index */
    fn random_access(nums: &[i32]) -> i32 {
        // Choose a random index in [0, nums.len())
        let random_index = rand::thread_rng().gen_range(0..nums.len());
        // Get and return the randomly selected element
        let random_num = nums[random_index];
        random_num
    }
    ```

=== "C"

    ```c title="array.c"
    /* Access an element at a random index */
    int randomAccess(int *nums, int size) {
        // Choose a random number in [0, size)
        int randomIndex = rand() % size;
        // Get and return the randomly selected element
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Access an element at a random index */
    fun randomAccess(nums: IntArray): Int {
        // Randomly select a number in [0, nums.size)
        val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
        // Get and return the randomly selected element
        val randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Access an element at a random index ###
    def random_access(nums)
      # Choose a random index in the interval [0, nums.length)
      random_index = Random.rand(0...nums.length)

      # Get and return the randomly selected element
      nums[random_index]
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Access%20an%20element%20at%20a%20random%20index%22%22%22%0A%20%20%20%20%23%20Choose%20a%20random%20number%20in%20the%20range%20%5B0,%20len%28nums%29-1%5D%0A%20%20%20%20random_index%20%3D%20random.randint%280,%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20Get%20and%20return%20the%20randomly%20selected%20element%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Random%20access%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22Randomly%20selected%20element%20from%20nums%3A%22,%20random_num%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Access%20an%20element%20at%20a%20random%20index%22%22%22%0A%20%20%20%20%23%20Choose%20a%20random%20number%20in%20the%20range%20%5B0,%20len%28nums%29-1%5D%0A%20%20%20%20random_index%20%3D%20random.randint%280,%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20Get%20and%20return%20the%20randomly%20selected%20element%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Random%20access%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22Randomly%20selected%20element%20from%20nums%3A%22,%20random_num%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 3. &nbsp; Inserting an element

Array elements sit next to one another, with no room between them for more data. As shown in Figure 4-3, inserting into the middle requires shifting every element at or after the insertion point one position toward the end, then assigning the new element at the desired index.

![Inserting an element into an array](array.assets/array_insert_element.png){ class="animation-figure" }

<p align="center"> Figure 4-3 &nbsp; Inserting an element into an array </p>

Because an array's length is fixed, inserting an element causes the last element to be lost. We will discuss the solution in the section on lists.

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """Insert element num at index `index` in the array"""
        # Shift all elements at and after index `index` one position to the right
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # Assign num to the element at index `index`
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Insert element num at index `index` in the array */
    void insert(int *nums, int size, int num, int index) {
        // Shift all elements at and after index `index` one position to the right
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Insert element num at index `index` in the array */
    void insert(int[] nums, int num, int index) {
        // Shift all elements at and after index `index` one position to the right
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Insert element num at index `index` in the array */
    void Insert(int[] nums, int num, int index) {
        // Shift all elements at and after index `index` one position to the right
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Insert element num at index `index` in the array */
    func insert(nums []int, num int, index int) {
        // Shift all elements at and after index `index` one position to the right
        for i := len(nums) - 1; i > index; i-- {
            nums[i] = nums[i-1]
        }
        // Assign num to the element at index `index`
        nums[index] = num
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Insert element num at index `index` in the array */
    func insert(nums: inout [Int], num: Int, index: Int) {
        // Shift all elements at and after index `index` one position to the right
        for i in stride(from: nums.count - 1, to: index, by: -1) {
            nums[i] = nums[i - 1]
        }
        // Assign num to the element at index `index`
        nums[index] = num
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Insert element num at index `index` in the array */
    function insert(nums, num, index) {
        // Shift all elements at and after index `index` one position to the right
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Insert element num at index `index` in the array */
    function insert(nums: number[], num: number, index: number): void {
        // Shift all elements at and after index `index` one position to the right
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Insert element _num at index in the array */
    void insert(List<int> nums, int _num, int index) {
      // Shift all elements at and after index `index` one position to the right
      for (var i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
      }
      // Assign _num to the element at index
      nums[index] = _num;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Insert element num at index `index` in the array */
    fn insert(nums: &mut [i32], num: i32, index: usize) {
        // Shift all elements at and after index `index` one position to the right
        for i in (index + 1..nums.len()).rev() {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }
    ```

=== "C"

    ```c title="array.c"
    /* Insert element num at index `index` in the array */
    void insert(int *nums, int size, int num, int index) {
        // Shift all elements at and after index `index` one position to the right
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Assign num to the element at index `index`
        nums[index] = num;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Insert element num at index `index` in the array */
    fun insert(nums: IntArray, num: Int, index: Int) {
        // Shift all elements at and after index `index` one position to the right
        for (i in nums.size - 1 downTo index + 1) {
            nums[i] = nums[i - 1]
        }
        // Assign num to the element at index `index`
        nums[index] = num
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Insert element num at index `index` in the array ###
    def insert(nums, num, index)
      # Shift all elements at and after index `index` one position to the right
      for i in (nums.length - 1).downto(index + 1)
        nums[i] = nums[i - 1]
      end

      # Assign num to the element at index `index`
      nums[index] = num
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22Insert%20element%20num%20at%20index%20%60index%60%20in%20the%20array%22%22%22%0A%20%20%20%20%23%20Shift%20all%20elements%20at%20and%20after%20index%20%60index%60%20one%20position%20to%20the%20right%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%20index,%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20Assign%20num%20to%20the%20element%20at%20index%20%60index%60%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Insert%20an%20element%0A%20%20%20%20insert%28nums,%206,%203%29%0A%20%20%20%20print%28%22Insert%20the%20number%206%20at%20index%203,%20giving%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22Insert%20element%20num%20at%20index%20%60index%60%20in%20the%20array%22%22%22%0A%20%20%20%20%23%20Shift%20all%20elements%20at%20and%20after%20index%20%60index%60%20one%20position%20to%20the%20right%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%20index,%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20Assign%20num%20to%20the%20element%20at%20index%20%60index%60%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Insert%20an%20element%0A%20%20%20%20insert%28nums,%206,%203%29%0A%20%20%20%20print%28%22Insert%20the%20number%206%20at%20index%203,%20giving%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 4. &nbsp; Removing an element

Similarly, as shown in Figure 4-4, removing the element at index $i$ requires shifting every element after $i$ one position toward the beginning.

![Removing an element from an array](array.assets/array_remove_element.png){ class="animation-figure" }

<p align="center"> Figure 4-4 &nbsp; Removing an element from an array </p>

After removal, the old final entry is no longer meaningful, so we do not need to change it explicitly.

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """Remove the element at index `index`"""
        # Shift all elements after index `index` one position to the left
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Remove the element at index `index` */
    void remove(int *nums, int size, int index) {
        // Shift all elements after index `index` one position to the left
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Remove the element at index `index` */
    void remove(int[] nums, int index) {
        // Shift all elements after index `index` one position to the left
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Remove the element at index `index` */
    void Remove(int[] nums, int index) {
        // Shift all elements after index `index` one position to the left
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Remove the element at index `index` */
    func remove(nums []int, index int) {
        // Shift all elements after index `index` one position to the left
        for i := index; i < len(nums)-1; i++ {
            nums[i] = nums[i+1]
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Remove the element at index `index` */
    func remove(nums: inout [Int], index: Int) {
        // Shift all elements after index `index` one position to the left
        for i in nums.indices.dropFirst(index).dropLast() {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Remove the element at index `index` */
    function remove(nums, index) {
        // Shift all elements after index `index` one position to the left
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Remove the element at index `index` */
    function remove(nums: number[], index: number): void {
        // Shift all elements after index `index` one position to the left
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Remove the element at index `index` */
    void remove(List<int> nums, int index) {
      // Shift all elements after index `index` one position to the left
      for (var i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
      }
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Remove the element at index `index` */
    fn remove(nums: &mut [i32], index: usize) {
        // Shift all elements after index `index` one position to the left
        for i in index..nums.len() - 1 {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* Remove the element at index `index` */
    // Note: stdio.h already declares a function named remove
    void removeItem(int *nums, int size, int index) {
        // Shift all elements after index `index` one position to the left
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Remove the element at index `index` */
    fun remove(nums: IntArray, index: Int) {
        // Shift all elements after index `index` one position to the left
        for (i in index..<nums.size - 1) {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Remove the element at index `index` ###
    def remove(nums, index)
      # Shift all elements after index `index` one position to the left
      for i in index...(nums.length - 1)
        nums[i] = nums[i + 1]
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22Remove%20the%20element%20at%20index%20%60index%60%22%22%22%0A%20%20%20%20%23%20Shift%20all%20elements%20after%20index%20%60index%60%20one%20position%20to%20the%20left%0A%20%20%20%20for%20i%20in%20range%28index,%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20remove%28nums,%202%29%0A%20%20%20%20print%28%22Remove%20the%20element%20at%20index%202,%20giving%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22Remove%20the%20element%20at%20index%20%60index%60%22%22%22%0A%20%20%20%20%23%20Shift%20all%20elements%20after%20index%20%60index%60%20one%20position%20to%20the%20left%0A%20%20%20%20for%20i%20in%20range%28index,%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20remove%28nums,%202%29%0A%20%20%20%20print%28%22Remove%20the%20element%20at%20index%202,%20giving%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Overall, inserting and removing array elements have these drawbacks.

- **High time complexity**: Both operations take $O(n)$ time on average, where $n$ is the array length.
- **Lost elements**: Since the length is fixed, insertion loses any element pushed beyond the array's bounds.
- **Wasted memory**: We can allocate a longer array and use only its beginning, so any final entries lost during insertion are unused. However, this leaves some memory wasted.

### 5. &nbsp; Traversing an array

Most programming languages let us traverse an array either by index or by visiting its elements directly:

=== "Python"

    ```python title="array.py"
    def traverse(nums: list[int]):
        """Traverse the array"""
        count = 0
        # Traverse the array by index
        for i in range(len(nums)):
            count += nums[i]
        # Iterate directly over the array elements
        for num in nums:
            count += num
        # Iterate over both the indices and the elements
        for i, num in enumerate(nums):
            count += nums[i]
            count += num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Traverse the array */
    void traverse(int *nums, int size) {
        int count = 0;
        // Traverse the array by index
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Traverse the array */
    void traverse(int[] nums) {
        int count = 0;
        // Traverse the array by index
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Iterate directly over the array elements
        for (int num : nums) {
            count += num;
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Traverse the array */
    void Traverse(int[] nums) {
        int count = 0;
        // Traverse the array by index
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Iterate directly over the array elements
        foreach (int num in nums) {
            count += num;
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Traverse the array */
    func traverse(nums []int) {
        count := 0
        // Traverse the array by index
        for i := 0; i < len(nums); i++ {
            count += nums[i]
        }
        count = 0
        // Iterate directly over the array elements
        for _, num := range nums {
            count += num
        }
        // Iterate over both the indices and the elements
        for i, num := range nums {
            count += nums[i]
            count += num
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Traverse the array */
    func traverse(nums: [Int]) {
        var count = 0
        // Traverse the array by index
        for i in nums.indices {
            count += nums[i]
        }
        // Iterate directly over the array elements
        for num in nums {
            count += num
        }
        // Iterate over both the indices and the elements
        for (i, num) in nums.enumerated() {
            count += nums[i]
            count += num
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Traverse the array */
    function traverse(nums) {
        let count = 0;
        // Traverse the array by index
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Iterate directly over the array elements
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Traverse the array */
    function traverse(nums: number[]): void {
        let count = 0;
        // Traverse the array by index
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Iterate directly over the array elements
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Traverse the array elements */
    void traverse(List<int> nums) {
      int count = 0;
      // Traverse the array by index
      for (var i = 0; i < nums.length; i++) {
        count += nums[i];
      }
      // Iterate directly over the array elements
      for (int _num in nums) {
        count += _num;
      }
      // Traverse the array using forEach
      nums.forEach((_num) {
        count += _num;
      });
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Traverse the array */
    fn traverse(nums: &[i32]) {
        let mut _count = 0;
        // Traverse the array by index
        for i in 0..nums.len() {
            _count += nums[i];
        }
        // Iterate directly over the array elements
        _count = 0;
        for &num in nums {
            _count += num;
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* Traverse the array */
    void traverse(int *nums, int size) {
        int count = 0;
        // Traverse the array by index
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Traverse the array */
    fun traverse(nums: IntArray) {
        var count = 0
        // Traverse the array by index
        for (i in nums.indices) {
            count += nums[i]
        }
        // Iterate directly over the array elements
        for (j in nums) {
            count += j
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Traverse the array ###
    def traverse(nums)
      count = 0

      # Traverse the array by index
      for i in 0...nums.length
        count += nums[i]
      end

      # Iterate directly over the array elements
      for num in nums
        count += num
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Traverse%20the%20array%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Traverse%20the%20array%20by%20index%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20Iterate%20directly%20over%20the%20array%20elements%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20Iterate%20over%20both%20the%20indices%20and%20the%20elements%0A%20%20%20%20for%20i,%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Traverse%20the%20array%0A%20%20%20%20traverse%28nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Traverse%20the%20array%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Traverse%20the%20array%20by%20index%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20Iterate%20directly%20over%20the%20array%20elements%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20Iterate%20over%20both%20the%20indices%20and%20the%20elements%0A%20%20%20%20for%20i,%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Traverse%20the%20array%0A%20%20%20%20traverse%28nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 6. &nbsp; Finding an element

To find a specified element, traverse the array and compare each value with the target. Return the index when a match is found.

Because an array is a linear data structure, this is called linear search.

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """Find a specified element in the array"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
    function find(nums, target) {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) return i;
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
    int find(List<int> nums, int target) {
      for (var i = 0; i < nums.length; i++) {
        if (nums[i] == target) return i;
      }
      return -1;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
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
    /* Find a specified element in the array */
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
    ### Find a specified element in the array ###
    def find(nums, target)
      for i in 0...nums.length
        return i if nums[i] == target
      end

      -1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20a%20specified%20element%20in%20the%20array%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Find%20an%20element%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums,%203%29%0A%20%20%20%20print%28%22Find%20element%203%20in%20nums,%20giving%20index%20%3D%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20a%20specified%20element%20in%20the%20array%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Find%20an%20element%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums,%203%29%0A%20%20%20%20print%28%22Find%20element%203%20in%20nums,%20giving%20index%20%3D%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 7. &nbsp; Expanding an array

In a complex system, a program cannot ensure that memory immediately after an array is available, so extending it in place is unsafe. Therefore, in most programming languages, **an array's length is fixed**.

To expand an array, create a larger one and copy every element into it. This takes $O(n)$ time and can be expensive for a large array. The code is as follows:

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """Extend the array length"""
        # Initialize an array with the extended length
        res = [0] * (len(nums) + enlarge)
        # Copy all elements from the original array to the new array
        for i in range(len(nums)):
            res[i] = nums[i]
        # Return the new, extended array
        return res
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Extend the array length */
    int *extend(int *nums, int size, int enlarge) {
        // Initialize an array with the extended length
        int *res = new int[size + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // Free memory
        delete[] nums;
        // Return the new, extended array
        return res;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Extend the array length */
    int[] extend(int[] nums, int enlarge) {
        // Initialize an array with the extended length
        int[] res = new int[nums.length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the new, extended array
        return res;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Extend the array length */
    int[] Extend(int[] nums, int enlarge) {
        // Initialize an array with the extended length
        int[] res = new int[nums.Length + enlarge];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Return the new, extended array
        return res;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Extend the array length */
    func extend(nums []int, enlarge int) []int {
        // Initialize an array with the extended length
        res := make([]int, len(nums)+enlarge)
        // Copy all elements from the original array to the new array
        for i, num := range nums {
            res[i] = num
        }
        // Return the new, extended array
        return res
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Extend the array length */
    func extend(nums: [Int], enlarge: Int) -> [Int] {
        // Initialize an array with the extended length
        var res = Array(repeating: 0, count: nums.count + enlarge)
        // Copy all elements from the original array to the new array
        for i in nums.indices {
            res[i] = nums[i]
        }
        // Return the new, extended array
        return res
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Extend the array length */
    // JavaScript Array is a dynamic array and can be extended directly
    // For learning purposes, this function treats Array as a fixed-length array
    function extend(nums, enlarge) {
        // Initialize an array with the extended length
        const res = new Array(nums.length + enlarge).fill(0);
        // Copy all elements from the original array to the new array
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the new, extended array
        return res;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Extend the array length */
    // Note: TypeScript Array is a dynamic array and can grow directly
    // For learning purposes, this function treats Array as a fixed-length array
    function extend(nums: number[], enlarge: number): number[] {
        // Initialize an array with the extended length
        const res = new Array(nums.length + enlarge).fill(0);
        // Copy all elements from the original array to the new array
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Return the new, extended array
        return res;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Extend the array length */
    List<int> extend(List<int> nums, int enlarge) {
      // Initialize an array with the extended length
      List<int> res = List.filled(nums.length + enlarge, 0);
      // Copy all elements from the original array to the new array
      for (var i = 0; i < nums.length; i++) {
        res[i] = nums[i];
      }
      // Return the new, extended array
      return res;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Extend the array length */
    fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
        // Initialize an array with the extended length
        let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
        // Copy all elements from the original array to the new one
        res[0..nums.len()].copy_from_slice(nums);

        // Return the new, extended array
        res
    }
    ```

=== "C"

    ```c title="array.c"
    /* Extend the array length */
    int *extend(int *nums, int size, int enlarge) {
        // Initialize an array with the extended length
        int *res = (int *)malloc(sizeof(int) * (size + enlarge));
        // Copy all elements from the original array to the new array
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // Initialize the newly added space
        for (int i = size; i < size + enlarge; i++) {
            res[i] = 0;
        }
        // Return the new, extended array
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Extend the array length */
    fun extend(nums: IntArray, enlarge: Int): IntArray {
        // Initialize an array with the extended length
        val res = IntArray(nums.size + enlarge)
        // Copy all elements from the original array to the new array
        for (i in nums.indices) {
            res[i] = nums[i]
        }
        // Return the new, extended array
        return res
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Extend the array length ###
    # Ruby Array is a dynamic array that can grow directly
    # For learning purposes, this function treats Array as a fixed-length array
    def extend(nums, enlarge)
      # Initialize an array with the extended length
      res = Array.new(nums.length + enlarge, 0)

      # Copy all elements from the original array to the new array
      for i in 0...nums.length
        res[i] = nums[i]
      end

      # Return the new, extended array
      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%23%20Note%20that%20a%20Python%20list%20is%20a%20dynamic%20array%20and%20can%20be%20extended%20directly%0A%23%20For%20learning%20purposes,%20this%20function%20treats%20a%20list%20as%20a%20fixed-length%20array%0Adef%20extend%28nums%3A%20list%5Bint%5D,%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22Extend%20the%20array%20length%22%22%22%0A%20%20%20%20%23%20Initialize%20an%20array%20with%20the%20extended%20length%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20Copy%20all%20elements%20from%20the%20original%20array%20to%20the%20new%20array%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20Return%20the%20new,%20extended%20array%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Extend%20the%20length%0A%20%20%20%20nums%20%3D%20extend%28nums,%203%29%0A%20%20%20%20print%28%22Extend%20the%20array%20length%20to%208,%20giving%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20Note%20that%20a%20Python%20list%20is%20a%20dynamic%20array%20and%20can%20be%20extended%20directly%0A%23%20For%20learning%20purposes,%20this%20function%20treats%20a%20list%20as%20a%20fixed-length%20array%0Adef%20extend%28nums%3A%20list%5Bint%5D,%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22Extend%20the%20array%20length%22%22%22%0A%20%20%20%20%23%20Initialize%20an%20array%20with%20the%20extended%20length%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20Copy%20all%20elements%20from%20the%20original%20array%20to%20the%20new%20array%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20Return%20the%20new,%20extended%20array%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20array%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22Array%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20Extend%20the%20length%0A%20%20%20%20nums%20%3D%20extend%28nums,%203%29%0A%20%20%20%20print%28%22Extend%20the%20array%20length%20to%208,%20giving%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 4.1.2 &nbsp; Strengths and limitations of arrays

An array stores elements of one type in contiguous memory. These known properties give the system opportunities to optimize operations.

- **Space efficiency**: Data occupies a contiguous block with no extra structural overhead.
- **Random access**: Any element can be accessed in $O(1)$ time.
- **Cache locality**: Accessing an element loads not only that element but also nearby data into the cache, speeding up later operations.

Contiguous storage also has limitations.

- **Slow insertion and deletion**: With many elements, these operations require substantial shifting.
- **Fixed length**: Once initialized, an array cannot change length; expansion requires copying all data into a new array.
- **Wasted space**: Any allocated space beyond actual needs is unused.

## 4.1.3 &nbsp; Typical applications of arrays

Arrays are fundamental, widely used data structures. They appear throughout algorithms and underpin more complex structures.

- **Random access**: To draw random samples, store data in an array and generate random indices to select elements.
- **Sorting and searching**: Arrays are the most common structures for these algorithms. Quick sort, merge sort, and binary search operate primarily on arrays.
- **Lookup tables**: An array can provide fast access to an element or a mapping. For example, a character-to-ASCII mapping can use a character's ASCII value as an index and store its corresponding element there.
- **Machine learning**: Neural networks make extensive use of linear algebra on vectors, matrices, and tensors, all built from arrays. Arrays are the most common data structure in neural network programming.
- **Implementing data structures**: Arrays can implement stacks, queues, hash tables, heaps, graphs, and more. A graph's adjacency matrix, for example, is a two-dimensional array.
