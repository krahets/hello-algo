<!-- [snippet]{init_array} -->
```python title="array.py"
# 配列を初期化
arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="array.cpp"
/* 配列を初期化 */
// スタック上に格納
int arr[5] = {};
int nums[5] = { 1, 3, 2, 5, 4 };
// ヒープ上に格納（領域を手動で解放する必要がある）
int* arr1 = new int[5] {};
int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
```

```java title="array.java"
/* 配列を初期化 */
int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
int[] nums = { 1, 3, 2, 5, 4 };
```

```csharp title="array.cs"
/* 配列を初期化 */
int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
int[] nums = [1, 3, 2, 5, 4];
```

```go title="array.go"
/* 配列を初期化 */
var arr [5]int
// Go では、長さを指定すると（[5]int）配列、指定しないと（[]int）スライスになる
// Go の配列はコンパイル時に長さが決まる設計のため、長さには定数しか指定できない
// 容量を拡張する extend() メソッドを実装しやすくするため、以下ではスライス（Slice）を配列（Array）として扱う
nums := []int{1, 3, 2, 5, 4}
```

```swift title="array.swift"
/* 配列を初期化 */
let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let nums = [1, 3, 2, 5, 4]
```

```javascript title="array.js"
/* 配列を初期化 */
var arr = new Array(5).fill(0);
var nums = [1, 3, 2, 5, 4];
```

```typescript title="array.ts"
/* 配列を初期化 */
let arr: number[] = new Array(5).fill(0);
let nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="array.dart"
/* 配列を初期化 */
List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="array.rs"
/* 配列を初期化 */
let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
let slice: &[i32] = &[0; 5];
// Rust では、長さを指定すると（[i32; 5]）配列、指定しないと（&[i32]）スライスになる
// Rust の配列はコンパイル時に長さが決まる設計のため、長さには定数しか指定できない
// Vector は、Rust で通常、動的配列として使う型
// 容量を拡張する extend() メソッドを実装しやすくするため、以下では vector を配列（array）として扱う
let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="array.c"
/* 配列を初期化 */
int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
int nums[5] = { 1, 3, 2, 5, 4 };
```

```kotlin title="array.kt"
/* 配列を初期化 */
var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
var nums = intArrayOf(1, 3, 2, 5, 4)
```

```ruby title="array.rb"
# 配列を初期化
arr = Array.new(5, 0)
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_array_tutor} -->
https://pythontutor.com/render.html#code=%23%20%E9%85%8D%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
