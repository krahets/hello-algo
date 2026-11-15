<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# 해시 테이블 초기화
hmap: dict = {}

# 추가 연산
# 해시 테이블에 키-값 쌍 (key, value) 추가
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 조회 연산
# 해시 테이블에 키 key를 입력하여 값 value를 얻음
name: str = hmap[15937]

# 삭제 연산
# 해시 테이블에서 키-값 쌍 (key, value) 삭제
hmap.pop(10583)
```

```cpp title="hash_map.cpp"
/* 해시 테이블 초기화 */
unordered_map<int, string> map;

/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
string name = map[15937];

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.erase(10583);
```

```java title="hash_map.java"
/* 해시 테이블 초기화 */
Map<Integer, String> map = new HashMap<>();

/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.put(12836, "小哈");
map.put(15937, "小啰");
map.put(16750, "小算");
map.put(13276, "小法");
map.put(10583, "小鸭");

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
String name = map.get(15937);

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.remove(10583);
```

```csharp title="hash_map.cs"
/* 해시 테이블 초기화 */
Dictionary<int, string> map = new() {
    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    { 12836, "小哈" },
    { 15937, "小啰" },
    { 16750, "小算" },
    { 13276, "小法" },
    { 10583, "小鸭" }
};

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
string name = map[15937];

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.Remove(10583);
```

```go title="hash_map_test.go"
/* 해시 테이블 초기화 */
hmap := make(map[int]string)

/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
name := hmap[15937]

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
delete(hmap, 10583)
```

```swift title="hash_map.swift"
/* 해시 테이블 초기화 */
var map: [Int: String] = [:]

/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
let name = map[15937]!

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* 해시 테이블 초기화 */
const map = new Map();
/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
let name = map.get(15937);

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.delete(10583);
```

```typescript title="hash_map.ts"
/* 해시 테이블 초기화 */
const map = new Map<number, string>();
/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n추가한 뒤의 해시 테이블\nKey -> Value');
console.info(map);

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
let name = map.get(15937);
console.info('\n학번 15937을 입력하여 찾은 이름 ' + name);

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.delete(10583);
console.info('\n10583을 삭제한 뒤의 해시 테이블\nKey -> Value');
console.info(map);
```

```dart title="hash_map.dart"
/* 해시 테이블 초기화 */
Map<int, String> map = {};

/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
String? name = map[15937];

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

/* 해시 테이블 초기화 */
let mut map: HashMap<i32, String> = HashMap::new();

/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.insert(12836, "小哈".to_string());
map.insert(15937, "小啰".to_string());
map.insert(16750, "小算".to_string());
map.insert(13276, "小法".to_string());
map.insert(10583, "小鸭".to_string());

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
let _name: Option<&String> = map.get(&15937);

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
let _removed_value: Option<String> = map.remove(&10583);
```

```c title="hash_map.c"
// C는 내장 해시 테이블을 제공하지 않는다
```

```kotlin title="hash_map.kt"
/* 해시 테이블 초기화 */
val map = HashMap<Int,String>()

/* 추가 연산 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻음
val name = map[15937]

/* 삭제 연산 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.remove(10583)
```

```ruby title="hash_map.rb"
# 해시 테이블 초기화
hmap = {}

# 추가 연산
# 해시 테이블에 키-값 쌍 (key, value) 추가
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# 조회 연산
# 해시 테이블에 키 key를 입력하여 값 value를 얻음
name = hmap[15937]

# 삭제 연산
# 해시 테이블에서 키-값 쌍 (key, value) 삭제
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A1%B0%ED%9A%8C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4%20key%EB%A5%BC%20%EC%9E%85%EB%A0%A5%ED%95%98%EC%97%AC%20%EA%B0%92%20value%EB%A5%BC%20%EC%96%BB%EC%9D%8C%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%82%AD%EC%A0%9C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%EC%84%9C%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# 해시 테이블 순회
# 키-값 쌍 key->value 순회
for key, value in hmap.items():
    print(key, "->", value)
# 키 key만 순회
for key in hmap.keys():
    print(key)
# 값 value만 순회
for value in hmap.values():
    print(value)
```

```cpp title="hash_map.cpp"
/* 해시 테이블 순회 */
// 키-값 쌍 key->value 순회
for (auto kv: map) {
    cout << kv.first << " -> " << kv.second << endl;
}
// 이터레이터로 key->value 순회
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << "->" << iter->second << endl;
}
```

```java title="hash_map.java"
/* 해시 테이블 순회 */
// 키-값 쌍 key->value 순회
for (Map.Entry <Integer, String> kv: map.entrySet()) {
    System.out.println(kv.getKey() + " -> " + kv.getValue());
}
// 키 key만 순회
for (int key: map.keySet()) {
    System.out.println(key);
}
// 값 value만 순회
for (String val: map.values()) {
    System.out.println(val);
}
```

```csharp title="hash_map.cs"
/* 해시 테이블 순회 */
// 키-값 쌍 Key->Value 순회
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}
// 키 key만 순회
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}
// 값 value만 순회
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* 해시 테이블 순회 */
// 키-값 쌍 key->value 순회
for key, value := range hmap {
    fmt.Println(key, "->", value)
}
// 키 key만 순회
for key := range hmap {
    fmt.Println(key)
}
// 값 value만 순회
for _, value := range hmap {
    fmt.Println(value)
}
```

```swift title="hash_map.swift"
/* 해시 테이블 순회 */
// 키-값 쌍 Key->Value 순회
for (key, value) in map {
    print("\(key) -> \(value)")
}
// 키 Key만 순회
for key in map.keys {
    print(key)
}
// 값 Value만 순회
for value in map.values {
    print(value)
}
```

```javascript title="hash_map.js"
/* 해시 테이블 순회 */
console.info('\n키-값 쌍 Key->Value 순회');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\n키 Key만 순회');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n값 Value만 순회');
for (const v of map.values()) {
    console.info(v);
}
```

```typescript title="hash_map.ts"
/* 해시 테이블 순회 */
console.info('\n키-값 쌍 Key->Value 순회');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\n키 Key만 순회');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n값 Value만 순회');
for (const v of map.values()) {
    console.info(v);
}
```

```dart title="hash_map.dart"
/* 해시 테이블 순회 */
// 키-값 쌍 Key->Value 순회
map.forEach((key, value) {
  print('$key -> $value');
});

// 키 Key만 순회
map.keys.forEach((key) {
  print(key);
});

// 값 Value만 순회
map.values.forEach((value) {
  print(value);
});
```

```rust title="hash_map.rs"
/* 해시 테이블 순회 */
// 키-값 쌍 Key->Value 순회
for (key, value) in &map {
    println!("{key} -> {value}");
}

// 키 Key만 순회
for key in map.keys() {
    println!("{key}");
}

// 값 Value만 순회
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// C는 내장 해시 테이블을 제공하지 않는다
```

```kotlin title="hash_map.kt"
/* 해시 테이블 순회 */
// 키-값 쌍 key->value 순회
for ((key, value) in map) {
    println("$key -> $value")
}
// 키 key만 순회
for (key in map.keys) {
    println(key)
}
// 값 value만 순회
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# 해시 테이블 순회
# 키-값 쌍 key->value 순회
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# 키 key만 순회
hmap.keys.each { |key| puts key }

# 값 value만 순회
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%23%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20key-%3Evalue%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%2C%20%22-%3E%22%2C%20value%29%0A%20%20%20%20%23%20%ED%82%A4%20key%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%EA%B0%92%20value%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20value%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28value%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
