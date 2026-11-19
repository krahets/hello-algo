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
// C には組み込みのハッシュテーブルがない
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
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E7%85%A7%E4%BC%9A%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%20key%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%A6%E5%80%A4%20value%20%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%89%8A%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%8B%E3%82%89%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20hmap.pop(10583)&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C には組み込みのハッシュテーブルがない
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
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E3%83%9A%E3%82%A2%E3%82%92%E8%B5%B0%E6%9F%BB%20key-%3Evalue%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items()%3A%0A%20%20%20%20%20%20%20%20print(key%2C%20%22-%3E%22%2C%20value)%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%E3%81%A0%E3%81%91%E3%82%92%E8%B5%B0%E6%9F%BB%20key%0A%20%20%20%20for%20key%20in%20hmap.keys()%3A%0A%20%20%20%20%20%20%20%20print(key)%0A%20%20%20%20%23%20%E5%80%A4%E3%81%A0%E3%81%91%E3%82%92%E8%B5%B0%E6%9F%BB%20value%0A%20%20%20%20for%20val%20in%20hmap.values()%3A%0A%20%20%20%20%20%20%20%20print(val)&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
