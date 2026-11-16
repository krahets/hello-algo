<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
[file]{built_in_hash}-[region]{builtin_hash}
```

```cpp title="built_in_hash.cpp"
[file]{built_in_hash}-[region]{builtin_hash}
```

```java title="built_in_hash.java"
[file]{built_in_hash}-[region]{builtin_hash}
```

```csharp title="built_in_hash.cs"
[file]{built_in_hash}-[region]{builtin_hash}
```

```go title="built_in_hash.go"
// Go 未提供内置 hash code 函数
```

```swift title="built_in_hash.swift"
[file]{built_in_hash}-[region]{builtin_hash}
```

```javascript title="built_in_hash.js"
// JavaScript 未提供内置 hash code 函数
```

```typescript title="built_in_hash.ts"
// TypeScript 未提供内置 hash code 函数
```

```dart title="built_in_hash.dart"
[file]{built_in_hash}-[region]{builtin_hash}
```

```rust title="built_in_hash.rs"
[file]{build_in_hash}-[region]{import_hasher}

[file]{build_in_hash}-[region]{builtin_hash}
```

```c title="built_in_hash.c"
// C 未提供内置 hash code 函数
```

```kotlin title="built_in_hash.kt"
[file]{built_in_hash}-[region]{builtin_hash}
```

```ruby title="built_in_hash.rb"
[file]{built_in_hash}-[region]{builtin_hash}
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%E6%95%B4%E6%95%B0%20%7Bnum%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%E5%B8%83%E5%B0%94%E9%87%8F%20%7Bbol%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%E5%B8%83%E5%B0%94%E9%87%8F%20True%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%E5%B0%8F%E6%95%B0%20%7Bdec%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9C%7Bstr%7D%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%BB%84%20%7Btup%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%E5%85%83%E7%BB%84%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%20%7Bobj%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
