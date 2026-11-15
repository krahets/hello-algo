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
// C는 내장 해시 테이블을 제공하지 않는다
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
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A1%B0%ED%9A%8C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4%20key%EB%A5%BC%20%EC%9E%85%EB%A0%A5%ED%95%98%EC%97%AC%20%EA%B0%92%20value%EB%A5%BC%20%EC%96%BB%EC%9D%8C%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%82%AD%EC%A0%9C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%EC%84%9C%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{hash_map_traversal} -->
```python title="hash_map.py"
[file]{hash_map}-[region]{iterate_pairs}

[file]{hash_map}-[region]{iterate_keys}

[file]{hash_map}-[region]{iterate_values}
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
// C는 내장 해시 테이블을 제공하지 않는다
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
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%23%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20key-%3Evalue%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%2C%20%22-%3E%22%2C%20value%29%0A%20%20%20%20%23%20%ED%82%A4%20key%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%EA%B0%92%20value%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20value%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28value%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
