<!-- [snippet]{init_array} -->
```python title="array.py"
# 初始化数组
arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="array.cpp"
/* 初始化数组 */
// 存储在栈上
int arr[5] = {};
int nums[5] = { 1, 3, 2, 5, 4 };
// 存储在堆上（需要手动释放空间）
int* arr1 = new int[5] {};
int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
```

```java title="array.java"
/* 初始化数组 */
int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
int[] nums = { 1, 3, 2, 5, 4 };
```

```csharp title="array.cs"
/* 初始化数组 */
int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
int[] nums = [1, 3, 2, 5, 4];
```

```go title="array.go"
/* 初始化数组 */
var arr [5]int
// 在 Go 中，指定长度时（[5]int）为数组，不指定长度时（[]int）为切片
// 由于 Go 的数组被设计为在编译期确定长度，因此只能使用常量来指定长度
// 为了方便实现扩容 extend() 方法，以下将切片（Slice）看作数组（Array）
nums := []int{1, 3, 2, 5, 4}
```

```swift title="array.swift"
/* 初始化数组 */
let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let nums = [1, 3, 2, 5, 4]
```

```javascript title="array.js"
/* 初始化数组 */
var arr = new Array(5).fill(0);
var nums = [1, 3, 2, 5, 4];
```

```typescript title="array.ts"
/* 初始化数组 */
let arr: number[] = new Array(5).fill(0);
let nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="array.dart"
/* 初始化数组 */
List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="array.rs"
/* 初始化数组 */
let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
let slice: &[i32] = &[0; 5];
// 在 Rust 中，指定长度时（[i32; 5]）为数组，不指定长度时（&[i32]）为切片
// 由于 Rust 的数组被设计为在编译期确定长度，因此只能使用常量来指定长度
// Vector 是 Rust 一般情况下用作动态数组的类型
// 为了方便实现扩容 extend() 方法，以下将 vector 看作数组（array）
let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="array.c"
/* 初始化数组 */
int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
int nums[5] = { 1, 3, 2, 5, 4 };
```

```kotlin title="array.kt"
/* 初始化数组 */
var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
var nums = intArrayOf(1, 3, 2, 5, 4)
```

```ruby title="array.rb"
# 初始化数组
arr = Array.new(5, 0)
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_array_tutor} -->
https://pythontutor.com/render.html#code=%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0Aarr%20%3D%20%5B0%5D%20*%205%20%20%23%20%5B%200,%200,%200,%200,%200%20%5D%0Anums%20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
