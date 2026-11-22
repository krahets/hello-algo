<!-- [snippet]{init_array} -->
```python title="array.py"
# Initialize the array
arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="array.cpp"
/* Initialize the array */
// Stored on the stack
int arr[5] = {};
int nums[5] = {1, 3, 2, 5, 4};
// Stored on the heap (memory must be freed manually)
int *arr1 = new int[5]{};
int *nums1 = new int[5]{1, 3, 2, 5, 4};
```

```java title="array.java"
/* Initialize the array */
int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
int[] nums = { 1, 3, 2, 5, 4 };
```

```csharp title="array.cs"
// Initialize the array
int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
int[] nums = [1, 3, 2, 5, 4];
```

```go title="array.go"
/* Initialize the array */
var arr [5]int
// In Go, a type with a specified length ([5]int) is an array; without a length ([]int), it is a slice
// Go array lengths are determined at compile time, so the length must be a constant
// To make the extend() function easier to implement, we treat slices as arrays below
nums := []int{1, 3, 2, 5, 4}
```

```swift title="array.swift"
/* Initialize the array */
let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
var nums = [1, 3, 2, 5, 4]
```

```javascript title="array.js"
/* Initialize the array */
const arr = new Array(5).fill(0);
let nums = [1, 3, 2, 5, 4];
```

```typescript title="array.ts"
/* Initialize the array */
const arr: number[] = new Array(5).fill(0);
let nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="array.dart"
/* Initialize the array */
var arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="array.rs"
/* Initialize the array */
let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
// In Rust, [i32; 5] is an array type with a fixed length, whereas &[i32] is a reference to a slice
// Rust array lengths are determined at compile time, so their lengths must be constant expressions
// Vec is the type normally used for dynamic arrays in Rust
// To simplify the extend() method, the following examples use a vector to represent an array
let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="array.c"
/* Initialize the array */
int arr[5] = {0}; // { 0, 0, 0, 0, 0 }
int nums[] = {1, 3, 2, 5, 4};
```

```kotlin title="array.kt"
/* Initialize the array */
val arr = IntArray(5) // { 0, 0, 0, 0, 0 }
var nums = intArrayOf(1, 3, 2, 5, 4)
```

```ruby title="array.rb"
# Initialize the array
arr = Array.new(5, 0)
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_array_tutor} -->
https://pythontutor.com/render.html#code=%23%20Initialize%20arrays%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
