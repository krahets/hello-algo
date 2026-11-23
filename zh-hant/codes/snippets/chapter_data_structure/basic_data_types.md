<!-- [snippet]{basic_type_arrays} -->
```python title=""
# 使用多種基本資料型別來初始化陣列
numbers: list[int] = [0] * 5
decimals: list[float] = [0.0] * 5
# Python 的字元實際上是長度為 1 的字串
characters: list[str] = ['0'] * 5
bools: list[bool] = [False] * 5
# Python 的串列可以自由儲存各種基本資料型別和物件引用
data = [0, 0.0, 'a', False, ListNode(0)]
```

```cpp title=""
// 使用多種基本資料型別來初始化陣列
int numbers[5];
float decimals[5];
char characters[5];
bool bools[5];
```

```java title=""
// 使用多種基本資料型別來初始化陣列
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
boolean[] bools = new boolean[5];
```

```csharp title=""
// 使用多種基本資料型別來初始化陣列
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
bool[] bools = new bool[5];
```

```go title=""
// 使用多種基本資料型別來初始化陣列
var numbers = [5]int{}
var decimals = [5]float64{}
var characters = [5]byte{}
var bools = [5]bool{}
```

```swift title=""
// 使用多種基本資料型別來初始化陣列
let numbers = Array(repeating: 0, count: 5)
let decimals = Array(repeating: 0.0, count: 5)
let characters: [Character] = Array(repeating: "a", count: 5)
let bools = Array(repeating: false, count: 5)
```

```javascript title=""
// JavaScript 的陣列可以自由儲存各種基本資料型別和物件
const array = [0, 0.0, 'a', false];
```

```typescript title=""
// 使用多種基本資料型別來初始化陣列
const numbers: number[] = [];
const characters: string[] = [];
const bools: boolean[] = [];
```

```dart title=""
// 使用多種基本資料型別來初始化陣列
List<int> numbers = List.filled(5, 0);
List<double> decimals = List.filled(5, 0.0);
List<String> characters = List.filled(5, 'a');
List<bool> bools = List.filled(5, false);
```

```rust title=""
// 使用多種基本資料型別來初始化陣列
let numbers: Vec<i32> = vec![0; 5];
let decimals: Vec<f32> = vec![0.0; 5];
let characters: Vec<char> = vec!['0'; 5];
let bools: Vec<bool> = vec![false; 5];
```

```c title=""
// 使用多種基本資料型別來初始化陣列
int numbers[10];
float decimals[10];
char characters[10];
bool bools[10];
```

```kotlin title=""
// 使用多種基本資料型別來初始化陣列
val numbers = IntArray(5)
val decinals = FloatArray(5)
val characters = CharArray(5)
val bools = BooleanArray(5)
```

```ruby title=""
# Ruby 的串列可以自由儲存各種基本資料型別和物件引用
data = [0, 0.0, 'a', false, ListNode.new(0)]
```

<!-- [tutor]{basic_type_arrays_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B9%BC%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%A4%9A%E7%A8%AE%E5%9F%BA%E6%9C%AC%E8%B3%87%E6%96%99%E5%9E%8B%E5%88%A5%E4%BE%86%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E5%85%83%E5%AF%A6%E9%9A%9B%E4%B8%8A%E6%98%AF%E9%95%B7%E5%BA%A6%E7%82%BA%201%20%E7%9A%84%E5%AD%97%E4%B8%B2%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E4%B8%B2%E5%88%97%E5%8F%AF%E4%BB%A5%E8%87%AA%E7%94%B1%E5%84%B2%E5%AD%98%E5%90%84%E7%A8%AE%E5%9F%BA%E6%9C%AC%E8%B3%87%E6%96%99%E5%9E%8B%E5%88%A5%E5%92%8C%E7%89%A9%E4%BB%B6%E5%BC%95%E7%94%A8%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20%27a%27%2C%20False%2C%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
