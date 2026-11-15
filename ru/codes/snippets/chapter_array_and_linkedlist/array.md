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
int nums[5] = { 1, 3, 2, 5, 4 };
// Хранится в куче (требуется ручное освобождение памяти)
int* arr1 = new int[5] {};
int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
```

```java title="array.java"
/* Инициализация массива */
int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
int[] nums = { 1, 3, 2, 5, 4 };
```

```csharp title="array.cs"
/* Инициализация массива */
int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
int[] nums = [1, 3, 2, 5, 4];
```

```go title="array.go"
/* Инициализация массива */
var arr [5]int
// В Go указание длины ([5]int) создает массив, а отсутствие длины ([]int) - срез
// Поскольку длина массива в Go определяется на этапе компиляции, для задания длины можно использовать только константы
// Чтобы упростить реализацию метода extend(), ниже будем рассматривать срезы (Slice) как массивы (Array)
nums := []int{1, 3, 2, 5, 4}
```

```swift title="array.swift"
/* Инициализация массива */
let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let nums = [1, 3, 2, 5, 4]
```

```javascript title="array.js"
/* Инициализация массива */
var arr = new Array(5).fill(0);
var nums = [1, 3, 2, 5, 4];
```

```typescript title="array.ts"
/* Инициализация массива */
let arr: number[] = new Array(5).fill(0);
let nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="array.dart"
/* Инициализация массива */
List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="array.rs"
/* Инициализация массива */
let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
let slice: &[i32] = &[0; 5];
// В Rust указание длины ([i32; 5]) создает массив, а отсутствие длины (&[i32]) - срез
// Поскольку длина массива в Rust определяется на этапе компиляции, для задания длины можно использовать только константы
// Vector в Rust обычно используется как динамический массив
// Чтобы упростить реализацию метода extend(), ниже будем рассматривать vector как массив (array)
let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="array.c"
/* Инициализация массива */
int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
int nums[5] = { 1, 3, 2, 5, 4 };
```

```kotlin title="array.kt"
/* Инициализация массива */
var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
var nums = intArrayOf(1, 3, 2, 5, 4)
```

```ruby title="array.rb"
# Инициализация массива
arr = Array.new(5, 0)
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_array_tutor} -->
https://pythontutor.com/render.html#code=%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
