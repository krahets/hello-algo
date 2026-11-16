<!-- [snippet]{hash_map_operations} -->
```python title="hash_map.py"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```cpp title="hash_map.cpp"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```java title="hash_map.java"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```csharp title="hash_map.cs"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```go title="hash_map_test.go"
[file]{hash_map_test}-[region]{init_hash_map}

[file]{hash_map_test}-[region]{add_pairs}

[file]{hash_map_test}-[region]{get_value}

[file]{hash_map_test}-[region]{remove_pair}
```

```swift title="hash_map.swift"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```javascript title="hash_map.js"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```typescript title="hash_map.ts"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```dart title="hash_map.dart"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```rust title="hash_map.rs"
[file]{hash_map}-[region]{import_hash_map}

[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```c title="hash_map.c"
// В C нет встроенной хеш-таблицы
```

```kotlin title="hash_map.kt"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

```ruby title="hash_map.rb"
[file]{hash_map}-[region]{init_hash_map}

[file]{hash_map}-[region]{add_pairs}

[file]{hash_map}-[region]{get_value}

[file]{hash_map}-[region]{remove_pair}
```

<!-- [tutor]{hash_map_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%BF%D0%B0%D1%80%D1%83%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%28key%2C%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%9B%D0%BE%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A1%D1%83%D0%B0%D0%BD%D1%8C%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A4%D0%B0%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%D0%A3%D1%82%D0%B5%D0%BD%D0%BE%D0%BA%22%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BA%D0%BB%D1%8E%D1%87%20key%20%D0%B2%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%B8%20%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20value%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%B7%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20%D0%BF%D0%B0%D1%80%D1%83%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%28key%2C%20value%29%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```cpp title="hash_map.cpp"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_pairs_iterator}
```

```java title="hash_map.java"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```csharp title="hash_map.cs"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```go title="hash_map_test.go"
[file]{hash_map_test}-[region]{iterate_pairs}

[file]{hash_map_test}-[region]{iterate_keys}

[file]{hash_map_test}-[region]{iterate_values}
```

```swift title="hash_map.swift"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```javascript title="hash_map.js"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```typescript title="hash_map.ts"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```dart title="hash_map.dart"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```rust title="hash_map.rs"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```c title="hash_map.c"
// В C нет встроенной хеш-таблицы
```

```kotlin title="hash_map.kt"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

```ruby title="hash_map.rb"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
```

<!-- [tutor]{hash_map_traversal_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%BF%D0%B0%D1%80%D1%83%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%28key%2C%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%9B%D0%BE%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A1%D1%83%D0%B0%D0%BD%D1%8C%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%D0%A1%D1%8F%D0%BE%20%D0%A4%D0%B0%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%D0%A3%D1%82%D0%B5%D0%BD%D0%BE%D0%BA%22%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%0A%20%20%20%20%23%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%D0%BF%D0%B0%D1%80%D0%B0%20%D0%BA%D0%BB%D1%8E%D1%87-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20key-%3Evalue%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%2C%20%22-%3E%22%2C%20value%29%0A%20%20%20%20%23%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%D0%BA%D0%BB%D1%8E%D1%87%20key%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20value%0A%20%20%20%20for%20val%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28val%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
