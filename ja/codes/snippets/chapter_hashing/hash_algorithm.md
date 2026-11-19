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
// Go には組み込みの hash code 関数がない
```

```swift title="built_in_hash.swift"
[file]{built_in_hash}-[region]{builtin_hash}
```

```javascript title="built_in_hash.js"
// JavaScript には組み込みの hash code 関数がない
```

```typescript title="built_in_hash.ts"
// TypeScript には組み込みの hash code 関数がない
```

```dart title="built_in_hash.dart"
[file]{built_in_hash}-[region]{builtin_hash}
```

```rust title="built_in_hash.rs"
[file]{build_in_hash}-[region]{import_hasher}

[file]{build_in_hash}-[region]{builtin_hash}
```

```c title="built_in_hash.c"
// C には組み込みの hash code 関数がない
```

```kotlin title="built_in_hash.kt"
[file]{built_in_hash}-[region]{builtin_hash}
```

```ruby title="built_in_hash.rb"
[file]{built_in_hash}-[region]{builtin_hash}
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash(num)%0A%20%20%20%20print(f%22%E6%95%B4%E6%95%B0%20%7Bnum%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_num%7D%22)%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash(bol)%0A%20%20%20%20print(f%22%E7%9C%9F%E5%81%BD%E5%80%A4%20%7Bbol%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_bol%7D%22)%0A%20%20%20%20%23%20%E7%9C%9F%E5%81%BD%E5%80%A4%20True%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash(dec)%0A%20%20%20%20print(f%22%E5%B0%8F%E6%95%B0%20%7Bdec%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_dec%7D%22)%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash(str)%0A%20%20%20%20print(f%22%E6%96%87%E5%AD%97%E5%88%97%E3%80%8C%7Bstr%7D%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_str%7D%22)%0A%20%20%20%20%23%20%E6%96%87%E5%AD%97%E5%88%97%E3%80%8CHello%20%E7%AE%97%E6%B3%95%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20(12836%2C%20%22%E5%B0%8F%E5%93%88%22)%0A%20%20%20%20hash_tup%20%3D%20hash(tup)%0A%20%20%20%20print(f%22%E3%82%BF%E3%83%97%E3%83%AB%20%7Btup%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_tup%7D%22)%0A%20%20%20%20%23%20%E3%82%BF%E3%83%97%E3%83%AB%20(12836%2C%20'%E5%B0%8F%E5%93%88')%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode(0)%0A%20%20%20%20hash_obj%20%3D%20hash(obj)%0A%20%20%20%20print(f%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%7Bobj%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_obj%7D%22)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
