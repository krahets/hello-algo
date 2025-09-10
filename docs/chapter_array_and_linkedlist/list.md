---
comments: true
---

# 4.3 &nbsp; 列表

<u>列表（list）</u>是一个抽象的数据结构概念，它表示元素的有序集合，支持元素访问、修改、添加、删除和遍历等操作，无须使用者考虑容量限制的问题。列表可以基于链表或数组实现。

- 链表天然可以看作一个列表，其支持元素增删查改操作，并且可以灵活动态扩容。
- 数组也支持元素增删查改，但由于其长度不可变，因此只能看作一个具有长度限制的列表。

当使用数组实现列表时，**长度不可变的性质会导致列表的实用性降低**。这是因为我们通常无法事先确定需要存储多少数据，从而难以选择合适的列表长度。若长度过小，则很可能无法满足使用需求；若长度过大，则会造成内存空间浪费。

为解决此问题，我们可以使用<u>动态数组（dynamic array）</u>来实现列表。它继承了数组的各项优点，并且可以在程序运行过程中进行动态扩容。

实际上，**许多编程语言中的标准库提供的列表是基于动态数组实现的**，例如 Python 中的 `list` 、Java 中的 `ArrayList` 、C++ 中的 `vector` 和 C# 中的 `List` 等。在接下来的讨论中，我们将把“列表”和“动态数组”视为等同的概念。

## 4.3.1 &nbsp; 列表常用操作

### 1. &nbsp; 初始化列表

我们通常使用“无初始值”和“有初始值”这两种初始化方法：

=== "Python"

    ```python title="list.py"
    # 初始化列表
    # 无初始值
    nums1: list[int] = []
    # 有初始值
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 初始化列表 */
    // 需注意，C++ 中 vector 即是本文描述的 nums
    // 无初始值
    vector<int> nums1;
    // 有初始值
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* 初始化列表 */
    // 无初始值
    List<Integer> nums1 = new ArrayList<>();
    // 有初始值（注意数组的元素类型需为 int[] 的包装类 Integer[]）
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 初始化列表 */
    // 无初始值
    List<int> nums1 = [];
    // 有初始值
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* 初始化列表 */
    // 无初始值
    nums1 := []int{}
    // 有初始值
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 初始化列表 */
    // 无初始值
    let nums1: [Int] = []
    // 有初始值
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* 初始化列表 */
    // 无初始值
    const nums1 = [];
    // 有初始值
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 初始化列表 */
    // 无初始值
    const nums1: number[] = [];
    // 有初始值
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 初始化列表 */
    // 无初始值
    List<int> nums1 = [];
    // 有初始值
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 初始化列表 */
    // 无初始值
    let nums1: Vec<i32> = Vec::new();
    // 有初始值
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 初始化列表 */
    // 无初始值
    var nums1 = listOf<Int>()
    // 有初始值
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 初始化列表
    # 无初始值
    nums1 = []
    # 有初始值
    nums = [1, 3, 2, 5, 4]
    ```

=== "Zig"

    ```zig title="list.zig"
    // 初始化列表
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

??? pythontutor "可视化运行"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

### 2. &nbsp; 访问元素

列表本质上是数组，因此可以在 $O(1)$ 时间内访问和更新元素，效率很高。

=== "Python"

    ```python title="list.py"
    # 访问元素
    num: int = nums[1]  # 访问索引 1 处的元素

    # 更新元素
    nums[1] = 0    # 将索引 1 处的元素更新为 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 访问元素 */
    int num = nums[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    nums[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Java"

    ```java title="list.java"
    /* 访问元素 */
    int num = nums.get(1);  // 访问索引 1 处的元素

    /* 更新元素 */
    nums.set(1, 0);  // 将索引 1 处的元素更新为 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 访问元素 */
    int num = nums[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    nums[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* 访问元素 */
    num := nums[1]  // 访问索引 1 处的元素

    /* 更新元素 */
    nums[1] = 0     // 将索引 1 处的元素更新为 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 访问元素 */
    let num = nums[1] // 访问索引 1 处的元素

    /* 更新元素 */
    nums[1] = 0 // 将索引 1 处的元素更新为 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* 访问元素 */
    const num = nums[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    nums[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 访问元素 */
    const num: number = nums[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    nums[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 访问元素 */
    int num = nums[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    nums[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 访问元素 */
    let num: i32 = nums[1];  // 访问索引 1 处的元素
    /* 更新元素 */
    nums[1] = 0;             // 将索引 1 处的元素更新为 0
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 访问元素 */
    val num = nums[1]       // 访问索引 1 处的元素
    /* 更新元素 */
    nums[1] = 0             // 将索引 1 处的元素更新为 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 访问元素
    num = nums[1] # 访问索引 1 处的元素
    # 更新元素
    nums[1] = 0 # 将索引 1 处的元素更新为 0
    ```

=== "Zig"

    ```zig title="list.zig"
    // 访问元素
    var num = nums.items[1]; // 访问索引 1 处的元素

    // 更新元素
    nums.items[1] = 0; // 将索引 1 处的元素更新为 0
    ```

??? pythontutor "可视化运行"

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

### 3. &nbsp; 插入与删除元素

相较于数组，列表可以自由地添加与删除元素。在列表尾部添加元素的时间复杂度为 $O(1)$ ，但插入和删除元素的效率仍与数组相同，时间复杂度为 $O(n)$ 。

=== "Python"

    ```python title="list.py"
    # 清空列表
    nums.clear()

    # 在尾部添加元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # 在中间插入元素
    nums.insert(3, 6)  # 在索引 3 处插入数字 6

    # 删除元素
    nums.pop(3)        # 删除索引 3 处的元素
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 清空列表 */
    nums.clear();

    /* 在尾部添加元素 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* 在中间插入元素 */
    nums.insert(nums.begin() + 3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.erase(nums.begin() + 3);      // 删除索引 3 处的元素
    ```

=== "Java"

    ```java title="list.java"
    /* 清空列表 */
    nums.clear();

    /* 在尾部添加元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 在中间插入元素 */
    nums.add(3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.remove(3);  // 删除索引 3 处的元素
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 清空列表 */
    nums.Clear();

    /* 在尾部添加元素 */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* 在中间插入元素 */
    nums.Insert(3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.RemoveAt(3);  // 删除索引 3 处的元素
    ```

=== "Go"

    ```go title="list_test.go"
    /* 清空列表 */
    nums = nil

    /* 在尾部添加元素 */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* 在中间插入元素 */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums = append(nums[:3], nums[4:]...) // 删除索引 3 处的元素
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 清空列表 */
    nums.removeAll()

    /* 在尾部添加元素 */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* 在中间插入元素 */
    nums.insert(6, at: 3) // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.remove(at: 3) // 删除索引 3 处的元素
    ```

=== "JS"

    ```javascript title="list.js"
    /* 清空列表 */
    nums.length = 0;

    /* 在尾部添加元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中间插入元素 */
    nums.splice(3, 0, 6); // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.splice(3, 1);  // 删除索引 3 处的元素
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 清空列表 */
    nums.length = 0;

    /* 在尾部添加元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中间插入元素 */
    nums.splice(3, 0, 6); // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.splice(3, 1);  // 删除索引 3 处的元素
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 清空列表 */
    nums.clear();

    /* 在尾部添加元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 在中间插入元素 */
    nums.insert(3, 6); // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.removeAt(3); // 删除索引 3 处的元素
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 清空列表 */
    nums.clear();

    /* 在尾部添加元素 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 在中间插入元素 */
    nums.insert(3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.remove(3);    // 删除索引 3 处的元素
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 清空列表 */
    nums.clear();

    /* 在尾部添加元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 在中间插入元素 */
    nums.add(3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.remove(3);  // 删除索引 3 处的元素
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 清空列表
    nums.clear

    # 在尾部添加元素
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # 在中间插入元素
    nums.insert(3, 6) # 在索引 3 处插入数字 6

    # 删除元素
    nums.delete_at(3) # 删除索引 3 处的元素
    ```

=== "Zig"

    ```zig title="list.zig"
    // 清空列表
    nums.clearRetainingCapacity();

    // 在尾部添加元素
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);

    // 在中间插入元素
    try nums.insert(3, 6); // 在索引 3 处插入数字 6

    // 删除元素
    _ = nums.orderedRemove(3); // 删除索引 3 处的元素
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

### 4. &nbsp; 遍历列表

与数组一样，列表可以根据索引遍历，也可以直接遍历各元素。

=== "Python"

    ```python title="list.py"
    # 通过索引遍历列表
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # 直接遍历列表元素
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* 直接遍历列表元素 */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* 直接遍历列表元素 */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* 通过索引遍历列表 */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* 直接遍历列表元素 */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 通过索引遍历列表 */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* 直接遍历列表元素 */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* 通过索引遍历列表 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 通过索引遍历列表 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 通过索引遍历列表 */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // 通过索引遍历列表
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // 直接遍历列表元素
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 通过索引遍历列表 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 直接遍历列表元素 */
    for (num in nums) {
        count += num
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 通过索引遍历列表
    count = 0
    for i in 0...nums.length
        count += nums[i]
    end

    # 直接遍历列表元素
    count = 0
    for num in nums
        count += num
    end
    ```

=== "Zig"

    ```zig title="list.zig"
    // 通过索引遍历列表
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums[i];
    }

    // 直接遍历列表元素
    count = 0;
    for (nums.items) |num| {
        count += num;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

### 5. &nbsp; 拼接列表

给定一个新列表 `nums1` ，我们可以将其拼接到原列表的尾部。

=== "Python"

    ```python title="list.py"
    # 拼接两个列表
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # 将列表 nums1 拼接到 nums 之后
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 拼接两个列表 */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // 将列表 nums1 拼接到 nums 之后
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 拼接两个列表 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // 将列表 nums1 拼接到 nums 之后
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 拼接两个列表 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // 将列表 nums1 拼接到 nums 之后
    ```

=== "Go"

    ```go title="list_test.go"
    /* 拼接两个列表 */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // 将列表 nums1 拼接到 nums 之后
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 拼接两个列表 */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // 将列表 nums1 拼接到 nums 之后
    ```

=== "JS"

    ```javascript title="list.js"
    /* 拼接两个列表 */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // 将列表 nums1 拼接到 nums 之后
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 拼接两个列表 */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // 将列表 nums1 拼接到 nums 之后
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 拼接两个列表 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // 将列表 nums1 拼接到 nums 之后
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 拼接两个列表 */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 拼接两个列表 */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // 将列表 nums1 拼接到 nums 之后
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 拼接两个列表
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

=== "Zig"

    ```zig title="list.zig"
    // 拼接两个列表
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items); // 将列表 nums1 拼接到 nums 之后
    ```

??? pythontutor "可视化运行"

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%90%8E&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%90%8E&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

### 6. &nbsp; 排序列表

完成列表排序后，我们便可以使用在数组类算法题中经常考查的“二分查找”和“双指针”算法。

=== "Python"

    ```python title="list.py"
    # 排序列表
    nums.sort()  # 排序后，列表元素从小到大排列
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 排序列表 */
    sort(nums.begin(), nums.end());  // 排序后，列表元素从小到大排列
    ```

=== "Java"

    ```java title="list.java"
    /* 排序列表 */
    Collections.sort(nums);  // 排序后，列表元素从小到大排列
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 排序列表 */
    nums.Sort(); // 排序后，列表元素从小到大排列
    ```

=== "Go"

    ```go title="list_test.go"
    /* 排序列表 */
    sort.Ints(nums)  // 排序后，列表元素从小到大排列
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 排序列表 */
    nums.sort() // 排序后，列表元素从小到大排列
    ```

=== "JS"

    ```javascript title="list.js"
    /* 排序列表 */
    nums.sort((a, b) => a - b);  // 排序后，列表元素从小到大排列
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 排序列表 */
    nums.sort((a, b) => a - b);  // 排序后，列表元素从小到大排列
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 排序列表 */
    nums.sort(); // 排序后，列表元素从小到大排列
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 排序列表 */
    nums.sort(); // 排序后，列表元素从小到大排列
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 排序列表 */
    nums.sort() // 排序后，列表元素从小到大排列
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 排序列表
    nums = nums.sort { |a, b| a <=> b } # 排序后，列表元素从小到大排列
    ```

=== "Zig"

    ```zig title="list.zig"
    // 排序列表
    std.sort.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    ```

??? pythontutor "可视化运行"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC%8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC%8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

## 4.3.2 &nbsp; 列表实现

许多编程语言内置了列表，例如 Java、C++、Python 等。它们的实现比较复杂，各个参数的设定也非常考究，例如初始容量、扩容倍数等。感兴趣的读者可以查阅源码进行学习。

为了加深对列表工作原理的理解，我们尝试实现一个简易版列表，包括以下三个重点设计。

- **初始容量**：选取一个合理的数组初始容量。在本示例中，我们选择 10 作为初始容量。
- **数量记录**：声明一个变量 `size` ，用于记录列表当前元素数量，并随着元素插入和删除实时更新。根据此变量，我们可以定位列表尾部，以及判断是否需要扩容。
- **扩容机制**：若插入元素时列表容量已满，则需要进行扩容。先根据扩容倍数创建一个更大的数组，再将当前数组的所有元素依次移动至新数组。在本示例中，我们规定每次将数组扩容至之前的 2 倍。

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """列表类"""

        def __init__(self):
            """构造方法"""
            self._capacity: int = 10  # 列表容量
            self._arr: list[int] = [0] * self._capacity  # 数组（存储列表元素）
            self._size: int = 0  # 列表长度（当前元素数量）
            self._extend_ratio: int = 2  # 每次列表扩容的倍数

        def size(self) -> int:
            """获取列表长度（当前元素数量）"""
            return self._size

        def capacity(self) -> int:
            """获取列表容量"""
            return self._capacity

        def get(self, index: int) -> int:
            """访问元素"""
            # 索引如果越界，则抛出异常，下同
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            return self._arr[index]

        def set(self, num: int, index: int):
            """更新元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            self._arr[index] = num

        def add(self, num: int):
            """在尾部添加元素"""
            # 元素数量超出容量时，触发扩容机制
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """在中间插入元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            # 元素数量超出容量时，触发扩容机制
            if self._size == self.capacity():
                self.extend_capacity()
            # 将索引 index 以及之后的元素都向后移动一位
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # 更新元素数量
            self._size += 1

        def remove(self, index: int) -> int:
            """删除元素"""
            if index < 0 or index >= self._size:
                raise IndexError("索引越界")
            num = self._arr[index]
            # 将索引 index 之后的元素都向前移动一位
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # 更新元素数量
            self._size -= 1
            # 返回被删除的元素
            return num

        def extend_capacity(self):
            """列表扩容"""
            # 新建一个长度为原数组 _extend_ratio 倍的新数组，并将原数组复制到新数组
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # 更新列表容量
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """返回有效长度的列表"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* 列表类 */
    class MyList {
      private:
        int *arr;             // 数组（存储列表元素）
        int arrCapacity = 10; // 列表容量
        int arrSize = 0;      // 列表长度（当前元素数量）
        int extendRatio = 2;   // 每次列表扩容的倍数

      public:
        /* 构造方法 */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* 析构方法 */
        ~MyList() {
            delete[] arr;
        }

        /* 获取列表长度（当前元素数量）*/
        int size() {
            return arrSize;
        }

        /* 获取列表容量 */
        int capacity() {
            return arrCapacity;
        }

        /* 访问元素 */
        int get(int index) {
            // 索引如果越界，则抛出异常，下同
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

        /* 在尾部添加元素 */
        void add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 在中间插入元素 */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (size() == capacity())
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 删除元素 */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            int num = arr[index];
            // 将索引 index 之后的元素都向前移动一位
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素数量
            arrSize--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        void extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // 将原数组中的所有元素复制到新数组
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // 释放内存
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* 将列表转换为 Vector 用于打印 */
        vector<int> toVector() {
            // 仅转换有效长度范围内的列表元素
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
    /* 列表类 */
    class MyList {
        private int[] arr; // 数组（存储列表元素）
        private int capacity = 10; // 列表容量
        private int size = 0; // 列表长度（当前元素数量）
        private int extendRatio = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        public MyList() {
            arr = new int[capacity];
        }

        /* 获取列表长度（当前元素数量） */
        public int size() {
            return size;
        }

        /* 获取列表容量 */
        public int capacity() {
            return capacity;
        }

        /* 访问元素 */
        public int get(int index) {
            // 索引如果越界，则抛出异常，下同
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

        /* 在尾部添加元素 */
        public void add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // 更新元素数量
            size++;
        }

        /* 在中间插入元素 */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素数量
            size++;
        }

        /* 删除元素 */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            int num = arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素数量
            size--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        public void extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // 更新列表容量
            capacity = arr.length;
        }

        /* 将列表转换为数组 */
        public int[] toArray() {
            int size = size();
            // 仅转换有效长度范围内的列表元素
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
    /* 列表类 */
    class MyList {
        private int[] arr;           // 数组（存储列表元素）
        private int arrCapacity = 10;    // 列表容量
        private int arrSize = 0;         // 列表长度（当前元素数量）
        private readonly int extendRatio = 2;  // 每次列表扩容的倍数

        /* 构造方法 */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* 获取列表长度（当前元素数量）*/
        public int Size() {
            return arrSize;
        }

        /* 获取列表容量 */
        public int Capacity() {
            return arrCapacity;
        }

        /* 访问元素 */
        public int Get(int index) {
            // 索引如果越界，则抛出异常，下同
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

        /* 在尾部添加元素 */
        public void Add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 在中间插入元素 */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 更新元素数量
            arrSize++;
        }

        /* 删除元素 */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("索引越界");
            int num = arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 更新元素数量
            arrSize--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        public void ExtendCapacity() {
            // 新建一个长度为 arrCapacity * extendRatio 的数组，并将原数组复制到新数组
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // 更新列表容量
            arrCapacity = arr.Length;
        }

        /* 将列表转换为数组 */
        public int[] ToArray() {
            // 仅转换有效长度范围内的列表元素
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
    /* 列表类 */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* 构造函数 */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // 列表容量
            arr:         make([]int, 10), // 数组（存储列表元素）
            arrSize:     0,               // 列表长度（当前元素数量）
            extendRatio: 2,               // 每次列表扩容的倍数
        }
    }

    /* 获取列表长度（当前元素数量） */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  获取列表容量 */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* 访问元素 */
    func (l *myList) get(index int) int {
        // 索引如果越界，则抛出异常，下同
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

    /* 在尾部添加元素 */
    func (l *myList) add(num int) {
        // 元素数量超出容量时，触发扩容机制
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // 更新元素数量
        l.arrSize++
    }

    /* 在中间插入元素 */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        // 元素数量超出容量时，触发扩容机制
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // 更新元素数量
        l.arrSize++
    }

    /* 删除元素 */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("索引越界")
        }
        num := l.arr[index]
        // 将索引 index 之后的元素都向前移动一位
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // 更新元素数量
        l.arrSize--
        // 返回被删除的元素
        return num
    }

    /* 列表扩容 */
    func (l *myList) extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // 更新列表容量
        l.arrCapacity = len(l.arr)
    }

    /* 返回有效长度的列表 */
    func (l *myList) toArray() []int {
        // 仅转换有效长度范围内的列表元素
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* 列表类 */
    class MyList {
        private var arr: [Int] // 数组（存储列表元素）
        private var _capacity: Int // 列表容量
        private var _size: Int // 列表长度（当前元素数量）
        private let extendRatio: Int // 每次列表扩容的倍数

        /* 构造方法 */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* 获取列表长度（当前元素数量）*/
        func size() -> Int {
            _size
        }

        /* 获取列表容量 */
        func capacity() -> Int {
            _capacity
        }

        /* 访问元素 */
        func get(index: Int) -> Int {
            // 索引如果越界则抛出错误，下同
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

        /* 在尾部添加元素 */
        func add(num: Int) {
            // 元素数量超出容量时，触发扩容机制
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // 更新元素数量
            _size += 1
        }

        /* 在中间插入元素 */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("索引越界")
            }
            // 元素数量超出容量时，触发扩容机制
            if size() == capacity() {
                extendCapacity()
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // 更新元素数量
            _size += 1
        }

        /* 删除元素 */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("索引越界")
            }
            let num = arr[index]
            // 将将索引 index 之后的元素都向前移动一位
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // 更新元素数量
            _size -= 1
            // 返回被删除的元素
            return num
        }

        /* 列表扩容 */
        func extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // 更新列表容量
            _capacity = arr.count
        }

        /* 将列表转换为数组 */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* 列表类 */
    class MyList {
        #arr = new Array(); // 数组（存储列表元素）
        #capacity = 10; // 列表容量
        #size = 0; // 列表长度（当前元素数量）
        #extendRatio = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* 获取列表长度（当前元素数量）*/
        size() {
            return this.#size;
        }

        /* 获取列表容量 */
        capacity() {
            return this.#capacity;
        }

        /* 访问元素 */
        get(index) {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            return this.#arr[index];
        }

        /* 更新元素 */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            this.#arr[index] = num;
        }

        /* 在尾部添加元素 */
        add(num) {
            // 如果长度等于容量，则需要扩容
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 将新元素添加到列表尾部
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* 在中间插入元素 */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            // 元素数量超出容量时，触发扩容机制
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // 更新元素数量
            this.#arr[index] = num;
            this.#size++;
        }

        /* 删除元素 */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            let num = this.#arr[index];
            // 将索引 index 之后的元素都向前移动一位
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // 更新元素数量
            this.#size--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // 更新列表容量
            this.#capacity = this.#arr.length;
        }

        /* 将列表转换为数组 */
        toArray() {
            let size = this.size();
            // 仅转换有效长度范围内的列表元素
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
    /* 列表类 */
    class MyList {
        private arr: Array<number>; // 数组（存储列表元素）
        private _capacity: number = 10; // 列表容量
        private _size: number = 0; // 列表长度（当前元素数量）
        private extendRatio: number = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* 获取列表长度（当前元素数量）*/
        public size(): number {
            return this._size;
        }

        /* 获取列表容量 */
        public capacity(): number {
            return this._capacity;
        }

        /* 访问元素 */
        public get(index: number): number {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            return this.arr[index];
        }

        /* 更新元素 */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            this.arr[index] = num;
        }

        /* 在尾部添加元素 */
        public add(num: number): void {
            // 如果长度等于容量，则需要扩容
            if (this._size === this._capacity) this.extendCapacity();
            // 将新元素添加到列表尾部
            this.arr[this._size] = num;
            this._size++;
        }

        /* 在中间插入元素 */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            // 元素数量超出容量时，触发扩容机制
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // 更新元素数量
            this.arr[index] = num;
            this._size++;
        }

        /* 删除元素 */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            let num = this.arr[index];
            // 将将索引 index 之后的元素都向前移动一位
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // 更新元素数量
            this._size--;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        public extendCapacity(): void {
            // 新建一个长度为 size 的数组，并将原数组复制到新数组
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // 更新列表容量
            this._capacity = this.arr.length;
        }

        /* 将列表转换为数组 */
        public toArray(): number[] {
            let size = this.size();
            // 仅转换有效长度范围内的列表元素
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
    /* 列表类 */
    class MyList {
      late List<int> _arr; // 数组（存储列表元素）
      int _capacity = 10; // 列表容量
      int _size = 0; // 列表长度（当前元素数量）
      int _extendRatio = 2; // 每次列表扩容的倍数

      /* 构造方法 */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* 获取列表长度（当前元素数量）*/
      int size() => _size;

      /* 获取列表容量 */
      int capacity() => _capacity;

      /* 访问元素 */
      int get(int index) {
        if (index >= _size) throw RangeError('索引越界');
        return _arr[index];
      }

      /* 更新元素 */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('索引越界');
        _arr[index] = _num;
      }

      /* 在尾部添加元素 */
      void add(int _num) {
        // 元素数量超出容量时，触发扩容机制
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // 更新元素数量
        _size++;
      }

      /* 在中间插入元素 */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('索引越界');
        // 元素数量超出容量时，触发扩容机制
        if (_size == _capacity) extendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // 更新元素数量
        _size++;
      }

      /* 删除元素 */
      int remove(int index) {
        if (index >= _size) throw RangeError('索引越界');
        int _num = _arr[index];
        // 将将索引 index 之后的元素都向前移动一位
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // 更新元素数量
        _size--;
        // 返回被删除的元素
        return _num;
      }

      /* 列表扩容 */
      void extendCapacity() {
        // 新建一个长度为原数组 _extendRatio 倍的新数组
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 将原数组复制到新数组
        List.copyRange(_newNums, 0, _arr);
        // 更新 _arr 的引用
        _arr = _newNums;
        // 更新列表容量
        _capacity = _arr.length;
      }

      /* 将列表转换为数组 */
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
    /* 列表类 */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // 数组（存储列表元素）
        capacity: usize,     // 列表容量
        size: usize,         // 列表长度（当前元素数量）
        extend_ratio: usize, // 每次列表扩容的倍数
    }

    #[allow(unused, unused_comparisons)]
    impl MyList {
        /* 构造方法 */
        pub fn new(capacity: usize) -> Self {
            let mut vec = vec![0; capacity];
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* 获取列表长度（当前元素数量）*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* 获取列表容量 */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 访问元素 */
        pub fn get(&self, index: usize) -> i32 {
            // 索引如果越界，则抛出异常，下同
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

        /* 在尾部添加元素 */
        pub fn add(&mut self, num: i32) {
            // 元素数量超出容量时，触发扩容机制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // 更新元素数量
            self.size += 1;
        }

        /* 在中间插入元素 */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("索引越界")
            };
            // 元素数量超出容量时，触发扩容机制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 更新元素数量
            self.size += 1;
        }

        /* 删除元素 */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("索引越界")
            };
            let num = self.arr[index];
            // 将索引 index 之后的元素都向前移动一位
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // 更新元素数量
            self.size -= 1;
            // 返回被删除的元素
            return num;
        }

        /* 列表扩容 */
        pub fn extend_capacity(&mut self) {
            // 新建一个长度为原数组 extend_ratio 倍的新数组，并将原数组复制到新数组
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // 更新列表容量
            self.capacity = new_capacity;
        }

        /* 将列表转换为数组 */
        pub fn to_array(&self) -> Vec<i32> {
            // 仅转换有效长度范围内的列表元素
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
    /* 列表类 */
    typedef struct {
        int *arr;        // 数组（存储列表元素）
        int capacity;    // 列表容量
        int size;        // 列表大小
        int extendRatio; // 列表每次扩容的倍数
    } MyList;

    /* 构造函数 */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* 析构函数 */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* 获取列表长度 */
    int size(MyList *nums) {
        return nums->size;
    }

    /* 获取列表容量 */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* 访问元素 */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* 更新元素 */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* 在尾部添加元素 */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 扩容
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* 在中间插入元素 */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // 元素数量超出容量时，触发扩容机制
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 扩容
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* 删除元素 */
    // 注意：stdio.h 占用了 remove 关键词
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* 列表扩容 */
    void extendCapacity(MyList *nums) {
        // 先分配空间
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // 拷贝旧数据到新数据
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // 释放旧数据
        free(temp);

        // 更新新数据
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* 将列表转换为 Array 用于打印 */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* 列表类 */
    class MyList {
        private var arr: IntArray = intArrayOf() // 数组（存储列表元素）
        private var capacity: Int = 10 // 列表容量
        private var size: Int = 0 // 列表长度（当前元素数量）
        private var extendRatio: Int = 2 // 每次列表扩容的倍数

        /* 构造方法 */
        init {
            arr = IntArray(capacity)
        }

        /* 获取列表长度（当前元素数量） */
        fun size(): Int {
            return size
        }

        /* 获取列表容量 */
        fun capacity(): Int {
            return capacity
        }

        /* 访问元素 */
        fun get(index: Int): Int {
            // 索引如果越界，则抛出异常，下同
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

        /* 在尾部添加元素 */
        fun add(num: Int) {
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // 更新元素数量
            size++
        }

        /* 在中间插入元素 */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引越界")
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity()
            // 将索引 index 以及之后的元素都向后移动一位
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // 更新元素数量
            size++
        }

        /* 删除元素 */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("索引越界")
            val num = arr[index]
            // 将将索引 index 之后的元素都向前移动一位
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // 更新元素数量
            size--
            // 返回被删除的元素
            return num
        }

        /* 列表扩容 */
        fun extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
            arr = arr.copyOf(capacity() * extendRatio)
            // 更新列表容量
            capacity = arr.size
        }

        /* 将列表转换为数组 */
        fun toArray(): IntArray {
            val size = size()
            // 仅转换有效长度范围内的列表元素
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
    ### 列表类 ###
    class MyList
      attr_reader :size       # 获取列表长度（当前元素数量）
      attr_reader :capacity   # 获取列表容量

      ### 构造方法 ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### 访问元素 ###
      def get(index)
        # 索引如果越界，则抛出异常，下同
        raise IndexError, "索引越界" if index < 0 || index >= size
        @arr[index]
      end

      ### 访问元素 ###
      def set(index, num)
        raise IndexError, "索引越界" if index < 0 || index >= size
        @arr[index] = num
      end

      ### 在尾部添加元素 ###
      def add(num)
        # 元素数量超出容量时，触发扩容机制
        extend_capacity if size == capacity
        @arr[size] = num

        # 更新元素数量
        @size += 1
      end

      ### 在中间插入元素 ###
      def insert(index, num)
        raise IndexError, "索引越界" if index < 0 || index >= size

        # 元素数量超出容量时，触发扩容机制
        extend_capacity if size == capacity

        # 将索引 index 以及之后的元素都向后移动一位
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # 更新元素数量
        @size += 1
      end

      ### 删除元素 ###
      def remove(index)
        raise IndexError, "索引越界" if index < 0 || index >= size
        num = @arr[index]

        # 将将索引 index 之后的元素都向前移动一位
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # 更新元素数量
        @size -= 1

        # 返回被删除的元素
        num
      end

      ### 列表扩容 ###
      def extend_capacity
        # 新建一个长度为原数组 extend_ratio 倍的新数组，并将原数组复制到新数组
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # 更新列表容量
        @capacity = arr.length
      end

      ### 将列表转换为数组 ###
      def to_array
        sz = size
        # 仅转换有效长度范围内的列表元素
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
    // 列表类
    const MyList = struct {
        const Self = @This();

        items: []i32, // 数组（存储列表元素）
        capacity: usize, // 列表容量
        allocator: std.mem.Allocator, // 内存分配器

        extend_ratio: usize = 2, // 每次列表扩容的倍数

        // 构造函数（分配内存+初始化列表）
        pub fn init(allocator: std.mem.Allocator) Self {
            return Self{
                .items = &[_]i32{},
                .capacity = 0,
                .allocator = allocator,
            };
        }

        // 析构函数（释放内存）
        pub fn deinit(self: Self) void {
            self.allocator.free(self.allocatedSlice());
        }

        // 在尾部添加元素
        pub fn add(self: *Self, item: i32) !void {
            // 元素数量超出容量时，触发扩容机制
            const newlen = self.items.len + 1;
            try self.ensureTotalCapacity(newlen);

            // 更新元素
            self.items.len += 1;
            const new_item_ptr = &self.items[self.items.len - 1];
            new_item_ptr.* = item;
        }

        // 获取列表长度（当前元素数量）
        pub fn getSize(self: *Self) usize {
            return self.items.len;
        }

        // 获取列表容量
        pub fn getCapacity(self: *Self) usize {
            return self.capacity;
        }

        // 访问元素
        pub fn get(self: *Self, index: usize) i32 {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 or index >= self.items.len) {
                @panic("索引越界");
            }
            return self.items[index];
        }

        // 更新元素
        pub fn set(self: *Self, index: usize, num: i32) void {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 or index >= self.items.len) {
                @panic("索引越界");
            }
            self.items[index] = num;
        }

        // 在中间插入元素
        pub fn insert(self: *Self, index: usize, item: i32) !void {
            if (index < 0 or index >= self.items.len) {
                @panic("索引越界");
            }

            // 元素数量超出容量时，触发扩容机制
            const newlen = self.items.len + 1;
            try self.ensureTotalCapacity(newlen);

            // 将索引 index 以及之后的元素都向后移动一位
            self.items.len += 1;
            var i = self.items.len - 1;
            while (i >= index) : (i -= 1) {
                self.items[i] = self.items[i - 1];
            }
            self.items[index] = item;
        }

        // 删除元素
        pub fn remove(self: *Self, index: usize) i32 {
            if (index < 0 or index >= self.getSize()) {
                @panic("索引越界");
            }
            // 将索引 index 之后的元素都向前移动一位
            const item = self.items[index];
            var i = index;
            while (i < self.items.len - 1) : (i += 1) {
                self.items[i] = self.items[i + 1];
            }
            self.items.len -= 1;
            // 返回被删除的元素
            return item;
        }

        // 将列表转换为数组
        pub fn toArraySlice(self: *Self) ![]i32 {
            return self.toOwnedSlice(false);
        }

        // 返回新的切片并设置是否要重置或清空列表容器
        pub fn toOwnedSlice(self: *Self, clear: bool) ![]i32 {
            const allocator = self.allocator;
            const old_memory = self.allocatedSlice();
            if (allocator.remap(old_memory, self.items.len)) |new_items| {
                if (clear) {
                    self.* = init(allocator);
                }
                return new_items;
            }

            const new_memory = try allocator.alloc(i32, self.items.len);
            @memcpy(new_memory, self.items);
            if (clear) {
                self.clearAndFree();
            }
            return new_memory;
        }

        // 列表扩容
        fn ensureTotalCapacity(self: *Self, new_capacity: usize) !void {
            if (self.capacity >= new_capacity) return;
            const capcacity = if (self.capacity == 0) 10 else self.capacity;
            const better_capacity = capcacity * self.extend_ratio;

            const old_memory = self.allocatedSlice();
            if (self.allocator.remap(old_memory, better_capacity)) |new_memory| {
                self.items.ptr = new_memory.ptr;
                self.capacity = new_memory.len;
            } else {
                const new_memory = try self.allocator.alloc(i32, better_capacity);
                @memcpy(new_memory[0..self.items.len], self.items);
                self.allocator.free(old_memory);
                self.items.ptr = new_memory.ptr;
                self.capacity = new_memory.len;
            }
        }

        fn clearAndFree(self: *Self, allocator: std.mem.Allocator) void {
            allocator.free(self.allocatedSlice());
            self.items.len = 0;
            self.capacity = 0;
        }

        fn allocatedSlice(self: Self) []i32 {
            return self.items.ptr[0..self.capacity];
        }
    };
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20*%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E9%95%BF%E5%BA%A6%EF%BC%88%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%90%8E%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%89%8D%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E6%89%A9%E5%AE%B9%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20*%20self.capacity%28%29%20*%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.set%280,%201%29%0A%0A%20%20%20%20%23%20%E6%B5%8B%E8%AF%95%E6%89%A9%E5%AE%B9%E6%9C%BA%E5%88%B6%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20*%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E9%95%BF%E5%BA%A6%EF%BC%88%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%EF%BC%89%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%20index%20%E4%BB%A5%E5%8F%8A%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%90%8E%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%22%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%20i%20%E4%B9%8B%E5%90%8E%E7%9A%84%E5%85%83%E7%B4%A0%E9%83%BD%E5%90%91%E5%89%8D%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E6%89%A9%E5%AE%B9%22%22%22%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20*%20self.capacity%28%29%20*%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.remove%283%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.set%280,%201%29%0A%0A%20%20%20%20%23%20%E6%B5%8B%E8%AF%95%E6%89%A9%E5%AE%B9%E6%9C%BA%E5%88%B6%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>
