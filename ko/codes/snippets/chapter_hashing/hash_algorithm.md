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
// Go는 내장 hash code 함수를 제공하지 않는다
```

```swift title="built_in_hash.swift"
[file]{built_in_hash}-[region]{builtin_hash}
```

```javascript title="built_in_hash.js"
// JavaScript는 내장 hash code 함수를 제공하지 않는다
```

```typescript title="built_in_hash.ts"
// TypeScript는 내장 hash code 함수를 제공하지 않는다
```

```dart title="built_in_hash.dart"
[file]{built_in_hash}-[region]{builtin_hash}
```

```rust title="built_in_hash.rs"
[file]{build_in_hash}-[region]{import_hasher}

[file]{build_in_hash}-[region]{builtin_hash}
```

```c title="built_in_hash.c"
// C는 내장 hash code 함수를 제공하지 않는다
```

```kotlin title="built_in_hash.kt"
[file]{built_in_hash}-[region]{builtin_hash}
```

```ruby title="built_in_hash.rb"
[file]{built_in_hash}-[region]{builtin_hash}
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%ED%9B%84%EC%86%8D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%EC%A0%95%EC%88%98%20%7Bnum%7D%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%EC%A0%95%EC%88%98%203%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20%7Bbol%7D%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20True%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%EC%86%8C%EC%88%98%20%7Bdec%7D%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%EC%86%8C%EC%88%98%203.14159%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98%7Bstr%7D%E2%80%99%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98Hello%20%E7%AE%97%E6%B3%95%E2%80%99%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836%2C%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%ED%8A%9C%ED%94%8C%20%7Btup%7D%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%ED%8A%9C%ED%94%8C%20%2812836%2C%20%27%E5%B0%8F%E5%93%88%27%29%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%7Bobj%7D%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%E2%86%92%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
