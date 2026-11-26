<!-- [snippet]{tree_array_representation} -->
```python title=""
# 二元樹的陣列表示法
# 用 None 表示空位
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* 二元樹的陣列表示法 */
// 用 int 的最大值 INT_MAX 標示空位
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* 二元樹的陣列表示法 */
// 使用 int 的包裝類別 Integer，即可用 null 標示空位
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* 二元樹的陣列表示法 */
// 使用可為空值的型別 int?，即可用 null 標示空位
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* 二元樹的陣列表示法 */
// 使用元素型別為 any 的切片，即可用 nil 標示空位
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* 二元樹的陣列表示法 */
// 使用可為空值的型別 Int?，即可用 nil 標示空位
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* 二元樹的陣列表示法 */
// 用 null 表示空位
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* 二元樹的陣列表示法 */
// 用 null 表示空位
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* 二元樹的陣列表示法 */
// 使用可為空值的型別 int?，即可用 null 標示空位
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* 二元樹的陣列表示法 */
// 用 None 標示空位
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* 二元樹的陣列表示法 */
// 用 int 的最大值標示空位，因此節點值不能是 INT_MAX
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* 二元樹的陣列表示法 */
// 用 null 表示空位
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### 二元樹的陣列表示法 ###
# 用 nil 表示空位
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
