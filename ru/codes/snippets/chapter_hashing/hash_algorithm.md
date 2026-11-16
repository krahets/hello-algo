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
// В Go нет встроенной функции hash code
```

```swift title="built_in_hash.swift"
[file]{built_in_hash}-[region]{builtin_hash}
```

```javascript title="built_in_hash.js"
// В JavaScript нет встроенной функции hash code
```

```typescript title="built_in_hash.ts"
// В TypeScript нет встроенной функции hash code
```

```dart title="built_in_hash.dart"
[file]{built_in_hash}-[region]{builtin_hash}
```

```rust title="built_in_hash.rs"
[file]{build_in_hash}-[region]{import_hasher}

[file]{build_in_hash}-[region]{builtin_hash}
```

```c title="built_in_hash.c"
// В C нет встроенной функции hash code
```

```kotlin title="built_in_hash.kt"
[file]{built_in_hash}-[region]{builtin_hash}
```

```ruby title="built_in_hash.rb"
[file]{built_in_hash}-[region]{builtin_hash}
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D1%83%D0%B7%D0%B5%D0%BB%D0%BA%D0%BB%D0%B0%D1%81%D1%81%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bnum%7D%20%3D%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203%20%3D%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D1%83%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%7Bbol%7D%20%3D%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D1%83%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20True%20%3D%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%B5%D1%81%D1%8F%D1%82%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bdec%7D%20%3D%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%B5%D1%81%D1%8F%D1%82%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203.14159%20%3D%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20Algo%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%AB%7Bstr%7D%C2%BB%20%3D%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%ABHello%20Algo%C2%BB%20%3D%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836%2C%20%22%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%7Btup%7D%20%3D%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%2812836%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%27%29%20%3D%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%7Bobj%7D%20%3D%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%3D%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
