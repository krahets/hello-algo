<!-- [snippet]{init_array} -->
```python title="array.py"
# Инициализация массива
arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="array.cpp"
/* Инициализация массива */
// Хранится в стеке
int arr[5] = {};
int nums[5] = {1, 3, 2, 5, 4};
// Хранится в куче (память нужно освободить вручную)
int *arr1 = new int[5]{};
int *nums1 = new int[5]{1, 3, 2, 5, 4};
```

```java title="array.java"
/* Инициализация массива */
int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
int[] nums = { 1, 3, 2, 5, 4 };
```

```csharp title="array.cs"
// Инициализация массива
int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
int[] nums = [1, 3, 2, 5, 4];
```

```go title="array.go"
/* Инициализация массива */
var arr [5]int
// В Go тип с указанной длиной ([5]int) — массив, а без длины ([]int) — срез
// Длина массива в Go определяется при компиляции, поэтому задать её можно только константой
// Для удобства реализации функции расширения extend() далее рассматриваем срез (slice) как массив (array)
nums := []int{1, 3, 2, 5, 4}
```

```swift title="array.swift"
/* Инициализация массива */
let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
var nums = [1, 3, 2, 5, 4]
```

```javascript title="array.js"
/* Инициализация массива */
const arr = new Array(5).fill(0);
let nums = [1, 3, 2, 5, 4];
```

```typescript title="array.ts"
/* Инициализация массива */
const arr: number[] = new Array(5).fill(0);
let nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="array.dart"
/* Инициализация массива */
var arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="array.rs"
/* Инициализация массива */
let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
// В Rust тип с указанной длиной ([i32; 5]) — массив, а без длины (&[i32]) — ссылка на срез
// Длина массива в Rust определяется при компиляции, поэтому задать её можно только константой
// В Rust в качестве динамического массива обычно используют вектор
// Для удобства реализации метода расширения extend() далее рассматриваем вектор как массив
let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="array.c"
/* Инициализация массива */
int arr[5] = {0}; // { 0, 0, 0, 0, 0 }
int nums[] = {1, 3, 2, 5, 4};
```

```kotlin title="array.kt"
/* Инициализация массива */
val arr = IntArray(5) // { 0, 0, 0, 0, 0 }
var nums = intArrayOf(1, 3, 2, 5, 4)
```

```ruby title="array.rb"
# Инициализация массива
arr = Array.new(5, 0)
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_array_tutor} -->
https://pythontutor.com/render.html#code=%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200,%200,%200,%200,%200%20%5D%0Anums%20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
