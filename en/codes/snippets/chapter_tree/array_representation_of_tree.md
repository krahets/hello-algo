<!-- [snippet]{tree_array_representation} -->
```python title=""
# Array representation of a binary tree
# Use None for empty positions
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* Array representation of a binary tree */
// Use INT_MAX, the maximum int value, for empty positions
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* Array representation of a binary tree */
// Use the wrapper class Integer so that null can mark empty positions
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* Array representation of a binary tree */
// Use the nullable type int? so that null can mark empty positions
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* Array representation of a binary tree */
// Use a slice of any so that nil can mark empty positions
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* Array representation of a binary tree */
// Use the optional type Int? so that nil can mark empty positions
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* Array representation of a binary tree */
// Use null for empty positions
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* Array representation of a binary tree */
// Use null for empty positions
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* Array representation of a binary tree */
// Use the nullable type int? so that null can mark empty positions
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* Array representation of a binary tree */
// Use None for empty positions
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* Array representation of a binary tree */
// Use the maximum int value for empty positions, so node values must not equal INT_MAX
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* Array representation of a binary tree */
// Use null for empty positions
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### Array representation of a binary tree ###
# Use nil for empty positions
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
