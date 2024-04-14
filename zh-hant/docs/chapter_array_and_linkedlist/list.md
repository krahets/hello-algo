# 串列

<u>串列（list）</u>是一個抽象的資料結構概念，它表示元素的有序集合，支持元素訪問、修改、新增、刪除和走訪等操作，無須使用者考慮容量限制的問題。串列可以基於鏈結串列或陣列實現。

- 鏈結串列天然可以看作一個串列，其支持元素增刪查改操作，並且可以靈活動態擴容。
- 陣列也支持元素增刪查改，但由於其長度不可變，因此只能看作一個具有長度限制的串列。

當使用陣列實現串列時，**長度不可變的性質會導致串列的實用性降低**。這是因為我們通常無法事先確定需要儲存多少資料，從而難以選擇合適的串列長度。若長度過小，則很可能無法滿足使用需求；若長度過大，則會造成記憶體空間浪費。

為解決此問題，我們可以使用<u>動態陣列（dynamic array）</u>來實現串列。它繼承了陣列的各項優點，並且可以在程式執行過程中進行動態擴容。

實際上，**許多程式語言中的標準庫提供的串列是基於動態陣列實現的**，例如 Python 中的 `list` 、Java 中的 `ArrayList` 、C++ 中的 `vector` 和 C# 中的 `List` 等。在接下來的討論中，我們將把“串列”和“動態陣列”視為等同的概念。

## 串列常用操作

### 初始化串列

我們通常使用“無初始值”和“有初始值”這兩種初始化方法：

=== "Python"

    ```python title="list.py"
    # 初始化串列
    # 無初始值
    nums1: list[int] = []
    # 有初始值
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 初始化串列 */
    // 需注意，C++ 中 vector 即是本文描述的 nums
    // 無初始值
    vector<int> nums1;
    // 有初始值
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* 初始化串列 */
    // 無初始值
    List<Integer> nums1 = new ArrayList<>();
    // 有初始值（注意陣列的元素型別需為 int[] 的包裝類別 Integer[]）
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 初始化串列 */
    // 無初始值
    List<int> nums1 = [];
    // 有初始值
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* 初始化串列 */
    // 無初始值
    nums1 := []int{}
    // 有初始值
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 初始化串列 */
    // 無初始值
    let nums1: [Int] = []
    // 有初始值
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* 初始化串列 */
    // 無初始值
    const nums1 = [];
    // 有初始值
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 初始化串列 */
    // 無初始值
    const nums1: number[] = [];
    // 有初始值
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 初始化串列 */
    // 無初始值
    List<int> nums1 = [];
    // 有初始值
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 初始化串列 */
    // 無初始值
    let nums1: Vec<i32> = Vec::new();
    // 有初始值
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 初始化串列 */
    // 無初始值
    var nums1 = listOf<Int>()
    // 有初始值
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 初始化串列
    # 無初始值
    nums1 = []
    # 有初始值
    nums = [1, 3, 2, 5, 4]
    ```

=== "Zig"

    ```zig title="list.zig"
    // 初始化串列
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

??? pythontutor "視覺化執行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20%23%20%E7%84%A1%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 訪問元素

串列本質上是陣列，因此可以在 $O(1)$ 時間內訪問和更新元素，效率很高。

=== "Python"

    ```python title="list.py"
    # 訪問元素
    num: int = nums[1]  # 訪問索引 1 處的元素

    # 更新元素
    nums[1] = 0    # 將索引 1 處的元素更新為 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 訪問元素 */
    int num = nums[1];  // 訪問索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0;  // 將索引 1 處的元素更新為 0
    ```

=== "Java"

    ```java title="list.java"
    /* 訪問元素 */
    int num = nums.get(1);  // 訪問索引 1 處的元素

    /* 更新元素 */
    nums.set(1, 0);  // 將索引 1 處的元素更新為 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 訪問元素 */
    int num = nums[1];  // 訪問索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0;  // 將索引 1 處的元素更新為 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* 訪問元素 */
    num := nums[1]  // 訪問索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0     // 將索引 1 處的元素更新為 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 訪問元素 */
    let num = nums[1] // 訪問索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0 // 將索引 1 處的元素更新為 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* 訪問元素 */
    const num = nums[1];  // 訪問索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0;  // 將索引 1 處的元素更新為 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 訪問元素 */
    const num: number = nums[1];  // 訪問索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0;  // 將索引 1 處的元素更新為 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 訪問元素 */
    int num = nums[1];  // 訪問索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0;  // 將索引 1 處的元素更新為 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 訪問元素 */
    let num: i32 = nums[1];  // 訪問索引 1 處的元素
    /* 更新元素 */
    nums[1] = 0;             // 將索引 1 處的元素更新為 0
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 訪問元素 */
    val num = nums[1]       // 訪問索引 1 處的元素
    /* 更新元素 */
    nums[1] = 0             // 將索引 1 處的元素更新為 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 訪問元素
    num = nums[1] # 訪問索引 1 處的元素
    # 更新元素
    nums[1] = 0 # 將索引 1 處的元素更新為 0
    ```

=== "Zig"

    ```zig title="list.zig"
    // 訪問元素
    var num = nums.items[1]; // 訪問索引 1 處的元素

    // 更新元素
    nums.items[1] = 0; // 將索引 1 處的元素更新為 0
    ```

??? pythontutor "視覺化執行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%A8%AA%E5%95%8F%E7%B4%A2%E5%BC%95%201%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%201%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E7%82%BA%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 插入與刪除元素

相較於陣列，串列可以自由地新增與刪除元素。在串列尾部新增元素的時間複雜度為 $O(1)$ ，但插入和刪除元素的效率仍與陣列相同，時間複雜度為 $O(n)$ 。

=== "Python"

    ```python title="list.py"
    # 清空串列
    nums.clear()

    # 在尾部新增元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # 在中間插入元素
    nums.insert(3, 6)  # 在索引 3 處插入數字 6

    # 刪除元素
    nums.pop(3)        # 刪除索引 3 處的元素
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 清空串列 */
    nums.clear();

    /* 在尾部新增元素 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* 在中間插入元素 */
    nums.insert(nums.begin() + 3, 6);  // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.erase(nums.begin() + 3);      // 刪除索引 3 處的元素
    ```

=== "Java"

    ```java title="list.java"
    /* 清空串列 */
    nums.clear();

    /* 在尾部新增元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 在中間插入元素 */
    nums.add(3, 6);  // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.remove(3);  // 刪除索引 3 處的元素
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 清空串列 */
    nums.Clear();

    /* 在尾部新增元素 */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* 在中間插入元素 */
    nums.Insert(3, 6);  // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.RemoveAt(3);  // 刪除索引 3 處的元素
    ```

=== "Go"

    ```go title="list_test.go"
    /* 清空串列 */
    nums = nil

    /* 在尾部新增元素 */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* 在中間插入元素 */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums = append(nums[:3], nums[4:]...) // 刪除索引 3 處的元素
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 清空串列 */
    nums.removeAll()

    /* 在尾部新增元素 */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* 在中間插入元素 */
    nums.insert(6, at: 3) // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.remove(at: 3) // 刪除索引 3 處的元素
    ```

=== "JS"

    ```javascript title="list.js"
    /* 清空串列 */
    nums.length = 0;

    /* 在尾部新增元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中間插入元素 */
    nums.splice(3, 0, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.splice(3, 1);  // 刪除索引 3 處的元素
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 清空串列 */
    nums.length = 0;

    /* 在尾部新增元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中間插入元素 */
    nums.splice(3, 0, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.splice(3, 1);  // 刪除索引 3 處的元素
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 清空串列 */
    nums.clear();

    /* 在尾部新增元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 在中間插入元素 */
    nums.insert(3, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.removeAt(3); // 刪除索引 3 處的元素
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 清空串列 */
    nums.clear();

    /* 在尾部新增元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中間插入元素 */
    nums.insert(3, 6);  // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.remove(3);    // 刪除索引 3 處的元素
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 清空串列 */
    nums.clear();

    /* 在尾部新增元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 在中間插入元素 */
    nums.add(3, 6);  // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.remove(3);  // 刪除索引 3 處的元素
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 清空串列
    nums.clear

    # 在尾部新增元素
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # 在中間插入元素
    nums.insert(3, 6) # 在索引 3 處插入數字 6

    # 刪除元素
    nums.delete_at(3) # 刪除索引 3 處的元素
    ```

=== "Zig"

    ```zig title="list.zig"
    // 清空串列
    nums.clearRetainingCapacity();

    // 在尾部新增元素
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);

    // 在中間插入元素
    try nums.insert(3, 6); // 在索引 3 處插入數字 6

    // 刪除元素
    _ = nums.orderedRemove(3); // 刪除索引 3 處的元素
    ```

??? pythontutor "視覺化執行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%96%B0%E5%A2%9E%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 走訪串列

與陣列一樣，串列可以根據索引走訪，也可以直接走訪各元素。

=== "Python"

    ```python title="list.py"
    # 透過索引走訪串列
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # 直接走訪串列元素
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 透過索引走訪串列 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* 直接走訪串列元素 */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* 透過索引走訪串列 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* 直接走訪串列元素 */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 透過索引走訪串列 */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* 直接走訪串列元素 */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* 透過索引走訪串列 */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* 直接走訪串列元素 */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 透過索引走訪串列 */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* 直接走訪串列元素 */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* 透過索引走訪串列 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接走訪串列元素 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 透過索引走訪串列 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接走訪串列元素 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 透過索引走訪串列 */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接走訪串列元素 */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // 透過索引走訪串列
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // 直接走訪串列元素
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 透過索引走訪串列 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 直接走訪串列元素 */
    for (num in nums) {
        count += num
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 透過索引走訪串列
    count = 0
    for i in 0...nums.length
        count += nums[i]
    end

    # 直接走訪串列元素
    count = 0
    for num in nums
        count += num
    end
    ```

=== "Zig"

    ```zig title="list.zig"
    // 透過索引走訪串列
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums[i];
    }

    // 直接走訪串列元素
    count = 0;
    for (nums.items) |num| {
        count += num;
    }
    ```

??? pythontutor "視覺化執行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%8F%E9%81%8E%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 拼接串列

給定一個新串列 `nums1` ，我們可以將其拼接到原串列的尾部。

=== "Python"

    ```python title="list.py"
    # 拼接兩個串列
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # 將串列 nums1 拼接到 nums 之後
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 拼接兩個串列 */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // 將串列 nums1 拼接到 nums 之後
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 拼接兩個串列 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // 將串列 nums1 拼接到 nums 之後
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 拼接兩個串列 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // 將串列 nums1 拼接到 nums 之後
    ```

=== "Go"

    ```go title="list_test.go"
    /* 拼接兩個串列 */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // 將串列 nums1 拼接到 nums 之後
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 拼接兩個串列 */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // 將串列 nums1 拼接到 nums 之後
    ```

=== "JS"

    ```javascript title="list.js"
    /* 拼接兩個串列 */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // 將串列 nums1 拼接到 nums 之後
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 拼接兩個串列 */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // 將串列 nums1 拼接到 nums 之後
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 拼接兩個串列 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // 將串列 nums1 拼接到 nums 之後
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 拼接兩個串列 */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 拼接兩個串列 */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // 將串列 nums1 拼接到 nums 之後
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 拼接兩個串列
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

=== "Zig"

    ```zig title="list.zig"
    // 拼接兩個串列
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items); // 將串列 nums1 拼接到 nums 之後
    ```

??? pythontutor "視覺化執行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E5%85%A9%E5%80%8B%E4%B8%B2%E5%88%97%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%BE%8C&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 排序串列

完成串列排序後，我們便可以使用在陣列類別演算法題中經常考查的“二分搜尋”和“雙指標”演算法。

=== "Python"

    ```python title="list.py"
    # 排序串列
    nums.sort()  # 排序後，串列元素從小到大排列
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 排序串列 */
    sort(nums.begin(), nums.end());  // 排序後，串列元素從小到大排列
    ```

=== "Java"

    ```java title="list.java"
    /* 排序串列 */
    Collections.sort(nums);  // 排序後，串列元素從小到大排列
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 排序串列 */
    nums.Sort(); // 排序後，串列元素從小到大排列
    ```

=== "Go"

    ```go title="list_test.go"
    /* 排序串列 */
    sort.Ints(nums)  // 排序後，串列元素從小到大排列
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 排序串列 */
    nums.sort() // 排序後，串列元素從小到大排列
    ```

=== "JS"

    ```javascript title="list.js"
    /* 排序串列 */
    nums.sort((a, b) => a - b);  // 排序後，串列元素從小到大排列
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 排序串列 */
    nums.sort((a, b) => a - b);  // 排序後，串列元素從小到大排列
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 排序串列 */
    nums.sort(); // 排序後，串列元素從小到大排列
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 排序串列 */
    nums.sort(); // 排序後，串列元素從小到大排列
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 排序串列 */
    nums.sort() // 排序後，串列元素從小到大排列
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 排序串列
    nums = nums.sort { |a, b| a <=> b } # 排序後，串列元素從小到大排列
    ```

=== "Zig"

    ```zig title="list.zig"
    // 排序串列
    std.sort.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    ```

??? pythontutor "視覺化執行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%BE%8C%EF%BC%8C%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E5%BE%9E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 串列實現

許多程式語言內建了串列，例如 Java、C++、Python 等。它們的實現比較複雜，各個參數的設定也非常考究，例如初始容量、擴容倍數等。感興趣的讀者可以查閱原始碼進行學習。

為了加深對串列工作原理的理解，我們嘗試實現一個簡易版串列，包括以下三個重點設計。

- **初始容量**：選取一個合理的陣列初始容量。在本示例中，我們選擇 10 作為初始容量。
- **數量記錄**：宣告一個變數 `size` ，用於記錄串列當前元素數量，並隨著元素插入和刪除實時更新。根據此變數，我們可以定位串列尾部，以及判斷是否需要擴容。
- **擴容機制**：若插入元素時串列容量已滿，則需要進行擴容。先根據擴容倍數建立一個更大的陣列，再將當前陣列的所有元素依次移動至新陣列。在本示例中，我們規定每次將陣列擴容至之前的 2 倍。

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
