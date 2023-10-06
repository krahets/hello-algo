---
comments: true
---

# 4.3 &nbsp; 列表

**数组长度不可变导致实用性降低**。在实际中，我们可能事先无法确定需要存储多少数据，这使数组长度的选择变得困难。若长度过小，需要在持续添加数据时频繁扩容数组；若长度过大，则会造成内存空间的浪费。

为解决此问题，出现了一种被称为「动态数组 dynamic array」的数据结构，即长度可变的数组，也常被称为「列表 list」。列表基于数组实现，继承了数组的优点，并且可以在程序运行过程中动态扩容。我们可以在列表中自由地添加元素，而无须担心超过容量限制。

## 4.3.1 &nbsp; 列表常用操作

### 1. &nbsp; 初始化列表

我们通常使用“无初始值”和“有初始值”这两种初始化方法。

=== "Python"

    ```python title="list.py"
    # 初始化列表
    # 无初始值
    list1: list[int] = []
    # 有初始值
    list: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 初始化列表 */
    // 需注意，C++ 中 vector 即是本文描述的 list
    // 无初始值
    vector<int> list1;
    // 有初始值
    vector<int> list = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* 初始化列表 */
    // 无初始值
    List<Integer> list1 = new ArrayList<>();
    // 有初始值（注意数组的元素类型需为 int[] 的包装类 Integer[]）
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> list = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 初始化列表 */
    // 无初始值
    List<int> list1 = new ();
    // 有初始值
    int[] numbers = new int[] { 1, 3, 2, 5, 4 };
    List<int> list = numbers.ToList();
    ```

=== "Go"

    ```go title="list_test.go"
    /* 初始化列表 */
    // 无初始值
    list1 := []int
    // 有初始值
    list := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 初始化列表 */
    // 无初始值
    let list1: [Int] = []
    // 有初始值
    var list = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* 初始化列表 */
    // 无初始值
    const list1 = [];
    // 有初始值
    const list = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 初始化列表 */
    // 无初始值
    const list1: number[] = [];
    // 有初始值
    const list: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 初始化列表 */
    // 无初始值
    List<int> list1 = [];
    // 有初始值
    List<int> list = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 初始化列表 */
    // 无初始值
    let list1: Vec<i32> = Vec::new();
    // 有初始值
    let list2: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Zig"

    ```zig title="list.zig"
    // 初始化列表
    var list = std.ArrayList(i32).init(std.heap.page_allocator);
    defer list.deinit();
    try list.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

### 2. &nbsp; 访问元素

列表本质上是数组，因此可以在 $O(1)$ 时间内访问和更新元素，效率很高。

=== "Python"

    ```python title="list.py"
    # 访问元素
    num: int = list[1]  # 访问索引 1 处的元素

    # 更新元素
    list[1] = 0    # 将索引 1 处的元素更新为 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 访问元素 */
    int num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Java"

    ```java title="list.java"
    /* 访问元素 */
    int num = list.get(1);  // 访问索引 1 处的元素

    /* 更新元素 */
    list.set(1, 0);  // 将索引 1 处的元素更新为 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 访问元素 */
    int num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* 访问元素 */
    num := list[1]  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0     // 将索引 1 处的元素更新为 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 访问元素 */
    let num = list[1] // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0 // 将索引 1 处的元素更新为 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* 访问元素 */
    const num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 访问元素 */
    const num: number = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 访问元素 */
    int num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 访问元素 */
    let num: i32 = list[1];    // 访问索引 1 处的元素
    /* 更新元素 */
    list[1] = 0;               // 将索引 1 处的元素更新为 0
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Zig"

    ```zig title="list.zig"
    // 访问元素
    var num = list.items[1]; // 访问索引 1 处的元素

    // 更新元素
    list.items[1] = 0; // 将索引 1 处的元素更新为 0  
    ```

### 3. &nbsp; 插入与删除元素

相较于数组，列表可以自由地添加与删除元素。在列表尾部添加元素的时间复杂度为 $O(1)$ ，但插入和删除元素的效率仍与数组相同，时间复杂度为 $O(n)$ 。

=== "Python"

    ```python title="list.py"
    # 清空列表
    list.clear()

    # 尾部添加元素
    list.append(1)
    list.append(3)
    list.append(2)
    list.append(5)
    list.append(4)

    # 中间插入元素
    list.insert(3, 6)  # 在索引 3 处插入数字 6

    # 删除元素
    list.pop(3)        # 删除索引 3 处的元素
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 清空列表 */
    list.clear();

    /* 尾部添加元素 */
    list.push_back(1);
    list.push_back(3);
    list.push_back(2);
    list.push_back(5);
    list.push_back(4);

    /* 中间插入元素 */
    list.insert(list.begin() + 3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    list.erase(list.begin() + 3);      // 删除索引 3 处的元素
    ```

=== "Java"

    ```java title="list.java"
    /* 清空列表 */
    list.clear();

    /* 尾部添加元素 */
    list.add(1);
    list.add(3);
    list.add(2);
    list.add(5);
    list.add(4);

    /* 中间插入元素 */
    list.add(3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    list.remove(3);  // 删除索引 3 处的元素
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 清空列表 */
    list.Clear();

    /* 尾部添加元素 */
    list.Add(1);
    list.Add(3);
    list.Add(2);
    list.Add(5);
    list.Add(4);

    /* 中间插入元素 */
    list.Insert(3, 6);

    /* 删除元素 */
    list.RemoveAt(3);
    ```

=== "Go"

    ```go title="list_test.go"
    /* 清空列表 */
    list = nil

    /* 尾部添加元素 */
    list = append(list, 1)
    list = append(list, 3)
    list = append(list, 2)
    list = append(list, 5)
    list = append(list, 4)

    /* 中间插入元素 */
    list = append(list[:3], append([]int{6}, list[3:]...)...) // 在索引 3 处插入数字 6

    /* 删除元素 */
    list = append(list[:3], list[4:]...) // 删除索引 3 处的元素
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 清空列表 */
    list.removeAll()

    /* 尾部添加元素 */
    list.append(1)
    list.append(3)
    list.append(2)
    list.append(5)
    list.append(4)

    /* 中间插入元素 */
    list.insert(6, at: 3) // 在索引 3 处插入数字 6

    /* 删除元素 */
    list.remove(at: 3) // 删除索引 3 处的元素
    ```

=== "JS"

    ```javascript title="list.js"
    /* 清空列表 */
    list.length = 0;

    /* 尾部添加元素 */
    list.push(1);
    list.push(3);
    list.push(2);
    list.push(5);
    list.push(4);

    /* 中间插入元素 */
    list.splice(3, 0, 6);

    /* 删除元素 */
    list.splice(3, 1);
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 清空列表 */
    list.length = 0;

    /* 尾部添加元素 */
    list.push(1);
    list.push(3);
    list.push(2);
    list.push(5);
    list.push(4);

    /* 中间插入元素 */
    list.splice(3, 0, 6);

    /* 删除元素 */
    list.splice(3, 1);
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 清空列表 */
    list.clear();

    /* 尾部添加元素 */
    list.add(1);
    list.add(3);
    list.add(2);
    list.add(5);
    list.add(4);

    /* 中间插入元素 */
    list.insert(3, 6); // 在索引 3 处插入数字 6

    /* 删除元素 */
    list.removeAt(3); // 删除索引 3 处的元素
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 清空列表 */
    list.clear();

    /* 尾部添加元素 */
    list.push(1);
    list.push(3);
    list.push(2);
    list.push(5);
    list.push(4);

    /* 中间插入元素 */
    list.insert(3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    list.remove(3);    // 删除索引 3 处的元素
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Zig"

    ```zig title="list.zig"
    // 清空列表
    list.clearRetainingCapacity();

    // 尾部添加元素
    try list.append(1);
    try list.append(3);
    try list.append(2);
    try list.append(5);
    try list.append(4);

    // 中间插入元素
    try list.insert(3, 6); // 在索引 3 处插入数字 6

    // 删除元素
    _ = list.orderedRemove(3); // 删除索引 3 处的元素
    ```

### 4. &nbsp; 遍历列表

与数组一样，列表可以根据索引遍历，也可以直接遍历各元素。

=== "Python"

    ```python title="list.py"
    # 通过索引遍历列表
    count = 0
    for i in range(len(list)):
        count += 1

    # 直接遍历列表元素
    count = 0
    for n in list:
        count += 1
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < list.size(); i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (int n : list) {
        count++;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < list.size(); i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (int n : list) {
        count++;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < list.Count; i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    foreach (int n in list) {
        count++;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* 通过索引遍历列表 */
    count := 0
    for i := 0; i < len(list); i++ {
        count++
    }

    /* 直接遍历列表元素 */
    count = 0
    for range list {
        count++
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 通过索引遍历列表 */
    var count = 0
    for _ in list.indices {
        count += 1
    }

    /* 直接遍历列表元素 */
    count = 0
    for _ in list {
        count += 1
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* 通过索引遍历列表 */
    let count = 0;
    for (let i = 0; i < list.length; i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (const n of list) {
        count++;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 通过索引遍历列表 */
    let count = 0;
    for (let i = 0; i < list.length; i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (const n of list) {
        count++;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < list.length; i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (int n in list) {
        count++;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 通过索引遍历列表 */
    let mut count = 0;
    for (index, value) in list.iter().enumerate() {
        count += 1;
    }

    /* 直接遍历列表元素 */
    let mut count = 0;
    for value in list.iter() {
        count += 1;
    }
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Zig"

    ```zig title="list.zig"
    // 通过索引遍历列表
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < list.items.len) : (i += 1) {
        count += 1;
    }

    // 直接遍历列表元素
    count = 0;
    for (list.items) |_| {
        count += 1;
    }
    ```

### 5. &nbsp; 拼接列表

给定一个新列表 `list1` ，我们可以将该列表拼接到原列表的尾部。

=== "Python"

    ```python title="list.py"
    # 拼接两个列表
    list1: list[int] = [6, 8, 7, 10, 9]
    list += list1  # 将列表 list1 拼接到 list 之后
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 拼接两个列表 */
    vector<int> list1 = { 6, 8, 7, 10, 9 };
    // 将列表 list1 拼接到 list 之后
    list.insert(list.end(), list1.begin(), list1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 拼接两个列表 */
    List<Integer> list1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    list.addAll(list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 拼接两个列表 */
    List<int> list1 = new() { 6, 8, 7, 10, 9 };
    list.AddRange(list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "Go"

    ```go title="list_test.go"
    /* 拼接两个列表 */
    list1 := []int{6, 8, 7, 10, 9}
    list = append(list, list1...)  // 将列表 list1 拼接到 list 之后
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 拼接两个列表 */
    let list1 = [6, 8, 7, 10, 9]
    list.append(contentsOf: list1) // 将列表 list1 拼接到 list 之后
    ```

=== "JS"

    ```javascript title="list.js"
    /* 拼接两个列表 */
    const list1 = [6, 8, 7, 10, 9];
    list.push(...list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 拼接两个列表 */
    const list1: number[] = [6, 8, 7, 10, 9];
    list.push(...list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 拼接两个列表 */
    List<int> list1 = [6, 8, 7, 10, 9];
    list.addAll(list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 拼接两个列表 */
    let list1: Vec<i32> = vec![6, 8, 7, 10, 9];
    list.extend(list1);
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Zig"

    ```zig title="list.zig"
    // 拼接两个列表
    var list1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer list1.deinit();
    try list1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try list.insertSlice(list.items.len, list1.items); // 将列表 list1 拼接到 list 之后
    ```

### 6. &nbsp; 排序列表

完成列表排序后，我们便可以使用在数组类算法题中经常考察的“二分查找”和“双指针”算法。

=== "Python"

    ```python title="list.py"
    # 排序列表
    list.sort()  # 排序后，列表元素从小到大排列
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 排序列表 */
    sort(list.begin(), list.end());  // 排序后，列表元素从小到大排列
    ```

=== "Java"

    ```java title="list.java"
    /* 排序列表 */
    Collections.sort(list);  // 排序后，列表元素从小到大排列
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 排序列表 */
    list.Sort(); // 排序后，列表元素从小到大排列
    ```

=== "Go"

    ```go title="list_test.go"
    /* 排序列表 */
    sort.Ints(list)  // 排序后，列表元素从小到大排列
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 排序列表 */
    list.sort() // 排序后，列表元素从小到大排列
    ```

=== "JS"

    ```javascript title="list.js"
    /* 排序列表 */  
    list.sort((a, b) => a - b);  // 排序后，列表元素从小到大排列
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 排序列表 */
    list.sort((a, b) => a - b);  // 排序后，列表元素从小到大排列
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 排序列表 */
    list.sort(); // 排序后，列表元素从小到大排列
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 排序列表 */
    list.sort(); // 排序后，列表元素从小到大排列
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "Zig"

    ```zig title="list.zig"
    // 排序列表
    std.sort.sort(i32, list.items, {}, comptime std.sort.asc(i32));
    ```

## 4.3.2 &nbsp; 列表实现

许多编程语言都提供内置的列表，例如 Java、C++、Python 等。它们的实现比较复杂，各个参数的设定也非常有考究，例如初始容量、扩容倍数等。感兴趣的读者可以查阅源码进行学习。

为了加深对列表工作原理的理解，我们尝试实现一个简易版列表，包括以下三个重点设计。

- **初始容量**：选取一个合理的数组初始容量。在本示例中，我们选择 10 作为初始容量。
- **数量记录**：声明一个变量 `size` ，用于记录列表当前元素数量，并随着元素插入和删除实时更新。根据此变量，我们可以定位列表尾部，以及判断是否需要扩容。
- **扩容机制**：若插入元素时列表容量已满，则需要进行扩容。首先根据扩容倍数创建一个更大的数组，再将当前数组的所有元素依次移动至新数组。在本示例中，我们规定每次将数组扩容至之前的 2 倍。

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """列表类简易实现"""

        def __init__(self):
            """构造方法"""
            self.__capacity: int = 10  # 列表容量
            self.__nums: list[int] = [0] * self.__capacity  # 数组（存储列表元素）
            self.__size: int = 0  # 列表长度（即当前元素数量）
            self.__extend_ratio: int = 2  # 每次列表扩容的倍数

        def size(self) -> int:
            """获取列表长度（即当前元素数量）"""
            return self.__size

        def capacity(self) -> int:
            """获取列表容量"""
            return self.__capacity

        def get(self, index: int) -> int:
            """访问元素"""
            # 索引如果越界则抛出异常，下同
            if index < 0 or index >= self.__size:
                raise IndexError("索引越界")
            return self.__nums[index]

        def set(self, num: int, index: int):
            """更新元素"""
            if index < 0 or index >= self.__size:
                raise IndexError("索引越界")
            self.__nums[index] = num

        def add(self, num: int):
            """尾部添加元素"""
            # 元素数量超出容量时，触发扩容机制
            if self.size() == self.capacity():
                self.extend_capacity()
            self.__nums[self.__size] = num
            self.__size += 1

        def insert(self, num: int, index: int):
            """中间插入元素"""
            if index < 0 or index >= self.__size:
                raise IndexError("索引越界")
            # 元素数量超出容量时，触发扩容机制
            if self.__size == self.capacity():
                self.extend_capacity()
            # 将索引 index 以及之后的元素都向后移动一位
            for j in range(self.__size - 1, index - 1, -1):
                self.__nums[j + 1] = self.__nums[j]
            self.__nums[index] = num
            # 更新元素数量
            self.__size += 1

        def remove(self, index: int) -> int:
            """删除元素"""
            if index < 0 or index >= self.__size:
                raise IndexError("索引越界")
            num = self.__nums[index]
            # 索引 i 之后的元素都向前移动一位
            for j in range(index, self.__size - 1):
                self.__nums[j] = self.__nums[j + 1]
            # 更新元素数量
            self.__size -= 1
            # 返回被删除元素
            return num

        def extend_capacity(self):
            """列表扩容"""
            # 新建一个长度为原数组 __extend_ratio 倍的新数组，并将原数组拷贝到新数组
            self.__nums = self.__nums + [0] * self.capacity() * (self.__extend_ratio - 1)
            # 更新列表容量
            self.__capacity = len(self.__nums)

        def to_array(self) -> list[int]:
            """返回有效长度的列表"""
            return self.__nums[: self.__size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* 列表类简易实现 */
    class MyList {
      private:
        int *nums;             // 数组（存储列表元素）
        int numsCapacity = 10; // 列表容量
        int numsSize = 0;      // 列表长度（即当前元素数量）
        int extendRatio = 2;   // 每次列表扩容的倍数

      public:
        /* 构造方法 */
        MyList() {
            nums = new int[numsCapacity];
        }

        /* 析构方法 */
        ~MyList() {
            delete[] nums;
        }

        /* 获取列表长度（即当前元素数量）*/
        int size() {
            return numsSize;
        }

        /* 获取列表容量 */
        int capacity() {
            return numsCapacity;
        }

        /* 访问元素 */
        int get(int index) {
            // 索引如果越界则抛出异常，下同
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            return nums[index];
        }

        /* 更新元素 */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            nums[index] = num;
        }

        /* 尾部添加元素 */
        void add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (size() == capacity())
                extendCapacity();
            nums[size()] = num;
            // 更新元素数量
            numsSize++;
        }

        /* 中间插入元素 */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (size() == capacity())
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = size() - 1; j >= index; j--) {
                nums[j + 1] = nums[j];
            }
            nums[index] = num;
            // 更新元素数量
            numsSize++;
        }

        /* 删除元素 */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("索引越界");
            int num = nums[index];
            // 索引 i 之后的元素都向前移动一位
            for (int j = index; j < size() - 1; j++) {
                nums[j] = nums[j + 1];
            }
            // 更新元素数量
            numsSize--;
            // 返回被删除元素
            return num;
        }

        /* 列表扩容 */
        void extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组
            int newCapacity = capacity() * extendRatio;
            int *tmp = nums;
            nums = new int[newCapacity];
            // 将原数组中的所有元素复制到新数组
            for (int i = 0; i < size(); i++) {
                nums[i] = tmp[i];
            }
            // 释放内存
            delete[] tmp;
            numsCapacity = newCapacity;
        }

        /* 将列表转换为 Vector 用于打印 */
        vector<int> toVector() {
            // 仅转换有效长度范围内的列表元素
            vector<int> vec(size());
            for (int i = 0; i < size(); i++) {
                vec[i] = nums[i];
            }
            return vec;
        }
    };
    ```

=== "Java"

    ```java title="my_list.java"
    /* 列表类简易实现 */
    class MyList {
        private int[] nums; // 数组（存储列表元素）
        private int capacity = 10; // 列表容量
        private int size = 0; // 列表长度（即当前元素数量）
        private int extendRatio = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        public MyList() {
            nums = new int[capacity];
        }

        /* 获取列表长度（即当前元素数量） */
        public int size() {
            return size;
        }

        /* 获取列表容量 */
        public int capacity() {
            return capacity;
        }

        /* 访问元素 */
        public int get(int index) {
            // 索引如果越界则抛出异常，下同
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            return nums[index];
        }

        /* 更新元素 */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            nums[index] = num;
        }

        /* 尾部添加元素 */
        public void add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity();
            nums[size] = num;
            // 更新元素数量
            size++;
        }

        /* 中间插入元素 */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (size == capacity())
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = size - 1; j >= index; j--) {
                nums[j + 1] = nums[j];
            }
            nums[index] = num;
            // 更新元素数量
            size++;
        }

        /* 删除元素 */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("索引越界");
            int num = nums[index];
            // 将索引 index 之后的元素都向前移动一位
            for (int j = index; j < size - 1; j++) {
                nums[j] = nums[j + 1];
            }
            // 更新元素数量
            size--;
            // 返回被删除元素
            return num;
        }

        /* 列表扩容 */
        public void extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组拷贝到新数组
            nums = Arrays.copyOf(nums, capacity() * extendRatio);
            // 更新列表容量
            capacity = nums.length;
        }

        /* 将列表转换为数组 */
        public int[] toArray() {
            int size = size();
            // 仅转换有效长度范围内的列表元素
            int[] nums = new int[size];
            for (int i = 0; i < size; i++) {
                nums[i] = get(i);
            }
            return nums;
        }
    }
    ```

=== "C#"

    ```csharp title="my_list.cs"
    /* 列表类简易实现 */
    class MyList {
        private int[] nums;           // 数组（存储列表元素）
        private int numsCapacity = 10;    // 列表容量
        private int numsSize = 0;         // 列表长度（即当前元素数量）
        private int extendRatio = 2;  // 每次列表扩容的倍数

        /* 构造方法 */
        public MyList() {
            nums = new int[numsCapacity];
        }

        /* 获取列表长度（即当前元素数量）*/
        public int size() {
            return numsSize;
        }

        /* 获取列表容量 */
        public int capacity() {
            return numsCapacity;
        }

        /* 访问元素 */
        public int get(int index) {
            // 索引如果越界则抛出异常，下同
            if (index < 0 || index >= numsSize)
                throw new IndexOutOfRangeException("索引越界");
            return nums[index];
        }

        /* 更新元素 */
        public void set(int index, int num) {
            if (index < 0 || index >= numsSize)
                throw new IndexOutOfRangeException("索引越界");
            nums[index] = num;
        }

        /* 尾部添加元素 */
        public void add(int num) {
            // 元素数量超出容量时，触发扩容机制
            if (numsSize == numsCapacity)
                extendCapacity();
            nums[numsSize] = num;
            // 更新元素数量
            numsSize++;
        }

        /* 中间插入元素 */
        public void insert(int index, int num) {
            if (index < 0 || index >= numsSize)
                throw new IndexOutOfRangeException("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (numsSize == numsCapacity)
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = numsSize - 1; j >= index; j--) {
                nums[j + 1] = nums[j];
            }
            nums[index] = num;
            // 更新元素数量
            numsSize++;
        }

        /* 删除元素 */
        public int remove(int index) {
            if (index < 0 || index >= numsSize)
                throw new IndexOutOfRangeException("索引越界");
            int num = nums[index];
            // 将索引 index 之后的元素都向前移动一位
            for (int j = index; j < numsSize - 1; j++) {
                nums[j] = nums[j + 1];
            }
            // 更新元素数量
            numsSize--;
            // 返回被删除元素
            return num;
        }

        /* 列表扩容 */
        public void extendCapacity() {
            // 新建一个长度为 numsCapacity * extendRatio 的数组，并将原数组拷贝到新数组
            Array.Resize(ref nums, numsCapacity * extendRatio);
            // 更新列表容量
            numsCapacity = nums.Length;
        }

        /* 将列表转换为数组 */
        public int[] toArray() {
            // 仅转换有效长度范围内的列表元素
            int[] nums = new int[numsSize];
            for (int i = 0; i < numsSize; i++) {
                nums[i] = get(i);
            }
            return nums;
        }
    }
    ```

=== "Go"

    ```go title="my_list.go"
    /* 列表类简易实现 */
    type myList struct {
        numsCapacity int
        nums         []int
        numsSize     int
        extendRatio  int
    }

    /* 构造函数 */
    func newMyList() *myList {
        return &myList{
            numsCapacity: 10,              // 列表容量
            nums:         make([]int, 10), // 数组（存储列表元素）
            numsSize:     0,               // 列表长度（即当前元素数量）
            extendRatio:  2,               // 每次列表扩容的倍数
        }
    }

    /* 获取列表长度（即当前元素数量） */
    func (l *myList) size() int {
        return l.numsSize
    }

    /*  获取列表容量 */
    func (l *myList) capacity() int {
        return l.numsCapacity
    }

    /* 访问元素 */
    func (l *myList) get(index int) int {
        // 索引如果越界则抛出异常，下同
        if index < 0 || index >= l.numsSize {
            panic("索引越界")
        }
        return l.nums[index]
    }

    /* 更新元素 */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.numsSize {
            panic("索引越界")
        }
        l.nums[index] = num
    }

    /* 尾部添加元素 */
    func (l *myList) add(num int) {
        // 元素数量超出容量时，触发扩容机制
        if l.numsSize == l.numsCapacity {
            l.extendCapacity()
        }
        l.nums[l.numsSize] = num
        // 更新元素数量
        l.numsSize++
    }

    /* 中间插入元素 */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.numsSize {
            panic("索引越界")
        }
        // 元素数量超出容量时，触发扩容机制
        if l.numsSize == l.numsCapacity {
            l.extendCapacity()
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for j := l.numsSize - 1; j >= index; j-- {
            l.nums[j+1] = l.nums[j]
        }
        l.nums[index] = num
        // 更新元素数量
        l.numsSize++
    }

    /* 删除元素 */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.numsSize {
            panic("索引越界")
        }
        num := l.nums[index]
        // 索引 i 之后的元素都向前移动一位
        for j := index; j < l.numsSize-1; j++ {
            l.nums[j] = l.nums[j+1]
        }
        // 更新元素数量
        l.numsSize--
        // 返回被删除元素
        return num
    }

    /* 列表扩容 */
    func (l *myList) extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组拷贝到新数组
        l.nums = append(l.nums, make([]int, l.numsCapacity*(l.extendRatio-1))...)
        // 更新列表容量
        l.numsCapacity = len(l.nums)
    }

    /* 返回有效长度的列表 */
    func (l *myList) toArray() []int {
        // 仅转换有效长度范围内的列表元素
        return l.nums[:l.numsSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* 列表类简易实现 */
    class MyList {
        private var nums: [Int] // 数组（存储列表元素）
        private var _capacity = 10 // 列表容量
        private var _size = 0 // 列表长度（即当前元素数量）
        private let extendRatio = 2 // 每次列表扩容的倍数

        /* 构造方法 */
        init() {
            nums = Array(repeating: 0, count: _capacity)
        }

        /* 获取列表长度（即当前元素数量）*/
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
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            return nums[index]
        }

        /* 更新元素 */
        func set(index: Int, num: Int) {
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            nums[index] = num
        }

        /* 尾部添加元素 */
        func add(num: Int) {
            // 元素数量超出容量时，触发扩容机制
            if _size == _capacity {
                extendCapacity()
            }
            nums[_size] = num
            // 更新元素数量
            _size += 1
        }

        /* 中间插入元素 */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            // 元素数量超出容量时，触发扩容机制
            if _size == _capacity {
                extendCapacity()
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for j in sequence(first: _size - 1, next: { $0 >= index + 1 ? $0 - 1 : nil }) {
                nums[j + 1] = nums[j]
            }
            nums[index] = num
            // 更新元素数量
            _size += 1
        }

        /* 删除元素 */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= _size {
                fatalError("索引越界")
            }
            let num = nums[index]
            // 将索引 index 之后的元素都向前移动一位
            for j in index ..< (_size - 1) {
                nums[j] = nums[j + 1]
            }
            // 更新元素数量
            _size -= 1
            // 返回被删除元素
            return num
        }

        /* 列表扩容 */
        func extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组拷贝到新数组
            nums = nums + Array(repeating: 0, count: _capacity * (extendRatio - 1))
            // 更新列表容量
            _capacity = nums.count
        }

        /* 将列表转换为数组 */
        func toArray() -> [Int] {
            var nums = Array(repeating: 0, count: _size)
            for i in 0 ..< _size {
                nums[i] = get(index: i)
            }
            return nums
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* 列表类简易实现 */
    class MyList {
        #nums = new Array(); // 数组（存储列表元素）
        #capacity = 10; // 列表容量
        #size = 0; // 列表长度（即当前元素数量）
        #extendRatio = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        constructor() {
            this.#nums = new Array(this.#capacity);
        }

        /* 获取列表长度（即当前元素数量）*/
        size() {
            return this.#size;
        }

        /* 获取列表容量 */
        capacity() {
            return this.#capacity;
        }

        /* 访问元素 */
        get(index) {
            // 索引如果越界则抛出异常，下同
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            return this.#nums[index];
        }

        /* 更新元素 */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            this.#nums[index] = num;
        }

        /* 尾部添加元素 */
        add(num) {
            // 如果长度等于容量，则需要扩容
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 将新元素添加到列表尾部
            this.#nums[this.#size] = num;
            this.#size++;
        }

        /* 中间插入元素 */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            // 元素数量超出容量时，触发扩容机制
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for (let j = this.#size - 1; j >= index; j--) {
                this.#nums[j + 1] = this.#nums[j];
            }
            // 更新元素数量
            this.#nums[index] = num;
            this.#size++;
        }

        /* 删除元素 */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('索引越界');
            let num = this.#nums[index];
            // 将索引 index 之后的元素都向前移动一位
            for (let j = index; j < this.#size - 1; j++) {
                this.#nums[j] = this.#nums[j + 1];
            }
            // 更新元素数量
            this.#size--;
            // 返回被删除元素
            return num;
        }

        /* 列表扩容 */
        extendCapacity() {
            // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组拷贝到新数组
            this.#nums = this.#nums.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // 更新列表容量
            this.#capacity = this.#nums.length;
        }

        /* 将列表转换为数组 */
        toArray() {
            let size = this.size();
            // 仅转换有效长度范围内的列表元素
            const nums = new Array(size);
            for (let i = 0; i < size; i++) {
                nums[i] = this.get(i);
            }
            return nums;
        }
    }
    ```

=== "TS"

    ```typescript title="my_list.ts"
    /* 列表类简易实现 */
    class MyList {
        private nums: Array<number>; // 数组（存储列表元素）
        private _capacity: number = 10; // 列表容量
        private _size: number = 0; // 列表长度（即当前元素数量）
        private extendRatio: number = 2; // 每次列表扩容的倍数

        /* 构造方法 */
        constructor() {
            this.nums = new Array(this._capacity);
        }

        /* 获取列表长度（即当前元素数量）*/
        public size(): number {
            return this._size;
        }

        /* 获取列表容量 */
        public capacity(): number {
            return this._capacity;
        }

        /* 访问元素 */
        public get(index: number): number {
            // 索引如果越界则抛出异常，下同
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            return this.nums[index];
        }

        /* 更新元素 */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            this.nums[index] = num;
        }

        /* 尾部添加元素 */
        public add(num: number): void {
            // 如果长度等于容量，则需要扩容
            if (this._size === this._capacity) this.extendCapacity();
            // 将新元素添加到列表尾部
            this.nums[this._size] = num;
            this._size++;
        }

        /* 中间插入元素 */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            // 元素数量超出容量时，触发扩容机制
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for (let j = this._size - 1; j >= index; j--) {
                this.nums[j + 1] = this.nums[j];
            }
            // 更新元素数量
            this.nums[index] = num;
            this._size++;
        }

        /* 删除元素 */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('索引越界');
            let num = this.nums[index];
            // 将索引 index 之后的元素都向前移动一位
            for (let j = index; j < this._size - 1; j++) {
                this.nums[j] = this.nums[j + 1];
            }
            // 更新元素数量
            this._size--;
            // 返回被删除元素
            return num;
        }

        /* 列表扩容 */
        public extendCapacity(): void {
            // 新建一个长度为 size 的数组，并将原数组拷贝到新数组
            this.nums = this.nums.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // 更新列表容量
            this._capacity = this.nums.length;
        }

        /* 将列表转换为数组 */
        public toArray(): number[] {
            let size = this.size();
            // 仅转换有效长度范围内的列表元素
            const nums = new Array(size);
            for (let i = 0; i < size; i++) {
                nums[i] = this.get(i);
            }
            return nums;
        }
    }
    ```

=== "Dart"

    ```dart title="my_list.dart"
    /* 列表类简易实现 */
    class MyList {
      late List<int> _nums; // 数组（存储列表元素）
      int _capacity = 10; // 列表容量
      int _size = 0; // 列表长度（即当前元素数量）
      int _extendRatio = 2; // 每次列表扩容的倍数

      /* 构造方法 */
      MyList() {
        _nums = List.filled(_capacity, 0);
      }

      /* 获取列表长度（即当前元素数量）*/
      int size() => _size;

      /* 获取列表容量 */
      int capacity() => _capacity;

      /* 访问元素 */
      int get(int index) {
        if (index >= _size) throw RangeError('索引越界');
        return _nums[index];
      }

      /* 更新元素 */
      void set(int index, int num) {
        if (index >= _size) throw RangeError('索引越界');
        _nums[index] = num;
      }

      /* 尾部添加元素 */
      void add(int num) {
        // 元素数量超出容量时，触发扩容机制
        if (_size == _capacity) extendCapacity();
        _nums[_size] = num;
        // 更新元素数量
        _size++;
      }

      /* 中间插入元素 */
      void insert(int index, int num) {
        if (index >= _size) throw RangeError('索引越界');
        // 元素数量超出容量时，触发扩容机制
        if (_size == _capacity) extendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (var j = _size - 1; j >= index; j--) {
          _nums[j + 1] = _nums[j];
        }
        _nums[index] = num;
        // 更新元素数量
        _size++;
      }

      /* 删除元素 */
      int remove(int index) {
        if (index >= _size) throw RangeError('索引越界');
        int num = _nums[index];
        // 将索引 index 之后的元素都向前移动一位
        for (var j = index; j < _size - 1; j++) {
          _nums[j] = _nums[j + 1];
        }
        // 更新元素数量
        _size--;
        // 返回被删除元素
        return num;
      }

      /* 列表扩容 */
      void extendCapacity() {
        // 新建一个长度为原数组 _extendRatio 倍的新数组
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 将原数组拷贝到新数组
        List.copyRange(_newNums, 0, _nums);
        // 更新 _nums 的引用
        _nums = _newNums;
        // 更新列表容量
        _capacity = _nums.length;
      }

      /* 将列表转换为数组 */
      List<int> toArray() {
        List<int> nums = [];
        for (var i = 0; i < _size; i++) {
          nums.add(get(i));
        }
        return nums;
      }
    }
    ```

=== "Rust"

    ```rust title="my_list.rs"
    /* 列表类简易实现 */
    #[allow(dead_code)]
    struct MyList {
        nums: Vec<i32>,       // 数组（存储列表元素）
        capacity: usize,      // 列表容量
        size: usize,          // 列表长度（即当前元素数量）
        extend_ratio: usize,  // 每次列表扩容的倍数
    }

    #[allow(unused,unused_comparisons)]
    impl MyList {
        /* 构造方法 */
        pub fn new(capacity: usize) -> Self {
            let mut vec = Vec::new(); 
            vec.resize(capacity, 0);
            Self {
                nums: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* 获取列表长度（即当前元素数量）*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* 获取列表容量 */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 访问元素 */
        pub fn get(&self, index: usize) -> i32 {
            // 索引如果越界则抛出异常，下同
            if index < 0 || index >= self.size {panic!("索引越界")};
            return self.nums[index];
        }

        /* 更新元素 */
        pub fn set(&mut self, index: usize, num: i32) {
            if index < 0 || index >= self.size {panic!("索引越界")};
            self.nums[index] = num;
        }

        /* 尾部添加元素 */
        pub fn add(&mut self, num: i32) {
            // 元素数量超出容量时，触发扩容机制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.nums[self.size] = num;
            // 更新元素数量
            self.size += 1;
        }

        /* 中间插入元素 */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index < 0 || index >= self.size() {panic!("索引越界")};
            // 元素数量超出容量时，触发扩容机制
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // 将索引 index 以及之后的元素都向后移动一位
            for j in (index..self.size).rev() {
                self.nums[j + 1] = self.nums[j];
            }
            self.nums[index] = num;
            // 更新元素数量
            self.size += 1;
        }

        /* 删除元素 */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index < 0 || index >= self.size() {panic!("索引越界")};
            let num = self.nums[index];
            // 将索引 index 之后的元素都向前移动一位
            for j in (index..self.size - 1) {
                self.nums[j] = self.nums[j + 1];
            }
            // 更新元素数量
            self.size -= 1;
            // 返回被删除元素
            return num;
        }

        /* 列表扩容 */
        pub fn extend_capacity(&mut self) {
            // 新建一个长度为原数组 extend_ratio 倍的新数组，并将原数组拷贝到新数组
            let new_capacity = self.capacity * self.extend_ratio;
            self.nums.resize(new_capacity, 0);
            // 更新列表容量
            self.capacity = new_capacity;
        }

        /* 将列表转换为数组 */
        pub fn to_array(&mut self) -> Vec<i32> {
            // 仅转换有效长度范围内的列表元素
            let mut nums = Vec::new();
            for i in 0..self.size {
                nums.push(self.get(i));
            }
            nums
        }
    }
    ```

=== "C"

    ```c title="my_list.c"
    /* 列表类简易实现 */
    struct myList {
        int *nums;       // 数组（存储列表元素）
        int capacity;    // 列表容量
        int size;        // 列表大小
        int extendRatio; // 列表每次扩容的倍数
    };

    typedef struct myList myList;

    /* 构造函数 */
    myList *newMyList() {
        myList *list = malloc(sizeof(myList));
        list->capacity = 10;
        list->nums = malloc(sizeof(int) * list->capacity);
        list->size = 0;
        list->extendRatio = 2;
        return list;
    }

    /* 析构函数 */
    void delMyList(myList *list) {
        free(list->nums);
        free(list);
    }

    /* 获取列表长度 */
    int size(myList *list) {
        return list->size;
    }

    /* 获取列表容量 */
    int capacity(myList *list) {
        return list->capacity;
    }

    /* 访问元素 */
    int get(myList *list, int index) {
        assert(index >= 0 && index < list->size);
        return list->nums[index];
    }

    /* 更新元素 */
    void set(myList *list, int index, int num) {
        assert(index >= 0 && index < list->size);
        list->nums[index] = num;
    }

    /* 尾部添加元素 */
    void add(myList *list, int num) {
        if (size(list) == capacity(list)) {
            extendCapacity(list); // 扩容
        }
        list->nums[size(list)] = num;
        list->size++;
    }

    /* 中间插入元素 */
    void insert(myList *list, int index, int num) {
        assert(index >= 0 && index < size(list));
        // 元素数量超出容量时，触发扩容机制
        if (size(list) == capacity(list)) {
            extendCapacity(list); // 扩容
        }
        for (int i = size(list); i > index; --i) {
            list->nums[i] = list->nums[i - 1];
        }
        list->nums[index] = num;
        list->size++;
    }

    /* 删除元素 */
    // 注意：stdio.h 占用了 remove 关键词
    int removeNum(myList *list, int index) {
        assert(index >= 0 && index < size(list));
        int num = list->nums[index];
        for (int i = index; i < size(list) - 1; i++) {
            list->nums[i] = list->nums[i + 1];
        }
        list->size--;
        return num;
    }

    /* 列表扩容 */
    void extendCapacity(myList *list) {
        // 先分配空间
        int newCapacity = capacity(list) * list->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = list->nums;

        // 拷贝旧数据到新数据
        for (int i = 0; i < size(list); i++)
            extend[i] = list->nums[i];

        // 释放旧数据
        free(temp);

        // 更新新数据
        list->nums = extend;
        list->capacity = newCapacity;
    }

    /* 将列表转换为 Array 用于打印 */
    int *toArray(myList *list) {
        return list->nums;
    }
    ```

=== "Zig"

    ```zig title="my_list.zig"
    // 列表类简易实现
    fn MyList(comptime T: type) type {
        return struct {
            const Self = @This();
            
            nums: []T = undefined,                        // 数组（存储列表元素）
            numsCapacity: usize = 10,                     // 列表容量
            numSize: usize = 0,                           // 列表长度（即当前元素数量）
            extendRatio: usize = 2,                       // 每次列表扩容的倍数
            mem_arena: ?std.heap.ArenaAllocator = null,
            mem_allocator: std.mem.Allocator = undefined, // 内存分配器

            // 构造函数（分配内存+初始化列表）
            pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
                if (self.mem_arena == null) {
                    self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                    self.mem_allocator = self.mem_arena.?.allocator();
                }
                self.nums = try self.mem_allocator.alloc(T, self.numsCapacity);
                @memset(self.nums, @as(T, 0));
            }

            // 析构函数（释放内存）
            pub fn deinit(self: *Self) void {
                if (self.mem_arena == null) return;
                self.mem_arena.?.deinit();
            }

            // 获取列表长度（即当前元素数量）
            pub fn size(self: *Self) usize {
                return self.numSize;
            }

            // 获取列表容量
            pub fn capacity(self: *Self) usize {
                return self.numsCapacity;
            }

            // 访问元素
            pub fn get(self: *Self, index: usize) T {
                // 索引如果越界则抛出异常，下同
                if (index < 0 or index >= self.size()) @panic("索引越界");
                return self.nums[index];
            }  

            // 更新元素
            pub fn set(self: *Self, index: usize, num: T) void {
                // 索引如果越界则抛出异常，下同
                if (index < 0 or index >= self.size()) @panic("索引越界");
                self.nums[index] = num;
            }  

            // 尾部添加元素
            pub fn add(self: *Self, num: T) !void {
                // 元素数量超出容量时，触发扩容机制
                if (self.size() == self.capacity()) try self.extendCapacity();
                self.nums[self.size()] = num;
                // 更新元素数量
                self.numSize += 1;
            }  

            // 中间插入元素
            pub fn insert(self: *Self, index: usize, num: T) !void {
                if (index < 0 or index >= self.size()) @panic("索引越界");
                // 元素数量超出容量时，触发扩容机制
                if (self.size() == self.capacity()) try self.extendCapacity();
                // 将索引 index 以及之后的元素都向后移动一位
                var j = self.size() - 1;
                while (j >= index) : (j -= 1) {
                    self.nums[j + 1] = self.nums[j];
                }
                self.nums[index] = num;
                // 更新元素数量
                self.numSize += 1;
            }

            // 删除元素
            pub fn remove(self: *Self, index: usize) T {
                if (index < 0 or index >= self.size()) @panic("索引越界");
                var num = self.nums[index];
                // 索引 i 之后的元素都向前移动一位
                var j = index;
                while (j < self.size() - 1) : (j += 1) {
                    self.nums[j] = self.nums[j + 1];
                }
                // 更新元素数量
                self.numSize -= 1;
                // 返回被删除元素
                return num;
            }

            // 列表扩容
            pub fn extendCapacity(self: *Self) !void {
                // 新建一个长度为 size * extendRatio 的数组，并将原数组拷贝到新数组
                var newCapacity = self.capacity() * self.extendRatio;
                var extend = try self.mem_allocator.alloc(T, newCapacity);
                @memset(extend, @as(T, 0));
                // 将原数组中的所有元素复制到新数组
                std.mem.copy(T, extend, self.nums);
                self.nums = extend;
                // 更新列表容量
                self.numsCapacity = newCapacity;
            }

            // 将列表转换为数组
            pub fn toArray(self: *Self) ![]T {
                // 仅转换有效长度范围内的列表元素
                var nums = try self.mem_allocator.alloc(T, self.size());
               @memset(nums, @as(T, 0));
                for (nums, 0..) |*num, i| {
                    num.* = self.get(i);
                }
                return nums;
            }
        };
    }
    ```
