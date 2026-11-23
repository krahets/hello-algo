<!-- [snippet]{tree_array_representation} -->
```python title=""
# 二分木の配列表現
# None で空の位置を表す
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* 二分木の配列表現 */
// int の最大値 INT_MAX で空の位置を示す
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* 二分木の配列表現 */
// int のラッパークラス Integer を使うと、null で空の位置を示せる
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* 二分木の配列表現 */
// null 許容型 int? を使うと、null で空の位置を示せる
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* 二分木の配列表現 */
// any 型のスライスを使うと、nil で空の位置を示せる
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* 二分木の配列表現 */
// オプショナル型 Int? を使うと、nil で空の位置を示せる
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* 二分木の配列表現 */
// null で空の位置を表す
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* 二分木の配列表現 */
// null で空の位置を表す
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* 二分木の配列表現 */
// null 許容型 int? を使うと、null で空の位置を示せる
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* 二分木の配列表現 */
// None で空の位置を示す
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* 二分木の配列表現 */
// int の最大値で空の位置を示すため、ノードの値に INT_MAX は使えない
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* 二分木の配列表現 */
// null で空の位置を表す
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### 二分木の配列表現 ###
# nil で空の位置を表す
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
