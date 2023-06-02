# 列表

**数组长度不可变导致实用性降低**。在许多情况下，我们事先无法确定需要存储多少数据，这使数组长度的选择变得困难。若长度过小，需要在持续添加数据时频繁扩容数组；若长度过大，则会造成内存空间的浪费。

为解决此问题，出现了一种被称为「动态数组 Dynamic Array」的数据结构，即长度可变的数组，也常被称为「列表 List」。列表基于数组实现，继承了数组的优点，并且可以在程序运行过程中动态扩容。在列表中，我们可以自由添加元素，而无需担心超过容量限制。

## 列表常用操作

**初始化列表**。通常我们会使用“无初始值”和“有初始值”的两种初始化方法。

=== "Java"

    ```java title="list.java"
    /* 初始化列表 */
    // 无初始值
    List<Integer> list1 = new ArrayList<>();
    // 有初始值（注意数组的元素类型需为 int[] 的包装类 Integer[]）
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> list = new ArrayList<>(Arrays.asList(numbers));
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

=== "Python"

    ```python title="list.py"
    # 初始化列表
    # 无初始值
    list1: List[int] = []
    # 有初始值
    list: List[int] = [1, 3, 2, 5, 4]
    ```

=== "Go"

    ```go title="list_test.go"
    /* 初始化列表 */
    // 无初始值
    list1 := []int
    // 有初始值
    list := []int{1, 3, 2, 5, 4}
    ```

=== "JavaScript"

    ```javascript title="list.js"
    /* 初始化列表 */
    // 无初始值
    const list1 = [];
    // 有初始值
    const list = [1, 3, 2, 5, 4];
    ```

=== "TypeScript"

    ```typescript title="list.ts"
    /* 初始化列表 */
    // 无初始值
    const list1: number[] = [];
    // 有初始值
    const list: number[] = [1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
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

=== "Swift"

    ```swift title="list.swift"
    /* 初始化列表 */
    // 无初始值
    let list1: [Int] = []
    // 有初始值
    var list = [1, 3, 2, 5, 4]
    ```

=== "Zig"

    ```zig title="list.zig"
    // 初始化列表
    var list = std.ArrayList(i32).init(std.heap.page_allocator);
    defer list.deinit();
    try list.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 初始化列表 */
    // 无初始值
    List<int> list1 = [];
    // 有初始值
    List<int> list = [1, 3, 2, 5, 4];
    ```

**访问与更新元素**。由于列表的底层数据结构是数组，因此可以在 $O(1)$ 时间内访问和更新元素，效率很高。

=== "Java"

    ```java title="list.java"
    /* 访问元素 */
    int num = list.get(1);  // 访问索引 1 处的元素

    /* 更新元素 */
    list.set(1, 0);  // 将索引 1 处的元素更新为 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 访问元素 */
    int num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Python"

    ```python title="list.py"
    # 访问元素
    num: int = list[1]  # 访问索引 1 处的元素

    # 更新元素
    list[1] = 0    # 将索引 1 处的元素更新为 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* 访问元素 */
    num := list[1]  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0     // 将索引 1 处的元素更新为 0
    ```

=== "JavaScript"

    ```javascript title="list.js"
    /* 访问元素 */
    const num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "TypeScript"

    ```typescript title="list.ts"
    /* 访问元素 */
    const num: number = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 访问元素 */
    int num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 访问元素 */
    let num = list[1] // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0 // 将索引 1 处的元素更新为 0
    ```

=== "Zig"

    ```zig title="list.zig"
    // 访问元素
    var num = list.items[1]; // 访问索引 1 处的元素

    // 更新元素
    list.items[1] = 0; // 将索引 1 处的元素更新为 0  
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 访问元素 */
    int num = list[1];  // 访问索引 1 处的元素

    /* 更新元素 */
    list[1] = 0;  // 将索引 1 处的元素更新为 0
    ```

**在列表中添加、插入、删除元素**。相较于数组，列表可以自由地添加与删除元素。在列表尾部添加元素的时间复杂度为 $O(1)$ ，但插入和删除元素的效率仍与数组相同，时间复杂度为 $O(N)$ 。

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

=== "JavaScript"

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

=== "TypeScript"

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

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
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

**遍历列表**。与数组一样，列表可以根据索引遍历，也可以直接遍历各元素。

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

=== "JavaScript"

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

=== "TypeScript"

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

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < list.Count(); i++)
    {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    foreach (int n in list)
    {
        count++;
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

**拼接两个列表**。给定一个新列表 `list1` ，我们可以将该列表拼接到原列表的尾部。

=== "Java"

    ```java title="list.java"
    /* 拼接两个列表 */
    List<Integer> list1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    list.addAll(list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 拼接两个列表 */
    vector<int> list1 = { 6, 8, 7, 10, 9 };
    // 将列表 list1 拼接到 list 之后
    list.insert(list.end(), list1.begin(), list1.end());
    ```

=== "Python"

    ```python title="list.py"
    # 拼接两个列表
    list1: List[int] = [6, 8, 7, 10, 9]
    list += list1  # 将列表 list1 拼接到 list 之后
    ```

=== "Go"

    ```go title="list_test.go"
    /* 拼接两个列表 */
    list1 := []int{6, 8, 7, 10, 9}
    list = append(list, list1...)  // 将列表 list1 拼接到 list 之后
    ```

=== "JavaScript"

    ```javascript title="list.js"
    /* 拼接两个列表 */
    const list1 = [6, 8, 7, 10, 9];
    list.push(...list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "TypeScript"

    ```typescript title="list.ts"
    /* 拼接两个列表 */
    const list1: number[] = [6, 8, 7, 10, 9];
    list.push(...list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 拼接两个列表 */
    List<int> list1 = new() { 6, 8, 7, 10, 9 };
    list.AddRange(list1);  // 将列表 list1 拼接到 list 之后
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 拼接两个列表 */
    let list1 = [6, 8, 7, 10, 9]
    list.append(contentsOf: list1) // 将列表 list1 拼接到 list 之后
    ```

=== "Zig"

    ```zig title="list.zig"
    // 拼接两个列表
    var list1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer list1.deinit();
    try list1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try list.insertSlice(list.items.len, list1.items); // 将列表 list1 拼接到 list 之后
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 拼接两个列表 */
    List<int> list1 = [6, 8, 7, 10, 9];
    list.addAll(list1);  // 将列表 list1 拼接到 list 之后
    ```

**排序列表**。排序也是常用的方法之一。完成列表排序后，我们便可以使用在数组类算法题中经常考察的「二分查找」和「双指针」算法。

=== "Java"

    ```java title="list.java"
    /* 排序列表 */
    Collections.sort(list);  // 排序后，列表元素从小到大排列
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 排序列表 */
    sort(list.begin(), list.end());  // 排序后，列表元素从小到大排列
    ```

=== "Python"

    ```python title="list.py"
    # 排序列表
    list.sort()  # 排序后，列表元素从小到大排列
    ```

=== "Go"

    ```go title="list_test.go"
    /* 排序列表 */
    sort.Ints(list)  // 排序后，列表元素从小到大排列
    ```

=== "JavaScript"

    ```javascript title="list.js"
    /* 排序列表 */  
    list.sort((a, b) => a - b);  // 排序后，列表元素从小到大排列
    ```

=== "TypeScript"

    ```typescript title="list.ts"
    /* 排序列表 */
    list.sort((a, b) => a - b);  // 排序后，列表元素从小到大排列
    ```

=== "C"

    ```c title="list.c"
    // C 未提供内置动态数组
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 排序列表 */
    list.Sort(); // 排序后，列表元素从小到大排列
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 排序列表 */
    list.sort() // 排序后，列表元素从小到大排列
    ```

=== "Zig"

    ```zig title="list.zig"
    // 排序列表
    std.sort.sort(i32, list.items, {}, comptime std.sort.asc(i32));
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 排序列表 */
    list.sort(); // 排序后，列表元素从小到大排列
    ```

## 列表实现 *

为了帮助加深对列表的理解，我们在此提供一个简易版列表实现。需要关注三个核心点：

- **初始容量**：选取一个合理的数组初始容量。在本示例中，我们选择 10 作为初始容量。
- **数量记录**：声明一个变量 size，用于记录列表当前元素数量，并随着元素插入和删除实时更新。根据此变量，我们可以定位列表尾部，以及判断是否需要扩容。
- **扩容机制**：插入元素时可能超出列表容量，此时需要扩容列表。扩容方法是根据扩容倍数创建一个更大的数组，并将当前数组的所有元素依次移动至新数组。在本示例中，我们规定每次将数组扩容至之前的 2 倍。

本示例旨在帮助读者直观理解列表的工作机制。实际编程语言中，列表实现更加标准和复杂，各个参数的设定也非常有考究，例如初始容量、扩容倍数等。感兴趣的读者可以查阅源码进行学习。

=== "Java"

    ```java title="my_list.java"
    [class]{MyList}-[func]{}
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    [class]{MyList}-[func]{}
    ```

=== "Python"

    ```python title="my_list.py"
    [class]{MyList}-[func]{}
    ```

=== "Go"

    ```go title="my_list.go"
    [class]{myList}-[func]{}
    ```

=== "JavaScript"

    ```javascript title="my_list.js"
    [class]{MyList}-[func]{}
    ```

=== "TypeScript"

    ```typescript title="my_list.ts"
    [class]{MyList}-[func]{}
    ```

=== "C"

    ```c title="my_list.c"
    [class]{myList}-[func]{}
    ```

=== "C#"

    ```csharp title="my_list.cs"
    [class]{MyList}-[func]{}
    ```

=== "Swift"

    ```swift title="my_list.swift"
    [class]{MyList}-[func]{}
    ```

=== "Zig"

    ```zig title="my_list.zig"
    [class]{MyList}-[func]{}
    ```

=== "Dart"

    ```dart title="my_list.dart"
    [class]{MyList}-[func]{}
    ```
