<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# Initialize the hash table
hmap = dict[int, str]()

# Insert operation
# Insert the key-value pair (key, value) into the hash table
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# Lookup operation
# Look up key in the hash table to obtain value
name: str = hmap[15937]

# Remove operation
# Remove the key-value pair (key, value) from the hash table
hmap.pop(10583)
```

```cpp title="hash_map.cpp"
/* Initialize the hash table */
unordered_map<int, string> map;

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* Lookup operation */
// Look up key in the hash table to obtain value
string name = map[15937];

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.erase(10583);
```

```java title="hash_map.java"
/* Initialize the hash table */
Map<Integer, String> map = new HashMap<>();

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map.put(12836, "小哈");
map.put(15937, "小啰");
map.put(16750, "小算");
map.put(13276, "小法");
map.put(10583, "小鸭");

/* Lookup operation */
// Look up key in the hash table to obtain value
String name = map.get(15937);

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.remove(10583);
```

```csharp title="hash_map.cs"
/* Initialize the hash table */
Dictionary<int, string> map = new() {
    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    { 12836, "小哈" },
    { 15937, "小啰" },
    { 16750, "小算" },
    { 13276, "小法" },
    { 10583, "小鸭" }
};

/* Lookup operation */
// Look up key in the hash table to obtain value
string name = map[15937];

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.Remove(10583);
```

```go title="hash_map_test.go"
/* Initialize the hash table */
hmap := make(map[int]string)

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

/* Lookup operation */
// Look up key in the hash table to obtain value
name := hmap[15937]

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
delete(hmap, 10583)
```

```swift title="hash_map.swift"
/* Initialize the hash table */
var map: [Int: String] = [:]

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* Lookup operation */
// Look up key in the hash table to obtain value
let name = map[15937]!

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* Initialize the hash table */
const map = new Map();

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');

/* Lookup operation */
// Look up key in the hash table to obtain value
let name = map.get(15937);

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.delete(10583);
```

```typescript title="hash_map.ts"
/* Initialize the hash table */
const map = new Map<number, string>();

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');

/* Lookup operation */
// Look up key in the hash table to obtain value
let name = map.get(15937);

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.delete(10583);
```

```dart title="hash_map.dart"
/* Initialize the hash table */
final Map<int, String> map = {};

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map[12836] = "小哈";
map[15937] = "小啰";
map[16750] = "小算";
map[13276] = "小法";
map[10583] = "小鸭";

/* Lookup operation */
// Look up key in the hash table to obtain value
final String? name = map[15937];

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

// Initialize the hash table
let mut map = HashMap::new();

// Insert operation
// Insert the key-value pair (key, value) into the hash table
map.insert(12836, "小哈");
map.insert(15937, "小啰");
map.insert(16750, "小算");
map.insert(13276, "小法");
map.insert(10583, "小鸭");

// Lookup operation
// Look up key in the hash table to obtain value
let name = map.get(&15937).copied().unwrap();

// Remove operation
// Remove the key-value pair (key, value) from the hash table
_ = map.remove(&10583);
```

```c title="hash_map.c"
// C provides no built-in hash table
```

```kotlin title="hash_map.kt"
/* Initialize the hash table */
val map = HashMap<Int, String>()

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

/* Lookup operation */
// Look up key in the hash table to obtain value
val name = map[15937]

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.remove(10583)
```

```ruby title="hash_map.rb"
# Initialize the hash table
hmap = {}

# Insert operation
# Insert the key-value pair (key, value) into the hash table
hmap[12836] = "小哈"
hmap[15937] = "小啰"
hmap[16750] = "小算"
hmap[13276] = "小法"
hmap[10583] = "小鸭"

# Lookup operation
# Look up key in the hash table to obtain value
name = hmap[15937]

# Remove operation
# Remove the key-value pair (key, value) from the hash table
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20hash%20table%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20Insertion%0A%20%20%20%20%23%20Add%20key-value%20pairs%20%28key%2C%20value%29%20to%20the%20hash%20table%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20Lookup%0A%20%20%20%20%23%20Look%20up%20key%20in%20the%20hash%20table%20to%20obtain%20value%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Deletion%0A%20%20%20%20%23%20Remove%20a%20key-value%20pair%20%28key%2C%20value%29%20from%20the%20hash%20table%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# Traverse the hash table
# Traverse key-value pairs: key->value
for key, value in hmap.items():
    print(key, "->", value)

# Traverse keys only: key
for key in hmap.keys():
    print(key)

# Traverse values only: value
for val in hmap.values():
    print(val)
```

```cpp title="hash_map.cpp"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
for (auto kv : map) {
    cout << kv.first << " -> " << kv.second << endl;
}

// Traverse key->value using an iterator
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << " -> " << iter->second << endl;
}
```

```java title="hash_map.java"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
for (Map.Entry<Integer, String> kv : map.entrySet()) {
    System.out.println(kv.getKey() + " -> " + kv.getValue());
}

// Traverse keys only: key
for (int key : map.keySet()) {
    System.out.println(key);
}

// Traverse values only: value
for (String val : map.values()) {
    System.out.println(val);
}
```

```csharp title="hash_map.cs"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}

// Traverse keys only: key
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}

// Traverse values only: value
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
for key, value := range hmap {
    fmt.Println(key, "->", value)
}

// Traverse keys only: key
for key := range hmap {
    fmt.Println(key)
}

// Traverse values only: value
for _, value := range hmap {
    fmt.Println(value)
}
```

```swift title="hash_map.swift"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
for (key, value) in map {
    print("\(key) -> \(value)")
}

// Traverse keys only: key
for key in map.keys {
    print(key)
}

// Traverse values only: value
for value in map.values {
    print(value)
}
```

```javascript title="hash_map.js"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// Traverse keys only: key
for (const k of map.keys()) {
    console.info(k);
}

// Traverse values only: value
for (const v of map.values()) {
    console.info(v);
}
```

```typescript title="hash_map.ts"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// Traverse keys only: key
for (const k of map.keys()) {
    console.info(k);
}

// Traverse values only: value
for (const v of map.values()) {
    console.info(v);
}
```

```dart title="hash_map.dart"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
map.forEach((key, value) => print("$key -> $value"));

// Traverse keys only: key
map.keys.forEach((key) => print(key));

// Traverse values only: value
map.values.forEach((value) => print(value));
```

```rust title="hash_map.rs"
// Traverse the hash table
// Traverse key-value pairs: key->value
for (key, value) in &map {
    println!("{key} -> {value}");
}

// Traverse keys only: key
for key in map.keys() {
    println!("{key}");
}

// Traverse values only: value
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// C provides no built-in hash table
```

```kotlin title="hash_map.kt"
/* Traverse the hash table */
// Traverse key-value pairs: key->value
for ((key, value) in map) {
    println("$key -> $value")
}

// Traverse keys only: key
for (key in map.keys) {
    println(key)
}

// Traverse values only: value
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# Traverse the hash table
# Traverse key-value pairs: key->value
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# Traverse keys only: key
hmap.keys.each { |key| puts key }

# Traverse values only: value
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20hash%20table%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20Insertion%0A%20%20%20%20%23%20Add%20key-value%20pairs%20%28key%2C%20value%29%20to%20the%20hash%20table%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20Traverse%20the%20hash%20table%0A%20%20%20%20%23%20Traverse%20key-value%20pairs%3A%20key-%3Evalue%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%2C%20%22-%3E%22%2C%20value%29%0A%20%20%20%20%23%20Traverse%20keys%20only%3A%20key%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20Traverse%20values%20only%3A%20value%0A%20%20%20%20for%20val%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28val%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
