<!-- [snippet]{init_array} -->
```python title="array.py"
# 初始化陣列
arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="array.cpp"
/* 初始化陣列 */
// 儲存在堆疊上
int arr[5] = {};
int nums[5] = { 1, 3, 2, 5, 4 };
// 儲存在堆積上（需要手動釋放空間）
int* arr1 = new int[5] {};
int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
```

```java title="array.java"
/* 初始化陣列 */
int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
int[] nums = { 1, 3, 2, 5, 4 };
```

```csharp title="array.cs"
/* 初始化陣列 */
int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
int[] nums = [1, 3, 2, 5, 4];
```

```go title="array.go"
/* 初始化陣列 */
var arr [5]int
// 在 Go 中，指定長度時（[5]int）為陣列，不指定長度時（[]int）為切片
// 由於 Go 的陣列被設計為在編譯期確定長度，因此只能使用常數來指定長度
// 為了方便實現擴容 extend() 方法，以下將切片（Slice）看作陣列（Array）
nums := []int{1, 3, 2, 5, 4}
```

```swift title="array.swift"
/* 初始化陣列 */
let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let nums = [1, 3, 2, 5, 4]
```

```javascript title="array.js"
/* 初始化陣列 */
var arr = new Array(5).fill(0);
var nums = [1, 3, 2, 5, 4];
```

```typescript title="array.ts"
/* 初始化陣列 */
let arr: number[] = new Array(5).fill(0);
let nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="array.dart"
/* 初始化陣列 */
List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="array.rs"
/* 初始化陣列 */
let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
let slice: &[i32] = &[0; 5];
// 在 Rust 中，指定長度時（[i32; 5]）為陣列，不指定長度時（&[i32]）為切片
// 由於 Rust 的陣列被設計為在編譯期確定長度，因此只能使用常數來指定長度
// Vector 是 Rust 一般情況下用作動態陣列的型別
// 為了方便實現擴容 extend() 方法，以下將 vector 看作陣列（array）
let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="array.c"
/* 初始化陣列 */
int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
int nums[5] = { 1, 3, 2, 5, 4 };
```

```kotlin title="array.kt"
/* 初始化陣列 */
var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
var nums = intArrayOf(1, 3, 2, 5, 4)
```

```ruby title="array.rb"
# 初始化陣列
arr = Array.new(5, 0)
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_array_tutor} -->
https://pythontutor.com/render.html#code=%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
