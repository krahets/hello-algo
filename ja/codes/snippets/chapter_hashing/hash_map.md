<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# ハッシュテーブルを初期化
hmap: dict = {}

# 追加操作
# ハッシュテーブルにペア (key, value) を追加
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 照会操作
# キー key を入力して値 value を取得
name: str = hmap[15937]

# 削除操作
# ハッシュテーブルからペア (key, value) を削除
hmap.pop(10583)
```

```cpp title="hash_map.cpp"
/* ハッシュテーブルを初期化 */
unordered_map<int, string> map;

/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* 照会操作 */
// キー key を入力して値 value を取得
string name = map[15937];

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.erase(10583);
```

```java title="hash_map.java"
/* ハッシュテーブルを初期化 */
Map<Integer, String> map = new HashMap<>();

/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map.put(12836, "小哈");
map.put(15937, "小啰");
map.put(16750, "小算");
map.put(13276, "小法");
map.put(10583, "小鸭");

/* 照会操作 */
// キー key を入力して値 value を取得
String name = map.get(15937);

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.remove(10583);
```

```csharp title="hash_map.cs"
/* ハッシュテーブルを初期化 */
Dictionary<int, string> map = new() {
    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    { 12836, "小哈" },
    { 15937, "小啰" },
    { 16750, "小算" },
    { 13276, "小法" },
    { 10583, "小鸭" }
};

/* 照会操作 */
// キー key を入力して値 value を取得
string name = map[15937];

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.Remove(10583);
```

```go title="hash_map_test.go"
/* ハッシュテーブルを初期化 */
hmap := make(map[int]string)

/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

/* 照会操作 */
// キー key を入力して値 value を取得
name := hmap[15937]

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
delete(hmap, 10583)
```

```swift title="hash_map.swift"
/* ハッシュテーブルを初期化 */
var map: [Int: String] = [:]

/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* 照会操作 */
// キー key を入力して値 value を取得
let name = map[15937]!

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* ハッシュテーブルを初期化 */
const map = new Map();
/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');

/* 照会操作 */
// キー key を入力して値 value を取得
let name = map.get(15937);

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.delete(10583);
```

```typescript title="hash_map.ts"
/* ハッシュテーブルを初期化 */
const map = new Map<number, string>();
/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n追加後のハッシュテーブルは\nKey -> Value');
console.info(map);

/* 照会操作 */
// キー key を入力して値 value を取得
let name = map.get(15937);
console.info('\n学籍番号 15937 を入力して得た名前は ' + name);

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.delete(10583);
console.info('\n10583 を削除した後のハッシュテーブルは\nKey -> Value');
console.info(map);
```

```dart title="hash_map.dart"
/* ハッシュテーブルを初期化 */
Map<int, String> map = {};

/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* 照会操作 */
// キー key を入力して値 value を取得
String? name = map[15937];

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

/* ハッシュテーブルを初期化 */
let mut map: HashMap<i32, String> = HashMap::new();

/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map.insert(12836, "小哈".to_string());
map.insert(15937, "小啰".to_string());
map.insert(16750, "小算".to_string());
map.insert(13276, "小法".to_string());
map.insert(10583, "小鸭".to_string());

/* 照会操作 */
// キー key を入力して値 value を取得
let _name: Option<&String> = map.get(&15937);

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
let _removed_value: Option<String> = map.remove(&10583);
```

```c title="hash_map.c"
// C には組み込みのハッシュテーブルがない
```

```kotlin title="hash_map.kt"
/* ハッシュテーブルを初期化 */
val map = HashMap<Int,String>()

/* 追加操作 */
// ハッシュテーブルにペア (key, value) を追加
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* 照会操作 */
// キー key を入力して値 value を取得
val name = map[15937]

/* 削除操作 */
// ハッシュテーブルからペア (key, value) を削除
map.remove(10583)
```

```ruby title="hash_map.rb"
# ハッシュテーブルを初期化
hmap = {}

# 追加操作
# ハッシュテーブルにペア (key, value) を追加
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 照会操作
# キー key を入力して値 value を取得
name = hmap[15937]

# 削除操作
# ハッシュテーブルからペア (key, value) を削除
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E7%85%A7%E4%BC%9A%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%20key%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%A6%E5%80%A4%20value%20%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%89%8A%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%8B%E3%82%89%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20hmap.pop(10583)&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# ハッシュテーブルを走査
# キーと値のペアを走査 key->value
for key, value in hmap.items():
    print(key, "->", value)
# キーだけを走査 key
for key in hmap.keys():
    print(key)
# 値だけを走査 value
for value in hmap.values():
    print(value)
```

```cpp title="hash_map.cpp"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 key->value
for (auto kv: map) {
    cout << kv.first << " -> " << kv.second << endl;
}
// イテレータで走査 key->value
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << "->" << iter->second << endl;
}
```

```java title="hash_map.java"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 key->value
for (Map.Entry <Integer, String> kv: map.entrySet()) {
    System.out.println(kv.getKey() + " -> " + kv.getValue());
}
// キーだけを走査 key
for (int key: map.keySet()) {
    System.out.println(key);
}
// 値だけを走査 value
for (String val: map.values()) {
    System.out.println(val);
}
```

```csharp title="hash_map.cs"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 Key->Value
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}
// キーだけを走査 key
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}
// 値だけを走査 value
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 key->value
for key, value := range hmap {
    fmt.Println(key, "->", value)
}
// キーだけを走査 key
for key := range hmap {
    fmt.Println(key)
}
// 値だけを走査 value
for _, value := range hmap {
    fmt.Println(value)
}
```

```swift title="hash_map.swift"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 Key->Value
for (key, value) in map {
    print("\(key) -> \(value)")
}
// キーだけを走査 Key
for key in map.keys {
    print(key)
}
// 値だけを走査 Value
for value in map.values {
    print(value)
}
```

```javascript title="hash_map.js"
/* ハッシュテーブルを走査 */
console.info('\nキーと値のペアを走査 Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nキーだけを走査 Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n値だけを走査 Value');
for (const v of map.values()) {
    console.info(v);
}
```

```typescript title="hash_map.ts"
/* ハッシュテーブルを走査 */
console.info('\nキーと値のペアを走査 Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nキーだけを走査 Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n値だけを走査 Value');
for (const v of map.values()) {
    console.info(v);
}
```

```dart title="hash_map.dart"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 Key->Value
map.forEach((key, value) {
  print('$key -> $value');
});

// キーだけを走査 Key
map.keys.forEach((key) {
  print(key);
});

// 値だけを走査 Value
map.values.forEach((value) {
  print(value);
});
```

```rust title="hash_map.rs"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 Key->Value
for (key, value) in &map {
    println!("{key} -> {value}");
}

// キーだけを走査 Key
for key in map.keys() {
    println!("{key}");
}

// 値だけを走査 Value
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// C には組み込みのハッシュテーブルがない
```

```kotlin title="hash_map.kt"
/* ハッシュテーブルを走査 */
// キーと値のペアを走査 key->value
for ((key, value) in map) {
    println("$key -> $value")
}
// キーだけを走査 key
for (key in map.keys) {
    println(key)
}
// 値だけを走査 value
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# ハッシュテーブルを走査
# キーと値のペアを走査 key->value
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# キーだけを走査 key
hmap.keys.each { |key| puts key }

# 値だけを走査 value
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E3%83%9A%E3%82%A2%E3%82%92%E8%B5%B0%E6%9F%BB%20key-%3Evalue%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items()%3A%0A%20%20%20%20%20%20%20%20print(key%2C%20%22-%3E%22%2C%20value)%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%E3%81%A0%E3%81%91%E3%82%92%E8%B5%B0%E6%9F%BB%20key%0A%20%20%20%20for%20key%20in%20hmap.keys()%3A%0A%20%20%20%20%20%20%20%20print(key)%0A%20%20%20%20%23%20%E5%80%A4%E3%81%A0%E3%81%91%E3%82%92%E8%B5%B0%E6%9F%BB%20value%0A%20%20%20%20for%20value%20in%20hmap.values()%3A%0A%20%20%20%20%20%20%20%20print(value)&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
