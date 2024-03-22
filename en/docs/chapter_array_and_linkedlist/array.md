---
comments: true
---

# 4.1 &nbsp; Arrays

An "array" is a linear data structure that operates as a lineup of similar items, stored together in a computer's memory in contiguous spaces. It's like a sequence that maintains organized storage. Each item in this lineup has its unique 'spot' known as an "index". Please refer to the Figure 4-1  to observe how arrays work and grasp these key terms.

![Array Definition and Storage Method](array.assets/array_definition.png){ class="animation-figure" }

<p align="center"> Figure 4-1 &nbsp; Array Definition and Storage Method </p>

## 4.1.1 &nbsp; Common Operations on Arrays

### 1. &nbsp; Initializing Arrays

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

=== "Zig"

    ```zig title="array.zig"
    // Initialize array
    var arr = [_]i32{0} ** 5; // { 0, 0, 0, 0, 0 }
    var nums = [_]i32{ 1, 3, 2, 5, 4 };
    ```

### 2. &nbsp; Accessing Elements

Elements in an array are stored in contiguous memory spaces, making it simpler to compute each element's memory address. The formula shown in the Figure below aids in determining an element's memory address, utilizing the array's memory address (specifically, the first element's address) and the element's index. This computation streamlines direct access to the desired element.

![Memory Address Calculation for Array Elements](array.assets/array_memory_location_calculation.png){ class="animation-figure" }

<p align="center"> Figure 4-2 &nbsp; Memory Address Calculation for Array Elements </p>

As observed in the above illustration, array indexing conventionally begins at $0$. While this might appear counterintuitive, considering counting usually starts at $1$, within the address calculation formula, **an index is essentially an offset from the memory address**. For the first element's address, this offset is $0$, validating its index as $0$.

Accessing elements in an array is highly efficient, allowing us to randomly access any element in $O(1)$ time.

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """随机访问元素"""
        # 在区间 [0, len(nums)-1] 中随机抽取一个数字
        random_index = random.randint(0, len(nums) - 1)
        # 获取并返回随机元素
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 随机访问元素 */
    int randomAccess(int *nums, int size) {
        // 在区间 [0, size) 中随机抽取一个数字
        int randomIndex = rand() % size;
        // 获取并返回随机元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 随机访问元素 */
    int randomAccess(int[] nums) {
        // 在区间 [0, nums.length) 中随机抽取一个数字
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // 获取并返回随机元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 随机访问元素 */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 在区间 [0, nums.Length) 中随机抽取一个数字
        int randomIndex = random.Next(nums.Length);
        // 获取并返回随机元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 随机访问元素 */
    func randomAccess(nums []int) (randomNum int) {
        // 在区间 [0, nums.length) 中随机抽取一个数字
        randomIndex := rand.Intn(len(nums))
        // 获取并返回随机元素
        randomNum = nums[randomIndex]
        return
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 随机访问元素 */
    func randomAccess(nums: [Int]) -> Int {
        // 在区间 [0, nums.count) 中随机抽取一个数字
        let randomIndex = nums.indices.randomElement()!
        // 获取并返回随机元素
        let randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 随机访问元素 */
    function randomAccess(nums) {
        // 在区间 [0, nums.length) 中随机抽取一个数字
        const random_index = Math.floor(Math.random() * nums.length);
        // 获取并返回随机元素
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 随机访问元素 */
    function randomAccess(nums: number[]): number {
        // 在区间 [0, nums.length) 中随机抽取一个数字
        const random_index = Math.floor(Math.random() * nums.length);
        // 获取并返回随机元素
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 随机访问元素 */
    int randomAccess(List<int> nums) {
      // 在区间 [0, nums.length) 中随机抽取一个数字
      int randomIndex = Random().nextInt(nums.length);
      // 获取并返回随机元素
      int randomNum = nums[randomIndex];
      return randomNum;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 随机访问元素 */
    fn random_access(nums: &[i32]) -> i32 {
        // 在区间 [0, nums.len()) 中随机抽取一个数字
        let random_index = rand::thread_rng().gen_range(0..nums.len());
        // 获取并返回随机元素
        let random_num = nums[random_index];
        random_num
    }
    ```

=== "C"

    ```c title="array.c"
    /* 随机访问元素 */
    int randomAccess(int *nums, int size) {
        // 在区间 [0, size) 中随机抽取一个数字
        int randomIndex = rand() % size;
        // 获取并返回随机元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Zig"

    ```zig title="array.zig"
    // 随机访问元素
    fn randomAccess(nums: []i32) i32 {
        // 在区间 [0, nums.len) 中随机抽取一个整数
        var randomIndex = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
        // 获取并返回随机元素
        var randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8F%E6%9C%BA%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5B0,%20len%28nums%29-1%5D%20%E4%B8%AD%E9%9A%8F%E6%9C%BA%E6%8A%BD%E5%8F%96%E4%B8%80%E4%B8%AA%E6%95%B0%E5%AD%97%0A%20%20%20%20random_index%20%3D%20random.randint%280,%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%B9%B6%E8%BF%94%E5%9B%9E%E9%9A%8F%E6%9C%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%9A%8F%E6%9C%BA%E8%AE%BF%E9%97%AE%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%E5%9C%A8%20nums%20%E4%B8%AD%E8%8E%B7%E5%8F%96%E9%9A%8F%E6%9C%BA%E5%85%83%E7%B4%A0%22,%20random_num%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8F%E6%9C%BA%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5B0,%20len%28nums%29-1%5D%20%E4%B8%AD%E9%9A%8F%E6%9C%BA%E6%8A%BD%E5%8F%96%E4%B8%80%E4%B8%AA%E6%95%B0%E5%AD%97%0A%20%20%20%20random_index%20%3D%20random.randint%280,%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%B9%B6%E8%BF%94%E5%9B%9E%E9%9A%8F%E6%9C%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%9A%8F%E6%9C%BA%E8%AE%BF%E9%97%AE%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%E5%9C%A8%20nums%20%E4%B8%AD%E8%8E%B7%E5%8F%96%E9%9A%8F%E6%9C%BA%E5%85%83%E7%B4%A0%22,%20random_num%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 3. &nbsp; Inserting Elements

Array elements are tightly packed in memory, with no space available to accommodate additional data between them. Illustrated in Figure below, inserting an element in the middle of an array requires shifting all subsequent elements back by one position to create room for the new element.

![Array Element Insertion Example](array.assets/array_insert_element.png){ class="animation-figure" }

<p align="center"> Figure 4-3 &nbsp; Array Element Insertion Example </p>

It's important to note that due to the fixed length of an array, inserting an element will unavoidably result in the loss of the last element in the array. Solutions to address this issue will be explored in the "List" chapter.

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """在数组的索引 index 处插入元素 num"""
        # 把索引 index 以及之后的所有元素向后移动一位
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # 将 num 赋给 index 处的元素
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 在数组的索引 index 处插入元素 num */
    void insert(int *nums, int size, int num, int index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 在数组的索引 index 处插入元素 num */
    void insert(int[] nums, int num, int index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 在数组的索引 index 处插入元素 num */
    void Insert(int[] nums, int num, int index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 在数组的索引 index 处插入元素 num */
    func insert(nums []int, num int, index int) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for i := len(nums) - 1; i > index; i-- {
            nums[i] = nums[i-1]
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 在数组的索引 index 处插入元素 num */
    func insert(nums: inout [Int], num: Int, index: Int) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for i in nums.indices.dropFirst(index).reversed() {
            nums[i] = nums[i - 1]
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 在数组的索引 index 处插入元素 num */
    function insert(nums, num, index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 在数组的索引 index 处插入元素 num */
    function insert(nums: number[], num: number, index: number): void {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 在数组的索引 index 处插入元素 _num */
    void insert(List<int> nums, int _num, int index) {
      // 把索引 index 以及之后的所有元素向后移动一位
      for (var i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
      }
      // 将 _num 赋给 index 处元素
      nums[index] = _num;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 在数组的索引 index 处插入元素 num */
    fn insert(nums: &mut Vec<i32>, num: i32, index: usize) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for i in (index + 1..nums.len()).rev() {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

=== "C"

    ```c title="array.c"
    /* 在数组的索引 index 处插入元素 num */
    void insert(int *nums, int size, int num, int index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

=== "Zig"

    ```zig title="array.zig"
    // 在数组的索引 index 处插入元素 num
    fn insert(nums: []i32, num: i32, index: usize) void {
        // 把索引 index 以及之后的所有元素向后移动一位
        var i = nums.len - 1;
        while (i > index) : (i -= 1) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E6%95%B0%E7%BB%84%E7%9A%84%E7%B4%A2%E5%BC%95%20index%20%E5%A4%84%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%20num%22%22%22%0A%20%20%20%20%23%20%E6%8A%8A%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%90%8E%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%90%91%E5%90%8E%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%20index,%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E5%B0%86%20num%20%E8%B5%8B%E7%BB%99%20index%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20insert%28nums,%206,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%20%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E6%95%B0%E7%BB%84%E7%9A%84%E7%B4%A2%E5%BC%95%20index%20%E5%A4%84%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%20num%22%22%22%0A%20%20%20%20%23%20%E6%8A%8A%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%90%8E%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%90%91%E5%90%8E%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%20index,%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E5%B0%86%20num%20%E8%B5%8B%E7%BB%99%20index%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20insert%28nums,%206,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%20%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 4. &nbsp; Deleting Elements

Similarly, as depicted in the Figure 4-4 , to delete an element at index $i$, all elements following index $i$ must be moved forward by one position.

![Array Element Deletion Example](array.assets/array_remove_element.png){ class="animation-figure" }

<p align="center"> Figure 4-4 &nbsp; Array Element Deletion Example </p>

Please note that after deletion, the former last element becomes "meaningless," hence requiring no specific modification.

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """删除索引 index 处的元素"""
        # 把索引 index 之后的所有元素向前移动一位
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 删除索引 index 处的元素 */
    void remove(int *nums, int size, int index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 删除索引 index 处的元素 */
    void remove(int[] nums, int index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 删除索引 index 处的元素 */
    void Remove(int[] nums, int index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 删除索引 index 处的元素 */
    func remove(nums []int, index int) {
        // 把索引 index 之后的所有元素向前移动一位
        for i := index; i < len(nums)-1; i++ {
            nums[i] = nums[i+1]
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 删除索引 index 处的元素 */
    func remove(nums: inout [Int], index: Int) {
        // 把索引 index 之后的所有元素向前移动一位
        for i in nums.indices.dropFirst(index).dropLast() {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 删除索引 index 处的元素 */
    function remove(nums, index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 删除索引 index 处的元素 */
    function remove(nums: number[], index: number): void {
        // 把索引 index 之后的所有元素向前移动一位
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 删除索引 index 处的元素 */
    void remove(List<int> nums, int index) {
      // 把索引 index 之后的所有元素向前移动一位
      for (var i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
      }
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 删除索引 index 处的元素 */
    fn remove(nums: &mut Vec<i32>, index: usize) {
        // 把索引 index 之后的所有元素向前移动一位
        for i in index..nums.len() - 1 {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* 删除索引 index 处的元素 */
    // 注意：stdio.h 占用了 remove 关键词
    void removeItem(int *nums, int size, int index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Zig"

    ```zig title="array.zig"
    // 删除索引 index 处的元素
    fn remove(nums: []i32, index: usize) void {
        // 把索引 index 之后的所有元素向前移动一位
        var i = index;
        while (i < nums.len - 1) : (i += 1) {
            nums[i] = nums[i + 1];
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E6%8A%8A%E7%B4%A2%E5%BC%95%20index%20%E4%B9%8B%E5%90%8E%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%90%91%E5%89%8D%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20for%20i%20in%20range%28index,%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20remove%28nums,%202%29%0A%20%20%20%20print%28%22%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%202%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E6%8A%8A%E7%B4%A2%E5%BC%95%20index%20%E4%B9%8B%E5%90%8E%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%90%91%E5%89%8D%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20for%20i%20in%20range%28index,%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20remove%28nums,%202%29%0A%20%20%20%20print%28%22%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%202%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

In summary, the insertion and deletion operations in arrays present the following disadvantages:

- **High Time Complexity**: Both insertion and deletion in an array have an average time complexity of $O(n)$, where $n$ is the length of the array.
- **Loss of Elements**: Due to the fixed length of arrays, elements that exceed the array's capacity are lost during insertion.
- **Waste of Memory**: Initializing a longer array and utilizing only the front part results in "meaningless" end elements during insertion, leading to some wasted memory space.

### 5. &nbsp; Traversing Arrays

In most programming languages, we can traverse an array either by using indices or by directly iterating over each element:

=== "Python"

    ```python title="array.py"
    def traverse(nums: list[int]):
        """遍历数组"""
        count = 0
        # 通过索引遍历数组
        for i in range(len(nums)):
            count += nums[i]
        # 直接遍历数组元素
        for num in nums:
            count += num
        # 同时遍历数据索引和元素
        for i, num in enumerate(nums):
            count += nums[i]
            count += num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 遍历数组 */
    void traverse(int *nums, int size) {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 遍历数组 */
    void traverse(int[] nums) {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接遍历数组元素
        for (int num : nums) {
            count += num;
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 遍历数组 */
    void Traverse(int[] nums) {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 直接遍历数组元素
        foreach (int num in nums) {
            count += num;
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 遍历数组 */
    func traverse(nums []int) {
        count := 0
        // 通过索引遍历数组
        for i := 0; i < len(nums); i++ {
            count += nums[i]
        }
        count = 0
        // 直接遍历数组元素
        for _, num := range nums {
            count += num
        }
        // 同时遍历数据索引和元素
        for i, num := range nums {
            count += nums[i]
            count += num
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 遍历数组 */
    func traverse(nums: [Int]) {
        var count = 0
        // 通过索引遍历数组
        for i in nums.indices {
            count += nums[i]
        }
        // 直接遍历数组元素
        for num in nums {
            count += num
        }
        // 同时遍历数据索引和元素
        for (i, num) in nums.enumerated() {
            count += nums[i]
            count += num
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 遍历数组 */
    function traverse(nums) {
        let count = 0;
        // 通过索引遍历数组
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接遍历数组元素
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 遍历数组 */
    function traverse(nums: number[]): void {
        let count = 0;
        // 通过索引遍历数组
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接遍历数组元素
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 遍历数组元素 */
    void traverse(List<int> nums) {
      int count = 0;
      // 通过索引遍历数组
      for (var i = 0; i < nums.length; i++) {
        count += nums[i];
      }
      // 直接遍历数组元素
      for (int _num in nums) {
        count += _num;
      }
      // 通过 forEach 方法遍历数组
      nums.forEach((_num) {
        count += _num;
      });
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 遍历数组 */
    fn traverse(nums: &[i32]) {
        let mut _count = 0;
        // 通过索引遍历数组
        for i in 0..nums.len() {
            _count += nums[i];
        }
        // 直接遍历数组元素
        for num in nums {
            _count += num;
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* 遍历数组 */
    void traverse(int *nums, int size) {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Zig"

    ```zig title="array.zig"
    // 遍历数组
    fn traverse(nums: []i32) void {
        var count: i32 = 0;
        // 通过索引遍历数组
        var i: i32 = 0;
        while (i < nums.len) : (i += 1) {
            count += nums[i];
        }
        count = 0;
        // 直接遍历数组元素
        for (nums) |num| {
            count += num;
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%E5%90%8C%E6%97%B6%E9%81%8D%E5%8E%86%E6%95%B0%E6%8D%AE%E7%B4%A2%E5%BC%95%E5%92%8C%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i,%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%0A%20%20%20%20traverse%28nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%E5%90%8C%E6%97%B6%E9%81%8D%E5%8E%86%E6%95%B0%E6%8D%AE%E7%B4%A2%E5%BC%95%E5%92%8C%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i,%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%0A%20%20%20%20traverse%28nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 6. &nbsp; Finding Elements

Locating a specific element within an array involves iterating through the array, checking each element to determine if it matches the desired value.

Because arrays are linear data structures, this operation is commonly referred to as "linear search."

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """在数组中查找指定元素"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 在数组中查找指定元素 */
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
    /* 在数组中查找指定元素 */
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
    /* 在数组中查找指定元素 */
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
    /* 在数组中查找指定元素 */
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
    /* 在数组中查找指定元素 */
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
    /* 在数组中查找指定元素 */
    function find(nums, target) {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) return i;
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 在数组中查找指定元素 */
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
    /* 在数组中查找指定元素 */
    int find(List<int> nums, int target) {
      for (var i = 0; i < nums.length; i++) {
        if (nums[i] == target) return i;
      }
      return -1;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 在数组中查找指定元素 */
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
    /* 在数组中查找指定元素 */
    int find(int *nums, int size, int target) {
        for (int i = 0; i < size; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Zig"

    ```zig title="array.zig"
    // 在数组中查找指定元素
    fn find(nums: []i32, target: i32) i32 {
        for (nums, 0..) |num, i| {
            if (num == target) return @intCast(i);
        }
        return -1;
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E6%95%B0%E7%BB%84%E4%B8%AD%E6%9F%A5%E6%89%BE%E6%8C%87%E5%AE%9A%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E6%89%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%20nums%20%E4%B8%AD%E6%9F%A5%E6%89%BE%E5%85%83%E7%B4%A0%203%20%EF%BC%8C%E5%BE%97%E5%88%B0%E7%B4%A2%E5%BC%95%20%3D%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E6%95%B0%E7%BB%84%E4%B8%AD%E6%9F%A5%E6%89%BE%E6%8C%87%E5%AE%9A%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E6%89%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%20nums%20%E4%B8%AD%E6%9F%A5%E6%89%BE%E5%85%83%E7%B4%A0%203%20%EF%BC%8C%E5%BE%97%E5%88%B0%E7%B4%A2%E5%BC%95%20%3D%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 7. &nbsp; Expanding Arrays

In complex system environments, ensuring the availability of memory space after an array for safe capacity extension becomes challenging. Consequently, in most programming languages, **the length of an array is immutable**.

To expand an array,  it's necessary to create a larger array and then copy the elements from the original array. This operation has a time complexity of $O(n)$ and can be time-consuming for large arrays. The code are as follows:

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """扩展数组长度"""
        # 初始化一个扩展长度后的数组
        res = [0] * (len(nums) + enlarge)
        # 将原数组中的所有元素复制到新数组
        for i in range(len(nums)):
            res[i] = nums[i]
        # 返回扩展后的新数组
        return res
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 扩展数组长度 */
    int *extend(int *nums, int size, int enlarge) {
        // 初始化一个扩展长度后的数组
        int *res = new int[size + enlarge];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // 释放内存
        delete[] nums;
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 扩展数组长度 */
    int[] extend(int[] nums, int enlarge) {
        // 初始化一个扩展长度后的数组
        int[] res = new int[nums.length + enlarge];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 扩展数组长度 */
    int[] Extend(int[] nums, int enlarge) {
        // 初始化一个扩展长度后的数组
        int[] res = new int[nums.Length + enlarge];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 扩展数组长度 */
    func extend(nums []int, enlarge int) []int {
        // 初始化一个扩展长度后的数组
        res := make([]int, len(nums)+enlarge)
        // 将原数组中的所有元素复制到新数组
        for i, num := range nums {
            res[i] = num
        }
        // 返回扩展后的新数组
        return res
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 扩展数组长度 */
    func extend(nums: [Int], enlarge: Int) -> [Int] {
        // 初始化一个扩展长度后的数组
        var res = Array(repeating: 0, count: nums.count + enlarge)
        // 将原数组中的所有元素复制到新数组
        for i in nums.indices {
            res[i] = nums[i]
        }
        // 返回扩展后的新数组
        return res
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 扩展数组长度 */
    // 请注意，JavaScript 的 Array 是动态数组，可以直接扩展
    // 为了方便学习，本函数将 Array 看作长度不可变的数组
    function extend(nums, enlarge) {
        // 初始化一个扩展长度后的数组
        const res = new Array(nums.length + enlarge).fill(0);
        // 将原数组中的所有元素复制到新数组
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 扩展数组长度 */
    // 请注意，TypeScript 的 Array 是动态数组，可以直接扩展
    // 为了方便学习，本函数将 Array 看作长度不可变的数组
    function extend(nums: number[], enlarge: number): number[] {
        // 初始化一个扩展长度后的数组
        const res = new Array(nums.length + enlarge).fill(0);
        // 将原数组中的所有元素复制到新数组
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 扩展数组长度 */
    List<int> extend(List<int> nums, int enlarge) {
      // 初始化一个扩展长度后的数组
      List<int> res = List.filled(nums.length + enlarge, 0);
      // 将原数组中的所有元素复制到新数组
      for (var i = 0; i < nums.length; i++) {
        res[i] = nums[i];
      }
      // 返回扩展后的新数组
      return res;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 扩展数组长度 */
    fn extend(nums: Vec<i32>, enlarge: usize) -> Vec<i32> {
        // 初始化一个扩展长度后的数组
        let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
        // 将原数组中的所有元素复制到新
        for i in 0..nums.len() {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        res
    }
    ```

=== "C"

    ```c title="array.c"
    /* 扩展数组长度 */
    int *extend(int *nums, int size, int enlarge) {
        // 初始化一个扩展长度后的数组
        int *res = (int *)malloc(sizeof(int) * (size + enlarge));
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // 初始化扩展后的空间
        for (int i = size; i < size + enlarge; i++) {
            res[i] = 0;
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "Zig"

    ```zig title="array.zig"
    // 扩展数组长度
    fn extend(mem_allocator: std.mem.Allocator, nums: []i32, enlarge: usize) ![]i32 {
        // 初始化一个扩展长度后的数组
        var res = try mem_allocator.alloc(i32, nums.len + enlarge);
        @memset(res, 0);
        // 将原数组中的所有元素复制到新数组
        std.mem.copy(i32, res, nums);
        // 返回扩展后的新数组
        return res;
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%23%20%E8%AF%B7%E6%B3%A8%E6%84%8F%EF%BC%8CPython%20%E7%9A%84%20list%20%E6%98%AF%E5%8A%A8%E6%80%81%E6%95%B0%E7%BB%84%EF%BC%8C%E5%8F%AF%E4%BB%A5%E7%9B%B4%E6%8E%A5%E6%89%A9%E5%B1%95%0A%23%20%E4%B8%BA%E4%BA%86%E6%96%B9%E4%BE%BF%E5%AD%A6%E4%B9%A0%EF%BC%8C%E6%9C%AC%E5%87%BD%E6%95%B0%E5%B0%86%20list%20%E7%9C%8B%E4%BD%9C%E9%95%BF%E5%BA%A6%E4%B8%8D%E5%8F%AF%E5%8F%98%E7%9A%84%E6%95%B0%E7%BB%84%0Adef%20extend%28nums%3A%20list%5Bint%5D,%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%89%A9%E5%B1%95%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%80%E4%B8%AA%E6%89%A9%E5%B1%95%E9%95%BF%E5%BA%A6%E5%90%8E%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%E5%B0%86%E5%8E%9F%E6%95%B0%E7%BB%84%E4%B8%AD%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%88%B0%E6%96%B0%E6%95%B0%E7%BB%84%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%89%A9%E5%B1%95%E5%90%8E%E7%9A%84%E6%96%B0%E6%95%B0%E7%BB%84%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%95%BF%E5%BA%A6%E6%89%A9%E5%B1%95%0A%20%20%20%20nums%20%3D%20extend%28nums,%203%29%0A%20%20%20%20print%28%22%E5%B0%86%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E6%89%A9%E5%B1%95%E8%87%B3%208%20%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20%E8%AF%B7%E6%B3%A8%E6%84%8F%EF%BC%8CPython%20%E7%9A%84%20list%20%E6%98%AF%E5%8A%A8%E6%80%81%E6%95%B0%E7%BB%84%EF%BC%8C%E5%8F%AF%E4%BB%A5%E7%9B%B4%E6%8E%A5%E6%89%A9%E5%B1%95%0A%23%20%E4%B8%BA%E4%BA%86%E6%96%B9%E4%BE%BF%E5%AD%A6%E4%B9%A0%EF%BC%8C%E6%9C%AC%E5%87%BD%E6%95%B0%E5%B0%86%20list%20%E7%9C%8B%E4%BD%9C%E9%95%BF%E5%BA%A6%E4%B8%8D%E5%8F%AF%E5%8F%98%E7%9A%84%E6%95%B0%E7%BB%84%0Adef%20extend%28nums%3A%20list%5Bint%5D,%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%89%A9%E5%B1%95%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%80%E4%B8%AA%E6%89%A9%E5%B1%95%E9%95%BF%E5%BA%A6%E5%90%8E%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%E5%B0%86%E5%8E%9F%E6%95%B0%E7%BB%84%E4%B8%AD%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%88%B0%E6%96%B0%E6%95%B0%E7%BB%84%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%89%A9%E5%B1%95%E5%90%8E%E7%9A%84%E6%96%B0%E6%95%B0%E7%BB%84%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E6%95%B0%E7%BB%84%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%95%BF%E5%BA%A6%E6%89%A9%E5%B1%95%0A%20%20%20%20nums%20%3D%20extend%28nums,%203%29%0A%20%20%20%20print%28%22%E5%B0%86%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E6%89%A9%E5%B1%95%E8%87%B3%208%20%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 4.1.2 &nbsp; Advantages and Limitations of Arrays

Arrays are stored in contiguous memory spaces and consist of elements of the same type. This approach provides substantial prior information that systems can leverage to optimize the efficiency of data structure operations.

- **High Space Efficiency**: Arrays allocate a contiguous block of memory for data, eliminating the need for additional structural overhead.
- **Support for Random Access**: Arrays allow $O(1)$ time access to any element.
- **Cache Locality**: When accessing array elements, the computer not only loads them but also caches the surrounding data, utilizing high-speed cache to enchance subsequent operation speeds.

However, continuous space storage is a double-edged sword, with the following limitations:

- **Low Efficiency in Insertion and Deletion**: As arrays accumulate many elements, inserting or deleting elements requires shifting a large number of elements.
- **Fixed Length**: The length of an array is fixed after initialization. Expanding an array requires copying all data to a new array, incurring significant costs.
- **Space Wastage**: If the allocated array size exceeds the what is necessary, the extra space is wasted.

## 4.1.3 &nbsp; Typical Applications of Arrays

Arrays are fundamental and widely used data structures. They find frequent application in various algorithms and serve in the implementation of complex data structures.

- **Random Access**: Arrays are ideal for storing data when random sampling is required. By generating a random sequence based on indices, we can achieve random sampling efficiently.
- **Sorting and Searching**: Arrays are the most commonly used data structure for sorting and searching algorithms.  Techniques like quick sort, merge sort, binary search, etc., are primarily operate on arrays.
- **Lookup Tables**: Arrays serve as efficient lookup tables for quick element or relationship retrieval. For instance, mapping characters to ASCII codes becomes seamless by using the ASCII code values as indices and storing corresponding elements in the array.
- **Machine Learning**: Within the domain of neural networks, arrays play a pivotal role in executing crucial linear algebra operations involving vectors, matrices, and tensors. Arrays serve as the primary and most extensively used data structure in neural network programming.
- **Data Structure Implementation**:  Arrays serve as the building blocks for implementing various data structures like stacks, queues, hash tables, heaps, graphs, etc. For instance, the adjacency matrix representation of a graph is essentially a two-dimensional array.
