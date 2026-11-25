<!-- [snippet]{tree_array_representation} -->
```python title=""
# Array representation of a binary tree
# Use None to represent an empty slot
tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
```

```cpp title=""
/* Array representation of a binary tree */
// Use INT_MAX, the largest int value, to mark an empty slot
vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```java title=""
/* Array representation of a binary tree */
// Use Integer, the wrapper class for int, so null can mark an empty slot
Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
```

```csharp title=""
/* Array representation of a binary tree */
// Use the nullable type int? so null can mark an empty slot
int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```go title=""
/* Array representation of a binary tree */
// Use a slice of type any so nil can mark an empty slot
tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
```

```swift title=""
/* Array representation of a binary tree */
// Use the optional type Int? so nil can mark an empty slot
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```

```javascript title=""
/* Array representation of a binary tree */
// Use null to represent an empty slot
let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```typescript title=""
/* Array representation of a binary tree */
// Use null to represent an empty slot
let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```dart title=""
/* Array representation of a binary tree */
// Use the nullable type int? so null can mark an empty slot
List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
```

```rust title=""
/* Array representation of a binary tree */
// Use None to mark an empty slot
let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
```

```c title=""
/* Array representation of a binary tree */
// Use the largest int value to mark an empty slot, so node values must differ from INT_MAX
int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
```

```kotlin title=""
/* Array representation of a binary tree */
// Use null to represent an empty slot
val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
```

```ruby title=""
### Array representation of a binary tree ###
# Use nil to represent an empty slot
tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
```
