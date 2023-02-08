---
comments: true
---

# 4.3. 列表

**由于长度不可变，数组的实用性大大降低**。在很多情况下，我们事先并不知道会输入多少数据，这就为数组长度的选择带来了很大困难。长度选小了，需要在添加数据中频繁地扩容数组；长度选大了，又造成内存空间的浪费。

为了解决此问题，诞生了一种被称为「列表 List」的数据结构。列表可以被理解为长度可变的数组，因此也常被称为「动态数组 Dynamic Array」。列表基于数组实现，继承了数组的优点，同时还可以在程序运行中实时扩容。在列表中，我们可以自由地添加元素，而不用担心超过容量限制。

## 4.3.1. 列表常用操作

**初始化列表**。我们通常会使用到“无初始值”和“有初始值”的两种初始化方法。

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
    """ 初始化列表 """
    # 无初始值
    list1 = []
    # 有初始值
    list = [1, 3, 2, 5, 4]
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

    ```

=== "C#"

    ```csharp title="list.cs"
    /* 初始化列表 */
    // 无初始值
    List<int> list1 = new ();
    // 有初始值（注意数组的元素类型需为 int[] 的包装类 Integer[]）
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

**访问与更新元素**。列表的底层数据结构是数组，因此可以在 $O(1)$ 时间内访问与更新元素，效率很高。

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
    """ 访问元素 """
    num = list[1]  # 访问索引 1 处的元素

    """ 更新元素 """
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

**在列表中添加、插入、删除元素**。相对于数组，列表可以自由地添加与删除元素。在列表尾部添加元素的时间复杂度为 $O(1)$ ，但是插入与删除元素的效率仍与数组一样低，时间复杂度为 $O(N)$ 。

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
    """ 清空列表 """
    list.clear()

    """ 尾部添加元素 """
    list.append(1)
    list.append(3)
    list.append(2)
    list.append(5)
    list.append(4)

    """ 中间插入元素 """
    list.insert(3, 6)  # 在索引 3 处插入数字 6

    """ 删除元素 """
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

**遍历列表**。与数组一样，列表可以使用索引遍历，也可以使用 `for-each` 直接遍历。

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
    """ 通过索引遍历列表 """
    count = 0
    for i in range(len(list)):
        count += 1

    """ 直接遍历列表元素 """
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

**拼接两个列表**。再创建一个新列表 `list1` ，我们可以将其中一个列表拼接到另一个的尾部。

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
    """ 拼接两个列表 """
    list1 = [6, 8, 7, 10, 9]
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

**排序列表**。排序也是常用的方法之一，完成列表排序后，我们就可以使用在数组类算法题中经常考察的「二分查找」和「双指针」算法了。

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
    """ 排序列表 """
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

## 4.3.2. 列表简易实现 *

为了帮助加深对列表的理解，我们在此提供一个列表的简易版本的实现。需要关注三个核心点：

- **初始容量**：选取一个合理的数组的初始容量 `initialCapacity` 。在本示例中，我们选择 10 作为初始容量。
- **数量记录**：需要声明一个变量 `size` ，用来记录列表当前有多少个元素，并随着元素插入与删除实时更新。根据此变量，可以定位列表的尾部，以及判断是否需要扩容。
- **扩容机制**：插入元素有可能导致超出列表容量，此时需要扩容列表，方法是建立一个更大的数组来替换当前数组。需要给定一个扩容倍数 `extendRatio` ，在本示例中，我们规定每次将数组扩容至之前的 2 倍。

本示例是为了帮助读者对如何实现列表产生直观的认识。实际编程语言中，列表的实现远比以下代码复杂且标准，感兴趣的读者可以查阅源码学习。

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
        // 索引 i 以及之后的元素都向后移动一位
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
        // 新建一个长度为 self.__size 的数组，并将原数组拷贝到新数组
        l.nums = append(l.nums, make([]int, l.numsCapacity*(l.extendRatio-1))...)
        // 更新列表容量
        l.numsCapacity = len(l.nums)
    }
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
    // 列表类简易实现
    pub fn MyList(comptime T: type) type {
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
                std.mem.set(T, self.nums, @as(T, 0));
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
                // 索引 i 以及之后的元素都向后移动一位
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
                std.mem.set(T, extend, @as(T, 0));
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
                std.mem.set(T, nums, @as(T, 0));
                for (nums) |*num, i| {
                    num.* = self.get(i);
                }
                return nums;
            }
        };
    }
    ```
