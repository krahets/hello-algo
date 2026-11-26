<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# Initialize the hash table
hmap = dict[int, str]()

# Insert a key-value pair
# Insert the pair (key, value) into the hash table
hmap[12836] = "Xiao Ha"
hmap[15937] = "Xiao Luo"
hmap[16750] = "Xiao Suan"
hmap[13276] = "Xiao Fa"
hmap[10583] = "Xiao Ya"

# Look up a value
# Look up key in the hash table to get value
name: str = hmap[15937]

# Remove a key-value pair
# Remove the pair (key, value) from the hash table
hmap.pop(10583)
```

```cpp title="hash_map.cpp"
/* Initialize the hash table */
unordered_map<int, string> map;

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map[12836] = "Xiao Ha";
map[15937] = "Xiao Luo";
map[16750] = "Xiao Suan";
map[13276] = "Xiao Fa";
map[10583] = "Xiao Ya";

/* Look up a value */
// Look up key in the hash table to get value
string name = map[15937];

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.erase(10583);
```

```java title="hash_map.java"
/* Initialize the hash table */
Map<Integer, String> map = new HashMap<>();

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map.put(12836, "Xiao Ha");
map.put(15937, "Xiao Luo");
map.put(16750, "Xiao Suan");
map.put(13276, "Xiao Fa");
map.put(10583, "Xiao Ya");

/* Look up a value */
// Look up key in the hash table to get value
String name = map.get(15937);

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.remove(10583);
```

```csharp title="hash_map.cs"
/* Initialize the hash table */
Dictionary<int, string> map = new() {
    /* Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    { 12836, "Xiao Ha" },
    { 15937, "Xiao Luo" },
    { 16750, "Xiao Suan" },
    { 13276, "Xiao Fa" },
    { 10583, "Xiao Ya" }
};

/* Look up a value */
// Look up key in the hash table to get value
string name = map[15937];

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.Remove(10583);
```

```go title="hash_map_test.go"
/* Initialize the hash table */
hmap := make(map[int]string)

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
hmap[12836] = "Xiao Ha"
hmap[15937] = "Xiao Luo"
hmap[16750] = "Xiao Suan"
hmap[13276] = "Xiao Fa"
hmap[10583] = "Xiao Ya"

/* Look up a value */
// Look up key in the hash table to get value
name := hmap[15937]

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
delete(hmap, 10583)
```

```swift title="hash_map.swift"
/* Initialize the hash table */
var map: [Int: String] = [:]

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map[12836] = "Xiao Ha"
map[15937] = "Xiao Luo"
map[16750] = "Xiao Suan"
map[13276] = "Xiao Fa"
map[10583] = "Xiao Ya"

/* Look up a value */
// Look up key in the hash table to get value
let name = map[15937]!

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* Initialize the hash table */
const map = new Map();

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map.set(12836, 'Xiao Ha');
map.set(15937, 'Xiao Luo');
map.set(16750, 'Xiao Suan');
map.set(13276, 'Xiao Fa');
map.set(10583, 'Xiao Ya');

/* Look up a value */
// Look up key in the hash table to get value
let name = map.get(15937);

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.delete(10583);
```

```typescript title="hash_map.ts"
/* Initialize the hash table */
const map = new Map<number, string>();

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map.set(12836, 'Xiao Ha');
map.set(15937, 'Xiao Luo');
map.set(16750, 'Xiao Suan');
map.set(13276, 'Xiao Fa');
map.set(10583, 'Xiao Ya');

/* Look up a value */
// Look up key in the hash table to get value
let name = map.get(15937);

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.delete(10583);
```

```dart title="hash_map.dart"
/* Initialize the hash table */
final Map<int, String> map = {};

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map[12836] = "Xiao Ha";
map[15937] = "Xiao Luo";
map[16750] = "Xiao Suan";
map[13276] = "Xiao Fa";
map[10583] = "Xiao Ya";

/* Look up a value */
// Look up key in the hash table to get value
final String? name = map[15937];

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

// Initialize the hash table
let mut map = HashMap::new();

// Insert a key-value pair
// Insert the pair (key, value) into the hash table
map.insert(12836, "Xiao Ha");
map.insert(15937, "Xiao Luo");
map.insert(16750, "Xiao Suan");
map.insert(13276, "Xiao Fa");
map.insert(10583, "Xiao Ya");

// Look up a value
// Look up key in the hash table to get value
let name = map.get(&15937).copied().unwrap();

// Remove a key-value pair
// Remove the pair (key, value) from the hash table
_ = map.remove(&10583);
```

```c title="hash_map.c"
// C does not provide a built-in hash table
```

```kotlin title="hash_map.kt"
/* Initialize the hash table */
val map = HashMap<Int, String>()

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map[12836] = "Xiao Ha"
map[15937] = "Xiao Luo"
map[16750] = "Xiao Suan"
map[13276] = "Xiao Fa"
map[10583] = "Xiao Ya"

/* Look up a value */
// Look up key in the hash table to get value
val name = map[15937]

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.remove(10583)
```

```ruby title="hash_map.rb"
# Initialize the hash table
hmap = {}

# Insert a key-value pair
# Insert the pair (key, value) into the hash table
hmap[12836] = "Xiao Ha"
hmap[15937] = "Xiao Luo"
hmap[16750] = "Xiao Suan"
hmap[13276] = "Xiao Fa"
hmap[10583] = "Xiao Ya"

# Look up a value
# Look up key in the hash table to get value
name = hmap[15937]

# Remove a key-value pair
# Remove the pair (key, value) from the hash table
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20hash%20table%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20Insertion%0A%20%20%20%20%23%20Add%20%28key,%20value%29%20pairs%20to%20the%20hash%20table%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22Xiao%20Ha%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22Xiao%20Luo%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22Xiao%20Suan%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22Xiao%20Fa%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22Xiao%20Ya%22%0A%20%20%20%20%0A%20%20%20%20%23%20Lookup%0A%20%20%20%20%23%20Use%20key%20to%20look%20up%20the%20corresponding%20value%20in%20the%20hash%20table%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Deletion%0A%20%20%20%20%23%20Remove%20a%20%28key,%20value%29%20pair%20from%20the%20hash%20table%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# Iterate over the hash table
# Iterate over key-value pairs (key->value)
for key, value in hmap.items():
    print(key, "->", value)

# Iterate over keys only
for key in hmap.keys():
    print(key)

# Iterate over values only
for val in hmap.values():
    print(val)
```

```cpp title="hash_map.cpp"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
for (auto kv : map) {
    cout << kv.first << " -> " << kv.second << endl;
}

// Iterate over key-value pairs with an iterator (key->value)
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << " -> " << iter->second << endl;
}
```

```java title="hash_map.java"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
for (Map.Entry<Integer, String> kv : map.entrySet()) {
    System.out.println(kv.getKey() + " -> " + kv.getValue());
}

// Iterate over keys only
for (int key : map.keySet()) {
    System.out.println(key);
}

// Iterate over values only
for (String val : map.values()) {
    System.out.println(val);
}
```

```csharp title="hash_map.cs"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}

// Iterate over keys only
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}

// Iterate over values only
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
for key, value := range hmap {
    fmt.Println(key, "->", value)
}

// Iterate over keys only
for key := range hmap {
    fmt.Println(key)
}

// Iterate over values only
for _, value := range hmap {
    fmt.Println(value)
}
```

```swift title="hash_map.swift"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
for (key, value) in map {
    print("\(key) -> \(value)")
}

// Iterate over keys only
for key in map.keys {
    print(key)
}

// Iterate over values only
for value in map.values {
    print(value)
}
```

```javascript title="hash_map.js"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// Iterate over keys only
for (const k of map.keys()) {
    console.info(k);
}

// Iterate over values only
for (const v of map.values()) {
    console.info(v);
}
```

```typescript title="hash_map.ts"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// Iterate over keys only
for (const k of map.keys()) {
    console.info(k);
}

// Iterate over values only
for (const v of map.values()) {
    console.info(v);
}
```

```dart title="hash_map.dart"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
map.forEach((key, value) => print("$key -> $value"));

// Iterate over keys only
map.keys.forEach((key) => print(key));

// Iterate over values only
map.values.forEach((value) => print(value));
```

```rust title="hash_map.rs"
// Iterate over the hash table
// Iterate over key-value pairs (key->value)
for (key, value) in &map {
    println!("{key} -> {value}");
}

// Iterate over keys only
for key in map.keys() {
    println!("{key}");
}

// Iterate over values only
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// C does not provide a built-in hash table
```

```kotlin title="hash_map.kt"
/* Iterate over the hash table */
// Iterate over key-value pairs (key->value)
for ((key, value) in map) {
    println("$key -> $value")
}

// Iterate over keys only
for (key in map.keys) {
    println(key)
}

// Iterate over values only
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# Iterate over the hash table
# Iterate over key-value pairs (key->value)
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# Iterate over keys only
hmap.keys.each { |key| puts key }

# Iterate over values only
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20hash%20table%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20Insertion%0A%20%20%20%20%23%20Add%20%28key,%20value%29%20pairs%20to%20the%20hash%20table%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22Xiao%20Ha%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22Xiao%20Luo%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22Xiao%20Suan%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22Xiao%20Fa%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22Xiao%20Ya%22%0A%20%20%20%20%0A%20%20%20%20%23%20Iterate%20over%20the%20hash%20table%0A%20%20%20%20%23%20Iterate%20over%20key-%3Evalue%20pairs%0A%20%20%20%20for%20key,%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key,%20%22-%3E%22,%20value%29%0A%20%20%20%20%23%20Iterate%20over%20the%20keys%20only%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20Iterate%20over%20the%20values%20only%0A%20%20%20%20for%20val%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28val%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
