<!-- [snippet]{tree_array_representation} -->
```python title=""
# 二叉树的数组表示
# 使用 None 来表示空位
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* 二叉树的数组表示 */
// 使用 int 最大值 INT_MAX 标记空位
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* 二叉树的数组表示 */
// 使用 int 的包装类 Integer ，就可以使用 null 来标记空位
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* 二叉树的数组表示 */
// 使用 int? 可空类型 ，就可以使用 null 来标记空位
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* 二叉树的数组表示 */
// 使用 any 类型的切片, 就可以使用 nil 来标记空位
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* 二叉树的数组表示 */
// 使用 Int? 可空类型 ，就可以使用 nil 来标记空位
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* 二叉树的数组表示 */
// 使用 null 来表示空位
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* 二叉树的数组表示 */
// 使用 null 来表示空位
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* 二叉树的数组表示 */
// 使用 int? 可空类型 ，就可以使用 null 来标记空位
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* 二叉树的数组表示 */
// 使用 None 来标记空位
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* 二叉树的数组表示 */
// 使用 int 最大值标记空位，因此要求节点值不能为 INT_MAX
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* 二叉树的数组表示 */
// 使用 null 来表示空位
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### 二叉树的数组表示 ###
# 使用 nil 来表示空位
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
