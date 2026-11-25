<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# ハッシュ表を初期化する
hmap = dict[int, str]()

# 追加
# ハッシュ表にペア (key, value) を追加する
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 検索
# ハッシュ表でキー key に対応する値 value を取得する
name: str = hmap[15937]

# 削除
# ハッシュ表からペア (key, value) を削除する
hmap.pop(10583)
```

```cpp title="hash_map.cpp"
/* ハッシュ表を初期化する */
unordered_map<int, string> map;

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
string name = map[15937];

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.erase(10583);
```

```java title="hash_map.java"
/* ハッシュ表を初期化する */
Map<Integer, String> map = new HashMap<>();

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map.put(12836, "小哈");
map.put(15937, "小啰");
map.put(16750, "小算");
map.put(13276, "小法");
map.put(10583, "小鸭");

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
String name = map.get(15937);

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.remove(10583);
```

```csharp title="hash_map.cs"
/* ハッシュ表を初期化する */
Dictionary<int, string> map = new() {
    /* 追加 */
    // ハッシュ表にペア (key, value) を追加する
    { 12836, "小哈" },
    { 15937, "小啰" },
    { 16750, "小算" },
    { 13276, "小法" },
    { 10583, "小鸭" }
};

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
string name = map[15937];

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.Remove(10583);
```

```go title="hash_map_test.go"
/* ハッシュ表を初期化する */
hmap := make(map[int]string)

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
name := hmap[15937]

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
delete(hmap, 10583)
```

```swift title="hash_map.swift"
/* ハッシュ表を初期化する */
var map: [Int: String] = [:]

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
let name = map[15937]!

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* ハッシュ表を初期化する */
const map = new Map();

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
let name = map.get(15937);

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.delete(10583);
```

```typescript title="hash_map.ts"
/* ハッシュ表を初期化する */
const map = new Map<number, string>();

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
let name = map.get(15937);

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.delete(10583);
```

```dart title="hash_map.dart"
/* ハッシュ表を初期化する */
final Map<int, String> map = {};

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
final String? name = map[15937];

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

// ハッシュ表を初期化する
let mut map = HashMap::new();

// 追加
// ハッシュ表にペア (key, value) を追加する
map.insert(12836, "小哈");
map.insert(15937, "小啰");
map.insert(16750, "小算");
map.insert(13276, "小法");
map.insert(10583, "小鸭");

// 検索
// ハッシュ表でキー key に対応する値 value を取得する
let name = map.get(&15937).copied().unwrap();

// 削除
// ハッシュ表からペア (key, value) を削除する
_ = map.remove(&10583);
```

```c title="hash_map.c"
// C には組み込みのハッシュ表がない
```

```kotlin title="hash_map.kt"
/* ハッシュ表を初期化する */
val map = HashMap<Int, String>()

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
val name = map[15937]

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.remove(10583)
```

```ruby title="hash_map.rb"
# ハッシュ表を初期化する
hmap = {}

# 追加
# ハッシュ表にペア (key, value) を追加する
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 検索
# ハッシュ表でキー key に対応する値 value を取得する
name = hmap[15937]

# 削除
# ハッシュ表からペア (key, value) を削除する
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E7%B5%84%20%28key,%20value%29%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%8F%E3%83%BC%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%AB%E3%82%AA%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%82%B9%E3%82%A2%E3%83%B3%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%95%E3%82%A1%E3%83%BC%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%A4%E3%83%BC%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%A4%9C%E7%B4%A2%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%20key%20%E3%82%92%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%A6%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%8B%E3%82%89%E5%80%A4%20value%20%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%89%8A%E9%99%A4%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%8B%E3%82%89%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E7%B5%84%20%28key,%20value%29%20%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# ハッシュ表を走査する
# キーと値のペアを順に表示 key->value
for key, value in hmap.items():
    print(key, "->", value)

# キーだけを順に表示 key
for key in hmap.keys():
    print(key)

# 値だけを順に表示 value
for val in hmap.values():
    print(val)
```

```cpp title="hash_map.cpp"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
for (auto kv : map) {
    cout << kv.first << " -> " << kv.second << endl;
}

// イテレータでペアを順に表示 key->value
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << " -> " << iter->second << endl;
}
```

```java title="hash_map.java"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
for (Map.Entry<Integer, String> kv : map.entrySet()) {
    System.out.println(kv.getKey() + " -> " + kv.getValue());
}

// キーだけを順に表示 key
for (int key : map.keySet()) {
    System.out.println(key);
}

// 値だけを順に表示 value
for (String val : map.values()) {
    System.out.println(val);
}
```

```csharp title="hash_map.cs"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}

// キーだけを順に表示 key
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}

// 値だけを順に表示 value
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
for key, value := range hmap {
    fmt.Println(key, "->", value)
}

// キーだけを順に表示 key
for key := range hmap {
    fmt.Println(key)
}

// 値だけを順に表示 value
for _, value := range hmap {
    fmt.Println(value)
}
```

```swift title="hash_map.swift"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
for (key, value) in map {
    print("\(key) -> \(value)")
}

// キーだけを順に表示 key
for key in map.keys {
    print(key)
}

// 値だけを順に表示 value
for value in map.values {
    print(value)
}
```

```javascript title="hash_map.js"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// キーだけを順に表示 key
for (const k of map.keys()) {
    console.info(k);
}

// 値だけを順に表示 value
for (const v of map.values()) {
    console.info(v);
}
```

```typescript title="hash_map.ts"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// キーだけを順に表示 key
for (const k of map.keys()) {
    console.info(k);
}

// 値だけを順に表示 value
for (const v of map.values()) {
    console.info(v);
}
```

```dart title="hash_map.dart"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
map.forEach((key, value) => print("$key -> $value"));

// キーだけを順に表示 key
map.keys.forEach((key) => print(key));

// 値だけを順に表示 value
map.values.forEach((value) => print(value));
```

```rust title="hash_map.rs"
// ハッシュ表を走査する
// キーと値のペアを順に表示 key->value
for (key, value) in &map {
    println!("{key} -> {value}");
}

// キーだけを順に表示 key
for key in map.keys() {
    println!("{key}");
}

// 値だけを順に表示 value
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// C には組み込みのハッシュ表がない
```

```kotlin title="hash_map.kt"
/* ハッシュ表を走査する */
// キーと値のペアを順に表示 key->value
for ((key, value) in map) {
    println("$key -> $value")
}

// キーだけを順に表示 key
for (key in map.keys) {
    println(key)
}

// 値だけを順に表示 value
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# ハッシュ表を走査する
# キーと値のペアを順に表示 key->value
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# キーだけを順に表示 key
hmap.keys.each { |key| puts key }

# 値だけを順に表示 value
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E7%B5%84%20%28key,%20value%29%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%8F%E3%83%BC%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%AB%E3%82%AA%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%82%B9%E3%82%A2%E3%83%B3%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%95%E3%82%A1%E3%83%BC%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E3%82%B7%E3%83%A3%E3%82%AA%E3%83%A4%E3%83%BC%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E9%A0%86%E3%81%AB%E3%81%9F%E3%81%A9%E3%82%8B%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E7%B5%84%20key-%3Evalue%20%E3%82%92%E9%A0%86%E3%81%AB%E3%81%9F%E3%81%A9%E3%82%8B%0A%20%20%20%20for%20key,%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key,%20%22-%3E%22,%20value%29%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%20key%20%E3%81%A0%E3%81%91%E3%82%92%E9%A0%86%E3%81%AB%E3%81%9F%E3%81%A9%E3%82%8B%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%E5%80%A4%20value%20%E3%81%A0%E3%81%91%E3%82%92%E9%A0%86%E3%81%AB%E3%81%9F%E3%81%A9%E3%82%8B%0A%20%20%20%20for%20val%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28val%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
