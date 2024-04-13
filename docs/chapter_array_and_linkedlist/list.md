# 列表

<u>列表（list）</u>是一个抽象的数据结构概念，它表示元素的有序集合，支持元素访问、修改、添加、删除和遍历等操作，无须使用者考虑容量限制的问题。列表可以基于链表或数组实现。

- 链表天然可以看作一个列表，其支持元素增删查改操作，并且可以灵活动态扩容。
- 数组也支持元素增删查改，但由于其长度不可变，因此只能看作一个具有长度限制的列表。

当使用数组实现列表时，**长度不可变的性质会导致列表的实用性降低**。这是因为我们通常无法事先确定需要存储多少数据，从而难以选择合适的列表长度。若长度过小，则很可能无法满足使用需求；若长度过大，则会造成内存空间浪费。

为解决此问题，我们可以使用<u>动态数组（dynamic array）</u>来实现列表。它继承了数组的各项优点，并且可以在程序运行过程中进行动态扩容。

实际上，**许多编程语言中的标准库提供的列表是基于动态数组实现的**，例如 Python 中的 `list` 、Java 中的 `ArrayList` 、C++ 中的 `vector` 和 C# 中的 `List` 等。在接下来的讨论中，我们将把“列表”和“动态数组”视为等同的概念。

## 列表常用操作

### 初始化列表

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

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 访问元素

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

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 插入与删除元素

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

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 遍历列表

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

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 拼接列表

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

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%90%8E&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 排序列表

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

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC%8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 列表实现

许多编程语言内置了列表，例如 Java、C++、Python 等。它们的实现比较复杂，各个参数的设定也非常考究，例如初始容量、扩容倍数等。感兴趣的读者可以查阅源码进行学习。

为了加深对列表工作原理的理解，我们尝试实现一个简易版列表，包括以下三个重点设计。

- **初始容量**：选取一个合理的数组初始容量。在本示例中，我们选择 10 作为初始容量。
- **数量记录**：声明一个变量 `size` ，用于记录列表当前元素数量，并随着元素插入和删除实时更新。根据此变量，我们可以定位列表尾部，以及判断是否需要扩容。
- **扩容机制**：若插入元素时列表容量已满，则需要进行扩容。先根据扩容倍数创建一个更大的数组，再将当前数组的所有元素依次移动至新数组。在本示例中，我们规定每次将数组扩容至之前的 2 倍。

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
