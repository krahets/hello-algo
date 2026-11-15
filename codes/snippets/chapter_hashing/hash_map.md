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
// C 未提供内置哈希表
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%90%91%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E8%BE%93%E5%85%A5%E9%94%AE%20key%20%EF%BC%8C%E5%BE%97%E5%88%B0%E5%80%BC%20value%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E5%88%A0%E9%99%A4%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
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
// C 未提供内置哈希表
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E9%94%AE%E5%80%BC%E5%AF%B9%20key-%3Evalue%0A%20%20%20%20for%20key,%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key,%20%22-%3E%22,%20value%29%0A%20%20%20%20%23%20%E5%8D%95%E7%8B%AC%E9%81%8D%E5%8E%86%E9%94%AE%20key%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%E5%8D%95%E7%8B%AC%E9%81%8D%E5%8E%86%E5%80%BC%20value%0A%20%20%20%20for%20value%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28value%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
