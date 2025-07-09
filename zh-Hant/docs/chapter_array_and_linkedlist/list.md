---
comments: true
---

# 4.3 &nbsp; 串列

<u>串列（list）</u>是一個抽象的資料結構概念，它表示元素的有序集合，支持元素訪問、修改、新增、刪除和走訪等操作，無須使用者考慮容量限制的問題。串列可以基於鏈結串列或陣列實現。

- 鏈結串列天然可以看作一個串列，其支持元素增刪查改操作，並且可以靈活動態擴容。
- 陣列也支持元素增刪查改，但由於其長度不可變，因此只能看作一個具有長度限制的串列。

當使用陣列實現串列時，**長度不可變的性質會導致串列的實用性降低**。這是因為我們通常無法事先確定需要儲存多少資料，從而難以選擇合適的串列長度。若長度過小，則很可能無法滿足使用需求；若長度過大，則會造成記憶體空間浪費。

為解決此問題，我們可以使用<u>動態陣列（dynamic array）</u>來實現串列。它繼承了陣列的各項優點，並且可以在程式執行過程中進行動態擴容。

實際上，**許多程式語言中的標準庫提供的串列是基於動態陣列實現的**，例如 Python 中的 `list` 、Java 中的 `ArrayList` 、C++ 中的 `vector` 和 C# 中的 `List` 等。在接下來的討論中，我們將把“串列”和“動態陣列”視為等同的概念。

## 4.3.1 &nbsp; 串列常用操作

### 1. &nbsp; 初始化串列

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

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20%23%20%E7%84%A1%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20%23%20%E7%84%A1%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 訪問元素

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

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%A8%AA%E5%95%8F%E7%B4%A2%E5%BC%95%201%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%201%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E7%82%BA%200&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%A8%AA%E5%95%8F%E7%B4%A2%E5%BC%95%201%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%201%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E7%82%BA%200&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 3. &nbsp; 插入與刪除元素

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

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%96%B0%E5%A2%9E%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%96%B0%E5%A2%9E%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E8%99%95%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 4. &nbsp; 走訪串列

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

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%8F%E9%81%8E%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%8F%E9%81%8E%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 5. &nbsp; 拼接串列

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

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E5%85%A9%E5%80%8B%E4%B8%B2%E5%88%97%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%BE%8C&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E5%85%A9%E5%80%8B%E4%B8%B2%E5%88%97%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%BE%8C&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 6. &nbsp; 排序串列

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

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%BE%8C%EF%BC%8C%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E5%BE%9E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%BE%8C%EF%BC%8C%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E5%BE%9E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 4.3.2 &nbsp; 串列實現

許多程式語言內建了串列，例如 Java、C++、Python 等。它們的實現比較複雜，各個參數的設定也非常考究，例如初始容量、擴容倍數等。感興趣的讀者可以查閱原始碼進行學習。

為了加深對串列工作原理的理解，我們嘗試實現一個簡易版串列，包括以下三個重點設計。

- **初始容量**：選取一個合理的陣列初始容量。在本示例中，我們選擇 10 作為初始容量。
- **數量記錄**：宣告一個變數 `size` ，用於記錄串列當前元素數量，並隨著元素插入和刪除即時更新。根據此變數，我們可以定位串列尾部，以及判斷是否需要擴容。
- **擴容機制**：若插入元素時串列容量已滿，則需要進行擴容。先根據擴容倍數建立一個更大的陣列，再將當前陣列的所有元素依次移動至新陣列。在本示例中，我們規定每次將陣列擴容至之前的 2 倍。

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """串列類別"""

        def __init__(self):
            """建構子"""
            self._capacity: int = 10  # 串列容量
            self._arr: list[int] = [0] * self._capacity  # 陣列（儲存串列元素）
            self._size: int = 0  # 串列長度（當前元素數量）
            self._extend_ratio: int = 2  # 每次串列擴容的倍數

        def size(self) -> int:
            """獲取串列長度（當前元素數量）"""
            return self._size

        def capacity(self) -> int:
            """獲取串列容量"""
            return self._capacity

        def get(self, index: int) -> int:
            """訪問元素"""
            # 索引如果越界，則丟擲異常，下同
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            return self._arr[index]

        def set(self, num: int, index: int):
            """更新元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            self._arr[index] = num

        def add(self, num: int):
            """在尾部新增元素"""
            # 元素數量超出容量時，觸發擴容機制
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """在中間插入元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            # 元素數量超出容量時，觸發擴容機制
            if self._size == self.capacity():
                self.extend_capacity()
            # 將索引 index 以及之後的元素都向後移動一位
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # 更新元素數量
            self._size += 1

        def remove(self, index: int) -> int:
            """刪除元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            num = self._arr[index]
            # 將索引 index 之後的元素都向前移動一位
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # 更新元素數量
            self._size -= 1
            # 返回被刪除的元素
            return num

        def extend_capacity(self):
            """串列擴容"""
            # 新建一個長度為原陣列 _extend_ratio 倍的新陣列，並將原陣列複製到新陣列
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # 更新串列容量
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """返回有效長度的串列"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* 串列類別 */
    class MyList {
      private:
        int *arr;             // 陣列（儲存串列元素）
        int arrCapacity = 10; // 串列容量
        int arrSize = 0;      // 串列長度（當前元素數量）
        int extendRatio = 2;   // 每次串列擴容的倍數

      public:
        /* 建構子 */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* 析構方法 */
        ~MyList() {
            delete[] arr;
        }

        /* 獲取串列長度（當前元素數量）*/
        int size() {
            return arrSize;
        }

        /* 獲取串列容量 */
        int capacity() {
            return arrCapacity;
        }

        /* 訪問元素 */
        int get(int index) {
            // 索引如果越界，則丟擲異常，下同
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

        /* 在尾部新增元素 */
        void add(int num) {
            // 元素數量超出容量時，觸發擴容機制
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // 更新元素數量
            arrSize++;
        }

        /* 在中間插入元素 */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            // 元素數量超出容量時，觸發擴容機制
            if (size() == capacity())
                extendCapacity();
            // 將索引 index 以及之後的元素都向後移動一位
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素數量
            arrSize++;
        }

        /* 刪除元素 */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            int num = arr[index];
            // 將索引 index 之後的元素都向前移動一位
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素數量
            arrSize--;
            // 返回被刪除的元素
            return num;
        }

        /* 串列擴容 */
        void extendCapacity() {
            // 新建一個長度為原陣列 extendRatio 倍的新陣列
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // 將原陣列中的所有元素複製到新陣列
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // 釋放記憶體
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* 將串列轉換為 Vector 用於列印 */
        vector<int> toVector() {
            // 僅轉換有效長度範圍內的串列元素
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
    /* 串列類別 */
    class MyList {
        private int[] arr; // 陣列（儲存串列元素）
        private int capacity = 10; // 串列容量
        private int size = 0; // 串列長度（當前元素數量）
        private int extendRatio = 2; // 每次串列擴容的倍數

        /* 建構子 */
        public MyList() {
            arr = new int[capacity];
        }

        /* 獲取串列長度（當前元素數量） */
        public int size() {
            return size;
        }

        /* 獲取串列容量 */
        public int capacity() {
            return capacity;
        }

        /* 訪問元素 */
        public int get(int index) {
            // 索引如果越界，則丟擲異常，下同
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

        /* 在尾部新增元素 */
        public void add(int num) {
            // 元素數量超出容量時，觸發擴容機制
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // 更新元素數量
            size++;
        }

        /* 在中間插入元素 */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            // 元素數量超出容量時，觸發擴容機制
            if (size == capacity())
                extendCapacity();
            // 將索引 index 以及之後的元素都向後移動一位
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素數量
            size++;
        }

        /* 刪除元素 */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            int num = arr[index];
            // 將將索引 index 之後的元素都向前移動一位
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素數量
            size--;
            // 返回被刪除的元素
            return num;
        }

        /* 串列擴容 */
        public void extendCapacity() {
            // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // 更新串列容量
            capacity = arr.length;
        }

        /* 將串列轉換為陣列 */
        public int[] toArray() {
            int size = size();
            // 僅轉換有效長度範圍內的串列元素
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
    /* 串列類別 */
    class MyList {
        private int[] arr;           // 陣列（儲存串列元素）
        private int arrCapacity = 10;    // 串列容量
        private int arrSize = 0;         // 串列長度（當前元素數量）
        private readonly int extendRatio = 2;  // 每次串列擴容的倍數

        /* 建構子 */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* 獲取串列長度（當前元素數量）*/
        public int Size() {
            return arrSize;
        }

        /* 獲取串列容量 */
        public int Capacity() {
            return arrCapacity;
        }

        /* 訪問元素 */
        public int Get(int index) {
            // 索引如果越界，則丟擲異常，下同
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

        /* 在尾部新增元素 */
        public void Add(int num) {
            // 元素數量超出容量時，觸發擴容機制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // 更新元素數量
            arrSize++;
        }

        /* 在中間插入元素 */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            // 元素數量超出容量時，觸發擴容機制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // 將索引 index 以及之後的元素都向後移動一位
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素數量
            arrSize++;
        }

        /* 刪除元素 */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            int num = arr[index];
            // 將將索引 index 之後的元素都向前移動一位
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素數量
            arrSize--;
            // 返回被刪除的元素
            return num;
        }

        /* 串列擴容 */
        public void ExtendCapacity() {
            // 新建一個長度為 arrCapacity * extendRatio 的陣列，並將原陣列複製到新陣列
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // 更新串列容量
            arrCapacity = arr.Length;
        }

        /* 將串列轉換為陣列 */
        public int[] ToArray() {
            // 僅轉換有效長度範圍內的串列元素
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
    /* 串列類別 */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* 建構子 */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // 串列容量
            arr:         make([]int, 10), // 陣列（儲存串列元素）
            arrSize:     0,               // 串列長度（當前元素數量）
            extendRatio: 2,               // 每次串列擴容的倍數
        }
    }

    /* 獲取串列長度（當前元素數量） */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  獲取串列容量 */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* 訪問元素 */
    func (l *myList) get(index int) int {
        // 索引如果越界，則丟擲異常，下同
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

    /* 在尾部新增元素 */
    func (l *myList) add(num int) {
        // 元素數量超出容量時，觸發擴容機制
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // 更新元素數量
        l.arrSize++
    }

    /* 在中間插入元素 */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        // 元素數量超出容量時，觸發擴容機制
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // 將索引 index 以及之後的元素都向後移動一位
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // 更新元素數量
        l.arrSize++
    }

    /* 刪除元素 */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        num := l.arr[index]
        // 將索引 index 之後的元素都向前移動一位
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // 更新元素數量
        l.arrSize--
        // 返回被刪除的元素
        return num
    }

    /* 串列擴容 */
    func (l *myList) extendCapacity() {
        // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // 更新串列容量
        l.arrCapacity = len(l.arr)
    }

    /* 返回有效長度的串列 */
    func (l *myList) toArray() []int {
        // 僅轉換有效長度範圍內的串列元素
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* 串列類別 */
    class MyList {
        private var arr: [Int] // 陣列（儲存串列元素）
        private var _capacity: Int // 串列容量
        private var _size: Int // 串列長度（當前元素數量）
        private let extendRatio: Int // 每次串列擴容的倍數

        /* 建構子 */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* 獲取串列長度（當前元素數量）*/
        func size() -> Int {
            _size
        }

        /* 獲取串列容量 */
        func capacity() -> Int {
            _capacity
        }

        /* 訪問元素 */
        func get(index: Int) -> Int {
            // 索引如果越界則丟擲錯誤，下同
            if index < 0 || index >= size() {
                fatalError("索引越界")
            }
            return arr[index]
        }

        /* 更新元素 */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("索引越界")
            }
            arr[index] = num
        }

        /* 在尾部新增元素 */
        func add(num: Int) {
            // 元素數量超出容量時，觸發擴容機制
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // 更新元素數量
            _size += 1
        }

        /* 在中間插入元素 */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("索引越界")
            }
            // 元素數量超出容量時，觸發擴容機制
            if size() == capacity() {
                extendCapacity()
            }
            // 將索引 index 以及之後的元素都向後移動一位
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // 更新元素數量
            _size += 1
        }

        /* 刪除元素 */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("索引越界")
            }
            let num = arr[index]
            // 將將索引 index 之後的元素都向前移動一位
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // 更新元素數量
            _size -= 1
            // 返回被刪除的元素
            return num
        }

        /* 串列擴容 */
        func extendCapacity() {
            // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // 更新串列容量
            _capacity = arr.count
        }

        /* 將串列轉換為陣列 */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* 串列類別 */
    class MyList {
        #arr = new Array(); // 陣列（儲存串列元素）
        #capacity = 10; // 串列容量
        #size = 0; // 串列長度（當前元素數量）
        #extendRatio = 2; // 每次串列擴容的倍數

        /* 建構子 */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* 獲取串列長度（當前元素數量）*/
        size() {
            return this.#size;
        }

        /* 獲取串列容量 */
        capacity() {
            return this.#capacity;
        }

        /* 訪問元素 */
        get(index) {
            // 索引如果越界，則丟擲異常，下同
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            return this.#arr[index];
        }

        /* 更新元素 */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            this.#arr[index] = num;
        }

        /* 在尾部新增元素 */
        add(num) {
            // 如果長度等於容量，則需要擴容
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 將新元素新增到串列尾部
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* 在中間插入元素 */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            // 元素數量超出容量時，觸發擴容機制
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 將索引 index 以及之後的元素都向後移動一位
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // 更新元素數量
            this.#arr[index] = num;
            this.#size++;
        }

        /* 刪除元素 */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            let num = this.#arr[index];
            // 將索引 index 之後的元素都向前移動一位
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // 更新元素數量
            this.#size--;
            // 返回被刪除的元素
            return num;
        }

        /* 串列擴容 */
        extendCapacity() {
            // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // 更新串列容量
            this.#capacity = this.#arr.length;
        }

        /* 將串列轉換為陣列 */
        toArray() {
            let size = this.size();
            // 僅轉換有效長度範圍內的串列元素
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
    /* 串列類別 */
    class MyList {
        private arr: Array<number>; // 陣列（儲存串列元素）
        private _capacity: number = 10; // 串列容量
        private _size: number = 0; // 串列長度（當前元素數量）
        private extendRatio: number = 2; // 每次串列擴容的倍數

        /* 建構子 */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* 獲取串列長度（當前元素數量）*/
        public size(): number {
            return this._size;
        }

        /* 獲取串列容量 */
        public capacity(): number {
            return this._capacity;
        }

        /* 訪問元素 */
        public get(index: number): number {
            // 索引如果越界，則丟擲異常，下同
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            return this.arr[index];
        }

        /* 更新元素 */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            this.arr[index] = num;
        }

        /* 在尾部新增元素 */
        public add(num: number): void {
            // 如果長度等於容量，則需要擴容
            if (this._size === this._capacity) this.extendCapacity();
            // 將新元素新增到串列尾部
            this.arr[this._size] = num;
            this._size++;
        }

        /* 在中間插入元素 */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            // 元素數量超出容量時，觸發擴容機制
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // 將索引 index 以及之後的元素都向後移動一位
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // 更新元素數量
            this.arr[index] = num;
            this._size++;
        }

        /* 刪除元素 */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            let num = this.arr[index];
            // 將將索引 index 之後的元素都向前移動一位
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // 更新元素數量
            this._size--;
            // 返回被刪除的元素
            return num;
        }

        /* 串列擴容 */
        public extendCapacity(): void {
            // 新建一個長度為 size 的陣列，並將原陣列複製到新陣列
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // 更新串列容量
            this._capacity = this.arr.length;
        }

        /* 將串列轉換為陣列 */
        public toArray(): number[] {
            let size = this.size();
            // 僅轉換有效長度範圍內的串列元素
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
    /* 串列類別 */
    class MyList {
      late List<int> _arr; // 陣列（儲存串列元素）
      int _capacity = 10; // 串列容量
      int _size = 0; // 串列長度（當前元素數量）
      int _extendRatio = 2; // 每次串列擴容的倍數

      /* 建構子 */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* 獲取串列長度（當前元素數量）*/
      int size() => _size;

      /* 獲取串列容量 */
      int capacity() => _capacity;

      /* 訪問元素 */
      int get(int index) {
        if (index >= _size) throw RangeError('索引越界');
        return _arr[index];
      }

      /* 更新元素 */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('索引越界');
        _arr[index] = _num;
      }

      /* 在尾部新增元素 */
      void add(int _num) {
        // 元素數量超出容量時，觸發擴容機制
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // 更新元素數量
        _size++;
      }

      /* 在中間插入元素 */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('索引越界');
        // 元素數量超出容量時，觸發擴容機制
        if (_size == _capacity) extendCapacity();
        // 將索引 index 以及之後的元素都向後移動一位
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // 更新元素數量
        _size++;
      }

      /* 刪除元素 */
      int remove(int index) {
        if (index >= _size) throw RangeError('索引越界');
        int _num = _arr[index];
        // 將將索引 index 之後的元素都向前移動一位
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // 更新元素數量
        _size--;
        // 返回被刪除的元素
        return _num;
      }

      /* 串列擴容 */
      void extendCapacity() {
        // 新建一個長度為原陣列 _extendRatio 倍的新陣列
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 將原陣列複製到新陣列
        List.copyRange(_newNums, 0, _arr);
        // 更新 _arr 的引用
        _arr = _newNums;
        // 更新串列容量
        _capacity = _arr.length;
      }

      /* 將串列轉換為陣列 */
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
    /* 串列類別 */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // 陣列（儲存串列元素）
        capacity: usize,     // 串列容量
        size: usize,         // 串列長度（當前元素數量）
        extend_ratio: usize, // 每次串列擴容的倍數
    }

    #[allow(unused, unused_comparisons)]
    impl MyList {
        /* 建構子 */
        pub fn new(capacity: usize) -> Self {
            let mut vec = vec![0; capacity];
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* 獲取串列長度（當前元素數量）*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* 獲取串列容量 */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 訪問元素 */
        pub fn get(&self, index: usize) -> i32 {
            // 索引如果越界，則丟擲異常，下同
            if index >= self.size {
                panic!("索引越界")
            };
            return self.arr[index];
        }

        /* 更新元素 */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("索引越界")
            };
            self.arr[index] = num;
        }

        /* 在尾部新增元素 */
        pub fn add(&mut self, num: i32) {
            // 元素數量超出容量時，觸發擴容機制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // 更新元素數量
            self.size += 1;
        }

        /* 在中間插入元素 */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("索引越界")
            };
            // 元素數量超出容量時，觸發擴容機制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // 將索引 index 以及之後的元素都向後移動一位
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 更新元素數量
            self.size += 1;
        }

        /* 刪除元素 */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("索引越界")
            };
            let num = self.arr[index];
            // 將索引 index 之後的元素都向前移動一位
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // 更新元素數量
            self.size -= 1;
            // 返回被刪除的元素
            return num;
        }

        /* 串列擴容 */
        pub fn extend_capacity(&mut self) {
            // 新建一個長度為原陣列 extend_ratio 倍的新陣列，並將原陣列複製到新陣列
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // 更新串列容量
            self.capacity = new_capacity;
        }

        /* 將串列轉換為陣列 */
        pub fn to_array(&self) -> Vec<i32> {
            // 僅轉換有效長度範圍內的串列元素
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
    /* 串列類別 */
    typedef struct {
        int *arr;        // 陣列（儲存串列元素）
        int capacity;    // 串列容量
        int size;        // 串列大小
        int extendRatio; // 串列每次擴容的倍數
    } MyList;

    /* 建構子 */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* 析構函式 */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* 獲取串列長度 */
    int size(MyList *nums) {
        return nums->size;
    }

    /* 獲取串列容量 */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* 訪問元素 */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* 更新元素 */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* 在尾部新增元素 */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 擴容
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* 在中間插入元素 */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // 元素數量超出容量時，觸發擴容機制
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 擴容
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* 刪除元素 */
    // 注意：stdio.h 佔用了 remove 關鍵詞
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* 串列擴容 */
    void extendCapacity(MyList *nums) {
        // 先分配空間
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // 複製舊資料到新資料
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // 釋放舊資料
        free(temp);

        // 更新新資料
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* 將串列轉換為 Array 用於列印 */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* 串列類別 */
    class MyList {
        private var arr: IntArray = intArrayOf() // 陣列（儲存串列元素）
        private var capacity: Int = 10 // 串列容量
        private var size: Int = 0 // 串列長度（當前元素數量）
        private var extendRatio: Int = 2 // 每次串列擴容的倍數

        /* 建構子 */
        init {
            arr = IntArray(capacity)
        }

        /* 獲取串列長度（當前元素數量） */
        fun size(): Int {
            return size
        }

        /* 獲取串列容量 */
        fun capacity(): Int {
            return capacity
        }

        /* 訪問元素 */
        fun get(index: Int): Int {
            // 索引如果越界，則丟擲異常，下同
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引越界")
            return arr[index]
        }

        /* 更新元素 */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引越界")
            arr[index] = num
        }

        /* 在尾部新增元素 */
        fun add(num: Int) {
            // 元素數量超出容量時，觸發擴容機制
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // 更新元素數量
            size++
        }

        /* 在中間插入元素 */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引越界")
            // 元素數量超出容量時，觸發擴容機制
            if (size == capacity())
                extendCapacity()
            // 將索引 index 以及之後的元素都向後移動一位
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // 更新元素數量
            size++
        }

        /* 刪除元素 */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引越界")
            val num = arr[index]
            // 將將索引 index 之後的元素都向前移動一位
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // 更新元素數量
            size--
            // 返回被刪除的元素
            return num
        }

        /* 串列擴容 */
        fun extendCapacity() {
            // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
            arr = arr.copyOf(capacity() * extendRatio)
            // 更新串列容量
            capacity = arr.size
        }

        /* 將串列轉換為陣列 */
        fun toArray(): IntArray {
            val size = size()
            // 僅轉換有效長度範圍內的串列元素
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
    ### 串列類別 ###
    class MyList
      attr_reader :size       # 獲取串列長度（當前元素數量）
      attr_reader :capacity   # 獲取串列容量

      ### 建構子 ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### 訪問元素 ###
      def get(index)
        # 索引如果越界，則丟擲異常，下同
        raise IndexError, "索引越界" if index < 0 || index >= size
        @arr[index]
      end

      ### 訪問元素 ###
      def set(index, num)
        raise IndexError, "索引越界" if index < 0 || index >= size
        @arr[index] = num
      end

      ### 在尾部新增元素 ###
      def add(num)
        # 元素數量超出容量時，觸發擴容機制
        extend_capacity if size == capacity
        @arr[size] = num

        # 更新元素數量
        @size += 1
      end

      ### 在中間插入元素 ###
      def insert(index, num)
        raise IndexError, "索引越界" if index < 0 || index >= size

        # 元素數量超出容量時，觸發擴容機制
        extend_capacity if size == capacity

        # 將索引 index 以及之後的元素都向後移動一位
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # 更新元素數量
        @size += 1
      end

      ### 刪除元素 ###
      def remove(index)
        raise IndexError, "索引越界" if index < 0 || index >= size
        num = @arr[index]

        # 將將索引 index 之後的元素都向前移動一位
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # 更新元素數量
        @size -= 1

        # 返回被刪除的元素
        num
      end

      ### 串列擴容 ###
      def extend_capacity
        # 新建一個長度為原陣列 extend_ratio 倍的新陣列，並將原陣列複製到新陣列
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # 更新串列容量
        @capacity = arr.length
      end

      ### 將串列轉換為陣列 ###
      def to_array
        sz = size
        # 僅轉換有效長度範圍內的串列元素
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

=== "Zig"

    ```zig title="my_list.zig"
    // 串列類別
    fn MyList(comptime T: type) type {
        return struct {
            const Self = @This();
            
            arr: []T = undefined,                        // 陣列（儲存串列元素）
            arrCapacity: usize = 10,                     // 串列容量
            numSize: usize = 0,                           // 串列長度（當前元素數量）
            extendRatio: usize = 2,                       // 每次串列擴容的倍數
            mem_arena: ?std.heap.ArenaAllocator = null,
            mem_allocator: std.mem.Allocator = undefined, // 記憶體分配器

            // 建構子（分配記憶體+初始化串列）
            pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
                if (self.mem_arena == null) {
                    self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                    self.mem_allocator = self.mem_arena.?.allocator();
                }
                self.arr = try self.mem_allocator.alloc(T, self.arrCapacity);
                @memset(self.arr, @as(T, 0));
            }

            // 析構函式（釋放記憶體）
            pub fn deinit(self: *Self) void {
                if (self.mem_arena == null) return;
                self.mem_arena.?.deinit();
            }

            // 獲取串列長度（當前元素數量）
            pub fn size(self: *Self) usize {
                return self.numSize;
            }

            // 獲取串列容量
            pub fn capacity(self: *Self) usize {
                return self.arrCapacity;
            }

            // 訪問元素
            pub fn get(self: *Self, index: usize) T {
                // 索引如果越界，則丟擲異常，下同
                if (index < 0 or index >= self.size()) @panic("索引越界");
                return self.arr[index];
            }  

            // 更新元素
            pub fn set(self: *Self, index: usize, num: T) void {
                // 索引如果越界，則丟擲異常，下同
                if (index < 0 or index >= self.size()) @panic("索引越界");
                self.arr[index] = num;
            }  

            // 在尾部新增元素
            pub fn add(self: *Self, num: T) !void {
                // 元素數量超出容量時，觸發擴容機制
                if (self.size() == self.capacity()) try self.extendCapacity();
                self.arr[self.size()] = num;
                // 更新元素數量
                self.numSize += 1;
            }  

            // 在中間插入元素
            pub fn insert(self: *Self, index: usize, num: T) !void {
                if (index < 0 or index >= self.size()) @panic("索引越界");
                // 元素數量超出容量時，觸發擴容機制
                if (self.size() == self.capacity()) try self.extendCapacity();
                // 將索引 index 以及之後的元素都向後移動一位
                var j = self.size() - 1;
                while (j >= index) : (j -= 1) {
                    self.arr[j + 1] = self.arr[j];
                }
                self.arr[index] = num;
                // 更新元素數量
                self.numSize += 1;
            }

            // 刪除元素
            pub fn remove(self: *Self, index: usize) T {
                if (index < 0 or index >= self.size()) @panic("索引越界");
                var num = self.arr[index];
                // 將索引 index 之後的元素都向前移動一位
                var j = index;
                while (j < self.size() - 1) : (j += 1) {
                    self.arr[j] = self.arr[j + 1];
                }
                // 更新元素數量
                self.numSize -= 1;
                // 返回被刪除的元素
                return num;
            }

            // 串列擴容
            pub fn extendCapacity(self: *Self) !void {
                // 新建一個長度為 size * extendRatio 的陣列，並將原陣列複製到新陣列
                var newCapacity = self.capacity() * self.extendRatio;
                var extend = try self.mem_allocator.alloc(T, newCapacity);
                @memset(extend, @as(T, 0));
                // 將原陣列中的所有元素複製到新陣列
                std.mem.copy(T, extend, self.arr);
                self.arr = extend;
                // 更新串列容量
                self.arrCapacity = newCapacity;
            }

            // 將串列轉換為陣列
            pub fn toArray(self: *Self) ![]T {
                // 僅轉換有效長度範圍內的串列元素
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

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22%E4%B8%B2%E5%88%97%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E4%B8%B2%E5%88%97%E9%95%B7%E5%BA%A6%EF%BC%88%E7%95%B6%E5%89%8D%E5%85%83%E7%B4%A0%E6%95%B8%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E4%B8%B2%E5%88%97%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%96%B0%E5%A2%9E%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%BE%8C%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%BE%8C%E7%A7%BB%E5%8B%95%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201%2C%20index%20-%201%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%BE%8C%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%89%8D%E7%A7%BB%E5%8B%95%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index%2C%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%B2%E5%88%97%E6%93%B4%E5%AE%B9%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%96%B0%E5%A2%9E%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%286%2C%20index%3D3%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.set%280%2C%201%29%0A%0A%20%20%20%20%23%20%E6%B8%AC%E8%A9%A6%E6%93%B4%E5%AE%B9%E6%A9%9F%E5%88%B6%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22%E4%B8%B2%E5%88%97%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E4%B8%B2%E5%88%97%E9%95%B7%E5%BA%A6%EF%BC%88%E7%95%B6%E5%89%8D%E5%85%83%E7%B4%A0%E6%95%B8%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E4%B8%B2%E5%88%97%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%96%B0%E5%A2%9E%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%BE%8C%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%BE%8C%E7%A7%BB%E5%8B%95%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201%2C%20index%20-%201%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%BE%8C%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%89%8D%E7%A7%BB%E5%8B%95%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index%2C%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%B2%E5%88%97%E6%93%B4%E5%AE%B9%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%96%B0%E5%A2%9E%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%286%2C%20index%3D3%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.set%280%2C%201%29%0A%0A%20%20%20%20%23%20%E6%B8%AC%E8%A9%A6%E6%93%B4%E5%AE%B9%E6%A9%9F%E5%88%B6%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>
