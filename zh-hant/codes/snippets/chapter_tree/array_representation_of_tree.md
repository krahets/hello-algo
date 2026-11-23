<!-- [snippet]{tree_array_representation} -->
```python title=""
# 二元樹的陣列表示
# 使用 None 來表示空位
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* 二元樹的陣列表示 */
// 使用 int 最大值 INT_MAX 標記空位
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* 二元樹的陣列表示 */
// 使用 int 的包裝類別 Integer ，就可以使用 null 來標記空位
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* 二元樹的陣列表示 */
// 使用 int? 可空型別 ，就可以使用 null 來標記空位
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* 二元樹的陣列表示 */
// 使用 any 型別的切片, 就可以使用 nil 來標記空位
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* 二元樹的陣列表示 */
// 使用 Int? 可空型別 ，就可以使用 nil 來標記空位
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* 二元樹的陣列表示 */
// 使用 null 來表示空位
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* 二元樹的陣列表示 */
// 使用 null 來表示空位
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* 二元樹的陣列表示 */
// 使用 int? 可空型別 ，就可以使用 null 來標記空位
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* 二元樹的陣列表示 */
// 使用 None 來標記空位
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* 二元樹的陣列表示 */
// 使用 int 最大值標記空位，因此要求節點值不能為 INT_MAX
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* 二元樹的陣列表示 */
// 使用 null 來表示空位
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### 二元樹的陣列表示 ###
# 使用 nil 來表示空位
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
