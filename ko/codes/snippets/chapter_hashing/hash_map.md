<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# 해시 테이블 초기화
hmap = dict[int, str]()

# 추가
# 해시 테이블에 키-값 쌍 (key, value) 추가
hmap[12836] = "샤오하"
hmap[15937] = "샤오뤄"
hmap[16750] = "샤오쑤안"
hmap[13276] = "샤오파"
hmap[10583] = "샤오야"

# 조회
# 해시 테이블에 키 key를 입력하여 값 value 조회
name: str = hmap[15937]

# 삭제
# 해시 테이블에서 키-값 쌍 (key, value) 삭제
hmap.pop(10583)
```

```cpp title="hash_map.cpp"
/* 해시 테이블 초기화 */
unordered_map<int, string> map;

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "샤오하";
map[15937] = "샤오뤄";
map[16750] = "샤오쑤안";
map[13276] = "샤오파";
map[10583] = "샤오야";

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
string name = map[15937];

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.erase(10583);
```

```java title="hash_map.java"
/* 해시 테이블 초기화 */
Map<Integer, String> map = new HashMap<>();

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.put(12836, "샤오하");
map.put(15937, "샤오뤄");
map.put(16750, "샤오쑤안");
map.put(13276, "샤오파");
map.put(10583, "샤오야");

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
String name = map.get(15937);

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.remove(10583);
```

```csharp title="hash_map.cs"
/* 해시 테이블 초기화 */
Dictionary<int, string> map = new() {
    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    { 12836, "샤오하" },
    { 15937, "샤오뤄" },
    { 16750, "샤오쑤안" },
    { 13276, "샤오파" },
    { 10583, "샤오야" }
};

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
string name = map[15937];

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.Remove(10583);
```

```go title="hash_map_test.go"
/* 해시 테이블 초기화 */
hmap := make(map[int]string)

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
hmap[12836] = "샤오하"
hmap[15937] = "샤오뤄"
hmap[16750] = "샤오쑤안"
hmap[13276] = "샤오파"
hmap[10583] = "샤오야"

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
name := hmap[15937]

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
delete(hmap, 10583)
```

```swift title="hash_map.swift"
/* 해시 테이블 초기화 */
var map: [Int: String] = [:]

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "샤오하"
map[15937] = "샤오뤄"
map[16750] = "샤오쑤안"
map[13276] = "샤오파"
map[10583] = "샤오야"

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
let name = map[15937]!

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* 해시 테이블 초기화 */
const map = new Map();

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.set(12836, '샤오하');
map.set(15937, '샤오뤄');
map.set(16750, '샤오쑤안');
map.set(13276, '샤오파');
map.set(10583, '샤오야');

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
let name = map.get(15937);

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.delete(10583);
```

```typescript title="hash_map.ts"
/* 해시 테이블 초기화 */
const map = new Map<number, string>();

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.set(12836, '샤오하');
map.set(15937, '샤오뤄');
map.set(16750, '샤오쑤안');
map.set(13276, '샤오파');
map.set(10583, '샤오야');

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
let name = map.get(15937);

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.delete(10583);
```

```dart title="hash_map.dart"
/* 해시 테이블 초기화 */
final Map<int, String> map = {};

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "샤오하";
map[15937] = "샤오뤄";
map[16750] = "샤오쑤안";
map[13276] = "샤오파";
map[10583] = "샤오야";

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
final String? name = map[15937];

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

// 해시 테이블 초기화
let mut map = HashMap::new();

// 추가
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.insert(12836, "샤오하");
map.insert(15937, "샤오뤄");
map.insert(16750, "샤오쑤안");
map.insert(13276, "샤오파");
map.insert(10583, "샤오야");

// 조회
// 해시 테이블에 키 key를 입력하여 값 value 조회
let name = map.get(&15937).copied().unwrap();

// 삭제
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
_ = map.remove(&10583);
```

```c title="hash_map.c"
// C는 내장 해시 테이블을 제공하지 않는다
```

```kotlin title="hash_map.kt"
/* 해시 테이블 초기화 */
val map = HashMap<Int, String>()

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "샤오하"
map[15937] = "샤오뤄"
map[16750] = "샤오쑤안"
map[13276] = "샤오파"
map[10583] = "샤오야"

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
val name = map[15937]

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.remove(10583)
```

```ruby title="hash_map.rb"
# 해시 테이블 초기화
hmap = {}

# 추가
# 해시 테이블에 키-값 쌍 (key, value) 추가
hmap[12836] = "샤오하"
hmap[15937] = "샤오뤄"
hmap[16750] = "샤오쑤안"
hmap[13276] = "샤오파"
hmap[10583] = "샤오야"

# 조회
# 해시 테이블에 키 key를 입력하여 값 value 조회
name = hmap[15937]

# 삭제
# 해시 테이블에서 키-값 쌍 (key, value) 삭제
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key,%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%EC%83%A4%EC%98%A4%ED%95%98%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%EC%83%A4%EC%98%A4%EB%A4%84%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%EC%83%A4%EC%98%A4%EC%8F%B8%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%EC%83%A4%EC%98%A4%ED%8C%8C%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%EC%83%A4%EC%98%A4%EC%95%BC%22%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A1%B0%ED%9A%8C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%EC%84%9C%20%ED%82%A4%20key%EB%A1%9C%20%EA%B0%92%20value%EB%A5%BC%20%EC%A1%B0%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%82%AD%EC%A0%9C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%EC%84%9C%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key,%20value%29%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# 해시 테이블 순회
# 키-값 쌍 순회 key->value
for key, value in hmap.items():
    print(key, "->", value)

# 키만 순회 key
for key in hmap.keys():
    print(key)

# 값만 순회 value
for val in hmap.values():
    print(val)
```

```cpp title="hash_map.cpp"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
for (auto kv : map) {
    cout << kv.first << " -> " << kv.second << endl;
}

// 반복자로 키-값 쌍 순회 key->value
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << " -> " << iter->second << endl;
}
```

```java title="hash_map.java"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
for (Map.Entry<Integer, String> kv : map.entrySet()) {
    System.out.println(kv.getKey() + " -> " + kv.getValue());
}

// 키만 순회 key
for (int key : map.keySet()) {
    System.out.println(key);
}

// 값만 순회 value
for (String val : map.values()) {
    System.out.println(val);
}
```

```csharp title="hash_map.cs"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}

// 키만 순회 key
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}

// 값만 순회 value
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
for key, value := range hmap {
    fmt.Println(key, "->", value)
}

// 키만 순회 key
for key := range hmap {
    fmt.Println(key)
}

// 값만 순회 value
for _, value := range hmap {
    fmt.Println(value)
}
```

```swift title="hash_map.swift"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
for (key, value) in map {
    print("\(key) -> \(value)")
}

// 키만 순회 key
for key in map.keys {
    print(key)
}

// 값만 순회 value
for value in map.values {
    print(value)
}
```

```javascript title="hash_map.js"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// 키만 순회 key
for (const k of map.keys()) {
    console.info(k);
}

// 값만 순회 value
for (const v of map.values()) {
    console.info(v);
}
```

```typescript title="hash_map.ts"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// 키만 순회 key
for (const k of map.keys()) {
    console.info(k);
}

// 값만 순회 value
for (const v of map.values()) {
    console.info(v);
}
```

```dart title="hash_map.dart"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
map.forEach((key, value) => print("$key -> $value"));

// 키만 순회 key
map.keys.forEach((key) => print(key));

// 값만 순회 value
map.values.forEach((value) => print(value));
```

```rust title="hash_map.rs"
// 해시 테이블 순회
// 키-값 쌍 순회 key->value
for (key, value) in &map {
    println!("{key} -> {value}");
}

// 키만 순회 key
for key in map.keys() {
    println!("{key}");
}

// 값만 순회 value
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// C는 내장 해시 테이블을 제공하지 않는다
```

```kotlin title="hash_map.kt"
/* 해시 테이블 순회 */
// 키-값 쌍 순회 key->value
for ((key, value) in map) {
    println("$key -> $value")
}

// 키만 순회 key
for (key in map.keys) {
    println(key)
}

// 값만 순회 value
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# 해시 테이블 순회
# 키-값 쌍 순회 key->value
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# 키만 순회 key
hmap.keys.each { |key| puts key }

# 값만 순회 value
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key,%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%EC%83%A4%EC%98%A4%ED%95%98%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%EC%83%A4%EC%98%A4%EB%A4%84%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%EC%83%A4%EC%98%A4%EC%8F%B8%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%EC%83%A4%EC%98%A4%ED%8C%8C%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%EC%83%A4%EC%98%A4%EC%95%BC%22%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%23%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%28key-%3Evalue%29%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key,%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key,%20%22-%3E%22,%20value%29%0A%20%20%20%20%23%20%ED%82%A4%28key%29%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%EA%B0%92%28value%29%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20val%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28val%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
