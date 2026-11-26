---
comments: true
---

# 4.3 &nbsp; 列表

<u>列表（list）</u>是一種抽象的資料結構，代表一組有順序的元素。使用者可以存取、修改、新增、刪除或走訪元素，不必考慮容量限制。列表可以用鏈結串列或陣列來實作。

- 鏈結串列本身就可以視為列表。它支援新增、刪除、查詢及修改元素，也能在執行時彈性增加容量。
- 陣列也支援新增、刪除、查詢及修改元素，但因為長度固定，只能視為長度受限的列表。

使用陣列實作列表時，**固定長度會降低列表的實用性**。我們通常無法預先確定要儲存多少資料，因此很難選定合適的長度。太短很可能不敷使用，太長則會浪費記憶體空間。

我們可以改用<u>動態陣列（dynamic array）</u>來實作列表。它保留了陣列的各項優點，還能在程式執行期間動態擴充容量。

事實上，**許多程式語言的標準函式庫都以動態陣列實作列表**，例如 Python 的 `list`、Java 的 `ArrayList`、C++ 的 `vector`，以及 C# 的 `List`。在接下來的討論中，我們將「列表」與「動態陣列」視為相同的概念。

## 4.3.1 &nbsp; 列表的常見操作

### 1. &nbsp; 初始化列表

初始化列表時，通常有「不指定初始值」和「給定初始值」兩種做法：

=== "Python"

    ```python title="list.py"
    # 初始化列表
    # 無初始值
    empty_nums: list[int] = []
    # 有初始值
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 初始化列表 */
    // 無初始值
    vector<int> emptyNums;
    // 有初始值
    vector<int> nums = {1, 3, 2, 5, 4};
    ```

=== "Java"

    ```java title="list.java"
    /* 初始化列表 */
    // 無初始值
    List<Integer> emptyNums = new ArrayList<>();
    // 有初始值（注意，陣列型別應為 Integer[] 而非 int[]，因為列表中的 int 元素必須使用其包裝類別 Integer）
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 初始化列表 */
    // 無初始值
    List<int> emptyNums = [];
    // 有初始值
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* 初始化列表 */
    // 無初始值
    emptyNums := []int{}
    // 有初始值
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 初始化列表 */
    // 無初始值
    let emptyNums: [Int] = []
    // 有初始值
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* 初始化列表 */
    // 無初始值
    const emptyNums = [];
    // 有初始值
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 初始化列表 */
    // 無初始值
    const emptyNums: number[] = [];
    // 有初始值
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 初始化列表 */
    // 無初始值
    List<int> emptyNums = [];
    // 有初始值
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    // 初始化列表
    // 無初始值
    let empty_nums: Vec<i32> = Vec::new();
    // 有初始值
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建的動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 初始化列表 */
    // 無初始值
    val emptyNums = mutableListOf<Int>()
    // 有初始值
    val nums = mutableListOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 初始化列表
    # 無初始值
    empty_nums = []
    # 有初始值
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20%23%20%E7%84%A1%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20%23%20%E7%84%A1%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 存取元素

這裡的列表底層是陣列，因此可在 $O(1)$ 時間內存取和更新元素，效率很高。

=== "Python"

    ```python title="list.py"
    # 存取元素
    x: int = nums[1]  # 存取索引 1 處的元素

    # 更新元素
    nums[1] = 0  # 將索引 1 處的元素更新為 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 存取元素 */
    int num = nums[1]; // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0; // 將索引 1 處的元素更新為 0
    ```

=== "Java"

    ```java title="list.java"
    /* 存取元素 */
    int num = nums.get(1); // 存取索引 1 處的元素

    /* 更新元素 */
    nums.set(1, 0); // 將索引 1 處的元素更新為 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 存取元素 */
    int num = nums[1]; // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0; // 將索引 1 處的元素更新為 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* 存取元素 */
    num := nums[1] // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0 // 將索引 1 處的元素更新為 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 存取元素 */
    let num = nums[1] // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0 // 將索引 1 處的元素更新為 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* 存取元素 */
    const num = nums[1]; // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0; // 將索引 1 處的元素更新為 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 存取元素 */
    const num: number = nums[1]; // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0; // 將索引 1 處的元素更新為 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 存取元素 */
    int _num = nums[1]; // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0; // 將索引 1 處的元素更新為 0
    ```

=== "Rust"

    ```rust title="list.rs"
    // 存取元素
    let num = nums[1]; // 存取索引 1 處的元素

    // 更新元素
    nums[1] = 0; // 將索引 1 處的元素更新為 0
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建的動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 存取元素 */
    val num = nums[1] // 存取索引 1 處的元素

    /* 更新元素 */
    nums[1] = 0 // 將索引 1 處的元素更新為 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 存取元素
    num = nums[1] # 存取索引 1 處的元素

    # 更新元素
    nums[1] = 0 # 將索引 1 處的元素更新為 0
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%85%83%E7%B4%A0%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%80%E5%8F%96%E7%B4%A2%E5%BC%95%201%20%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%201%20%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E7%82%BA%200&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%85%83%E7%B4%A0%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%80%E5%8F%96%E7%B4%A2%E5%BC%95%201%20%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%201%20%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E7%82%BA%200&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 3. &nbsp; 插入與刪除元素

相較於陣列，列表可以自由加入或刪除元素。在列表尾端加入元素的時間複雜度為 $O(1)$，但插入和刪除元素的效率仍與陣列相同，時間複雜度為 $O(n)$。

=== "Python"

    ```python title="list.py"
    # 清空列表
    nums.clear()

    # 在尾端加入元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # 在中間插入元素
    nums.insert(3, 6)  # 在索引 3 處插入數字 6

    # 刪除元素
    nums.pop(3)  # 刪除索引 3 處的元素
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 清空列表 */
    nums.clear();

    /* 在尾端加入元素 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* 在中間插入元素 */
    nums.insert(nums.begin() + 3, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.erase(nums.begin() + 3); // 刪除索引 3 處的元素
    ```

=== "Java"

    ```java title="list.java"
    /* 清空列表 */
    nums.clear();

    /* 在尾端加入元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 在中間插入元素 */
    nums.add(3, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.remove(3); // 刪除索引 3 處的元素
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 清空列表 */
    nums.Clear();

    /* 在尾端加入元素 */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* 在中間插入元素 */
    nums.Insert(3, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.RemoveAt(3); // 刪除索引 3 處的元素
    ```

=== "Go"

    ```go title="list_test.go"
    /* 清空列表 */
    nums = nil

    /* 在尾端加入元素 */
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
    /* 清空列表 */
    nums.removeAll()

    /* 在尾端加入元素 */
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
    /* 清空列表 */
    nums.length = 0;

    /* 在尾端加入元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中間插入元素 */
    nums.splice(3, 0, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.splice(3, 1); // 刪除索引 3 處的元素
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 清空列表 */
    nums.length = 0;

    /* 在尾端加入元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中間插入元素 */
    nums.splice(3, 0, 6); // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.splice(3, 1); // 刪除索引 3 處的元素
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 清空列表 */
    nums.clear();

    /* 在尾端加入元素 */
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
    // 清空列表
    nums.clear();

    // 在尾端加入元素
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    // 在中間插入元素
    nums.insert(3, 6); // 在索引 3 處插入數字 6

    // 刪除元素
    nums.remove(3); // 刪除索引 3 處的元素
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建的動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 清空列表 */
    nums.clear()

    /* 在尾端加入元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)

    /* 在中間插入元素 */
    nums.add(3, 6) // 在索引 3 處插入數字 6

    /* 刪除元素 */
    nums.removeAt(3) // 刪除索引 3 處的元素
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 清空列表
    nums.clear

    # 在尾端加入元素
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

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E7%AB%AF%E5%8A%A0%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E7%AB%AF%E5%8A%A0%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 4. &nbsp; 走訪列表

和陣列一樣，我們可以依索引走訪列表，也可以直接走訪各個元素。

=== "Python"

    ```python title="list.py"
    # 依索引走訪列表
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # 直接走訪列表中的元素
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 依索引走訪列表 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* 直接走訪列表中的元素 */
    count = 0;
    for (int x : nums) {
        count += x;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* 依索引走訪列表 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* 直接走訪列表中的元素 */
    for (int x : nums) {
        count += x;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 依索引走訪列表 */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* 直接走訪列表中的元素 */
    count = 0;
    foreach (int x in nums) {
        count += x;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* 依索引走訪列表 */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* 直接走訪列表中的元素 */
    count = 0
    for _, x := range nums {
        count += x
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 依索引走訪列表 */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* 直接走訪列表中的元素 */
    count = 0
    for x in nums {
        count += x
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* 依索引走訪列表 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接走訪列表中的元素 */
    count = 0;
    for (const x of nums) {
        count += x;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 依索引走訪列表 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接走訪列表中的元素 */
    count = 0;
    for (const x of nums) {
        count += x;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 依索引走訪列表 */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
      count += nums[i];
    }

    /* 直接走訪列表中的元素 */
    count = 0;
    for (var x in nums) {
      count += x;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // 依索引走訪列表
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // 直接走訪列表中的元素
    _count = 0;
    for x in &nums {
        _count += x;
    }
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建的動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 依索引走訪列表 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 直接走訪列表中的元素 */
    for (j in nums) {
        count += j
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 依索引走訪列表
    count = 0
    for i in 0...nums.length
      count += nums[i]
    end

    # 直接走訪列表中的元素
    count = 0
    nums.each do |x|
      count += x
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BE%9D%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%E4%B8%AD%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BE%9D%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%E4%B8%AD%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 5. &nbsp; 串接列表

給定一個新列表 `nums1`，我們可以將它接在原列表的尾端。

=== "Python"

    ```python title="list.py"
    # 串接兩個列表
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # 將列表 nums1 接在 nums 之後
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 串接兩個列表 */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    // 將列表 nums1 接在 nums 之後
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 串接兩個列表 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1); // 將列表 nums1 接在 nums 之後
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 串接兩個列表 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1); // 將列表 nums1 接在 nums 之後
    ```

=== "Go"

    ```go title="list_test.go"
    /* 串接兩個列表 */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...) // 將列表 nums1 接在 nums 之後
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 串接兩個列表 */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // 將列表 nums1 接在 nums 之後
    ```

=== "JS"

    ```javascript title="list.js"
    /* 串接兩個列表 */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1); // 將列表 nums1 接在 nums 之後
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 串接兩個列表 */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1); // 將列表 nums1 接在 nums 之後
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 串接兩個列表 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1); // 將列表 nums1 接在 nums 之後
    ```

=== "Rust"

    ```rust title="list.rs"
    // 串接兩個列表
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append 會移走 nums1 的元素，之後 nums1 就空了
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建的動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 串接兩個列表 */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // 將列表 nums1 接在 nums 之後
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 串接兩個列表
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%B8%B2%E6%8E%A5%E5%85%A9%E5%80%8B%E4%B8%B2%E5%88%97%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%20nums1%20%E6%8E%A5%E5%88%B0%20nums%20%E7%9A%84%E5%B0%BE%E7%AB%AF&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%B8%B2%E6%8E%A5%E5%85%A9%E5%80%8B%E4%B8%B2%E5%88%97%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%20nums1%20%E6%8E%A5%E5%88%B0%20nums%20%E7%9A%84%E5%B0%BE%E7%AB%AF&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 6. &nbsp; 排序列表

將列表排序後，就能使用陣列演算法題目中常見的「二分搜尋」與「雙指標」演算法。

=== "Python"

    ```python title="list.py"
    # 排序列表
    nums.sort()  # 排序後，列表元素由小到大排列
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 排序列表 */
    sort(nums.begin(), nums.end()); // 排序後，列表元素由小到大排列
    ```

=== "Java"

    ```java title="list.java"
    /* 排序列表 */
    Collections.sort(nums); // 排序後，列表元素由小到大排列
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 排序列表 */
    nums.Sort(); // 排序後，列表元素由小到大排列
    ```

=== "Go"

    ```go title="list_test.go"
    /* 排序列表 */
    sort.Ints(nums) // 排序後，列表元素由小到大排列
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 排序列表 */
    nums.sort() // 排序後，列表元素由小到大排列
    ```

=== "JS"

    ```javascript title="list.js"
    /* 排序列表 */
    nums.sort((a, b) => a - b); // 排序後，列表元素由小到大排列
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 排序列表 */
    nums.sort((a, b) => a - b); // 排序後，列表元素由小到大排列
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 排序列表 */
    nums.sort(); // 排序後，列表元素由小到大排列
    ```

=== "Rust"

    ```rust title="list.rs"
    // 排序列表
    nums.sort(); // 排序後，列表元素由小到大排列
    ```

=== "C"

    ```c title="list.c"
    // C 未提供內建的動態陣列
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 排序列表 */
    nums.sort() // 排序後，列表元素由小到大排列
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 排序列表
    nums = nums.sort { |a, b| a <=> b } # 排序後，列表元素由小到大排列
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E6%8E%92%E5%BA%8F%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%BE%8C%EF%BC%8C%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E7%94%B1%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E6%8E%92%E5%BA%8F%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%BE%8C%EF%BC%8C%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E7%94%B1%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 4.3.2 &nbsp; 實作列表

許多程式語言都提供現成的列表，例如 Java、C++ 和 Python。這些列表的實作較為複雜，初始容量、容量擴充倍數等參數也都經過仔細設計。有興趣的讀者可以閱讀原始碼，進一步了解。

為了更深入理解列表的運作原理，我們試著實作一個簡易的列表。設計時有三個重點。

- **初始容量**：選擇合理的陣列初始容量。本例採用的初始容量為 10。
- **記錄元素數量**：宣告變數 `size`，記錄列表目前的元素數量，每次插入或刪除元素時都要更新。我們可以用這個變數找到列表尾端，也可以用它判斷是否需要擴充容量。
- **容量擴充機制**：插入元素時，若列表容量已滿，就必須擴充容量。先依擴充倍數建立較大的陣列，再將目前陣列中的所有元素依序移到新陣列。本例規定每次都將陣列容量擴充為原來的 2 倍。

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """列表類別"""

        def __init__(self):
            """建構方法"""
            self._capacity: int = 10  # 列表容量
            self._arr: list[int] = [0] * self._capacity  # 陣列（用來儲存列表元素）
            self._size: int = 0  # 列表長度（目前的元素數量）
            self._extend_ratio: int = 2  # 每次擴充列表容量的倍數

        def size(self) -> int:
            """取得列表長度（目前的元素數量）"""
            return self._size

        def capacity(self) -> int:
            """取得列表容量"""
            return self._capacity

        def get(self, index: int) -> int:
            """存取元素"""
            # 若索引超出範圍，就拋出例外，以下同理
            if index < 0 or index >= self._size:
                raise IndexError("索引超出範圍")
            return self._arr[index]

        def set(self, num: int, index: int):
            """更新元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引超出範圍")
            self._arr[index] = num

        def add(self, num: int):
            """在尾端加入元素"""
            # 若加入元素後數量將超過容量，就觸發擴充機制
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """在中間插入元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引超出範圍")
            # 若加入元素後數量將超過容量，就觸發擴充機制
            if self._size == self.capacity():
                self.extend_capacity()
            # 將索引 index 起的所有元素往後移一格
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # 更新元素數量
            self._size += 1

        def remove(self, index: int) -> int:
            """刪除元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引超出範圍")
            num = self._arr[index]
            # 將索引 index 之後的所有元素往前移一格
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # 更新元素數量
            self._size -= 1
            # 回傳刪除的元素
            return num

        def extend_capacity(self):
            """擴充列表容量"""
            # 建立長度為原陣列 _extend_ratio 倍的新陣列，並將原陣列的內容複製過去
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # 更新列表容量
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """回傳僅包含有效元素的列表"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* 列表類別 */
    class MyList {
      private:
        int *arr;             // 陣列（用來儲存列表元素）
        int arrCapacity = 10; // 列表容量
        int arrSize = 0;      // 列表長度（目前的元素數量）
        int extendRatio = 2;   // 每次擴充列表容量的倍數

      public:
        /* 建構方法 */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* 解構方法 */
        ~MyList() {
            delete[] arr;
        }

        /* 取得列表長度（目前的元素數量）*/
        int size() {
            return arrSize;
        }

        /* 取得列表容量 */
        int capacity() {
            return arrCapacity;
        }

        /* 存取元素 */
        int get(int index) {
            // 若索引超出範圍，就拋出例外，以下同理
            if (index < 0 || index >= size())
                throw out_of_range("索引超出範圍");
            return arr[index];
        }

        /* 更新元素 */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引超出範圍");
            arr[index] = num;
        }

        /* 在尾端加入元素 */
        void add(int num) {
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // 更新元素數量
            arrSize++;
        }

        /* 在中間插入元素 */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引超出範圍");
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (size() == capacity())
                extendCapacity();
            // 將索引 index 起的所有元素往後移一格
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
                throw out_of_range("索引超出範圍");
            int num = arr[index];
            // 將索引 index 之後的所有元素往前移一格
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素數量
            arrSize--;
            // 回傳刪除的元素
            return num;
        }

        /* 擴充列表容量 */
        void extendCapacity() {
            // 建立新陣列，長度為原陣列的 extendRatio 倍
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // 將原陣列的所有元素複製到新陣列
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // 釋放記憶體
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* 將列表轉為 Vector 以便印出 */
        vector<int> toVector() {
            // 僅轉換列表有效長度範圍內的元素
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
    /* 列表類別 */
    class MyList {
        private int[] arr; // 陣列（用來儲存列表元素）
        private int capacity = 10; // 列表容量
        private int size = 0; // 列表長度（目前的元素數量）
        private int extendRatio = 2; // 每次擴充列表容量的倍數

        /* 建構方法 */
        public MyList() {
            arr = new int[capacity];
        }

        /* 取得列表長度（目前的元素數量） */
        public int size() {
            return size;
        }

        /* 取得列表容量 */
        public int capacity() {
            return capacity;
        }

        /* 存取元素 */
        public int get(int index) {
            // 若索引超出範圍，就拋出例外，以下同理
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引超出範圍");
            return arr[index];
        }

        /* 更新元素 */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引超出範圍");
            arr[index] = num;
        }

        /* 在尾端加入元素 */
        public void add(int num) {
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // 更新元素數量
            size++;
        }

        /* 在中間插入元素 */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引超出範圍");
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (size == capacity())
                extendCapacity();
            // 將索引 index 起的所有元素往後移一格
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
                throw new IndexOutOfBoundsException("索引超出範圍");
            int num = arr[index];
            // 將索引 index 之後的所有元素往前移一格
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素數量
            size--;
            // 回傳刪除的元素
            return num;
        }

        /* 擴充列表容量 */
        public void extendCapacity() {
            // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // 更新列表容量
            capacity = arr.length;
        }

        /* 將列表轉為陣列 */
        public int[] toArray() {
            int size = size();
            // 僅轉換列表有效長度範圍內的元素
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
    /* 列表類別 */
    class MyList {
        private int[] arr;           // 陣列（用來儲存列表元素）
        private int arrCapacity = 10;    // 列表容量
        private int arrSize = 0;         // 列表長度（目前的元素數量）
        private readonly int extendRatio = 2;  // 每次擴充列表容量的倍數

        /* 建構方法 */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* 取得列表長度（目前的元素數量）*/
        public int Size() {
            return arrSize;
        }

        /* 取得列表容量 */
        public int Capacity() {
            return arrCapacity;
        }

        /* 存取元素 */
        public int Get(int index) {
            // 若索引超出範圍，就拋出例外，以下同理
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引超出範圍");
            return arr[index];
        }

        /* 更新元素 */
        public void Set(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引超出範圍");
            arr[index] = num;
        }

        /* 在尾端加入元素 */
        public void Add(int num) {
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // 更新元素數量
            arrSize++;
        }

        /* 在中間插入元素 */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引超出範圍");
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // 將索引 index 起的所有元素往後移一格
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
                throw new IndexOutOfRangeException("索引超出範圍");
            int num = arr[index];
            // 將索引 index 之後的所有元素往前移一格
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素數量
            arrSize--;
            // 回傳刪除的元素
            return num;
        }

        /* 擴充列表容量 */
        public void ExtendCapacity() {
            // 建立長度為 arrCapacity * extendRatio 的陣列，並將原陣列的內容複製過去
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // 更新列表容量
            arrCapacity = arr.Length;
        }

        /* 將列表轉為陣列 */
        public int[] ToArray() {
            // 僅轉換列表有效長度範圍內的元素
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
    /* 列表類別 */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* 建構函式 */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // 列表容量
            arr:         make([]int, 10), // 陣列（用來儲存列表元素）
            arrSize:     0,               // 列表長度（目前的元素數量）
            extendRatio: 2,               // 每次擴充列表容量的倍數
        }
    }

    /* 取得列表長度（目前的元素數量） */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  取得列表容量 */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* 存取元素 */
    func (l *myList) get(index int) int {
        // 若索引超出範圍，就拋出例外，以下同理
        if index < 0 || index >= l.arrSize {
            panic("索引超出範圍")
        }
        return l.arr[index]
    }

    /* 更新元素 */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("索引超出範圍")
        }
        l.arr[index] = num
    }

    /* 在尾端加入元素 */
    func (l *myList) add(num int) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
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
            panic("索引超出範圍")
        }
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // 將索引 index 起的所有元素往後移一格
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
            panic("索引超出範圍")
        }
        num := l.arr[index]
        // 將索引 index 之後的所有元素往前移一格
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // 更新元素數量
        l.arrSize--
        // 回傳刪除的元素
        return num
    }

    /* 擴充列表容量 */
    func (l *myList) extendCapacity() {
        // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // 更新列表容量
        l.arrCapacity = len(l.arr)
    }

    /* 回傳僅包含有效元素的列表 */
    func (l *myList) toArray() []int {
        // 僅轉換列表有效長度範圍內的元素
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* 列表類別 */
    class MyList {
        private var arr: [Int] // 陣列（用來儲存列表元素）
        private var _capacity: Int // 列表容量
        private var _size: Int // 列表長度（目前的元素數量）
        private let extendRatio: Int // 每次擴充列表容量的倍數

        /* 建構方法 */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* 取得列表長度（目前的元素數量）*/
        func size() -> Int {
            _size
        }

        /* 取得列表容量 */
        func capacity() -> Int {
            _capacity
        }

        /* 存取元素 */
        func get(index: Int) -> Int {
            // 若索引超出範圍，就拋出錯誤，以下同理
            if index < 0 || index >= size() {
                fatalError("索引超出範圍")
            }
            return arr[index]
        }

        /* 更新元素 */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("索引超出範圍")
            }
            arr[index] = num
        }

        /* 在尾端加入元素 */
        func add(num: Int) {
            // 若加入元素後數量將超過容量，就觸發擴充機制
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
                fatalError("索引超出範圍")
            }
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if size() == capacity() {
                extendCapacity()
            }
            // 將索引 index 起的所有元素往後移一格
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
                fatalError("索引超出範圍")
            }
            let num = arr[index]
            // 將索引 index 之後的所有元素往前移一格
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // 更新元素數量
            _size -= 1
            // 回傳刪除的元素
            return num
        }

        /* 擴充列表容量 */
        func extendCapacity() {
            // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // 更新列表容量
            _capacity = arr.count
        }

        /* 將列表轉為陣列 */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* 列表類別 */
    class MyList {
        #arr = new Array(); // 陣列（用來儲存列表元素）
        #capacity = 10; // 列表容量
        #size = 0; // 列表長度（目前的元素數量）
        #extendRatio = 2; // 每次擴充列表容量的倍數

        /* 建構方法 */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* 取得列表長度（目前的元素數量）*/
        size() {
            return this.#size;
        }

        /* 取得列表容量 */
        capacity() {
            return this.#capacity;
        }

        /* 存取元素 */
        get(index) {
            // 若索引超出範圍，就拋出例外，以下同理
            if (index < 0 || index >= this.#size) throw new Error('索引超出範圍');
            return this.#arr[index];
        }

        /* 更新元素 */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引超出範圍');
            this.#arr[index] = num;
        }

        /* 在尾端加入元素 */
        add(num) {
            // 若長度等於容量，就需要擴充容量
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 將新元素加入列表尾端
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* 在中間插入元素 */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引超出範圍');
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 將索引 index 起的所有元素往後移一格
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // 更新元素數量
            this.#arr[index] = num;
            this.#size++;
        }

        /* 刪除元素 */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('索引超出範圍');
            let num = this.#arr[index];
            // 將索引 index 之後的所有元素往前移一格
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // 更新元素數量
            this.#size--;
            // 回傳刪除的元素
            return num;
        }

        /* 擴充列表容量 */
        extendCapacity() {
            // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // 更新列表容量
            this.#capacity = this.#arr.length;
        }

        /* 將列表轉為陣列 */
        toArray() {
            let size = this.size();
            // 僅轉換列表有效長度範圍內的元素
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
    /* 列表類別 */
    class MyList {
        private arr: Array<number>; // 陣列（用來儲存列表元素）
        private _capacity: number = 10; // 列表容量
        private _size: number = 0; // 列表長度（目前的元素數量）
        private extendRatio: number = 2; // 每次擴充列表容量的倍數

        /* 建構方法 */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* 取得列表長度（目前的元素數量）*/
        public size(): number {
            return this._size;
        }

        /* 取得列表容量 */
        public capacity(): number {
            return this._capacity;
        }

        /* 存取元素 */
        public get(index: number): number {
            // 若索引超出範圍，就拋出例外，以下同理
            if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
            return this.arr[index];
        }

        /* 更新元素 */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
            this.arr[index] = num;
        }

        /* 在尾端加入元素 */
        public add(num: number): void {
            // 若長度等於容量，就需要擴充容量
            if (this._size === this._capacity) this.extendCapacity();
            // 將新元素加入列表尾端
            this.arr[this._size] = num;
            this._size++;
        }

        /* 在中間插入元素 */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // 將索引 index 起的所有元素往後移一格
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // 更新元素數量
            this.arr[index] = num;
            this._size++;
        }

        /* 刪除元素 */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
            let num = this.arr[index];
            // 將索引 index 之後的所有元素往前移一格
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // 更新元素數量
            this._size--;
            // 回傳刪除的元素
            return num;
        }

        /* 擴充列表容量 */
        public extendCapacity(): void {
            // 建立長度為 size 的陣列，並將原陣列的內容複製過去
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // 更新列表容量
            this._capacity = this.arr.length;
        }

        /* 將列表轉為陣列 */
        public toArray(): number[] {
            let size = this.size();
            // 僅轉換列表有效長度範圍內的元素
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
    /* 列表類別 */
    class MyList {
      late List<int> _arr; // 陣列（用來儲存列表元素）
      int _capacity = 10; // 列表容量
      int _size = 0; // 列表長度（目前的元素數量）
      int _extendRatio = 2; // 每次擴充列表容量的倍數

      /* 建構方法 */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* 取得列表長度（目前的元素數量）*/
      int size() => _size;

      /* 取得列表容量 */
      int capacity() => _capacity;

      /* 存取元素 */
      int get(int index) {
        if (index >= _size) throw RangeError('索引超出範圍');
        return _arr[index];
      }

      /* 更新元素 */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('索引超出範圍');
        _arr[index] = _num;
      }

      /* 在尾端加入元素 */
      void add(int _num) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // 更新元素數量
        _size++;
      }

      /* 在中間插入元素 */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('索引超出範圍');
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (_size == _capacity) extendCapacity();
        // 將索引 index 起的所有元素往後移一格
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // 更新元素數量
        _size++;
      }

      /* 刪除元素 */
      int remove(int index) {
        if (index >= _size) throw RangeError('索引超出範圍');
        int _num = _arr[index];
        // 將索引 index 之後的所有元素往前移一格
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // 更新元素數量
        _size--;
        // 回傳刪除的元素
        return _num;
      }

      /* 擴充列表容量 */
      void extendCapacity() {
        // 建立新陣列，長度為原陣列的 _extendRatio 倍
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 將原陣列的內容複製到新陣列
        List.copyRange(_newNums, 0, _arr);
        // 更新 _arr 的參照
        _arr = _newNums;
        // 更新列表容量
        _capacity = _arr.length;
      }

      /* 將列表轉為陣列 */
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
    /* 列表類別 */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // 陣列（用來儲存列表元素）
        capacity: usize,     // 列表容量
        size: usize,         // 列表長度（目前的元素數量）
        extend_ratio: usize, // 每次擴充列表容量的倍數
    }

    #[allow(unused, unused_comparisons)]
    impl MyList {
        /* 建構方法 */
        pub fn new(capacity: usize) -> Self {
            let mut vec = vec![0; capacity];
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* 取得列表長度（目前的元素數量）*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* 取得列表容量 */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 存取元素 */
        pub fn get(&self, index: usize) -> i32 {
            // 若索引超出範圍，就拋出例外，以下同理
            if index >= self.size {
                panic!("索引超出範圍")
            };
            return self.arr[index];
        }

        /* 更新元素 */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("索引超出範圍")
            };
            self.arr[index] = num;
        }

        /* 在尾端加入元素 */
        pub fn add(&mut self, num: i32) {
            // 若加入元素後數量將超過容量，就觸發擴充機制
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
                panic!("索引超出範圍")
            };
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // 將索引 index 起的所有元素往後移一格
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
                panic!("索引超出範圍")
            };
            let num = self.arr[index];
            // 將索引 index 之後的所有元素往前移一格
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // 更新元素數量
            self.size -= 1;
            // 回傳刪除的元素
            return num;
        }

        /* 擴充列表容量 */
        pub fn extend_capacity(&mut self) {
            // 建立長度為原陣列 extend_ratio 倍的新陣列，並將原陣列的內容複製過去
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // 更新列表容量
            self.capacity = new_capacity;
        }

        /* 將列表轉為陣列 */
        pub fn to_array(&self) -> Vec<i32> {
            // 僅轉換列表有效長度範圍內的元素
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
    /* 列表類別 */
    typedef struct {
        int *arr;        // 陣列（用來儲存列表元素）
        int capacity;    // 列表容量
        int size;        // 列表大小
        int extendRatio; // 列表每次擴充容量的倍數
    } MyList;

    /* 建構函式 */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* 解構函式 */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* 取得列表長度 */
    int size(MyList *nums) {
        return nums->size;
    }

    /* 取得列表容量 */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* 存取元素 */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* 更新元素 */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* 在尾端加入元素 */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 擴充容量
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* 在中間插入元素 */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 擴充容量
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* 刪除元素 */
    // 注意：stdio.h 已使用 remove 這個名稱
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* 擴充列表容量 */
    void extendCapacity(MyList *nums) {
        // 先配置空間
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // 將舊資料複製到新空間
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // 釋放舊資料
        free(temp);

        // 改用新資料
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* 將列表轉為 Array 以便印出 */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* 列表類別 */
    class MyList {
        private var arr: IntArray = intArrayOf() // 陣列（用來儲存列表元素）
        private var capacity: Int = 10 // 列表容量
        private var size: Int = 0 // 列表長度（目前的元素數量）
        private var extendRatio: Int = 2 // 每次擴充列表容量的倍數

        /* 建構方法 */
        init {
            arr = IntArray(capacity)
        }

        /* 取得列表長度（目前的元素數量） */
        fun size(): Int {
            return size
        }

        /* 取得列表容量 */
        fun capacity(): Int {
            return capacity
        }

        /* 存取元素 */
        fun get(index: Int): Int {
            // 若索引超出範圍，就拋出例外，以下同理
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引超出範圍")
            return arr[index]
        }

        /* 更新元素 */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引超出範圍")
            arr[index] = num
        }

        /* 在尾端加入元素 */
        fun add(num: Int) {
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // 更新元素數量
            size++
        }

        /* 在中間插入元素 */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引超出範圍")
            // 若加入元素後數量將超過容量，就觸發擴充機制
            if (size == capacity())
                extendCapacity()
            // 將索引 index 起的所有元素往後移一格
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // 更新元素數量
            size++
        }

        /* 刪除元素 */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引超出範圍")
            val num = arr[index]
            // 將索引 index 之後的所有元素往前移一格
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // 更新元素數量
            size--
            // 回傳刪除的元素
            return num
        }

        /* 擴充列表容量 */
        fun extendCapacity() {
            // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
            arr = arr.copyOf(capacity() * extendRatio)
            // 更新列表容量
            capacity = arr.size
        }

        /* 將列表轉為陣列 */
        fun toArray(): IntArray {
            val size = size()
            // 僅轉換列表有效長度範圍內的元素
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
    ### 列表類別 ###
    class MyList
      attr_reader :size       # 取得列表長度（目前的元素數量）
      attr_reader :capacity   # 取得列表容量

      ### 建構方法 ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### 存取元素 ###
      def get(index)
        # 若索引超出範圍，就拋出例外，以下同理
        raise IndexError, "索引超出範圍" if index < 0 || index >= size
        @arr[index]
      end

      ### 存取元素 ###
      def set(index, num)
        raise IndexError, "索引超出範圍" if index < 0 || index >= size
        @arr[index] = num
      end

      ### 在尾端加入元素 ###
      def add(num)
        # 若加入元素後數量將超過容量，就觸發擴充機制
        extend_capacity if size == capacity
        @arr[size] = num

        # 更新元素數量
        @size += 1
      end

      ### 在中間插入元素 ###
      def insert(index, num)
        raise IndexError, "索引超出範圍" if index < 0 || index >= size

        # 若加入元素後數量將超過容量，就觸發擴充機制
        extend_capacity if size == capacity

        # 將索引 index 起的所有元素往後移一格
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # 更新元素數量
        @size += 1
      end

      ### 刪除元素 ###
      def remove(index)
        raise IndexError, "索引超出範圍" if index < 0 || index >= size
        num = @arr[index]

        # 將索引 index 之後的所有元素往前移一格
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # 更新元素數量
        @size -= 1

        # 回傳刪除的元素
        num
      end

      ### 擴充列表容量 ###
      def extend_capacity
        # 建立長度為原陣列 extend_ratio 倍的新陣列，並將原陣列的內容複製過去
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # 更新列表容量
        @capacity = arr.length
      end

      ### 將列表轉為陣列 ###
      def to_array
        sz = size
        # 僅轉換列表有效長度範圍內的元素
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%22%22%22%E5%88%97%E8%A1%A8%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%88%97%E8%A1%A8%E9%95%B7%E5%BA%A6%EF%BC%88%E7%9B%AE%E5%89%8D%E7%9A%84%E5%85%83%E7%B4%A0%E6%95%B8%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20return%20self._size%0A%0A%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20return%20self._capacity%0A%0A%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AD%98%E5%8F%96%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E7%AB%AF%E5%8A%A0%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E8%B5%B7%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%BE%8C%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%BE%8C%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%89%8D%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20return%20num%0A%0A%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%22%22%22%E6%93%B4%E5%85%85%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20nums%20%3D%20MyList%28%29%0A%20%20%23%20%E5%9C%A8%E5%B0%BE%E7%AB%AF%E5%8A%A0%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20nums.add%281%29%0A%20%20nums.add%283%29%0A%20%20nums.add%282%29%0A%20%20nums.add%285%29%0A%20%20nums.add%284%29%0A%0A%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20nums.remove%283%29%0A%0A%20%20%23%20%E5%AD%98%E5%8F%96%E5%85%83%E7%B4%A0%0A%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20nums.set%280,%201%29%0A%0A%20%20%23%20%E6%B8%AC%E8%A9%A6%E5%AE%B9%E9%87%8F%E6%93%B4%E5%85%85%E6%A9%9F%E5%88%B6%0A%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%22%22%22%E5%88%97%E8%A1%A8%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%88%97%E8%A1%A8%E9%95%B7%E5%BA%A6%EF%BC%88%E7%9B%AE%E5%89%8D%E7%9A%84%E5%85%83%E7%B4%A0%E6%95%B8%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20return%20self._size%0A%0A%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20return%20self._capacity%0A%0A%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AD%98%E5%8F%96%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E7%AB%AF%E5%8A%A0%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20index%20%E8%B5%B7%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%BE%8C%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%22%29%0A%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%BE%8C%E7%9A%84%E6%89%80%E6%9C%89%E5%85%83%E7%B4%A0%E5%BE%80%E5%89%8D%E7%A7%BB%E4%B8%80%E6%A0%BC%0A%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20return%20num%0A%0A%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%22%22%22%E6%93%B4%E5%85%85%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20nums%20%3D%20MyList%28%29%0A%20%20%23%20%E5%9C%A8%E5%B0%BE%E7%AB%AF%E5%8A%A0%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20nums.add%281%29%0A%20%20nums.add%283%29%0A%20%20nums.add%282%29%0A%20%20nums.add%285%29%0A%20%20nums.add%284%29%0A%0A%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20nums.remove%283%29%0A%0A%20%20%23%20%E5%AD%98%E5%8F%96%E5%85%83%E7%B4%A0%0A%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20nums.set%280,%201%29%0A%0A%20%20%23%20%E6%B8%AC%E8%A9%A6%E5%AE%B9%E9%87%8F%E6%93%B4%E5%85%85%E6%A9%9F%E5%88%B6%0A%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>
