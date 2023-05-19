# 哈希表

哈希表通过建立「键 key」与「值 value」之间的映射，实现高效的元素查询。具体而言，我们向哈希表输入一个 key，则可以在 $O(1)$ 时间内获取对应的 value 。

以一个包含 $n$ 个学生的数据库为例，每个学生都有“姓名 `name`”和“学号 `id`”两项数据。假如我们希望实现查询功能，例如“输入一个学号，返回对应的姓名”，则可以采用哈希表来实现。

![哈希表的抽象表示](hash_map.assets/hash_map.png)

除哈希表外，我们还可以使用数组或链表实现查询功能，各项操作的时间复杂度如下表所示。

在哈希表中增删查改的时间复杂度都是 $O(1)$ ，全面胜出！因此，哈希表常用于对查找效率要求较高的场景。

<div class="center-table" markdown>

|          | 数组   | 链表   | 哈希表 |
| -------- | ------ | ------ | ------ |
| 查找元素 | $O(n)$ | $O(n)$ | $O(1)$ |
| 插入元素 | $O()$ | $O(1)$ | $O(1)$ |
| 删除元素 | $O(n)$ | $O(n)$ | $O(1)$ |

</div>

## 哈希表常用操作

哈希表的基本操作包括 **初始化、查询操作、添加与删除键值对**。

=== "Java"

    ```java title="hash_map.java"
    /* 初始化哈希表 */
    Map<Integer, String> map = new HashMap<>();
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈");   
    map.put(15937, "小啰");   
    map.put(16750, "小算");   
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    String name = map.get(15937);
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583);
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* 初始化哈希表 */
    unordered_map<int, string> map;
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    string name = map[15937];
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.erase(10583);
    ```

=== "Python"

    ```python title="hash_map.py"
    # 初始化哈希表
    mapp: Dict = {}
    
    # 添加操作
    # 在哈希表中添加键值对 (key, value)
    mapp[12836] = "小哈"
    mapp[15937] = "小啰"
    mapp[16750] = "小算"
    mapp[13276] = "小法"
    mapp[10583] = "小鸭"
    
    # 查询操作
    # 向哈希表输入键 key ，得到值 value
    name: str = mapp[15937]
    
    # 删除操作
    # 在哈希表中删除键值对 (key, value)
    mapp.pop(10583)
    ```

=== "Go"

    ```go title="hash_map.go"
    /* 初始化哈希表 */
    mapp := make(map[int]string)
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    mapp[12836] = "小哈"
    mapp[15937] = "小啰"
    mapp[16750] = "小算"
    mapp[13276] = "小法"
    mapp[10583] = "小鸭"
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    name := mapp[15937]
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    delete(mapp, 10583)
    ```

=== "JavaScript"

    ```javascript title="hash_map.js"
    /* 初始化哈希表 */
    const map = new ArrayHashMap();
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map.get(15937);
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.delete(10583);
    ```

=== "TypeScript"

    ```typescript title="hash_map.ts"
    /* 初始化哈希表 */
    const map = new Map<number, string>();
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');
    console.info('\n添加完成后，哈希表为\nKey -> Value');
    console.info(map);
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map.get(15937);
    console.info('\n输入学号 15937 ，查询到姓名 ' + name);
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.delete(10583);
    console.info('\n删除 10583 后，哈希表为\nKey -> Value');
    console.info(map);
    ```

=== "C"

    ```c title="hash_map.c"
    // C 未提供内置哈希表
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* 初始化哈希表 */
    Dictionary<int, String> map = new ();
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.Add(12836, "小哈");
    map.Add(15937, "小啰");
    map.Add(16750, "小算");
    map.Add(13276, "小法");
    map.Add(10583, "小鸭");
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    String name = map[15937];
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.Remove(10583);
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* 初始化哈希表 */
    var map: [Int: String] = [:]
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map[15937]!
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.removeValue(forKey: 10583)
    ```

=== "Zig"

    ```zig title="hash_map.zig"

    ```

遍历哈希表有三种方式，即 **遍历键值对、遍历键、遍历值**。

=== "Java"

    ```java title="hash_map.java"
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for (Map.Entry <Integer, String> kv: map.entrySet()) {
        System.out.println(kv.getKey() + " -> " + kv.getValue());
    }
    // 单独遍历键 key
    for (int key: map.keySet()) {
        System.out.println(key);
    }
    // 单独遍历值 value
    for (String val: map.values()) {
        System.out.println(val);
    }
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for (auto kv: map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    // 单独遍历键 key
    for (auto key: map) {
        cout << key.first << endl;
    }
    // 单独遍历值 value
    for (auto val: map) {
        cout << val.second << endl;
    }
    ```

=== "Python"

    ```python title="hash_map.py"
    # 遍历哈希表
    # 遍历键值对 key->value
    for key, value in mapp.items():
        print(key, "->", value)
    # 单独遍历键 key
    for key in mapp.keys():
        print(key)
    # 单独遍历值 value
    for value in mapp.values():
        print(value)
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for key, value := range mapp {
        fmt.Println(key, "->", value)
    }
    // 单独遍历键 key
    for key := range mapp {
        fmt.Println(key)
    }
    // 单独遍历值 value
    for _, value := range mapp {
        fmt.Println(value)
    }
    ```

=== "JavaScript"

    ```javascript title="hash_map.js"
    /* 遍历哈希表 */
    console.info('\n遍历键值对 Key->Value');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\n单独遍历键 Key');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n单独遍历值 Value');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "TypeScript"

    ```typescript title="hash_map.ts"
    /* 遍历哈希表 */
    console.info('\n遍历键值对 Key->Value');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\n单独遍历键 Key');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n单独遍历值 Value');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "C"

    ```c title="hash_map.c"
    // C 未提供内置哈希表
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* 遍历哈希表 */
    // 遍历键值对 Key->Value
    foreach (var kv in map)
    {
        Console.WriteLine(kv.Key + " -> " + kv.Value);
    }
    // 单独遍历键 key
    foreach (int key in map.Keys)
    {
        Console.WriteLine(key);
    }
    // 单独遍历值 value
    foreach (String val in map.Values)
    {
        Console.WriteLine(val);
    }
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* 遍历哈希表 */
    // 遍历键值对 Key->Value
    for (key, value) in map {
        print("\(key) -> \(value)")
    }
    // 单独遍历键 Key
    for key in map.keys {
        print(key)
    }
    // 单独遍历值 Value
    for value in map.values {
        print(value)
    }
    ```

=== "Zig"

    ```zig title="hash_map.zig"

    ```

## 哈希函数

哈希表的底层实现为数组，同时可能包含链表、二叉树（红黑树）等数据结构，以提高查询性能（将在下节讨论）。

首先考虑最简单的情况，**仅使用一个数组来实现哈希表**。通常，我们将数组中的每个空位称为「桶 Bucket」，用于存储键值对。

我们将键值对 key, value 封装成一个类 `Entry` ，并将所有 `Entry` 放入数组中。这样，数组中的每个 `Entry` 都具有唯一的索引。为了建立 key 和索引之间的映射关系，我们需要使用「哈希函数 Hash Function」。

设哈希表的数组为 `buckets` ，哈希函数为 `f(x)` ，那么查询操作的步骤如下：

1. 输入 `key` ，通过哈希函数计算出索引 `index` ，即 `index = f(key)` ；
2. 通过索引在数组中访问到键值对 `entry` ，即 `entry = buckets[index]` ，然后从 `entry` 中获取对应的 `value` ；

以学生数据 `key 学号 -> value 姓名` 为例，我们可以设计如下哈希函数：

$$
f(x) = x \bmod {100}
$$

其中 $\bmod$ 表示取余运算。

![哈希函数工作原理](hash_map.assets/hash_function.png)

=== "Java"

    ```java title="array_hash_map.java"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

=== "C++"

    ```cpp title="array_hash_map.cpp"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

=== "Python"

    ```python title="array_hash_map.py"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

=== "Go"

    ```go title="array_hash_map.go"
    [class]{entry}-[func]{}

    [class]{arrayHashMap}-[func]{}
    ```

=== "JavaScript"

    ```javascript title="array_hash_map.js"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

=== "TypeScript"

    ```typescript title="array_hash_map.ts"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

=== "C"

    ```c title="array_hash_map.c"
    [class]{entry}-[func]{}

    [class]{arrayHashMap}-[func]{}
    ```

=== "C#"

    ```csharp title="array_hash_map.cs"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

=== "Swift"

    ```swift title="array_hash_map.swift"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

=== "Zig"

    ```zig title="array_hash_map.zig"
    [class]{Entry}-[func]{}

    [class]{ArrayHashMap}-[func]{}
    ```

## 哈希冲突

细心的你可能已经注意到，**在某些情况下，哈希函数 $f(x) = x \bmod 100$ 可能无法正常工作**。具体来说，当输入的 key 后两位相同时，哈希函数的计算结果也会相同，从而指向同一个 value 。例如，查询学号为 $12836$ 和 $20336$ 的两个学生时，我们得到：

$$
f(12836) = f(20336) = 36
$$

这两个学号指向了同一个姓名，这显然是错误的。我们把这种情况称为「哈希冲突 Hash Collision」。在后续章节中，我们将讨论如何解决哈希冲突的问题。

![哈希冲突示例](hash_map.assets/hash_collision.png)

综上所述，一个优秀的哈希函数应具备以下特性：

- 尽可能减少哈希冲突的发生；
- 查询效率高且稳定，能够在绝大多数情况下达到 $O(1)$ 时间复杂度；
- 较高的空间利用率，即使“键值对占用空间 / 哈希表总占用空间”比例最大化；
