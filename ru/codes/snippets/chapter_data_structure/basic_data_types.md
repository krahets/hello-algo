<!-- [snippet]{basic_type_arrays} -->
```python title=""
# Инициализируем массивы с использованием различных базовых типов данных
numbers: list[int] = [0] * 5
decimals: list[float] = [0.0] * 5
# В Python символы фактически являются строками длины 1
characters: list[str] = ['0'] * 5
bools: list[bool] = [False] * 5
# Списки Python могут свободно хранить различные базовые типы данных и ссылки на объекты
data = [0, 0.0, 'a', False, ListNode(0)]
```

```cpp title=""
// Инициализируем массивы с использованием различных базовых типов данных
int numbers[5];
float decimals[5];
char characters[5];
bool bools[5];
```

```java title=""
// Инициализируем массивы с использованием различных базовых типов данных
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
boolean[] bools = new boolean[5];
```

```csharp title=""
// Инициализируем массивы с использованием различных базовых типов данных
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
bool[] bools = new bool[5];
```

```go title=""
// Инициализируем массивы с использованием различных базовых типов данных
var numbers = [5]int{}
var decimals = [5]float64{}
var characters = [5]byte{}
var bools = [5]bool{}
```

```swift title=""
// Инициализируем массивы с использованием различных базовых типов данных
let numbers = Array(repeating: 0, count: 5)
let decimals = Array(repeating: 0.0, count: 5)
let characters: [Character] = Array(repeating: "a", count: 5)
let bools = Array(repeating: false, count: 5)
```

```javascript title=""
// Массивы JavaScript могут свободно хранить различные базовые типы данных и объекты
const array = [0, 0.0, 'a', false];
```

```typescript title=""
// Инициализируем массивы с использованием различных базовых типов данных
const numbers: number[] = [];
const characters: string[] = [];
const bools: boolean[] = [];
```

```dart title=""
// Инициализируем массивы с использованием различных базовых типов данных
List<int> numbers = List.filled(5, 0);
List<double> decimals = List.filled(5, 0.0);
List<String> characters = List.filled(5, 'a');
List<bool> bools = List.filled(5, false);
```

```rust title=""
// Инициализируем массивы с использованием различных базовых типов данных
let numbers: Vec<i32> = vec![0; 5];
let decimals: Vec<f32> = vec![0.0; 5];
let characters: Vec<char> = vec!['0'; 5];
let bools: Vec<bool> = vec![false; 5];
```

```c title=""
// Инициализируем массивы с использованием различных базовых типов данных
int numbers[10];
float decimals[10];
char characters[10];
bool bools[10];
```

```kotlin title=""
// Инициализируем массивы с использованием различных базовых типов данных
val numbers = IntArray(5)
val decinals = FloatArray(5)
val characters = CharArray(5)
val bools = BooleanArray(5)
```

```ruby title=""
# Списки Ruby могут свободно хранить различные базовые типы данных и ссылки на объекты
data = [0, 0.0, 'a', false, ListNode.new(0)]
```

<!-- [tutor]{basic_type_arrays_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D1%83%D0%B7%D0%B5%D0%BB%D0%BA%D0%BB%D0%B0%D1%81%D1%81%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%D0%BC%20%D0%BD%D0%B5%D1%81%D0%BA%D0%BE%D0%BB%D1%8C%D0%BA%D0%B8%D1%85%20%D0%B1%D0%B0%D0%B7%D0%BE%D0%B2%D1%8B%D1%85%20%D1%82%D0%B8%D0%BF%D0%BE%D0%B2%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20%D0%92%20Python%20%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB%D1%8B%20%D0%BD%D0%B0%20%D1%81%D0%B0%D0%BC%D0%BE%D0%BC%20%D0%B4%D0%B5%D0%BB%D0%B5%20%D1%8F%D0%B2%D0%BB%D1%8F%D1%8E%D1%82%D1%81%D1%8F%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B0%D0%BC%D0%B8%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%201%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20%D0%A1%D0%BF%D0%B8%D1%81%D0%BA%D0%B8%20%D0%B2%20Python%20%D0%BC%D0%BE%D0%B3%D1%83%D1%82%20%D1%81%D0%B2%D0%BE%D0%B1%D0%BE%D0%B4%D0%BD%D0%BE%20%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D1%82%D1%8C%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D0%B5%20%D0%B1%D0%B0%D0%B7%D0%BE%D0%B2%D1%8B%D0%B5%20%D1%82%D0%B8%D0%BF%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B8%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8%20%D0%BD%D0%B0%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20%27a%27%2C%20False%2C%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
