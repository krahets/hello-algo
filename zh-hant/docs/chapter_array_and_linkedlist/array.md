---
comments: true
---

# 4.1 &nbsp; 陣列

<u>陣列（array）</u>是一種線性資料結構，會將型別相同的元素存放在連續的記憶體空間中。元素在陣列中的位置稱為該元素的<u>索引（index）</u>。圖 4-1 呈現陣列的主要概念與儲存方式。

![陣列的定義與儲存方式](array.assets/array_definition.svg){ class="animation-figure" }

<p align="center"> 圖 4-1 &nbsp; 陣列的定義與儲存方式 </p>

## 4.1.1 &nbsp; 陣列的常見操作

### 1. &nbsp; 初始化陣列

我們可以依需要選擇兩種方式初始化陣列：不指定初始值，或給定初始值。若未指定初始值，多數程式語言會將陣列元素初始化為 $0$：

=== "Python"

    ```python title="array.py"
    # 初始化陣列
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 初始化陣列 */
    // 儲存在堆疊上
    int arr[5] = {};
    int nums[5] = {1, 3, 2, 5, 4};
    // 儲存在堆積上（需要手動釋放空間）
    int *arr1 = new int[5]{};
    int *nums1 = new int[5]{1, 3, 2, 5, 4};
    ```

=== "Java"

    ```java title="array.java"
    /* 初始化陣列 */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    // 初始化陣列
    int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
    int[] nums = [1, 3, 2, 5, 4];
    ```

=== "Go"

    ```go title="array.go"
    /* 初始化陣列 */
    var arr [5]int
    // 在 Go 中，指定長度時（[5]int）是陣列，未指定長度時（[]int）是切片
    // Go 陣列的長度必須在編譯時確定，因此只能用常數指定長度
    // 為了方便實作擴充容量的 extend() 函式，以下將切片（Slice）視為陣列（Array）
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 初始化陣列 */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="array.js"
    /* 初始化陣列 */
    const arr = new Array(5).fill(0);
    let nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 初始化陣列 */
    const arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 初始化陣列 */
    var arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 初始化陣列 */
    let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
    // 在 Rust 中，指定長度時（[i32; 5]）是陣列，未指定長度時（&[i32]）是切片
    // Rust 陣列的長度必須在編譯時確定，因此只能用常數指定長度
    // Rust 通常使用 Vector 型別來表示動態陣列
    // 為了方便實作擴充容量的 extend() 方法，以下將 vector 視為陣列（array）
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    /* 初始化陣列 */
    int arr[5] = {0}; // { 0, 0, 0, 0, 0 }
    int nums[] = {1, 3, 2, 5, 4};
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* 初始化陣列 */
    val arr = IntArray(5) // { 0, 0, 0, 0, 0 }
    var nums = intArrayOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="array.rb"
    # 初始化陣列
    arr = Array.new(5, 0)
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 243px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200,%200,%200,%200,%200%20%5D%0Anums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200,%200,%200,%200,%200%20%5D%0Anums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 存取元素

陣列元素連續存放在記憶體中，因此很容易算出各元素的記憶體位址。只要知道陣列的起始位址（也就是第一個元素的記憶體位址）和目標元素的索引，就能用圖 4-2 的公式算出該元素的記憶體位址，直接存取它。

![計算陣列元素的記憶體位址](array.assets/array_memory_location_calculation.svg){ class="animation-figure" }

<p align="center"> 圖 4-2 &nbsp; 計算陣列元素的記憶體位址 </p>

從圖 4-2 可以看出，陣列中第一個元素的索引是 $0$。這乍看有些不合直覺，因為我們通常習慣從 $1$ 開始數。但從位址公式來看，**索引本質上代表記憶體位址的偏移量**。第一個元素的位址偏移量為 $0$，因此索引為 $0$ 很合理。

存取陣列元素非常有效率。對陣列中的任一元素，我們都能在 $O(1)$ 時間內隨機存取。

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """隨機存取元素"""
        # 從區間 [0, len(nums)-1] 隨機選取一個數
        random_index = random.randint(0, len(nums) - 1)
        # 取得並回傳隨機選出的元素
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 隨機存取元素 */
    int randomAccess(int *nums, int size) {
        // 從區間 [0, size) 隨機選取一個數
        int randomIndex = rand() % size;
        // 取得並回傳隨機選出的元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 隨機存取元素 */
    int randomAccess(int[] nums) {
        // 從區間 [0, nums.length) 隨機選取一個數
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // 取得並回傳隨機選出的元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 隨機存取元素 */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 從區間 [0, nums.Length) 隨機選取一個數
        int randomIndex = random.Next(nums.Length);
        // 取得並回傳隨機選出的元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 隨機存取元素 */
    func randomAccess(nums []int) (randomNum int) {
        // 從區間 [0, nums.length) 隨機選取一個數
        randomIndex := rand.Intn(len(nums))
        // 取得並回傳隨機選出的元素
        randomNum = nums[randomIndex]
        return
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 隨機存取元素 */
    func randomAccess(nums: [Int]) -> Int {
        // 從區間 [0, nums.count) 隨機選取一個數
        let randomIndex = nums.indices.randomElement()!
        // 取得並回傳隨機選出的元素
        let randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 隨機存取元素 */
    function randomAccess(nums) {
        // 從區間 [0, nums.length) 隨機選取一個數
        const random_index = Math.floor(Math.random() * nums.length);
        // 取得並回傳隨機選出的元素
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 隨機存取元素 */
    function randomAccess(nums: number[]): number {
        // 從區間 [0, nums.length) 隨機選取一個數
        const random_index = Math.floor(Math.random() * nums.length);
        // 取得並回傳隨機選出的元素
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 隨機存取元素 */
    int randomAccess(List<int> nums) {
      // 從區間 [0, nums.length) 隨機選取一個數
      int randomIndex = Random().nextInt(nums.length);
      // 取得並回傳隨機選出的元素
      int randomNum = nums[randomIndex];
      return randomNum;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 隨機存取元素 */
    fn random_access(nums: &[i32]) -> i32 {
        // 從區間 [0, nums.len()) 隨機選取一個數
        let random_index = rand::thread_rng().gen_range(0..nums.len());
        // 取得並回傳隨機選出的元素
        let random_num = nums[random_index];
        random_num
    }
    ```

=== "C"

    ```c title="array.c"
    /* 隨機存取元素 */
    int randomAccess(int *nums, int size) {
        // 從區間 [0, size) 隨機選取一個數
        int randomIndex = rand() % size;
        // 取得並回傳隨機選出的元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* 隨機存取元素 */
    fun randomAccess(nums: IntArray): Int {
        // 從區間 [0, nums.size) 隨機選取一個數
        val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
        // 取得並回傳隨機選出的元素
        val randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### 隨機存取元素 ###
    def random_access(nums)
      # 從區間 [0, nums.length) 隨機選取一個數
      random_index = Random.rand(0...nums.length)

      # 取得並回傳隨機選出的元素
      nums[random_index]
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%A8%E6%A9%9F%E5%AD%98%E5%8F%96%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%BE%9E%E5%8D%80%E9%96%93%20%5B0,%20len%28nums%29-1%5D%20%E9%9A%A8%E6%A9%9F%E9%81%B8%E5%8F%96%E4%B8%80%E5%80%8B%E6%95%B8%0A%20%20%20%20random_index%20%3D%20random.randint%280,%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E4%B8%A6%E5%9B%9E%E5%82%B3%E9%9A%A8%E6%A9%9F%E9%81%B8%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%9A%A8%E6%A9%9F%E5%AD%98%E5%8F%96%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%E5%BE%9E%20nums%20%E9%9A%A8%E6%A9%9F%E5%8F%96%E5%BE%97%E7%9A%84%E5%85%83%E7%B4%A0%E7%82%BA%22,%20random_num%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%A8%E6%A9%9F%E5%AD%98%E5%8F%96%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%BE%9E%E5%8D%80%E9%96%93%20%5B0,%20len%28nums%29-1%5D%20%E9%9A%A8%E6%A9%9F%E9%81%B8%E5%8F%96%E4%B8%80%E5%80%8B%E6%95%B8%0A%20%20%20%20random_index%20%3D%20random.randint%280,%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E4%B8%A6%E5%9B%9E%E5%82%B3%E9%9A%A8%E6%A9%9F%E9%81%B8%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E9%9A%A8%E6%A9%9F%E5%AD%98%E5%8F%96%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%E5%BE%9E%20nums%20%E9%9A%A8%E6%A9%9F%E5%8F%96%E5%BE%97%E7%9A%84%E5%85%83%E7%B4%A0%E7%82%BA%22,%20random_num%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 3. &nbsp; 插入元素

陣列元素在記憶體中緊鄰彼此，中間沒有空間可以存放其他資料。如圖 4-3 所示，若要在陣列中間插入元素，需要先將插入位置起的所有元素往後移一格，再將新元素寫入該索引處。

![在陣列中插入元素的範例](array.assets/array_insert_element.svg){ class="animation-figure" }

<p align="center"> 圖 4-3 &nbsp; 在陣列中插入元素的範例 </p>

要留意的是，陣列的長度固定，因此插入一個元素，一定會使尾端原有的元素「遺失」。我們會在〈列表〉一節討論如何解決這個問題。

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """在陣列的索引 index 處插入元素 num"""
        # 將索引 index 起的所有元素往後移一格
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # 將 num 指派給索引 index 處的元素
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 在陣列的索引 index 處插入元素 num */
    void insert(int *nums, int size, int num, int index) {
        // 將索引 index 起的所有元素往後移一格
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 在陣列的索引 index 處插入元素 num */
    void insert(int[] nums, int num, int index) {
        // 將索引 index 起的所有元素往後移一格
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 在陣列的索引 index 處插入元素 num */
    void Insert(int[] nums, int num, int index) {
        // 將索引 index 起的所有元素往後移一格
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 在陣列的索引 index 處插入元素 num */
    func insert(nums []int, num int, index int) {
        // 將索引 index 起的所有元素往後移一格
        for i := len(nums) - 1; i > index; i-- {
            nums[i] = nums[i-1]
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 在陣列的索引 index 處插入元素 num */
    func insert(nums: inout [Int], num: Int, index: Int) {
        // 將索引 index 起的所有元素往後移一格
        for i in stride(from: nums.count - 1, to: index, by: -1) {
            nums[i] = nums[i - 1]
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 在陣列的索引 index 處插入元素 num */
    function insert(nums, num, index) {
        // 將索引 index 起的所有元素往後移一格
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 在陣列的索引 index 處插入元素 num */
    function insert(nums: number[], num: number, index: number): void {
        // 將索引 index 起的所有元素往後移一格
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 在陣列的索引 index 處插入元素 _num */
    void insert(List<int> nums, int _num, int index) {
      // 將索引 index 起的所有元素往後移一格
      for (var i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
      }
      // 將 _num 指派給索引 index 處的元素
      nums[index] = _num;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 在陣列的索引 index 處插入元素 num */
    fn insert(nums: &mut [i32], num: i32, index: usize) {
        // 將索引 index 起的所有元素往後移一格
        for i in (index + 1..nums.len()).rev() {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }
    ```

=== "C"

    ```c title="array.c"
    /* 在陣列的索引 index 處插入元素 num */
    void insert(int *nums, int size, int num, int index) {
        // 將索引 index 起的所有元素往後移一格
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* 在陣列的索引 index 處插入元素 num */
    fun insert(nums: IntArray, num: Int, index: Int) {
        // 將索引 index 起的所有元素往後移一格
        for (i in nums.size - 1 downTo index + 1) {
            nums[i] = nums[i - 1]
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### 在陣列的索引 index 處插入元素 num ###
    def insert(nums, num, index)
      # 將索引 index 起的所有元素往後移一格
      for i in (nums.length - 1).downto(index + 1)
        nums[i] = nums[i - 1]
      end

      # 將 num 指派給索引 index 處的元素
      nums[index] = num
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E9%99%A3%E5%88%97%E7%9A%84%E7%B4%A2%E5%BC%95%20index%20%E8%99%95%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%20num%22%22%22%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E8%B5%B7%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%BE%8C%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%20index,%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E5%B0%87%20num%20%E6%8C%87%E6%B4%BE%E7%B5%A6%E7%B4%A2%E5%BC%95%20index%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20insert%28nums,%206,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E9%99%A3%E5%88%97%E7%9A%84%E7%B4%A2%E5%BC%95%20index%20%E8%99%95%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%20num%22%22%22%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E8%B5%B7%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%BE%8C%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%20index,%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E5%B0%87%20num%20%E6%8C%87%E6%B4%BE%E7%B5%A6%E7%B4%A2%E5%BC%95%20index%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20insert%28nums,%206,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 4. &nbsp; 刪除元素

同理，如圖 4-4 所示，若要刪除索引 $i$ 處的元素，就必須將索引 $i$ 之後的所有元素往前移一格。

![刪除陣列元素的範例](array.assets/array_remove_element.svg){ class="animation-figure" }

<p align="center"> 圖 4-4 &nbsp; 刪除陣列元素的範例 </p>

刪除完成後，原本留在尾端的元素已經沒有意義，因此無須特別修改它。

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """刪除索引 index 處的元素"""
        # 將索引 index 之後的所有元素往前移一格
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 刪除索引 index 處的元素 */
    void remove(int *nums, int size, int index) {
        // 將索引 index 之後的所有元素往前移一格
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 刪除索引 index 處的元素 */
    void remove(int[] nums, int index) {
        // 將索引 index 之後的所有元素往前移一格
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 刪除索引 index 處的元素 */
    void Remove(int[] nums, int index) {
        // 將索引 index 之後的所有元素往前移一格
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 刪除索引 index 處的元素 */
    func remove(nums []int, index int) {
        // 將索引 index 之後的所有元素往前移一格
        for i := index; i < len(nums)-1; i++ {
            nums[i] = nums[i+1]
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 刪除索引 index 處的元素 */
    func remove(nums: inout [Int], index: Int) {
        // 將索引 index 之後的所有元素往前移一格
        for i in nums.indices.dropFirst(index).dropLast() {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 刪除索引 index 處的元素 */
    function remove(nums, index) {
        // 將索引 index 之後的所有元素往前移一格
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 刪除索引 index 處的元素 */
    function remove(nums: number[], index: number): void {
        // 將索引 index 之後的所有元素往前移一格
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 刪除索引 index 處的元素 */
    void remove(List<int> nums, int index) {
      // 將索引 index 之後的所有元素往前移一格
      for (var i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
      }
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 刪除索引 index 處的元素 */
    fn remove(nums: &mut [i32], index: usize) {
        // 將索引 index 之後的所有元素往前移一格
        for i in index..nums.len() - 1 {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* 刪除索引 index 處的元素 */
    // 注意：stdio.h 已使用 remove 這個名稱
    void removeItem(int *nums, int size, int index) {
        // 將索引 index 之後的所有元素往前移一格
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* 刪除索引 index 處的元素 */
    fun remove(nums: IntArray, index: Int) {
        // 將索引 index 之後的所有元素往前移一格
        for (i in index..<nums.size - 1) {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### 刪除索引 index 處的元素 ###
    def remove(nums, index)
      # 將索引 index 之後的所有元素往前移一格
      for i in index...(nums.length - 1)
        nums[i] = nums[i + 1]
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E4%B9%8B%E5%BE%8C%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%89%8D%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20i%20in%20range%28index,%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20remove%28nums,%202%29%0A%20%20%20%20print%28%22%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%202%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E4%B9%8B%E5%BE%8C%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%89%8D%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20i%20in%20range%28index,%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20remove%28nums,%202%29%0A%20%20%20%20print%28%22%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%202%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

整體來說，陣列的插入與刪除操作有以下缺點。

- **時間複雜度高**：在陣列中插入和刪除元素的平均時間複雜度都是 $O(n)$，其中 $n$ 為陣列長度。
- **元素遺失**：陣列的長度固定，因此插入新元素後，被移出陣列範圍的元素會遺失。
- **浪費記憶體**：可以將陣列初始化得長一些，只使用前面一部分。如此一來，插入資料時，尾端遺失的元素都沒有意義，但也會浪費一部分記憶體。

### 5. &nbsp; 走訪陣列

在多數程式語言中，我們既可以依索引走訪陣列，也可以直接走訪陣列中的每個元素：

=== "Python"

    ```python title="array.py"
    def traverse(nums: list[int]):
        """走訪陣列"""
        count = 0
        # 依索引走訪陣列
        for i in range(len(nums)):
            count += nums[i]
        # 直接走訪陣列中的元素
        for num in nums:
            count += num
        # 同時走訪資料的索引和元素
        for i, num in enumerate(nums):
            count += nums[i]
            count += num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 走訪陣列 */
    void traverse(int *nums, int size) {
        int count = 0;
        // 依索引走訪陣列
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 走訪陣列 */
    void traverse(int[] nums) {
        int count = 0;
        // 依索引走訪陣列
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列中的元素
        for (int num : nums) {
            count += num;
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 走訪陣列 */
    void Traverse(int[] nums) {
        int count = 0;
        // 依索引走訪陣列
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列中的元素
        foreach (int num in nums) {
            count += num;
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 走訪陣列 */
    func traverse(nums []int) {
        count := 0
        // 依索引走訪陣列
        for i := 0; i < len(nums); i++ {
            count += nums[i]
        }
        count = 0
        // 直接走訪陣列中的元素
        for _, num := range nums {
            count += num
        }
        // 同時走訪資料的索引和元素
        for i, num := range nums {
            count += nums[i]
            count += num
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 走訪陣列 */
    func traverse(nums: [Int]) {
        var count = 0
        // 依索引走訪陣列
        for i in nums.indices {
            count += nums[i]
        }
        // 直接走訪陣列中的元素
        for num in nums {
            count += num
        }
        // 同時走訪資料的索引和元素
        for (i, num) in nums.enumerated() {
            count += nums[i]
            count += num
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 走訪陣列 */
    function traverse(nums) {
        let count = 0;
        // 依索引走訪陣列
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列中的元素
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 走訪陣列 */
    function traverse(nums: number[]): void {
        let count = 0;
        // 依索引走訪陣列
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列中的元素
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 走訪陣列中的元素 */
    void traverse(List<int> nums) {
      int count = 0;
      // 依索引走訪陣列
      for (var i = 0; i < nums.length; i++) {
        count += nums[i];
      }
      // 直接走訪陣列中的元素
      for (int _num in nums) {
        count += _num;
      }
      // 以 forEach 方法走訪陣列
      nums.forEach((_num) {
        count += _num;
      });
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 走訪陣列 */
    fn traverse(nums: &[i32]) {
        let mut _count = 0;
        // 依索引走訪陣列
        for i in 0..nums.len() {
            _count += nums[i];
        }
        // 直接走訪陣列中的元素
        _count = 0;
        for &num in nums {
            _count += num;
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* 走訪陣列 */
    void traverse(int *nums, int size) {
        int count = 0;
        // 依索引走訪陣列
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* 走訪陣列 */
    fun traverse(nums: IntArray) {
        var count = 0
        // 依索引走訪陣列
        for (i in nums.indices) {
            count += nums[i]
        }
        // 直接走訪陣列中的元素
        for (j in nums) {
            count += j
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### 走訪陣列 ###
    def traverse(nums)
      count = 0

      # 依索引走訪陣列
      for i in 0...nums.length
        count += nums[i]
      end

      # 直接走訪陣列中的元素
      for num in nums
        count += num
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E4%BE%9D%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%E4%B8%AD%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%E5%90%8C%E6%99%82%E8%B5%B0%E8%A8%AA%E8%B3%87%E6%96%99%E7%9A%84%E7%B4%A2%E5%BC%95%E5%92%8C%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i,%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%0A%20%20%20%20traverse%28nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E4%BE%9D%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%E4%B8%AD%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%E5%90%8C%E6%99%82%E8%B5%B0%E8%A8%AA%E8%B3%87%E6%96%99%E7%9A%84%E7%B4%A2%E5%BC%95%E5%92%8C%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i,%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%0A%20%20%20%20traverse%28nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 6. &nbsp; 尋找元素

在陣列中尋找指定元素時，需要走訪陣列，逐一檢查元素值是否相符。一旦找到，函式就回傳對應的索引。

陣列是線性資料結構，因此上述搜尋方式稱為「線性搜尋」。

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """在陣列中尋找指定元素"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
    function find(nums, target) {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) return i;
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
    int find(List<int> nums, int target) {
      for (var i = 0; i < nums.length; i++) {
        if (nums[i] == target) return i;
      }
      return -1;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
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
    /* 在陣列中尋找指定元素 */
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
    ### 在陣列中尋找指定元素 ###
    def find(nums, target)
      for i in 0...nums.length
        return i if nums[i] == target
      end

      -1
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E9%99%A3%E5%88%97%E4%B8%AD%E5%B0%8B%E6%89%BE%E6%8C%87%E5%AE%9A%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%B0%8B%E6%89%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%20nums%20%E4%B8%AD%E5%B0%8B%E6%89%BE%E5%85%83%E7%B4%A0%203%EF%BC%8C%E5%BE%97%E5%88%B0%E7%B4%A2%E5%BC%95%20%3D%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E9%99%A3%E5%88%97%E4%B8%AD%E5%B0%8B%E6%89%BE%E6%8C%87%E5%AE%9A%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%B0%8B%E6%89%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums,%203%29%0A%20%20%20%20print%28%22%E5%9C%A8%20nums%20%E4%B8%AD%E5%B0%8B%E6%89%BE%E5%85%83%E7%B4%A0%203%EF%BC%8C%E5%BE%97%E5%88%B0%E7%B4%A2%E5%BC%95%20%3D%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 7. &nbsp; 擴充陣列容量

在複雜的系統環境中，程式難以保證緊接在陣列後面的記憶體空間可供使用，因此無法直接安全地擴充容量。所以在多數程式語言中，**陣列的長度固定不變**。

若要擴充容量，就得建立一個更大的陣列，再將原陣列的元素依序複製過去。這項操作需要 $O(n)$ 的時間，陣列很大時相當耗時。程式碼如下：

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """增加陣列長度"""
        # 初始化加長後的陣列
        res = [0] * (len(nums) + enlarge)
        # 將原陣列的所有元素複製到新陣列
        for i in range(len(nums)):
            res[i] = nums[i]
        # 回傳加長後的新陣列
        return res
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 增加陣列長度 */
    int *extend(int *nums, int size, int enlarge) {
        // 初始化加長後的陣列
        int *res = new int[size + enlarge]{};
        // 將原陣列的所有元素複製到新陣列
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // 釋放記憶體
        delete[] nums;
        // 回傳加長後的新陣列
        return res;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 增加陣列長度 */
    int[] extend(int[] nums, int enlarge) {
        // 初始化加長後的陣列
        int[] res = new int[nums.length + enlarge];
        // 將原陣列的所有元素複製到新陣列
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 回傳加長後的新陣列
        return res;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 增加陣列長度 */
    int[] Extend(int[] nums, int enlarge) {
        // 初始化加長後的陣列
        int[] res = new int[nums.Length + enlarge];
        // 將原陣列的所有元素複製到新陣列
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 回傳加長後的新陣列
        return res;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* 增加陣列長度 */
    func extend(nums []int, enlarge int) []int {
        // 初始化加長後的陣列
        res := make([]int, len(nums)+enlarge)
        // 將原陣列的所有元素複製到新陣列
        for i, num := range nums {
            res[i] = num
        }
        // 回傳加長後的新陣列
        return res
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 增加陣列長度 */
    func extend(nums: [Int], enlarge: Int) -> [Int] {
        // 初始化加長後的陣列
        var res = Array(repeating: 0, count: nums.count + enlarge)
        // 將原陣列的所有元素複製到新陣列
        for i in nums.indices {
            res[i] = nums[i]
        }
        // 回傳加長後的新陣列
        return res
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* 增加陣列長度 */
    // 請注意，JavaScript 的 Array 是動態陣列，可直接增加長度
    // 為方便學習，此函式將 Array 視為長度固定的陣列
    function extend(nums, enlarge) {
        // 初始化加長後的陣列
        const res = new Array(nums.length + enlarge).fill(0);
        // 將原陣列的所有元素複製到新陣列
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 回傳加長後的新陣列
        return res;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 增加陣列長度 */
    // 請注意，TypeScript 的 Array 是動態陣列，可直接增加長度
    // 為方便學習，此函式將 Array 視為長度固定的陣列
    function extend(nums: number[], enlarge: number): number[] {
        // 初始化加長後的陣列
        const res = new Array(nums.length + enlarge).fill(0);
        // 將原陣列的所有元素複製到新陣列
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 回傳加長後的新陣列
        return res;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 增加陣列長度 */
    List<int> extend(List<int> nums, int enlarge) {
      // 初始化加長後的陣列
      List<int> res = List.filled(nums.length + enlarge, 0);
      // 將原陣列的所有元素複製到新陣列
      for (var i = 0; i < nums.length; i++) {
        res[i] = nums[i];
      }
      // 回傳加長後的新陣列
      return res;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 增加陣列長度 */
    fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
        // 初始化加長後的陣列
        let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
        // 將原陣列的所有元素複製到新陣列
        res[0..nums.len()].copy_from_slice(nums);

        // 回傳加長後的新陣列
        res
    }
    ```

=== "C"

    ```c title="array.c"
    /* 增加陣列長度 */
    int *extend(int *nums, int size, int enlarge) {
        // 初始化加長後的陣列
        int *res = (int *)malloc(sizeof(int) * (size + enlarge));
        // 將原陣列的所有元素複製到新陣列
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // 初始化新增的空間
        for (int i = size; i < size + enlarge; i++) {
            res[i] = 0;
        }
        // 回傳加長後的新陣列
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* 增加陣列長度 */
    fun extend(nums: IntArray, enlarge: Int): IntArray {
        // 初始化加長後的陣列
        val res = IntArray(nums.size + enlarge)
        // 將原陣列的所有元素複製到新陣列
        for (i in nums.indices) {
            res[i] = nums[i]
        }
        // 回傳加長後的新陣列
        return res
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### 增加陣列長度 ###
    # 請注意，Ruby 的 Array 是動態陣列，可直接增加長度
    # 為方便學習，此函式將 Array 視為長度固定的陣列
    def extend(nums, enlarge)
      # 初始化加長後的陣列
      res = Array.new(nums.length + enlarge, 0)

      # 將原陣列的所有元素複製到新陣列
      for i in 0...nums.length
        res[i] = nums[i]
      end

      # 回傳加長後的新陣列
      res
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%23%20%E8%AB%8B%E6%B3%A8%E6%84%8F%EF%BC%8CPython%20%E7%9A%84%20list%20%E6%98%AF%E5%8B%95%E6%85%8B%E9%99%A3%E5%88%97%EF%BC%8C%E5%8F%AF%E7%9B%B4%E6%8E%A5%E5%A2%9E%E5%8A%A0%E9%95%B7%E5%BA%A6%0A%23%20%E7%82%BA%E6%96%B9%E4%BE%BF%E5%AD%B8%E7%BF%92%EF%BC%8C%E6%AD%A4%E5%87%BD%E5%BC%8F%E5%B0%87%20list%20%E8%A6%96%E7%82%BA%E9%95%B7%E5%BA%A6%E5%9B%BA%E5%AE%9A%E7%9A%84%E9%99%A3%E5%88%97%0Adef%20extend%28nums%3A%20list%5Bint%5D,%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%A2%9E%E5%8A%A0%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8A%A0%E9%95%B7%E5%BE%8C%E7%9A%84%E9%99%A3%E5%88%97%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%E5%B0%87%E5%8E%9F%E9%99%A3%E5%88%97%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%88%B0%E6%96%B0%E9%99%A3%E5%88%97%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%9B%9E%E5%82%B3%E5%8A%A0%E9%95%B7%E5%BE%8C%E7%9A%84%E6%96%B0%E9%99%A3%E5%88%97%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%A2%9E%E5%8A%A0%E9%95%B7%E5%BA%A6%0A%20%20%20%20nums%20%3D%20extend%28nums,%203%29%0A%20%20%20%20print%28%22%E5%B0%87%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%E5%A2%9E%E5%8A%A0%E8%87%B3%208%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20%E8%AB%8B%E6%B3%A8%E6%84%8F%EF%BC%8CPython%20%E7%9A%84%20list%20%E6%98%AF%E5%8B%95%E6%85%8B%E9%99%A3%E5%88%97%EF%BC%8C%E5%8F%AF%E7%9B%B4%E6%8E%A5%E5%A2%9E%E5%8A%A0%E9%95%B7%E5%BA%A6%0A%23%20%E7%82%BA%E6%96%B9%E4%BE%BF%E5%AD%B8%E7%BF%92%EF%BC%8C%E6%AD%A4%E5%87%BD%E5%BC%8F%E5%B0%87%20list%20%E8%A6%96%E7%82%BA%E9%95%B7%E5%BA%A6%E5%9B%BA%E5%AE%9A%E7%9A%84%E9%99%A3%E5%88%97%0Adef%20extend%28nums%3A%20list%5Bint%5D,%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%A2%9E%E5%8A%A0%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8A%A0%E9%95%B7%E5%BE%8C%E7%9A%84%E9%99%A3%E5%88%97%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%E5%B0%87%E5%8E%9F%E9%99%A3%E5%88%97%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%88%B0%E6%96%B0%E9%99%A3%E5%88%97%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%9B%9E%E5%82%B3%E5%8A%A0%E9%95%B7%E5%BE%8C%E7%9A%84%E6%96%B0%E9%99%A3%E5%88%97%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20print%28%22%E9%99%A3%E5%88%97%20nums%20%3D%22,%20nums%29%0A%0A%20%20%20%20%23%20%E5%A2%9E%E5%8A%A0%E9%95%B7%E5%BA%A6%0A%20%20%20%20nums%20%3D%20extend%28nums,%203%29%0A%20%20%20%20print%28%22%E5%B0%87%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%E5%A2%9E%E5%8A%A0%E8%87%B3%208%EF%BC%8C%E5%BE%97%E5%88%B0%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 4.1.2 &nbsp; 陣列的優點與限制

陣列的元素型別相同，且在記憶體中連續存放。系統可以利用這些事先已知的特性，提高資料結構的操作效率。

- **空間效率高**：陣列為資料配置連續的記憶體區塊，不必為結構本身付出額外的空間成本。
- **支援隨機存取**：在 $O(1)$ 時間內就能存取陣列中的任一元素。
- **快取區域性**：存取陣列元素時，電腦也會把附近的其他資料載入快取，讓後續操作能藉由快取加快執行速度。

使用連續空間儲存資料有利有弊，以下是它的限制。

- **插入與刪除效率低**：陣列中的元素越多，插入或刪除時可能需要移動的元素就越多。
- **長度固定**：陣列在初始化後長度就固定了。若要擴充容量，必須將所有資料複製到新陣列，成本很高。
- **浪費空間**：若配置給陣列的空間超過實際需求，多餘的空間就浪費了。

## 4.1.3 &nbsp; 陣列的常見應用

陣列是一種基礎且常見的資料結構，各種演算法都經常用到它，也可以用它實作更複雜的資料結構。

- **隨機存取**：若要隨機抽取樣本，可以用陣列存放資料，產生一串隨機索引，再依索引抽樣。
- **排序與搜尋**：陣列是排序與搜尋演算法最常用的資料結構。快速排序、合併排序、二分搜尋等演算法主要都在陣列上操作。
- **查找表**：若要快速找到某個元素或查出其對應關係，可以將陣列當作查找表。例如，要建立字元與 ASCII 碼之間的對應關係，可以將字元的 ASCII 碼值當成索引，再將對應的元素放入陣列中的該位置。
- **機器學習**：類神經網路大量使用向量、矩陣、張量之間的線性代數運算，這些資料都以陣列來表示。陣列是設計類神經網路程式時最常用的資料結構。
- **實作資料結構**：陣列可以用來實作堆疊、佇列、雜湊表、堆積、圖等資料結構。例如，圖的鄰接矩陣其實就是一個二維陣列。
