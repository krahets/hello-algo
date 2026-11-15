<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# 初始化哈希表
hmap: dict = {}

# 添加操作
# 在哈希表中添加键值对 (key, value)
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 查询操作
# 向哈希表中输入键 key ，得到值 value
name: str = hmap[15937]

# 删除操作
# 在哈希表中删除键值对 (key, value)
hmap.pop(10583)
```

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
// 向哈希表中输入键 key ，得到值 value
string name = map[15937];

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.erase(10583);
```

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
// 向哈希表中输入键 key ，得到值 value
String name = map.get(15937);

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.remove(10583);
```

```csharp title="hash_map.cs"
/* 初始化哈希表 */
Dictionary<int, string> map = new() {
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    { 12836, "小哈" },
    { 15937, "小啰" },
    { 16750, "小算" },
    { 13276, "小法" },
    { 10583, "小鸭" }
};

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
string name = map[15937];

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.Remove(10583);
```

```go title="hash_map_test.go"
/* 初始化哈希表 */
hmap := make(map[int]string)

/* 添加操作 */
// 在哈希表中添加键值对 (key, value)
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
name := hmap[15937]

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
delete(hmap, 10583)
```

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
// 向哈希表中输入键 key ，得到值 value
let name = map[15937]!

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* 初始化哈希表 */
const map = new Map();
/* 添加操作 */
// 在哈希表中添加键值对 (key, value)
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
let name = map.get(15937);

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.delete(10583);
```

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
// 向哈希表中输入键 key ，得到值 value
let name = map.get(15937);
console.info('\n输入学号 15937 ，查询到姓名 ' + name);

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.delete(10583);
console.info('\n删除 10583 后，哈希表为\nKey -> Value');
console.info(map);
```

```dart title="hash_map.dart"
/* 初始化哈希表 */
Map<int, String> map = {};

/* 添加操作 */
// 在哈希表中添加键值对 (key, value)
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
String? name = map[15937];

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

/* 初始化哈希表 */
let mut map: HashMap<i32, String> = HashMap::new();

/* 添加操作 */
// 在哈希表中添加键值对 (key, value)
map.insert(12836, "小哈".to_string());
map.insert(15937, "小啰".to_string());
map.insert(16750, "小算".to_string());
map.insert(13276, "小法".to_string());
map.insert(10583, "小鸭".to_string());

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
let _name: Option<&String> = map.get(&15937);

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
let _removed_value: Option<String> = map.remove(&10583);
```

```c title="hash_map.c"
// C 未提供内置哈希表
```

```kotlin title="hash_map.kt"
/* 初始化哈希表 */
val map = HashMap<Int,String>()

/* 添加操作 */
// 在哈希表中添加键值对 (key, value)
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
val name = map[15937]

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.remove(10583)
```

```ruby title="hash_map.rb"
# 初始化哈希表
hmap = {}

# 添加操作
# 在哈希表中添加键值对 (key, value)
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 查询操作
# 向哈希表中输入键 key ，得到值 value
name = hmap[15937]

# 删除操作
# 在哈希表中删除键值对 (key, value)
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%90%91%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E8%BE%93%E5%85%A5%E9%94%AE%20key%20%EF%BC%8C%E5%BE%97%E5%88%B0%E5%80%BC%20value%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E5%88%A0%E9%99%A4%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# 遍历哈希表
# 遍历键值对 key->value
for key, value in hmap.items():
    print(key, "->", value)
# 单独遍历键 key
for key in hmap.keys():
    print(key)
# 单独遍历值 value
for value in hmap.values():
    print(value)
```

```cpp title="hash_map.cpp"
/* 遍历哈希表 */
// 遍历键值对 key->value
for (auto kv: map) {
    cout << kv.first << " -> " << kv.second << endl;
}
// 使用迭代器遍历 key->value
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << "->" << iter->second << endl;
}
```

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

```csharp title="hash_map.cs"
/* 遍历哈希表 */
// 遍历键值对 Key->Value
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}
// 单独遍历键 key
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}
// 单独遍历值 value
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* 遍历哈希表 */
// 遍历键值对 key->value
for key, value := range hmap {
    fmt.Println(key, "->", value)
}
// 单独遍历键 key
for key := range hmap {
    fmt.Println(key)
}
// 单独遍历值 value
for _, value := range hmap {
    fmt.Println(value)
}
```

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

```dart title="hash_map.dart"
/* 遍历哈希表 */
// 遍历键值对 Key->Value
map.forEach((key, value) {
  print('$key -> $value');
});

// 单独遍历键 Key
map.keys.forEach((key) {
  print(key);
});

// 单独遍历值 Value
map.values.forEach((value) {
  print(value);
});
```

```rust title="hash_map.rs"
/* 遍历哈希表 */
// 遍历键值对 Key->Value
for (key, value) in &map {
    println!("{key} -> {value}");
}

// 单独遍历键 Key
for key in map.keys() {
    println!("{key}");
}

// 单独遍历值 Value
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// C 未提供内置哈希表
```

```kotlin title="hash_map.kt"
/* 遍历哈希表 */
// 遍历键值对 key->value
for ((key, value) in map) {
    println("$key -> $value")
}
// 单独遍历键 key
for (key in map.keys) {
    println(key)
}
// 单独遍历值 value
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# 遍历哈希表
# 遍历键值对 key->value
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# 单独遍历键 key
hmap.keys.each { |key| puts key }

# 单独遍历值 value
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E9%94%AE%E5%80%BC%E5%AF%B9%20key-%3Evalue%0A%20%20%20%20for%20key,%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key,%20%22-%3E%22,%20value%29%0A%20%20%20%20%23%20%E5%8D%95%E7%8B%AC%E9%81%8D%E5%8E%86%E9%94%AE%20key%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%E5%8D%95%E7%8B%AC%E9%81%8D%E5%8E%86%E5%80%BC%20value%0A%20%20%20%20for%20value%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28value%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
