<!-- [snippet]{init_array} -->
```python title="array.py"
# 배열 초기화
arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="array.cpp"
/* 배열 초기화 */
// 스택에 저장
int arr[5] = {};
int nums[5] = { 1, 3, 2, 5, 4 };
// 힙에 저장(공간을 직접 해제해야 함)
int* arr1 = new int[5] {};
int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
```

```java title="array.java"
/* 배열 초기화 */
int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
int[] nums = { 1, 3, 2, 5, 4 };
```

```csharp title="array.cs"
/* 배열 초기화 */
int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
int[] nums = [1, 3, 2, 5, 4];
```

```go title="array.go"
/* 배열 초기화 */
var arr [5]int
// Go에서 길이를 지정하면([5]int) 배열이고, 지정하지 않으면([]int) 슬라이스다
// Go 배열의 길이는 컴파일 시 결정되도록 설계되었으므로 상수로만 길이를 지정할 수 있다
// 용량 확장 메서드 extend()를 쉽게 구현하기 위해 아래에서는 슬라이스(Slice)를 배열(Array)로 간주한다
nums := []int{1, 3, 2, 5, 4}
```

```swift title="array.swift"
/* 배열 초기화 */
let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let nums = [1, 3, 2, 5, 4]
```

```javascript title="array.js"
/* 배열 초기화 */
var arr = new Array(5).fill(0);
var nums = [1, 3, 2, 5, 4];
```

```typescript title="array.ts"
/* 배열 초기화 */
let arr: number[] = new Array(5).fill(0);
let nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="array.dart"
/* 배열 초기화 */
List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="array.rs"
/* 배열 초기화 */
let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
let slice: &[i32] = &[0; 5];
// Rust에서 길이를 지정하면([i32; 5]) 배열이고, 지정하지 않으면(&[i32]) 슬라이스다
// Rust 배열의 길이는 컴파일 시 결정되도록 설계되었으므로 상수로만 길이를 지정할 수 있다
// Vector는 Rust에서 일반적으로 동적 배열로 사용하는 자료형이다
// 용량 확장 메서드 extend()를 쉽게 구현하기 위해 아래에서는 vector를 배열(array)로 간주한다
let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="array.c"
/* 배열 초기화 */
int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
int nums[5] = { 1, 3, 2, 5, 4 };
```

```kotlin title="array.kt"
/* 배열 초기화 */
var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
var nums = intArrayOf(1, 3, 2, 5, 4)
```

```ruby title="array.rb"
# 배열 초기화
arr = Array.new(5, 0)
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_array_tutor} -->
https://pythontutor.com/render.html#code=%23%20%EB%B0%B0%EC%97%B4%20%EC%B4%88%EA%B8%B0%ED%99%94%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
