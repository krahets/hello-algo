<!-- [snippet]{tree_array_representation} -->
```python title=""
# 二分木の配列表現
# 空きを None で表す
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* 二分木の配列表現 */
// 空きを int の最大値 INT_MAX で表す
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* 二分木の配列表現 */
// int のラッパークラス Integer を使えば、空きを null で表せる
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* 二分木の配列表現 */
// null 許容型 int? を使えば、空きを null で表せる
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* 二分木の配列表現 */
// 要素型が any のスライスを使えば、空きを nil で表せる
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* 二分木の配列表現 */
// nil を許容する Int? 型を使えば、空きを nil で表せる
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* 二分木の配列表現 */
// 空きを null で表す
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* 二分木の配列表現 */
// 空きを null で表す
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* 二分木の配列表現 */
// null 許容型 int? を使えば、空きを null で表せる
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* 二分木の配列表現 */
// 空きを None で表す
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* 二分木の配列表現 */
// 空きを int の最大値で表すので、ノードの値には INT_MAX を使えない
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* 二分木の配列表現 */
// 空きを null で表す
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### 二分木の配列表現 ###
# 空きを nil で表す
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
