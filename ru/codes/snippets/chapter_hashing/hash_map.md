<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
# Инициализация хеш-таблицы
hmap = dict[int, str]()

# Операция добавления
# Добавить пару (key, value) в хеш-таблицу
hmap[12836] = "Сяо Ха"
hmap[15937] = "Сяо Ло"
hmap[16750] = "Сяо Суань"
hmap[13276] = "Сяо Фа"
hmap[10583] = "Сяо Я"

# Операция поиска
# Передать ключ key в хеш-таблицу и получить значение value
name: str = hmap[15937]

# Операция удаления
# Удалить пару (key, value) из хеш-таблицы
hmap.pop(10583)
```

```cpp title="hash_map.cpp"
/* Инициализация хеш-таблицы */
unordered_map<int, string> map;

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map[12836] = "Сяо Ха";
map[15937] = "Сяо Ло";
map[16750] = "Сяо Суань";
map[13276] = "Сяо Фа";
map[10583] = "Сяо Я";

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
string name = map[15937];

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.erase(10583);
```

```java title="hash_map.java"
/* Инициализация хеш-таблицы */
Map<Integer, String> map = new HashMap<>();

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map.put(12836, "Сяо Ха");
map.put(15937, "Сяо Ло");
map.put(16750, "Сяо Суань");
map.put(13276, "Сяо Фа");
map.put(10583, "Сяо Я");

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
String name = map.get(15937);

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.remove(10583);
```

```csharp title="hash_map.cs"
/* Инициализация хеш-таблицы */
Dictionary<int, string> map = new() {
    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    { 12836, "Сяо Ха" },
    { 15937, "Сяо Ло" },
    { 16750, "Сяо Суань" },
    { 13276, "Сяо Фа" },
    { 10583, "Сяо Я" }
};

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
string name = map[15937];

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.Remove(10583);
```

```go title="hash_map_test.go"
/* Инициализация хеш-таблицы */
hmap := make(map[int]string)

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
hmap[12836] = "Сяо Ха"
hmap[15937] = "Сяо Ло"
hmap[16750] = "Сяо Суань"
hmap[13276] = "Сяо Фа"
hmap[10583] = "Сяо Я"

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
name := hmap[15937]

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
delete(hmap, 10583)
```

```swift title="hash_map.swift"
/* Инициализация хеш-таблицы */
var map: [Int: String] = [:]

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map[12836] = "Сяо Ха"
map[15937] = "Сяо Ло"
map[16750] = "Сяо Суань"
map[13276] = "Сяо Фа"
map[10583] = "Сяо Я"

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
let name = map[15937]!

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.removeValue(forKey: 10583)
```

```javascript title="hash_map.js"
/* Инициализация хеш-таблицы */
const map = new Map();

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Сяо Я');

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
let name = map.get(15937);

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.delete(10583);
```

```typescript title="hash_map.ts"
/* Инициализация хеш-таблицы */
const map = new Map<number, string>();

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Сяо Я');

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
let name = map.get(15937);

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.delete(10583);
```

```dart title="hash_map.dart"
/* Инициализация хеш-таблицы */
final Map<int, String> map = {};

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map[12836] = "Сяо Ха";
map[15937] = "Сяо Ло";
map[16750] = "Сяо Суань";
map[13276] = "Сяо Фа";
map[10583] = "Сяо Я";

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
final String? name = map[15937];

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.remove(10583);
```

```rust title="hash_map.rs"
use std::collections::HashMap;

// Инициализация хеш-таблицы
let mut map = HashMap::new();

// Операция добавления
// Добавить пару (key, value) в хеш-таблицу
map.insert(12836, "Сяо Ха");
map.insert(15937, "Сяо Ло");
map.insert(16750, "Сяо Суань");
map.insert(13276, "Сяо Фа");
map.insert(10583, "Сяо Я");

// Операция поиска
// Передать ключ key в хеш-таблицу и получить значение value
let name = map.get(&15937).copied().unwrap();

// Операция удаления
// Удалить пару (key, value) из хеш-таблицы
_ = map.remove(&10583);
```

```c title="hash_map.c"
// В C нет встроенной хеш-таблицы
```

```kotlin title="hash_map.kt"
/* Инициализация хеш-таблицы */
val map = HashMap<Int, String>()

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map[12836] = "Сяо Ха"
map[15937] = "Сяо Ло"
map[16750] = "Сяо Суань"
map[13276] = "Сяо Фа"
map[10583] = "Сяо Я"

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
val name = map[15937]

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.remove(10583)
```

```ruby title="hash_map.rb"
# Инициализация хеш-таблицы
hmap = {}

# Операция добавления
# Добавить пару (key, value) в хеш-таблицу
hmap[12836] = "Сяо Ха"
hmap[15937] = "Сяо Ло"
hmap[16750] = "Сяо Суань"
hmap[13276] = "Сяо Фа"
hmap[10583] = "Сяо Я"

# Операция поиска
# Передать ключ key в хеш-таблицу и получить значение value
name = hmap[15937]

# Операция удаления
# Удалить пару (key, value) из хеш-таблицы
hmap.delete(10583)
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%BF%D0%B0%D1%80%D1%83%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%28key%2C%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%9B%D0%BE%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A1%D1%83%D0%B0%D0%BD%D1%8C%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A4%D0%B0%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%D0%A3%D1%82%D0%B5%D0%BD%D0%BE%D0%BA%22%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BA%D0%BB%D1%8E%D1%87%20key%20%D0%B2%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%B8%20%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20value%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%B7%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20%D0%BF%D0%B0%D1%80%D1%83%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%28key%2C%20value%29%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
# Обход хеш-таблицы
# Обход пар ключ-значение key->value
for key, value in hmap.items():
    print(key, "->", value)

# Обход только ключей key
for key in hmap.keys():
    print(key)

# Обход только значений value
for val in hmap.values():
    print(val)
```

```cpp title="hash_map.cpp"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for (auto kv : map) {
    cout << kv.first << " -> " << kv.second << endl;
}

// Обход key->value с помощью итератора
for (auto iter = map.begin(); iter != map.end(); iter++) {
    cout << iter->first << " -> " << iter->second << endl;
}
```

```java title="hash_map.java"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for (Map.Entry<Integer, String> kv : map.entrySet()) {
    System.out.println(kv.getKey() + " -> " + kv.getValue());
}

// Обход только ключей key
for (int key : map.keySet()) {
    System.out.println(key);
}

// Обход только значений value
for (String val : map.values()) {
    System.out.println(val);
}
```

```csharp title="hash_map.cs"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
foreach (var kv in map) {
    Console.WriteLine(kv.Key + " -> " + kv.Value);
}

// Обход только ключей key
foreach (int key in map.Keys) {
    Console.WriteLine(key);
}

// Обход только значений value
foreach (string val in map.Values) {
    Console.WriteLine(val);
}
```

```go title="hash_map_test.go"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for key, value := range hmap {
    fmt.Println(key, "->", value)
}

// Обход только ключей key
for key := range hmap {
    fmt.Println(key)
}

// Обход только значений value
for _, value := range hmap {
    fmt.Println(value)
}
```

```swift title="hash_map.swift"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for (key, value) in map {
    print("\(key) -> \(value)")
}

// Обход только ключей key
for key in map.keys {
    print(key)
}

// Обход только значений value
for value in map.values {
    print(value)
}
```

```javascript title="hash_map.js"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// Обход только ключей key
for (const k of map.keys()) {
    console.info(k);
}

// Обход только значений value
for (const v of map.values()) {
    console.info(v);
}
```

```typescript title="hash_map.ts"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}

// Обход только ключей key
for (const k of map.keys()) {
    console.info(k);
}

// Обход только значений value
for (const v of map.values()) {
    console.info(v);
}
```

```dart title="hash_map.dart"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
map.forEach((key, value) => print("$key -> $value"));

// Обход только ключей key
map.keys.forEach((key) => print(key));

// Обход только значений value
map.values.forEach((value) => print(value));
```

```rust title="hash_map.rs"
// Обход хеш-таблицы
// Обход пар ключ-значение key->value
for (key, value) in &map {
    println!("{key} -> {value}");
}

// Обход только ключей key
for key in map.keys() {
    println!("{key}");
}

// Обход только значений value
for value in map.values() {
    println!("{value}");
}
```

```c title="hash_map.c"
// В C нет встроенной хеш-таблицы
```

```kotlin title="hash_map.kt"
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for ((key, value) in map) {
    println("$key -> $value")
}

// Обход только ключей key
for (key in map.keys) {
    println(key)
}

// Обход только значений value
for (_val in map.values) {
    println(_val)
}
```

```ruby title="hash_map.rb"
# Обход хеш-таблицы
# Обход пар ключ-значение key->value
hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

# Обход только ключей key
hmap.keys.each { |key| puts key }

# Обход только значений value
hmap.values.each { |val| puts val }
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%BF%D0%B0%D1%80%D1%83%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%28key%2C%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%9B%D0%BE%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A1%D1%83%D0%B0%D0%BD%D1%8C%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A4%D0%B0%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%D0%A3%D1%82%D0%B5%D0%BD%D0%BE%D0%BA%22%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%0A%20%20%20%20%23%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%D0%BF%D0%B0%D1%80%D0%B0%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20key-%3Evalue%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%2C%20%22-%3E%22%2C%20value%29%0A%20%20%20%20%23%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%D0%BA%D0%BB%D1%8E%D1%87%20key%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20value%0A%20%20%20%20for%20val%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28val%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
