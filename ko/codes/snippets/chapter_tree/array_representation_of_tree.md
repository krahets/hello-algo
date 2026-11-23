<!-- [snippet]{tree_array_representation} -->
```python title=""
# 이진 트리의 배열 표현
# None으로 빈자리 표시
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* 이진 트리의 배열 표현 */
// int의 최댓값 INT_MAX로 빈자리 표시
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* 이진 트리의 배열 표현 */
// int의 래퍼 클래스 Integer를 사용하면 null로 빈자리를 표시할 수 있다
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* 이진 트리의 배열 표현 */
// 널 허용 타입 int?를 사용하면 null로 빈자리를 표시할 수 있다
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* 이진 트리의 배열 표현 */
// any 타입의 슬라이스를 사용하면 nil로 빈자리를 표시할 수 있다
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* 이진 트리의 배열 표현 */
// 널 허용 타입 Int?를 사용하면 nil로 빈자리를 표시할 수 있다
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* 이진 트리의 배열 표현 */
// null로 빈자리 표시
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* 이진 트리의 배열 표현 */
// null로 빈자리 표시
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* 이진 트리의 배열 표현 */
// 널 허용 타입 int?를 사용하면 null로 빈자리를 표시할 수 있다
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* 이진 트리의 배열 표현 */
// None으로 빈자리 표시
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* 이진 트리의 배열 표현 */
// int의 최댓값으로 빈자리를 표시하므로 노드 값은 INT_MAX이면 안 된다
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* 이진 트리의 배열 표현 */
// null로 빈자리 표시
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### 이진 트리의 배열 표현 ###
# nil로 빈자리 표시
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
